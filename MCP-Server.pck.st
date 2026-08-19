'From Cuis7.9 [latest update: #8113] on 19 August 2026 at 9:49:22 am'!
'Description Utf8 support - thanks Luciano!!'!
!provides: 'MCP-Server' 1 21!
!requires: 'JSON' nil nil nil!
!requires: 'OSProcess' nil nil nil!
SystemOrganization addCategory: #'MCP-Server'!


!classDefinition: #MCPServer category: #'MCP-Server'!
Object subclass: #MCPServer
	instanceVariableNames: 'transport running debugger debuggerMorph'
	classVariableNames: 'LastAnswered LastReceived RunningInstance'
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPServer class' category: #'MCP-Server'!
MCPServer class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportStdio category: #'MCP-Server'!
Object subclass: #MCPTransportStdio
	instanceVariableNames: 'stdin stdout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPTransportStdio class' category: #'MCP-Server'!
MCPTransportStdio class
	instanceVariableNames: ''!


!MCPServer methodsFor: 'initialization' stamp: 'LLM 31/Jul/2026, 4:30:14 pm (UTC)'!
initialize
	transport := MCPTransportStdio new.
	running := false.! !

!MCPServer methodsFor: 'running' stamp: 'LLM 31/Jul/2026, 5:55:19 pm (UTC)'!
logAnswered: response receivedAt: receivedTime

	| answeredTime |
	
	answeredTime := DateAndTime now.
	Transcript 
		show: answeredTime printString; 
		show: ' Answered after: '; 
		show: (answeredTime - receivedTime) printString;
		"show: ' - Result: ';
		show: (response at: 'result' ifAbsent: [ 'no result found...']);"
		newLine;
		flush

	! !

!MCPServer methodsFor: 'running' stamp: 'HAW 31/Jul/2026, 5:53:53 pm (UTC)'!
logReceived: request
	
	| receivedTime |
	
	receivedTime := DateAndTime now.
	Transcript 
		show: receivedTime printString; 
		show: ' Received: ';
		show: (request ifNil: [ 'nil request'] ifNotNil: [request at: 'method' ifAbsent: ['no method found...']]);
		newLine;
		flush.
		
	^receivedTime
	! !

!MCPServer methodsFor: 'running' stamp: 'LLM 31/Jul/2026, 4:19:59 pm (UTC)'!
process: request 

	| receivedTime response  |
	
	LastReceived := request.	
	receivedTime := self logReceived: request.
	
	request
		ifNil: [ running := false ]
		ifNotNil: [
			response := self handleRequest: request.
			response ifNotNil: [
				| jsonResponse |
				jsonResponse := Json render: response.
				transport writeMessage: jsonResponse. 
				LastAnswered := response.
				self logAnswered: response receivedAt: receivedTime ]].
	
	! !

!MCPServer methodsFor: 'running' stamp: 'LLM 31/Jul/2026, 4:19:34 pm (UTC)'!
run
	"Main server loop - read requests, dispatch, write responses"
	| request |
	RunningInstance := self.
	running := true.
	[ running ] whileTrue: [
		request := transport readMessage.
		self process: request ] ! !

!MCPServer methodsFor: 'running' stamp: ''!
stop
	running := false.
	RunningInstance := nil.! !

!MCPServer methodsFor: 'request handling' stamp: ''!
dispatch: method params: params
	"Dispatch JSON-RPC method to handler"
	method = 'initialize' ifTrue: [ ^ self handleInitialize: params ].
	method = 'tools/list' ifTrue: [ ^ self handleToolsList: params ].
	method = 'tools/call' ifTrue: [ ^ self handleToolsCall: params ].
	method = 'ping' ifTrue: [ ^ Dictionary new ].
	self error: 'Unknown method: ' , method.! !

!MCPServer methodsFor: 'request handling' stamp: ''!
handleNotification: method params: params
	"Handle JSON-RPC notifications (no response expected)"
	method = 'notifications/initialized' ifTrue: [ ^ self ].
	method = 'notifications/cancelled' ifTrue: [ ^ self ].! !

