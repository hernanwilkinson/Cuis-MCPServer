'From Cuis7.9 [latest update: #8113] on 19 August 2026 at 5:59:35 pm'!
'Description HTTP support'!
!provides: 'MCP-Server' 1 22!
!requires: 'JSON' nil nil nil!
!requires: 'OSProcess' nil nil nil!
SystemOrganization addCategory: 'MCP-Server'!


!classDefinition: #MCPAuthentication category: 'MCP-Server'!
Object subclass: #MCPAuthentication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPAuthentication class' category: 'MCP-Server'!
MCPAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPBearerTokenAuthentication category: 'MCP-Server'!
MCPAuthentication subclass: #MCPBearerTokenAuthentication
	instanceVariableNames: 'token'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPBearerTokenAuthentication class' category: 'MCP-Server'!
MCPBearerTokenAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPNoAuthentication category: 'MCP-Server'!
MCPAuthentication subclass: #MCPNoAuthentication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPNoAuthentication class' category: 'MCP-Server'!
MCPNoAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPHttpSession category: 'MCP-Server'!
Object subclass: #MCPHttpSession
	instanceVariableNames: 'identifier stream writeMutualExclusion open'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPHttpSession class' category: 'MCP-Server'!
MCPHttpSession class
	instanceVariableNames: ''!

!classDefinition: #MCPServer category: 'MCP-Server'!
Object subclass: #MCPServer
	instanceVariableNames: 'transport running debugger debuggerMorph shouldLogMessages'
	classVariableNames: 'LastAnswered LastReceived RunningInstance'
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPServer class' category: 'MCP-Server'!
MCPServer class
	instanceVariableNames: ''!

!classDefinition: #MCPTransport category: 'MCP-Server'!
Object subclass: #MCPTransport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPTransport class' category: 'MCP-Server'!
MCPTransport class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportHttp category: 'MCP-Server'!
MCPTransport subclass: #MCPTransportHttp
	instanceVariableNames: 'portNumber interfaceAddress webServer mcpServer sessions sessionCounter authentication'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPTransportHttp class' category: 'MCP-Server'!
MCPTransportHttp class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportStdio category: 'MCP-Server'!
MCPTransport subclass: #MCPTransportStdio
	instanceVariableNames: 'stdin stdout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCP-Server'!
!classDefinition: 'MCPTransportStdio class' category: 'MCP-Server'!
MCPTransportStdio class
	instanceVariableNames: ''!


!MCPAuthentication commentStamp: '<historical>' prior: 0!
I decide which requests an MCPTransportHttpCopy is willing to serve.

My subclasses are the two answers to that question: MCPNoAuthenticationCopy serves everybody, MCPBearerTokenAuthenticationCopy serves only the requests that carry the token it was created with. A transport always has one of us, so it never has to ask whether authentication is turned on.!

!MCPBearerTokenAuthentication commentStamp: '<historical>' prior: 0!
I serve only the requests that carry my token in their authorization header, as in

	Authorization: Bearer <token>

which is the scheme RemoteControlMCP uses and the one an MCP client configures with a headers entry. A request without the header, or with the wrong token, is answered 401 by the transport.!

!MCPNoAuthentication commentStamp: '<historical>' prior: 0!
I serve every request: the endpoint I guard asks for no credentials.

I am the right choice while the endpoint listens on the loopback interface only, where the operating system already keeps other machines out. Guard an endpoint reachable from the network with MCPBearerTokenAuthenticationCopy instead.!

!MCPHttpSession commentStamp: '<historical>' prior: 0!
I am one open Server-Sent Events stream between an MCPTransportHttpCopy and a client that speaks the older SSE transport.

I know my identifier, which the client sends back in the sessionId parameter of every message it posts, and the socket stream my events are written to. Only one writer at a time writes on that stream. A write that fails closes me, and a closed session never writes again.!

!MCPTransport commentStamp: '<historical>' prior: 0!
I am the way an MCPServerCopy talks to its client. My subclasses know how requests arrive and how answers go back: MCPTransportStdioCopy reads and writes the standard streams of the operating system process, MCPTransportHttpCopy listens on a TCP port and serves the MCP HTTP endpoint.

A server asks me to serveRequestsFor: it, and I answer each message by sending it responseTo: or jsonResponseTo:.!

!MCPTransportHttp commentStamp: '<historical>' prior: 0!
I serve MCP over TCP, speaking JSON-RPC on top of HTTP the same way RemoteControlMCP does.

I publish two entry points on a WebServer:
- my endpointPath (/mcp) answers POST with the response to the message in the body, which is all a Streamable HTTP client needs. GET on it opens a Server-Sent Events stream for clients that speak the older SSE transport, and DELETE ends that stream.
- my messagesPath (/messages) takes the messages of an event stream client, named by a sessionId parameter, and pushes each answer as a message event on that stream.

Every request goes through my authentication before it is served, and one that it turns down is answered 401. I listen on the interface I was created with, the loopback one by default, so the endpoint is reachable only from this machine. Configure a client with the url http://127.0.0.1:2358/mcp!