!MCPServer methodsFor: 'request handling' stamp: 'LLM 14/Jul/2026, 2:54:57 pm (UTC)'!
handleRequest: request
	"Handle a JSON-RPC request, return response or nil for notifications"
	| method id result jsonResult |

	Transcript show: request; newLine.
	method := request
		at: 'method'
		ifAbsent: [ ^ nil ].
	id := request
		at: 'id'
		ifAbsent: [ ].
	id ifNil: [
		self
			handleNotification: method
			params:
				(request
					at: 'params'
					ifAbsent: [ Dictionary new ]).
		^ nil ].
	jsonResult := [
	result := self
		dispatch: method
		params:
			(request
				at: 'params'
				ifAbsent: [ Dictionary new ]).
	self
		successResponse: id
		result: result ]
		on: Error
		do: [ :ex |
			self
				errorResponse: id
				code: -32603
				message: ex printString ].
			
	Transcript show: jsonResult; newLine.
	^jsonResult ! !

!MCPServer methodsFor: 'responses' stamp: ''!
errorResponse: id code: code message: message
	"Build a JSON-RPC error response"
	^ OrderedDictionary new
		
			at: 'jsonrpc'
			put: '2.0';
		
			at: 'id'
			put: id;
		
			at: 'error'
			put:
				(OrderedDictionary new
					
						at: 'code'
						put: code;
					
						at: 'message'
						put: message;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'responses' stamp: ''!
successResponse: id result: result
	"Build a JSON-RPC success response"
	^ OrderedDictionary new
		
			at: 'jsonrpc'
			put: '2.0';
		
			at: 'id'
			put: id;
		
			at: 'result'
			put: result;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: ''!
handleInitialize: params
	"Handle MCP initialize request"
	^ OrderedDictionary new
		
			at: 'protocolVersion'
			put: '2024-11-05';
		
			at: 'capabilities'
			put:
				(OrderedDictionary new
					
						at: 'tools'
						put: Dictionary new;
					yourself);
		
			at: 'serverInfo'
			put:
				(OrderedDictionary new
					
						at: 'name'
						put: 'cuis-smalltalk';
					
						at: 'version'
						put: '1.0.0';
					yourself);
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'LLM 31/Jul/2026, 4:24:43 pm (UTC)'!
handleToolsCall: params
	"Handle MCP tools/call request"
	| name arguments resultText |
	name := params at: 'name'.
	arguments := params at: 'arguments' ifAbsent: [ Dictionary new ].
	resultText := self executeTool: name arguments: arguments.
	^ (Dictionary new)
		at: 'content' put: {
			(Dictionary new)
				at: 'type' put: 'text';
				at: 'text' put: resultText;
				yourself
		};
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: ''!
handleToolsList: params
	"Handle MCP tools/list request"
	^ OrderedDictionary new
		
			at: 'tools'
			put: self toolDefinitions;
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefBrowse
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_browse';
		
			at: 'description'
			put: 'Browse a class to see its superclass, instance variables, class variables, and method selectors.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class to browse';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefClassesInCategory
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_classes_in_category';
		
			at: 'description'
			put: 'List all classes in a specific category.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'category'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the category';
											yourself);
								yourself);
					
						at: 'required'
						put: #('category');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:26:18 pm (UTC)'!
toolDefDebuggerProceed
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_debugger_proceed';
		
			at: 'description'
			put: 'It does a proceed on the debugger, that means running the debugging procees to the end';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new		
					at: 'type' put: 'object';
					at: 'properties' put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:26:21 pm (UTC)'!
toolDefDebuggerRestart
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_debugger_restart';
		
			at: 'description'
			put: 'It does a restart on the debugger, that means restarting the current execution context, that is thisContext';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new		
					at: 'type' put: 'object';
					at: 'properties' put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:26:25 pm (UTC)'!