!MCPAuthentication methodsFor: 'authorizing' stamp: ''!
authorizes: aWebRequest

	"Answer whether aWebRequest may be served."

	self subclassResponsibility! !

!MCPBearerTokenAuthentication methodsFor: 'initialization' stamp: ''!
initializeRequiringToken: aToken

	token := aToken! !

!MCPBearerTokenAuthentication methodsFor: 'authorizing' stamp: ''!
authorizes: aWebRequest

	"Answer whether aWebRequest carries my token. A request without an authorization
	header carries an empty one, which never matches."

	^(aWebRequest headerAt: self class authorizationHeaderName) = self expectedAuthorizationHeader! !

!MCPBearerTokenAuthentication methodsFor: 'authorizing' stamp: ''!
expectedAuthorizationHeader

	"Answer the authorization header a request has to carry to be served."

	^self class bearerScheme, token! !

!MCPBearerTokenAuthentication class methodsFor: 'instance creation' stamp: ''!
requiringToken: aToken

	self assertIsValidToken: aToken.

	^self new initializeRequiringToken: aToken! !

!MCPBearerTokenAuthentication class methodsFor: 'preconditions' stamp: ''!
assertIsValidToken: aToken

	(aToken isString and: [ aToken notEmpty ])
		ifFalse: [ self error: self invalidTokenErrorDescription ]! !

!MCPBearerTokenAuthentication class methodsFor: 'error descriptions' stamp: ''!
invalidTokenErrorDescription

	^'The bearer token has to be a non empty String'! !

!MCPBearerTokenAuthentication class methodsFor: 'constants' stamp: ''!
authorizationHeaderName

	^'authorization'! !

!MCPBearerTokenAuthentication class methodsFor: 'constants' stamp: ''!
bearerScheme

	"Answer the authorization scheme that names a token, with its separating space."

	^'Bearer '! !

!MCPNoAuthentication methodsFor: 'authorizing' stamp: ''!
authorizes: aWebRequest

	"Every request is served: the endpoint asks for no credentials."

	^true! !

!MCPHttpSession methodsFor: 'initialization' stamp: ''!
initializeIdentifiedAs: anIdentifier writingTo: aStream

	identifier := anIdentifier.
	stream := aStream.
	open := true.
	writeMutualExclusion := Semaphore forMutualExclusion! !

!MCPHttpSession methodsFor: 'accessing' stamp: ''!
identifier

	^identifier! !

!MCPHttpSession methodsFor: 'accessing' stamp: ''!
stream

	^stream! !

!MCPHttpSession methodsFor: 'opening and closing' stamp: ''!
close

	"Stop writing events to this session. Can be sent to an already closed session."

	open := false! !

!MCPHttpSession methodsFor: 'opening and closing' stamp: ''!
isOpen

	"Answer whether events can still be written to this session."

	^open! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
sendEndpointEvent: anEndpointUrl

	"Tell the client where it has to post the messages of this session."

	self sendEvent: 'endpoint' data: anEndpointUrl! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
sendEvent: anEventName data: aDataString

	self sendFrame: 'event: ', anEventName, String crlfString,
		'data: ', aDataString, String crlfString, String crlfString! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
sendFrame: aFrame

	"Write one frame as UTF-8 bytes, one writer at a time. A write that fails closes
	this session."

	writeMutualExclusion critical: [
		self isOpen ifTrue: [
			[ stream nextPutAll: aFrame asUtf8Bytes.
			stream flush ]
				on: Error
				do: [ :aWriteError | self close ] ] ]! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
sendKeepAlive

	"Send a comment frame, so clients and proxies see the connection alive."

	self sendFrame: ': keep-alive', String crlfString, String crlfString! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
sendMessageEvent: aJsonString

	"Send one JSON-RPC answer as a message event."

	self sendEvent: 'message' data: aJsonString! !

!MCPHttpSession class methodsFor: 'instance creation' stamp: ''!
identifiedAs: anIdentifier writingTo: aStream

	self assertIsValidIdentifier: anIdentifier.
	self assertIsValidStream: aStream.

	^self new initializeIdentifiedAs: anIdentifier writingTo: aStream! !

!MCPHttpSession class methodsFor: 'preconditions' stamp: ''!
assertIsValidIdentifier: anIdentifier

	(anIdentifier isString and: [ anIdentifier notEmpty ])
		ifFalse: [ self error: self invalidIdentifierErrorDescription ]! !

!MCPHttpSession class methodsFor: 'preconditions' stamp: ''!
assertIsValidStream: aStream

	aStream isNil ifTrue: [ self error: self streamIsRequiredErrorDescription ]! !

!MCPHttpSession class methodsFor: 'error descriptions' stamp: ''!
invalidIdentifierErrorDescription

	^'The session identifier has to be a non empty String'! !

!MCPHttpSession class methodsFor: 'error descriptions' stamp: ''!
streamIsRequiredErrorDescription

	^'A session needs a stream to write its events to'! !

!MCPServer methodsFor: 'initialization' stamp: 'HAW 19/Aug/2026, 8:32:14 pm (UTC)'!
initializeServingOver: aTransport

	transport := aTransport.
	running := false.
	self doNotLogMessages ! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:32:05 pm (UTC)'!
doNotLogMessages

	shouldLogMessages := false! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:31:54 pm (UTC)'!
logAnswered: response receivedAt: receivedTime

	shouldLogMessages ifTrue: [
		| answeredTime |
	
		answeredTime := DateAndTime now.
		Transcript 
			show: answeredTime printString; 
			show: ' Answered after: '; 
			show: (answeredTime - receivedTime) printString;
			newLine;
			flush ]

	! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:31:54 pm (UTC)'!
logMessages

	shouldLogMessages := true! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:31:54 pm (UTC)'!
logReceived: request
	
	| receivedTime |
	
	receivedTime := DateAndTime now.
	shouldLogMessages ifTrue: [
		Transcript 
			show: receivedTime printString; 
			show: ' Received: ';
			show: (request ifNil: [ 'nil request'] ifNotNil: [request at: 'method' ifAbsent: ['no method found...']]);
			newLine;
			flush ].
			
	^receivedTime
	! !

!MCPServer methodsFor: 'running' stamp: ''!
isRunning

	"Answer whether I am still serving requests."

	^running! !

!MCPServer methodsFor: 'running' stamp: ''!
run

	"Serve MCP requests over my transport until stopped. Whether this blocks the calling
	process is up to the transport."

	RunningInstance := self.
	running := true.
	transport serveRequestsFor: self! !

!MCPServer methodsFor: 'running' stamp: ''!
stop

	running := false.
	transport stopServingRequests.
	RunningInstance := nil! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 8:56:22 pm (UTC)'!
dispatch: aMethod params: aParams ifNone: aNoneBlock

	aMethod = 'initialize' ifTrue: [ ^ self handleInitialize: aParams ].
	aMethod = 'tools/list' ifTrue: [ ^ self handleToolsList: aParams ].
	aMethod = 'tools/call' ifTrue: [ ^ self handleToolsCall: aParams ].
	aMethod = 'ping' ifTrue: [ ^ Dictionary new ].
	
	^aNoneBlock value! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 8:55:54 pm (UTC)'!
handleMethod: aMethod with: aParams identifiedAs: anId 

	^[ | methodResult |
		methodResult := self 
			dispatch: aMethod 
			params: aParams 
			ifNone: [ ^self errorResponse: anId code: -32601 message: 'Unknown method: ' , aMethod].
		self successResponse: anId result: methodResult ]
		on: Error
		do: [ :ex | self errorResponse: anId code: -32603 message: ex printString ].
	! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 8:57:28 pm (UTC)'!
handleNotification: method with: params
	
	"Right now it does nothing. Change to support  cancellation - Hernan"
	method = 'notifications/initialized' ifTrue: [ ^ nil ].
	method = 'notifications/cancelled' ifTrue: [ ^ nil ].
	
	^nil! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 8:57:28 pm (UTC)'!
handleRequest: aRequest
	
	| method id params |

	method := aRequest at: 'method' ifAbsent: [ ^ nil ].
	id := aRequest at: 'id' ifAbsent: [ nil ].
	params := aRequest at: 'params' ifAbsent: [ Dictionary new ].
	
	^id 
		ifNil: [ self handleNotification: method with: params ]
		ifNotNil: [ self handleMethod: method with: params identifiedAs: id ]! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
handleToolsList: params
	"Handle MCP tools/list request"
	^ OrderedDictionary new
		
			at: 'tools'
			put: self toolDefinitions;
		yourself.! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolDebuggerProceed: args

	debugger ifNil: [ ^'Error: no debugger to proceed' ].
	debugger proceed.
	
	^ ''! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolDebuggerRestart: args

	debugger ifNil: [ ^'Error: no debugger to restart' ].
	debugger restart.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolDebuggerStepInto: args

	debugger ifNil:  [ ^'Error: no debugger to stepInto' ].
	debugger send.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolDebuggerStepOver: args

	debugger ifNil: [ ^'Error: no debugger to stepOver' ].
	debugger doStep.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolDebuggerThrough: args

	debugger ifNil:  [ ^'Error: no debugger to through' ].
	debugger stepIntoBlock.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolDefineClass: args
	"Define a new class"
	| definition |
	definition := args
		at: 'definition'
		ifAbsent: [ '' ].
	definition isEmpty ifTrue: [ self error: 'No definition provided' ].
	Compiler evaluate: definition.
	^ 'Class defined successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 8:07:00 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolEvaluate: args
	"Evaluate Smalltalk code and return result"
	| code result |
	code := args
		at: 'code'
		ifAbsent: [ '' ].
	code isEmpty ifTrue: [ self error: 'No code provided' ].
	result := Compiler evaluate: code.
	^ result printString.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolEvaluateToDebugOnError: args
	
	| code |

	code := args
		at: 'code'
		ifAbsent: [ '' ].
	code isEmpty ifTrue: [ self error: 'No code provided' ].
	
	^self evaluateToDebugOnError: code! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolFinishDebugging: args
	
	debuggerMorph ifNotNil: [ :morph | morph delete ].
	debugger := nil.
	debuggerMorph := nil.
	
	^ ''! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolListCategories: args
	"List all system categories"
	| categories |
	categories := SystemOrganization categories asArray sorted.
	^ Json render: categories.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