toolDefDebuggerStepInto
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_debugger_stepinto';
		
			at: 'description'
			put: 'It does a step into on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack';
		
			at: 'inputSchema'
			put: (OrderedDictionary new		
					at: 'type' put: 'object';
					at: 'properties' put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:26:29 pm (UTC)'!
toolDefDebuggerStepOver
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_debugger_stepover';
		
			at: 'description'
			put: 'It does a step over on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new		
					at: 'type' put: 'object';
					at: 'properties' put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:26:32 pm (UTC)'!
toolDefDebuggerThrough
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_debugger_through';
		
			at: 'description'
			put: 'It does a thought on the debugger created by smalltalk_evaluate_to_debug_on_error. Doing a through means going inside of the next block closure. If the next instruction is not a block closure it is the same as doind a step over. Returns the print string of the top of the stack';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new		
					at: 'type' put: 'object';
					at: 'properties' put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefDefineClass
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_define_class';
		
			at: 'description'
			put: 'Define a new class or modify an existing class definition.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'definition'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Full class definition expression';
											yourself);
								yourself);
					
						at: 'required'
						put: #('definition');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefDefineMethod
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_define_method';
		
			at: 'description'
			put: 'Define or modify a method on a class.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class';
											yourself);
								
									at: 'source'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Full method source including selector';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className' 'source');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefDeleteClass
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_delete_class';
		
			at: 'description'
			put: 'Remove a class from the system.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class to remove';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefDeleteMethod
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_delete_method';
		
			at: 'description'
			put: 'Remove a method from a class.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class';
											yourself);
								
									at: 'selector'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Selector of the method to remove';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className' 'selector');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefEvaluate
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_evaluate';
		
			at: 'description'
			put: 'Evaluate arbitrary Smalltalk code and return the result.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'code'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Smalltalk code to evaluate';
											yourself);
								yourself);
					
						at: 'required'
						put: #('code');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:08:00 pm (UTC)'!
toolDefEvaluateToDebugOnError
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_evaluate_to_debug_on_error';
		
			at: 'description'
			put: 'Evaluate arbitrary Smalltalk code, return the result if no error, return the string ''Error: '' with the exception description and install a debugger to debug the error using the tools smalltalk_debugger_stepinto, smalltalk_debugger_stepover, smalltalk_debugger_through, smalltalk_debugger_proceed, smalltalk_debugger_restart, smalltalk_finish_debugging. You can access the debugger evaluating: `Smalltalk at: #DebuggerInstance`';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'code'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Smalltalk code to evaluate';
											yourself);
								yourself);
					
						at: 'required'
						put: #('code');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 31/Jul/2026, 9:26:02 pm (UTC)'!
toolDefFinishDebugging
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_finish_debugging';
		
			at: 'description'
			put: 'It clean ups all the debugging session. It should always be sent when no more debugging is needed';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new		
					at: 'type' put: 'object';
					at: 'properties' put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefHierarchy
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_hierarchy';
		
			at: 'description'
			put: 'Get the inheritance hierarchy for a class (from Object down to the class).';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefListCategories
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_list_categories';
		
			at: 'description'
			put: 'List all system categories.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefListClasses
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_list_classes';
		
			at: 'description'
			put: 'List all classes in the system, optionally filtered by prefix.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'prefix'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Optional prefix to filter class names';
											yourself);
								yourself);
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefMethodSource
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_method_source';
		
			at: 'description'
			put: 'Get the source code of a specific method.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class';
											yourself);
								
									at: 'selector'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Method selector';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className' 'selector');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefSaveImage
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_save_image';
		
			at: 'description'
			put: 'Save the Smalltalk image to disk.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put: Dictionary new;
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: ''!
toolDefSubclasses
	^ OrderedDictionary new
		
			at: 'name'
			put: 'smalltalk_subclasses';
		
			at: 'description'
			put: 'Get the direct subclasses of a class.';
		
			at: 'inputSchema'
			put:
				(OrderedDictionary new
					
						at: 'type'
						put: 'object';
					
						at: 'properties'
						put:
							(OrderedDictionary new
								
									at: 'className'
									put:
										(OrderedDictionary new
											
												at: 'type'
												put: 'string';
											
												at: 'description'
												put: 'Name of the class';
											yourself);
								yourself);
					
						at: 'required'
						put: #('className');
					yourself);
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 16/Aug/2026, 6:12:15 pm (UTC)'!
toolDefinitions
	"Note: saveImage is intentionally excluded from exposed tools"
	^ {self toolDefEvaluate. 
	self toolDefBrowse. 
	self toolDefMethodSource. 
	self toolDefDefineClass. 
	self toolDefDefineMethod. 
	self toolDefDeleteMethod. 
	self toolDefDeleteClass. 
	self toolDefListClasses. 
	self toolDefHierarchy. 
	self toolDefSubclasses. 
	self toolDefListCategories. 
	self toolDefClassesInCategory.
	self toolDefEvaluateToDebugOnError.
	self toolDefDebuggerStepInto.
	self toolDefDebuggerStepOver.
	self toolDefDebuggerThrough.
	self toolDefDebuggerProceed.
	self toolDefDebuggerRestart.
	self toolDefFinishDebugging.
	self toolDefSaveImage.
	}.! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 31/Jul/2026, 9:09:14 pm (UTC)'!