toolSaveImage: args
	"Save the current image in place.
	Uses headlessSave which calls snapshotPrimitive directly,
	skipping the full shutdown/startup cycle that would restart MCP."
	[ Smalltalk saveImage ] fork.
	(Delay forSeconds: 1) wait.
	^ 'Image saved: ' , Smalltalk imageName.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
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

!MCPServer methodsFor: 'handling requests' stamp: ''!
jsonInternalErrorFor: anError

	"Answer a rendered JSON-RPC internal error, for transports that have to answer something
	when no request could be handled."

	^Json render: (self errorResponse: nil code: -32603 message: anError description)! !

!MCPServer methodsFor: 'handling requests' stamp: ''!
jsonParseError

	^Json render: (self errorResponse: nil code: -32700 message: self class parseErrorDescription)! !

!MCPServer methodsFor: 'handling requests' stamp: ''!
jsonResponseTo: aJsonString

	"Answer the rendered JSON-RPC response for the message in aJsonString, or nil when the
	message is a notification. A message that cannot be parsed is answered with the parse
	error the JSON-RPC specification defines."

	| request |

	request := [ Json readFrom: aJsonString readStream ]
		on: Error
		do: [ :aParseError | ^self jsonParseError ].

	^(self responseTo: request) ifNotNil: [ :response | Json render: response ]! !

!MCPServer methodsFor: 'handling requests' stamp: ''!
process: aRequest

	"Handle one message read from a streaming transport, writing its answer back on it.
	A nil message means the stream closed, which stops the server."

	aRequest
		ifNil: [ running := false ]
		ifNotNil: [ :request |
			(self responseTo: request) ifNotNil: [ :response |
				transport writeMessage: (Json render: response) ] ]! !

!MCPServer methodsFor: 'handling requests' stamp: ''!
responseTo: aRequest

	"Answer the JSON-RPC response for aRequest, or nil when aRequest is a notification and
	expects no answer."

	| receivedTime response |

	LastReceived := aRequest.
	receivedTime := self logReceived: aRequest.
	response := self handleRequest: aRequest.
	response ifNotNil: [ :anAnswer |
		LastAnswered := anAnswer.
		self logAnswered: anAnswer receivedAt: receivedTime ].

	^response! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:18:55 pm (UTC)'!
servingOver: aTransport

	^self new initializeServingOver: aTransport! !

!MCPServer class methodsFor: 'instance creation' stamp: ''!
servingOverHttpAtPort: aPortNumber

	"Answer a server that answers the requests posted to the MCP endpoint on aPortNumber,
	authenticating them the way the environment asks for."

	^self servingOverHttpAtPort: aPortNumber authenticatingWith: self httpAuthentication! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:07:14 pm (UTC)'!
servingOverHttpAtPort: aPortNumber authenticatingWith: anAuthentication

	^self servingOver: (MCPTransportHttp listeningAtPort: aPortNumber authenticatingWith: anAuthentication)! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:07:20 pm (UTC)'!
servingOverStandardInputOutput

	"Answer a server that reads its requests from standard input and answers on standard output."

	^self servingOver: MCPTransportStdio new! !

!MCPServer class methodsFor: 'development mode' stamp: 'HAW 19/Aug/2026, 8:13:06 pm (UTC)'!
isDevMode

	^Smalltalk startUpArguments includes: '--devMode' ! !

!MCPServer class methodsFor: 'class initialization' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
initialize

	Smalltalk addToStartUpList: self! !

!MCPServer class methodsFor: 'error descriptions' stamp: ''!
parseErrorDescription

	^'Parse error'! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:06:48 pm (UTC)'!
authenticationRequiring: aToken

	"Answer the authentication for aToken, reading an empty variable as no token at all."

	^aToken
		ifEmpty: [ MCPNoAuthentication new ]
		ifNotEmpty: [ MCPBearerTokenAuthentication requiringToken: aToken ]! !

!MCPServer class methodsFor: 'command line' stamp: ''!
httpArgument

	"Answer the command line argument that asks for the HTTP transport on the default port."

	^'--mcpHttp'! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:17:12 pm (UTC)'!
httpAuthentication

	"Answer who will decide which requests the endpoint serves. A token in the environment
	turns authentication on, and without one the endpoint serves any client that reaches it."

	^(OSProcess accessor environmentAt: self httpTokenEnvironmentVariableName)
		ifNil: [ MCPNoAuthentication new ]
		ifNotNil: [ :aToken | self authenticationRequiring: aToken ]! !

!MCPServer class methodsFor: 'command line' stamp: ''!
httpPortArgumentPrefix

	"Answer the start of the command line argument that asks for the HTTP transport on a
	given port, as in --mcpHttpPort=2358"

	^'--mcpHttpPort='! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:23:51 pm (UTC)'!
httpPortNumberFromArguments

	"Answer the port named on the command line, or the default one when none is named."

	^Smalltalk startUpArguments
		detect: [ :anArgument | anArgument beginsWith: self httpPortArgumentPrefix ]
		ifFound: [ :portArgument | self portNumberFrom: portArgument ]
		ifNone: [ MCPTransportHttp defaultPortNumber ].
! !

!MCPServer class methodsFor: 'command line' stamp: ''!
httpTokenEnvironmentVariableName

	"Answer the environment variable that carries the bearer token the endpoint requires.
	It is read from the environment and not from the command line, because command line
	arguments are visible to anyone who lists the processes of this machine."

	^'SMALLTALK_MCP_TOKEN'! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:25:10 pm (UTC)'!
isHttpArgument: anArgument

	^anArgument = self httpArgument or: [ anArgument beginsWith: self httpPortArgumentPrefix ]! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:24:57 pm (UTC)'!
isHttpRequested

	"Answer whether the image was launched to serve MCP over HTTP, with or without naming
	a port."

	^Smalltalk startUpArguments anySatisfy: [ :anArgument | self isHttpArgument: anArgument ]! !

!MCPServer class methodsFor: 'command line' stamp: ''!
isStandardInputOutputRequested

	^Smalltalk startUpArguments includes: self standardInputOutputArgument! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:24:05 pm (UTC)'!
portNumberFrom: portArgument 

	^Integer readFrom: (portArgument allButFirst: self httpPortArgumentPrefix size) readStream! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:25:49 pm (UTC)'!
standardInputOutputArgument

	"Answer the command line argument that asks for the standard streams transport."

	^'--mcpStdIO'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 19/Aug/2026, 8:19:51 pm (UTC)'!
startHttpServer

	"Serve MCP over HTTP. The web server listens in processes of its own, so running the
	server answers as soon as the listener is up. The delay lets the image finish starting."

	[ (Delay forMilliseconds: 500) wait.
	(self servingOverHttpAtPort: self httpPortNumberFromArguments) run ]
		forkAt: Processor userBackgroundPriority named: 'MCP HTTP Server'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 19/Aug/2026, 8:26:56 pm (UTC)'!
startStdIOServer

	"Serve MCP over the standard streams in a background process, so the graphical interface
	initializes normally."

	[ (Delay forMilliseconds: 500) wait.
	self servingOverStandardInputOutput run ]
		forkAt: Processor userBackgroundPriority named: 'MCP StdIO Server'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 19/Aug/2026, 8:26:32 pm (UTC)'!
startUp: isResuming

	"Start the server the image was launched for. A server left running by the previous
	life of the image is stopped first, because its streams and its sockets are gone."

	isResuming ifFalse: [ ^self ].
	RunningInstance ifNotNil: [ :aPreviousServer | aPreviousServer stop ].
	self isHttpRequested ifTrue: [ ^self startHttpServer ].
	self isStandardInputOutputRequested ifTrue: [ ^self startStdIOServer ].
	
	"I do not signal an error becuase the image is starting - Hernan"
	Transcript 
		show: 'No MCP Server started. Check image arguments'; 
		newLine! !

!MCPTransport methodsFor: 'serving' stamp: ''!
serveRequestsFor: anMCPServerCopy

	"Start serving MCP requests for anMCPServerCopy. Whether this blocks the calling
	process is up to each transport."

	self subclassResponsibility! !

!MCPTransport methodsFor: 'serving' stamp: ''!
stopServingRequests

	"Stop serving and release whatever is held open. Can be sent to a transport that
	is not serving."

	self subclassResponsibility! !

!MCPTransport methodsFor: 'encoding' stamp: ''!
utf8Decode: aLine

	"stdin entrega un Character por cada byte leido, asi que aLine no es texto todavia:
	es la secuencia de bytes UTF-8 del mensaje, con un code point por byte.
	Sin esto, pi llega como dos Characters (207 y 128) en vez de un solo code point,
	y todo lo que no sea ASCII termina como mojibake al compilarlo o mostrarlo.

	Ojo con asByteArray: sobre un UnicodeString vuelve a encodear en UTF-8, con lo cual
	los bytes se duplicarian. Los code points son los bytes, hay que tomarlos tal cual.

	Si la linea es ASCII puro no hay nada que decodificar y la devolvemos como viene."

	| bytes |

	(aLine anySatisfy: [ :eachCharacter | eachCharacter codePoint > 127 ]) ifFalse: [ ^aLine ].
	(aLine anySatisfy: [ :eachCharacter | eachCharacter codePoint > 255 ]) ifTrue: [ ^aLine ].
	bytes := ByteArray new: aLine size.
	aLine doWithIndex: [ :eachCharacter :index | bytes at: index put: eachCharacter codePoint ].

	^UnicodeString fromUtf8Bytes: bytes! !

!MCPTransportHttp methodsFor: 'initialization' stamp: ''!
initializeListeningAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: anAuthentication

	portNumber := aPortNumber.
	interfaceAddress := anInterfaceAddress.
	authentication := anAuthentication.
	sessions := Dictionary new.
	sessionCounter := 0! !