executeTool: name arguments: args
	"Dispatch tool call to implementation"
	name = 'smalltalk_evaluate' ifTrue: [ ^ self toolEvaluate: args ].
	name = 'smalltalk_browse' ifTrue: [ ^ self toolBrowse: args ].
	name = 'smalltalk_method_source' ifTrue: [ ^ self toolMethodSource: args ].
	name = 'smalltalk_define_class' ifTrue: [ ^ self toolDefineClass: args ].
	name = 'smalltalk_define_method' ifTrue: [ ^ self toolDefineMethod: args ].
	name = 'smalltalk_delete_method' ifTrue: [ ^ self toolDeleteMethod: args ].
	name = 'smalltalk_delete_class' ifTrue: [ ^ self toolDeleteClass: args ].
	name = 'smalltalk_list_classes' ifTrue: [ ^ self toolListClasses: args ].
	name = 'smalltalk_hierarchy' ifTrue: [ ^ self toolHierarchy: args ].
	name = 'smalltalk_subclasses' ifTrue: [ ^ self toolSubclasses: args ].
	name = 'smalltalk_list_categories' ifTrue: [ ^ self toolListCategories: args ].
	name = 'smalltalk_classes_in_category' ifTrue: [ ^ self toolClassesInCategory: args ].
	name = 'smalltalk_save_image' ifTrue: [ ^ self toolSaveImage: args ].

	name = 'smalltalk_evaluate_to_debug_on_error' ifTrue: [ ^ self toolEvaluateToDebugOnError: args ].
	name = 'smalltalk_debugger_proceed' ifTrue: [ ^ self toolDebuggerProceed: args ].
	name = 'smalltalk_debugger_restart' ifTrue: [ ^ self toolDebuggerRestart: args ].
	name = 'smalltalk_debugger_stepinto' ifTrue: [ ^ self toolDebuggerStepInto: args ].
	name = 'smalltalk_debugger_stepover' ifTrue: [ ^ self toolDebuggerStepOver: args ].
	name = 'smalltalk_debugger_through' ifTrue: [ ^ self toolDebuggerThrough: args ].
	name = 'smalltalk_finish_debugging' ifTrue: [ ^ self toolFinishDebugging: args ].

	self error: 'Unknown tool: ' , name.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:34:25 pm (UTC)'!
classFor: className 
	
	^(className endsWith: ' class')
		ifTrue: [ 
			(Smalltalk
				at: (className copyReplaceAll: ' class' with: '') asSymbol
				ifAbsent: [ self error: 'Class not found: ' , className ]) class ]
		ifFalse: [	
			Smalltalk
				at: className asSymbol
				ifAbsent: [ self error: 'Class not found: ' , className ]].
	! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
evaluateToDebugOnError: code
	
	| result sem |
	
	self toolFinishDebugging: nil.
	sem := Semaphore new.

	[[ result := Compiler evaluate: code.
	sem signal ]
		on: Error 
		do: [:e | 
			result := 'Error: ', e messageText.
			debugger := Debugger new
				process: Processor activeProcess
				context: e signalerContext.
			debuggerMorph := debugger openFullMorphicLabel: 'Debugged Debugger'. 
		
			sem signal.
			Processor activeProcess suspend]] fork.

	sem wait.
		
	^ result printString.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:34:49 pm (UTC)'!