!MCPTransportHttp methodsFor: 'accessing' stamp: ''!
authentication

	"Answer who decides which requests I serve."

	^authentication! !

!MCPTransportHttp methodsFor: 'accessing' stamp: ''!
interfaceAddress

	^interfaceAddress! !

!MCPTransportHttp methodsFor: 'accessing' stamp: ''!
isServing

	"Answer whether the endpoint is listening."

	^webServer notNil! !

!MCPTransportHttp methodsFor: 'accessing' stamp: ''!
portNumber

	^portNumber! !

!MCPTransportHttp methodsFor: 'accessing' stamp: ''!
sessions

	"Answer the open event streams, indexed by session identifier."

	^sessions! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
addServicesTo: aWebServer

	"Publish the entry points the MCP HTTP transports need, answering JSON-RPC errors
	instead of the web server default error page."

	aWebServer
		addService: self endpointPath
		action: [ :aWebRequest | self respondToEndpointRequest: aWebRequest ]
		methods: self endpointHttpMethods.
	aWebServer
		addService: self messagesPath
		action: [ :aWebRequest | self respondToMessagesRequest: aWebRequest ]
		methods: self messagesHttpMethods.
	aWebServer errorHandler: [ :anError :aWebRequest | self respondWithServerError: anError to: aWebRequest ]! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
interfaceAddressBytes

	"Answer my interface address as the four byte IPv4 address the socket primitive expects."

	^((interfaceAddress findTokens: '.') collect: [ :eachPart | Integer readFrom: eachPart readStream ]) asByteArray! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
newListeningWebServer

	"Answer a web server already listening on my port and interface."

	| aWebServer |

	Socket initializeNetwork.
	aWebServer := WebServer new.
	aWebServer listenOn: portNumber interface: self interfaceAddressBytes.

	^aWebServer! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
serveRequestsFor: anMCPServerCopy

	"Start listening for the requests anMCPServerCopy has to answer. Answers as soon as
	the listener is up, because the web server serves each connection in a process of its own."

	mcpServer := anMCPServerCopy.
	self stopServingRequests.
	webServer := self newListeningWebServer.
	self addServicesTo: webServer! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
shutDown: aWebServer

	aWebServer stopListener.
	aWebServer destroyConnections.
	aWebServer listenerSocket ifNotNil: [ :aListenerSocket | aListenerSocket destroy ]! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
stopServingRequests

	"Stop listening and drop every open event stream."

	self closeAllSessions.
	webServer ifNotNil: [ :aWebServer | self shutDown: aWebServer ].
	webServer := nil! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
endpointHttpMethods

	^#('POST' 'GET' 'DELETE')! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
endpointPath

	"Answer the path where the MCP endpoint answers."

	^'/mcp'! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
messagesEndpointFor: aSessionIdentifier

	"Answer the url an event stream client has to post the messages of its session to."

	^self messagesPath, '?sessionId=', aSessionIdentifier! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
messagesHttpMethods

	^#('POST')! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
messagesPath

	"Answer the path where a client of the event stream transport posts its messages."

	^'/messages'! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
acknowledge: aWebRequest

	"Answer an empty 202: the message was accepted and there is nothing to send back."

	^aWebRequest sendResponseCode: 202 content: '' type: self plainTextContentType close: false! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
bodyOf: aWebRequest

	"Answer the request body as text. A byte oriented body arrives with one Character per
	byte, so it still has to be decoded."

	^self utf8Decode: (aWebRequest content ifNil: [ '' ]) asString! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