toolBrowse: args
	"Browse a class - return metadata as JSON.
	 Includes both instance-side and class-side methods."
	| className class result |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	class := self classFor: className.
	result := OrderedDictionary new.
	result
		at: 'name'
		put: class name.
	result
		at: 'superclass'
		put:
			(class superclass
				ifNil: [ 'nil' ]
				ifNotNil: [ :sc |
					sc name ]).
	result
		at: 'category'
		put: class category.
	result
		at: 'instanceVariables'
		put: class instVarNames asArray.
	result
		at: 'classVariables'
		put: class classVarNames asArray.
	result
		at: 'methods'
		put: class selectors asArray sorted.
	result
		at: 'comment'
		put: (class comment ifNil: [ '' ]).
	^ Json render: result.! !

!MCPServer methodsFor: 'tool implementations' stamp: ''!
toolClassesInCategory: args
	"List all classes in a category"
	| category classes names |
	category := args
		at: 'category'
		ifAbsent: [ '' ].
	category isEmpty ifTrue: [ self error: 'No category provided' ].
	classes := Smalltalk allClasses select: [ :c |
		c category = category asSymbol ].
	names := (classes collect: [ :c |
		c name ]) asArray sorted.
	^ Json render: names.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
toolDebuggerProceed: args

	debugger ifNil: [ ^'Error: no debugger to proceed' ].
	debugger proceed.
	
	^ ''! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
toolDebuggerRestart: args

	debugger ifNil: [ ^'Error: no debugger to restart' ].
	debugger restart.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
toolDebuggerStepInto: args

	debugger ifNil:  [ ^'Error: no debugger to stepInto' ].
	debugger send.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
toolDebuggerStepOver: args

	debugger ifNil: [ ^'Error: no debugger to stepOver' ].
	debugger doStep.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
toolDebuggerThrough: args

	debugger ifNil:  [ ^'Error: no debugger to through' ].
	debugger stepIntoBlock.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'jmm 26/Jan/2026, 12:30:00 pm (UTC)'!
toolDefineClass: args
	"Define a new class"
	| definition |
	definition := args
		at: 'definition'
		ifAbsent: [ '' ].
	definition isEmpty ifTrue: [ self error: 'No definition provided' ].
	Compiler evaluate: definition.
	^ 'Class defined successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:35:19 pm (UTC)'!