endpointResponders

	"Answer the message that responds to each HTTP method that is not a plain JSON-RPC post."

	^Dictionary newFromPairs: {
		'GET'. #openEventStreamFor:.
		'DELETE'. #closeEventStreamFor: }! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
jsonContentType

	^'application/json; charset=utf-8'! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
plainTextContentType

	^'text/plain; charset=utf-8'! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
pushAnswerTo: aWebRequest over: aSession

	"Send the answer to the message in the request body as a message event on aSession."

	| response |

	response := [ mcpServer jsonResponseTo: (self bodyOf: aWebRequest) ]
		on: Error
		do: [ :anError | mcpServer jsonInternalErrorFor: anError ].
	response ifNotNil: [ :aJsonString | aSession sendMessageEvent: aJsonString ]! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
respondToEndpointRequest: aWebRequest

	"POST carries one JSON-RPC message and is answered with its response. GET opens an
	event stream for clients speaking the Server-Sent Events transport, and DELETE ends one.
	A request my authentication turns down is served none of them."

	(authentication authorizes: aWebRequest) ifFalse: [ ^self respondWithUnauthorizedTo: aWebRequest ].

	^self perform: (self responderFor: aWebRequest method) with: aWebRequest! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
respondToJsonRpcRequest: aWebRequest

	"Answer the JSON-RPC response for the message in the request body. A notification has
	no answer, so it is acknowledged instead."

	^(mcpServer jsonResponseTo: (self bodyOf: aWebRequest))
		ifNil: [ self acknowledge: aWebRequest ]
		ifNotNil: [ :aJsonString |
			aWebRequest send200Response: aJsonString asUtf8Bytes contentType: self jsonContentType ]! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
respondToMessagesRequest: aWebRequest

	"Dispatch the message in the body and push its answer over the event stream the request
	names, acknowledging the post as the Server-Sent Events transport requires."

	| session |

	(authentication authorizes: aWebRequest) ifFalse: [ ^self respondWithUnauthorizedTo: aWebRequest ].
	session := self sessionFor: aWebRequest.
	session ifNil: [ ^self respondWithUnknownSessionTo: aWebRequest ].
	self pushAnswerTo: aWebRequest over: session.

	^self acknowledge: aWebRequest! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
respondWithServerError: anError to: aWebRequest

	"Answer a JSON-RPC internal error instead of the web server default error page."

	^aWebRequest
		sendResponseCode: 500
		content: (mcpServer jsonInternalErrorFor: anError) asUtf8Bytes
		type: self jsonContentType
		close: false! !

!MCPTransportHttp methodsFor: 'responding' stamp: 'HAW 19/Aug/2026, 7:27:54 pm (UTC)'!
respondWithUnauthorizedTo: aWebRequest

	"Answer 401 to a request that did not authenticate, and let the connection go, so a
	client that got its credentials wrong does not hold the socket open."

	self closeConnectionOf: aWebRequest.

	^aWebRequest
		sendResponseCode: 401
		content: self class unauthorizedErrorDescription
		type: self plainTextContentType
		close: true! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
respondWithUnknownSessionTo: aWebRequest

	^aWebRequest
		sendResponseCode: 404
		content: self class unknownSessionErrorDescription
		type: self plainTextContentType
		close: false! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
responderFor: anHttpMethod

	^self endpointResponders at: anHttpMethod ifAbsent: [ #respondToJsonRpcRequest: ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
closeAllSessions

	"Close every open event stream and forget them all."

	sessions do: [ :eachSession | eachSession close ].
	sessions := Dictionary new! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
closeEventStreamFor: aWebRequest

	"End the event stream the request names, when it is still open, and acknowledge."

	(self sessionFor: aWebRequest) ifNotNil: [ :aSession | self closeSession: aSession ].

	^self acknowledge: aWebRequest! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
closeSession: aSession

	aSession close.
	sessions removeKey: aSession identifier ifAbsent: [ nil ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
eventStreamHandshake

	"Answer the HTTP headers that open a Server-Sent Events stream."

	^'HTTP/1.1 200 OK', String crlfString,
		'Content-Type: text/event-stream; charset=utf-8', String crlfString,
		'Cache-Control: no-cache', String crlfString,
		'Connection: Keep-Alive', String crlfString,
		String crlfString! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
keepAliveDelay

	^Delay forSeconds: 15! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
keepAliveWhileOpen: aSession

	"Hold the connection with a comment frame now and then, so clients and proxies see it
	alive, until a write fails and closes the session."

	[ aSession isOpen ] whileTrue: [
		aSession sendKeepAlive.
		self keepAliveDelay wait ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
newSessionIdentifier

	sessionCounter := sessionCounter + 1.

	^'mcp-', sessionCounter printString! !

!MCPTransportHttp methodsFor: 'event streams' stamp: 'HAW 19/Aug/2026, 8:06:54 pm (UTC)'!
newSessionWritingTo: aStream

	| session |

	session := MCPHttpSession identifiedAs: self newSessionIdentifier writingTo: aStream.
	sessions at: session identifier put: session.

	^session! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
openEventStreamFor: aWebRequest

	"Open an event stream on this connection: write the handshake, announce where the client
	has to post its messages, and hold the connection until it disconnects. This runs in the
	connection process and blocks there, so nothing else is answered on it."

	| session |

	session := self newSessionWritingTo: aWebRequest stream.
	self writeHandshakeTo: session.
	session isOpen ifTrue: [ self keepAliveWhileOpen: session ].
	self closeSession: session.

	^session! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
sessionFor: aWebRequest

	"Answer the session the request names in its sessionId parameter, or nil when it names
	none or names one that is no longer open."

	| requestedIdentifier |

	requestedIdentifier := aWebRequest getFields at: 'sessionId' ifAbsent: [ ^nil ].

	^sessions at: requestedIdentifier ifAbsent: [ nil ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
writeHandshakeTo: aSession

	"Write the headers that turn the connection into an event stream and announce the
	messages endpoint of the session. A stream that cannot be written to is closed."

	[ aSession stream nextPutAll: self eventStreamHandshake asUtf8Bytes.
	aSession sendEndpointEvent: (self messagesEndpointFor: aSession identifier).
	aSession stream flush ]
		on: Error
		do: [ :aWriteError | aSession close ]! !

!MCPTransportHttp methodsFor: 'as yet unclassified' stamp: 'HAW 19/Aug/2026, 7:28:07 pm (UTC)'!
closeConnectionHeaderValue

	^'close'! !

!MCPTransportHttp methodsFor: 'as yet unclassified' stamp: 'HAW 19/Aug/2026, 7:28:00 pm (UTC)'!
closeConnectionOf: aWebRequest

	"Ask the web server not to keep this connection alive. The header has to be set on the
	request and not on the response, because the server takes the decision from the request
	and then overwrites whatever the response said."

	aWebRequest headerAt: self connectionHeaderName put: self closeConnectionHeaderValue! !

!MCPTransportHttp methodsFor: 'as yet unclassified' stamp: 'HAW 19/Aug/2026, 7:28:05 pm (UTC)'!
connectionHeaderName

	^'Connection'! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:06:48 pm (UTC)'!
listeningAtPort: aPortNumber

	"Answer a transport that serves any client that can reach the loopback interface."

	^self listeningAtPort: aPortNumber authenticatingWith: MCPNoAuthentication new! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: ''!
listeningAtPort: aPortNumber authenticatingWith: anAuthentication

	^self
		listeningAtPort: aPortNumber
		onInterface: self defaultInterfaceAddress
		authenticatingWith: anAuthentication! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:06:48 pm (UTC)'!
listeningAtPort: aPortNumber onInterface: anInterfaceAddress

	^self
		listeningAtPort: aPortNumber
		onInterface: anInterfaceAddress
		authenticatingWith: MCPNoAuthentication new! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: ''!
listeningAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: anAuthentication

	self assertIsValidPortNumber: aPortNumber.
	self assertIsValidInterfaceAddress: anInterfaceAddress.
	self assertIsValidAuthentication: anAuthentication.

	^self new
		initializeListeningAtPort: aPortNumber
		onInterface: anInterfaceAddress
		authenticatingWith: anAuthentication! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:06:42 pm (UTC)'!
listeningAtPort: aPortNumber requiringToken: aToken

	"Answer a transport that serves only the requests carrying aToken."

	^self
		listeningAtPort: aPortNumber
		authenticatingWith: (MCPBearerTokenAuthentication requiringToken: aToken)! !

!MCPTransportHttp class methodsFor: 'defaults' stamp: ''!
defaultInterfaceAddress

	"Answer the loopback address: the endpoint is meant for tools running on this machine."

	^'127.0.0.1'! !

!MCPTransportHttp class methodsFor: 'defaults' stamp: ''!
defaultPortNumber

	"Answer the port the MCP endpoint listens on. It sits next to the one RemoteControlMCP
	uses, so both can serve from the same image."

	^2358! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 8:06:31 pm (UTC)'!
assertIsValidAuthentication: anAuthentication

	(anAuthentication isKindOf: MCPAuthentication)
		ifFalse: [ self error: self invalidAuthenticationErrorDescription ]! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: ''!
assertIsValidInterfaceAddress: anInterfaceAddress

	(anInterfaceAddress isString and: [ anInterfaceAddress notEmpty ])
		ifFalse: [ self error: self invalidInterfaceAddressErrorDescription ]! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: ''!
assertIsValidPortNumber: aPortNumber

	(aPortNumber isInteger and: [ aPortNumber between: 1 and: 65535 ])
		ifFalse: [ self error: self invalidPortNumberErrorDescription ]! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
invalidAuthenticationErrorDescription

	^'The authentication has to be an instance of MCPAuthenticationCopy'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
invalidInterfaceAddressErrorDescription

	^'The interface address has to be a non empty String, for example 127.0.0.1'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
invalidPortNumberErrorDescription

	^'The port number has to be an integer between 1 and 65535'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
unauthorizedErrorDescription

	^'Unauthorized'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
unknownSessionErrorDescription

	^'There is no open event stream with that session identifier'! !

!MCPTransportStdio methodsFor: 'initialization' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
initialize

	| osProc |

	osProc := OSProcess thisOSProcess.
	stdin := osProc stdIn asAsyncFileReadStream.
	stdin setNonBlocking.
	stdout := osProc stdOut.! !

!MCPTransportStdio methodsFor: 'reading' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
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

!MCPTransportStdio methodsFor: 'reading' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
readMessage
	"Read a JSON message from stdin"
	| line |

	line := self readLine.
	line isNil ifTrue: [ ^ nil ].

	^ Json readFrom: (self utf8Decode: line) readStream.! !

!MCPTransportStdio methodsFor: 'writing' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
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

!MCPTransportStdio methodsFor: 'encoding' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
utf8Encode: aString
	"stdout escribe un byte por cada Character, asi que le pasamos los bytes UTF-8
	de aString como un String de bytes. Para ASCII puro esto es la identidad."

	| bytes |
	bytes := aString asUtf8Bytes.
	^(String new: bytes size) replaceFrom: 1 to: bytes size with: bytes startingAt: 1! !

!MCPTransportStdio methodsFor: 'serving' stamp: ''!
serveRequestsFor: anMCPServerCopy

	"Read one message at a time from standard input and let anMCPServerCopy answer it on
	standard output. Blocks the calling process until the server stops running."

	[ anMCPServerCopy isRunning ] whileTrue: [ anMCPServerCopy process: self readMessage ]! !

!MCPTransportStdio methodsFor: 'serving' stamp: ''!
stopServingRequests

	"Standard input and output belong to the operating system process, so there is
	nothing to release here."! !
MCPServer initialize!