toolDefineMethod: args
	"Define or modify a method on a class.
	 In dev mode (SMALLTALK_DEV_MODE=1), uses compile:classified: to write
	 source to the .changes file. Otherwise uses compileSilently:classified:
	 to avoid UI dialogs in headless mode."
	| className source category class |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	source := args
		at: 'source'
		ifAbsent: [ '' ].
	category := args
		at: 'category'
		ifAbsent: [ 'as yet unclassified' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	source isEmpty ifTrue: [ self error: 'No source provided' ].
	class := self classFor: className.
	MCPServer isDevMode
		ifTrue: [ class compile: source classified: category ]
		ifFalse: [ class compileSilently: source classified: category ].
	^ 'Method defined successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: ''!
toolDeleteClass: args
	"Remove a class from the system"
	| className class |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	class := Smalltalk
		at: className asSymbol
		ifAbsent: [ self error: 'Class not found: ' , className ].
	class removeFromSystem.
	^ 'Class deleted successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:35:29 pm (UTC)'!
toolDeleteMethod: args
	"Remove a method from a class"
	| className selector class |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	selector := args
		at: 'selector'
		ifAbsent: [ '' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	selector isEmpty ifTrue: [ self error: 'No selector provided' ].
	class := self classFor: className.
	(class includesSelector: selector asSymbol) ifFalse: [ self error: 'Method not found: ' , className , '>>' , selector ].
	class removeSelector: selector asSymbol.
	^ 'Method deleted successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: ''!
toolEvaluate: args
	"Evaluate Smalltalk code and return result"
	| code result |
	code := args
		at: 'code'
		ifAbsent: [ '' ].
	code isEmpty ifTrue: [ self error: 'No code provided' ].
	result := Compiler evaluate: code.
	^ result printString.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 9:54:19 pm (UTC)'!
toolEvaluateToDebugOnError: args
	
	| code |

	code := args
		at: 'code'
		ifAbsent: [ '' ].
	code isEmpty ifTrue: [ self error: 'No code provided' ].
	
	^self evaluateToDebugOnError: code! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:03:02 pm (UTC)'!
toolFinishDebugging: args
	
	debuggerMorph ifNotNil: [ :morph | morph delete ].
	debugger := nil.
	debuggerMorph := nil.
	
	^ ''! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:35:39 pm (UTC)'!
toolHierarchy: args
	"Get inheritance hierarchy from Object down to this class"
	| className class hierarchy |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	class := self classFor: className.
	hierarchy := OrderedCollection new.
	[ class notNil ] whileTrue: [
		hierarchy add: class name.
		class := class superclass ].
	^ Json render: hierarchy asArray.! !

!MCPServer methodsFor: 'tool implementations' stamp: ''!
toolListCategories: args
	"List all system categories"
	| categories |
	categories := SystemOrganization categories asArray sorted.
	^ Json render: categories.! !

!MCPServer methodsFor: 'tool implementations' stamp: ''!
toolListClasses: args
	"List all classes, optionally filtered by prefix"
	| prefix classes names |
	prefix := args
		at: 'prefix'
		ifAbsent: [ '' ].
	classes := Smalltalk allClasses.
	prefix isEmpty ifFalse: [
		classes := classes select: [ :c |
			c name asString beginsWith: prefix ]].
	names := (classes collect: [ :c |
		c name ]) asArray sorted.
	^ Json render: names.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:35:50 pm (UTC)'!
toolMethodSource: args
	"Get source code of a method. Supports both instance and class side.
	 Class side can be requested via side='class' parameter or by appending
	 ' class' to className (e.g. 'MCPServer class')."
	| className selector class |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	selector := args
		at: 'selector'
		ifAbsent: [ '' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	selector isEmpty ifTrue: [ self error: 'No selector provided' ].
	class := self classFor: className.
	(class includesSelector: selector asSymbol) ifFalse: [ self error: 'Method not found: ' , className , '>>' , selector ].
	^ (class >> selector asSymbol) sourceCode.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 16/Aug/2026, 6:08:40 pm (UTC)'!
toolSaveImage: args
	"Save the current image in place.
	Uses headlessSave which calls snapshotPrimitive directly,
	skipping the full shutdown/startup cycle that would restart MCP."
	[ Smalltalk saveImage ] fork.
	(Delay forSeconds: 1) wait.
	^ 'Image saved: ' , Smalltalk imageName.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 31/Jul/2026, 10:35:56 pm (UTC)'!
toolSubclasses: args
	"Get direct subclasses of a class"
	| className class names |
	className := args
		at: 'className'
		ifAbsent: [ '' ].
	className isEmpty ifTrue: [ self error: 'No className provided' ].
	class := self classFor: className.
	names := (class subclasses collect: [ :c |
		c name ]) asArray sorted.
	^ Json render: names.! !

!MCPServer class methodsFor: 'private' stamp: ''!
envAt: varName
	"Get environment variable value. Works on both Squeak (getenv:) and Cuis (OSProcess)."
	(Smalltalk respondsTo: #getenv:) ifTrue: [ ^ Smalltalk getenv: varName ].
	[ ^ OSProcess accessor environmentAt: varName ]
		on: Error do: [ :e | ^ nil ].! !

!MCPServer class methodsFor: 'private' stamp: 'LLM 14/Jul/2026, 10:22:26 pm (UTC)'!
envAt: varName put: aValue
	
	^ OSProcess accessor environmentAt: varName put: aValue ! !

!MCPServer class methodsFor: 'saving' stamp: ''!
headlessSave
	"Save the image without the full shutdown/startup cycle.
	Calls snapshotPrimitive directly, which avoids:
	  - processShutDownList / processStartUpList (would restart MCP)
	  - Cursor/Morphic UI operations (would hang under headless/xvfb)
	Changes file logging IS preserved for traceability.
	Based on Squeak MCPServer>>headlessSave, ported to Cuis API."
	
	| changesLog result |
	
	"Log to changes file"
	(SourceFiles at: 2) ifNotNil: [
		changesLog := String streamContents: [ :s |
			s nextPutAll: '----SNAPSHOT----';
			  nextPutAll: Date today printString;
			  space;
			  nextPutAll: Time now printString;
			  space;
			  nextPutAll: Smalltalk imageName asFullFileEntry name ].
		Smalltalk logChange: changesLog.
		Transcript show: changesLog; newLine ].
	
	"Save — calls primitive 97 directly"
	result := Smalltalk snapshotPrimitive.
	
	result ifNil: [ self error: 'Failed to write image file (disk full?)' ].
	
	"result is false when continuing from save point.
	 result is true when image is later restored (resumed)."
	^ result! !

!MCPServer class methodsFor: 'system startup' stamp: 'LLM 14/Jul/2026, 9:47:54 pm (UTC)'!
startUp: resuming
	"Called on image startup. Two modes:
	 1. SMALLTALK_MCP_DAEMON=1 env var: Daemon mode (inline, blocking)
	 2. --mcp flag: Original MCP mode (forked, background)
	 
	 Daemon mode runs inline during processStartUpList: which fires BEFORE
	 the Morphic world loop starts — critical for headless operation under
	 xvfb-run where the daemon controls stdin/stdout.
	 
	 Guard: skip if MCP server is already running (resume after save)."
	| args |
	resuming ifFalse: [ ^ self ].
	
	"On restart, stop previous running server because there are a new stdin/out"
	RunningInstance notNil ifTrue: [ RunningInstance stop ].
	
	"Daemon mode — set by smalltalk-daemon.py via env var"
	((self envAt: 'SMALLTALK_MCP_DAEMON') = '1') ifTrue: [
		^ self startDaemon ].
	
	"Original MCP mode — set by --mcp command line flag"
	args := Smalltalk startUpArguments.
	(args includes: '--mcp') ifTrue: [ self startServer ].! !

!MCPServer class methodsFor: 'version' stamp: 'jmm 20/Feb/2026, 3:50:00 am (UTC)'!
version
	"Return the MCP server version number.
	 Increment when making changes that external tools should detect.
	 Version history:
	   1 - Initial version
	   2 - Fixed toolDefineMethod: to use compileSilently: for headless operation
	   3 - (skipped)
	   4 - Fork MCP to background process, allowing GUI to display
	   5 - Set author initials to avoid prompt during class/method definition
	   6 - Port to OSProcess for non-blocking stdio (GUI responsive during MCP wait)
	   7 - Ensure ThisOSProcess is initialized before MCP transport accesses it
	   8 - Remove debug logging that blocked UI startup
	   9 - Simplify MCPTransport initialize
	   10 - Add extensive logging to debug UI startup hang
	   11 - Remove debug logging, use correct Cuis author API
	   12 - JMM-619: Add daemon mode (SMALLTALK_MCP_DAEMON env var) for smalltalk-daemon.py
	   13 - JMM-645: Remove SourceFiles manipulation — changes file always retained
	   14 - JMM-645: headlessSave for Cuis, RunningInstance guard, envAt: for cross-platform
	   15 - JMM-655: toolDefineMethod: uses compile:classified: in dev mode for .changes file"
	^ 15! !

!MCPServer class methodsFor: 'instance creation' stamp: 'LLM 31/Jul/2026, 4:18:59 pm (UTC)'!
setAUthorInitials
"
	Utilities  setAuthorInitials: 'LLM' name: 'ClaudeSmalltalk'
"! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 14/Jul/2026, 1:09:41 pm (UTC)'!
startDaemon
	"Start MCP server for daemon operation (JMM-619).
	Called from startUp: when SMALLTALK_MCP_DAEMON=1.
	Runs inline (blocking) — no fork, no delay.
	
	This is critical for smalltalk-daemon.py which communicates over
	subprocess stdin/stdout pipes. Running inline ensures MCP responds
	immediately without waiting for Morphic initialization.
	
	Environment variables:
	  SMALLTALK_MCP_DAEMON=1  - triggers this mode
	  SMALLTALK_DEV_MODE=1    - keeps .changes file (else disabled)"
	
	Transcript show: 'MCP Daemon starting'; newLine.
	self setAUthorInitials. 

	"Run inline — blocks this process, which is fine since we are in startUp:
	 and do not want the Morphic world loop to run before MCP is ready"
	self new run.! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 14/Jul/2026, 1:09:41 pm (UTC)'!
startServer
	"Start MCP server in background process, allowing GUI to initialize normally"
	self setAUthorInitials.
	[
		(Delay forMilliseconds: 500) wait.
		self new run
	] forkAt: Processor userBackgroundPriority named: 'MCP Server'.! !

!MCPServer class methodsFor: 'development mode' stamp: 'LLM 14/Jul/2026, 10:34:26 pm (UTC)'!
isDevMode

	^(self envAt: 'SMALLTALK_DEV_MODE') = '1' 
		or: [ Smalltalk startUpArguments includes: '--devMode' ]! !

!MCPServer class methodsFor: 'class initialization' stamp: 'HAW 7/Aug/2026, 11:50:46 am (UTC)'!
initialize

	Smalltalk addToStartUpList: self! !

!MCPTransportStdio methodsFor: 'initialization' stamp: 'HAW 31/Jul/2026, 2:57:01 pm (UTC)'!
initialize

	| osProc |

	osProc := OSProcess thisOSProcess.
	stdin := osProc stdIn asAsyncFileReadStream.
	stdin setNonBlocking.
	stdout := osProc stdOut.! !

!MCPTransportStdio methodsFor: 'reading' stamp: 'HAW 31/Jul/2026, 2:57:13 pm (UTC)'!
readLine
	
	| char line |

	line := String new writeStream.
	[[ stdin closed ifTrue: [ ^nil ].
	char := stdin next.
	char isNil ] whileTrue: [ (Delay forMilliseconds: 10) wait ].
	line nextPut: char.
	char = Character lf ] whileFalse.

	^line contents
	
	! !

!MCPTransportStdio methodsFor: 'reading' stamp: 'LLM 13/Aug/2026, 12:00:00 pm (UTC)'!
readMessage
	"Read a JSON message from stdin"
	| line |

	line := self readLine.
	line isNil ifTrue: [ ^ nil ].

	^ Json readFrom: (self utf8Decode: line) readStream.! !

!MCPTransportStdio methodsFor: 'writing' stamp: 'LLM 13/Aug/2026, 12:00:00 pm (UTC)'!
writeMessage: jsonString
	"Write a JSON message to stdout, ensuring no embedded newlines"
	| clean |

	stdout closed ifTrue: [ ^self ].

	clean := jsonString copyWithout: Character cr.
	clean := clean copyWithout: Character lf.
	stdout
		nextPutAll: (self utf8Encode: clean);
		newLine;
		flush.! !

!MCPTransportStdio methodsFor: 'encoding' stamp: 'LLM 13/Aug/2026, 12:00:00 pm (UTC)'!
utf8Decode: aLine
	"stdin entrega un Character por cada byte leido, asi que aLine no es texto todavia:
	es la secuencia de bytes UTF-8 del mensaje, con un code point por byte.
	Sin esto, 'pi' llega como dos Characters (207 y 128) en vez de un solo code point,
	y todo lo que no sea ASCII termina como mojibake al compilarlo o mostrarlo.

	Ojo con asByteArray: sobre un UnicodeString vuelve a encodear en UTF-8, con lo cual
	los bytes se duplicarian. Los code points son los bytes, hay que tomarlos tal cual.

	Si la linea es ASCII puro no hay nada que decodificar y la devolvemos como viene."

	| bytes |
	(aLine anySatisfy: [ :each | each codePoint > 127 ]) ifFalse: [ ^aLine ].
	(aLine anySatisfy: [ :each | each codePoint > 255 ]) ifTrue: [ ^aLine ].
	bytes := ByteArray new: aLine size.
	aLine doWithIndex: [ :each :index | bytes at: index put: each codePoint ].
	^UnicodeString fromUtf8Bytes: bytes! !

!MCPTransportStdio methodsFor: 'encoding' stamp: 'LLM 13/Aug/2026, 12:00:00 pm (UTC)'!
utf8Encode: aString
	"stdout escribe un byte por cada Character, asi que le pasamos los bytes UTF-8
	de aString como un String de bytes. Para ASCII puro esto es la identidad."

	| bytes |
	bytes := aString asUtf8Bytes.
	^(String new: bytes size) replaceFrom: 1 to: bytes size with: bytes startingAt: 1! !
MCPServer initialize!
