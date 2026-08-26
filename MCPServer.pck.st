'From Cuis7.9 [latest update: #8134] on 26 August 2026 at 12:46:35 pm'!
'Description Answer the changes a refactoring made'!
!provides: 'MCPServer' 1 22!
SystemOrganization addCategory: 'MCPServer'!


!classDefinition: #MCPAuthentication category: 'MCPServer'!
Object subclass: #MCPAuthentication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPAuthentication class' category: 'MCPServer'!
MCPAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPBearerTokenAuthentication category: 'MCPServer'!
MCPAuthentication subclass: #MCPBearerTokenAuthentication
	instanceVariableNames: 'token'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPBearerTokenAuthentication class' category: 'MCPServer'!
MCPBearerTokenAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPNoAuthentication category: 'MCPServer'!
MCPAuthentication subclass: #MCPNoAuthentication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPNoAuthentication class' category: 'MCPServer'!
MCPNoAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggingSession category: 'MCPServer'!
Object subclass: #MCPDebuggingSession
	instanceVariableNames: ''
	classVariableNames: 'Current'
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggingSession class' category: 'MCPServer'!
MCPDebuggingSession class
	instanceVariableNames: ''!

!classDefinition: #MCPNoDebuggingSession category: 'MCPServer'!
MCPDebuggingSession subclass: #MCPNoDebuggingSession
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPNoDebuggingSession class' category: 'MCPServer'!
MCPNoDebuggingSession class
	instanceVariableNames: ''!

!classDefinition: #MCPOpenDebuggingSession category: 'MCPServer'!
MCPDebuggingSession subclass: #MCPOpenDebuggingSession
	instanceVariableNames: 'debugger'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPOpenDebuggingSession class' category: 'MCPServer'!
MCPOpenDebuggingSession class
	instanceVariableNames: ''!

!classDefinition: #MCPHttpSession category: 'MCPServer'!
Object subclass: #MCPHttpSession
	instanceVariableNames: 'identifier stream writeMutualExclusion open'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPHttpSession class' category: 'MCPServer'!
MCPHttpSession class
	instanceVariableNames: ''!

!classDefinition: #MCPServer category: 'MCPServer'!
Object subclass: #MCPServer
	instanceVariableNames: 'transport running debugger debuggerMorph shouldLogMessages tools smalltalk'
	classVariableNames: 'RunningInstance'
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPServer class' category: 'MCPServer'!
MCPServer class
	instanceVariableNames: ''!

!classDefinition: #MCPTool category: 'MCPServer'!
Object subclass: #MCPTool
	instanceVariableNames: 'name description properties'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTool class' category: 'MCPServer'!
MCPTool class
	instanceVariableNames: ''!

!classDefinition: #MCPBrowseTool category: 'MCPServer'!
MCPTool subclass: #MCPBrowseTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPBrowseTool class' category: 'MCPServer'!
MCPBrowseTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDefineClassTool category: 'MCPServer'!
MCPTool subclass: #MCPDefineClassTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDefineClassTool class' category: 'MCPServer'!
MCPDefineClassTool class
	instanceVariableNames: ''!

!classDefinition: #MCPEvaluateToDebugOnErrorTool category: 'MCPServer'!
MCPTool subclass: #MCPEvaluateToDebugOnErrorTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPEvaluateToDebugOnErrorTool class' category: 'MCPServer'!
MCPEvaluateToDebugOnErrorTool class
	instanceVariableNames: ''!

!classDefinition: #MCPPluggableTool category: 'MCPServer'!
MCPTool subclass: #MCPPluggableTool
	instanceVariableNames: 'executeBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPluggableTool class' category: 'MCPServer'!
MCPPluggableTool class
	instanceVariableNames: ''!

!classDefinition: #MCPToolGroup category: 'MCPServer'!
Object subclass: #MCPToolGroup
	instanceVariableNames: 'smalltalk'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolGroup class' category: 'MCPServer'!
MCPToolGroup class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringToolGroup category: 'MCPServer'!
MCPToolGroup subclass: #MCPRefactoringToolGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPRefactoringToolGroup class' category: 'MCPServer'!
MCPRefactoringToolGroup class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringTools category: 'MCPServer'!
MCPRefactoringToolGroup subclass: #MCPRefactoringTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPRefactoringTools class' category: 'MCPServer'!
MCPRefactoringTools class
	instanceVariableNames: ''!

!classDefinition: #MCPToolProperty category: 'MCPServer'!
Object subclass: #MCPToolProperty
	instanceVariableNames: 'name description required absentBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolProperty class' category: 'MCPServer'!
MCPToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPClassToolProperty category: 'MCPServer'!
MCPToolProperty subclass: #MCPClassToolProperty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPClassToolProperty class' category: 'MCPServer'!
MCPClassToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodProperty category: 'MCPServer'!
MCPToolProperty subclass: #MCPMethodProperty
	instanceVariableNames: 'classProperty selectorProperty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPMethodProperty class' category: 'MCPServer'!
MCPMethodProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPPlainToolProperty category: 'MCPServer'!
MCPToolProperty subclass: #MCPPlainToolProperty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPlainToolProperty class' category: 'MCPServer'!
MCPPlainToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPPluggableToolProperty category: 'MCPServer'!
MCPToolProperty subclass: #MCPPluggableToolProperty
	instanceVariableNames: 'valueBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPluggableToolProperty class' category: 'MCPServer'!
MCPPluggableToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPTransport category: 'MCPServer'!
Object subclass: #MCPTransport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransport class' category: 'MCPServer'!
MCPTransport class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportHttp category: 'MCPServer'!
MCPTransport subclass: #MCPTransportHttp
	instanceVariableNames: 'portNumber interfaceAddress webServer mcpServer sessions sessionCounter authentication'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransportHttp class' category: 'MCPServer'!
MCPTransportHttp class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportText category: 'MCPServer'!
MCPTransport subclass: #MCPTransportText
	instanceVariableNames: 'in out'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransportText class' category: 'MCPServer'!
MCPTransportText class
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

!MCPDebuggingSession commentStamp: '<historical>' prior: 0!
I am the debugger an MCP client is driving.

There is one at a time, so my class answers the current one: an MCPOpenDebuggingSession while an evaluation is suspended at an error, and an MCPNoDebuggingSession when there is none, which answers every message with the error a client gets for driving a debugger that is not there.!

!MCPHttpSession commentStamp: '<historical>' prior: 0!
I am one open Server-Sent Events stream between an MCPTransportHttpCopy and a client that speaks the older SSE transport.

I know my identifier, which the client sends back in the sessionId parameter of every message it posts, and the socket stream my events are written to. Only one writer at a time writes on that stream. A write that fails closes me, and a closed session never writes again.!

!MCPTool commentStamp: '<historical>' prior: 0!
I am a tool an MCP server offers.

I am created with my name, my description and the properties a request can carry for me, so one class serves many tools. I answer the definition a client is shown, and valueWithArguments: anArguments, which my subclasses implement.

MCPPluggableTool covers the tools whose work is an expression; write a subclass of mine when the work is more than a block should hold, as MCPDefineClassTool does.!

!MCPBrowseTool commentStamp: '<historical>' prior: 0!
I am the tool that describes a class: its superclass, its variables, its selectors and its comment.

I am a class of my own because what I answer is a dictionary built field by field, which is more than a block should hold.!

!MCPDefineClassTool commentStamp: '<historical>' prior: 0!
I am the tool that defines a class.

The definition a request carries is parsed and judged before it is evaluated, so that a request that is not a class definition does not change the image. That is more than a block should hold, which is why I am a class of my own.!

!MCPEvaluateToDebugOnErrorTool commentStamp: '<historical>' prior: 0!
I am the tool that evaluates code and leaves a debugger open when it fails.

I am a class of my own because I run the evaluation in a process of its own, so the process answering the request is not the one left suspended at the error.!

!MCPPluggableTool commentStamp: '<historical>' prior: 0!
I am a tool whose work is the block I was created with.

I read my properties out of the arguments of a request and evaluate my block with their values, so the block takes one parameter per property, in the order they were given to me. I answer valueWithArguments: the way my block does, which is why the two read alike.!

!MCPToolGroup commentStamp: '<historical>' prior: 0!
I am a group of tools a server offers.

Every subclass of mine is asked to add its tools, so a package that has some is one that subclasses me, and a package that is not loaded adds none. There is nothing to register and nothing to forget to register.!

!MCPRefactoringToolGroup commentStamp: '<historical>' prior: 0!
I am a group of tools that apply refactorings.

I know how a refactoring is applied and what my subclasses need to build one: the scope a refactoring over a selector works on, the class a name stands for, and the names a client sent as one text.

A group of mine that has tools of its own is named after the refactorings it offers, as MCPRefactoringTools; a group of mine that only gathers others is named a tool group, as I am.!

!MCPRefactoringTools commentStamp: '<historical>' prior: 0!
I am every tool that applies a refactoring of the image I was made for.

A server asks me for my tools and offers them; what a refactoring needs to be built, and how a piece of source is named by the text it is written with or by the interval it occupies, is mine to know and not the server's.!

!MCPToolProperty commentStamp: '<historical>' prior: 0!
I am a property a client can send to an MCP tool.

I know my propertyName, my description and whether I am required, which is what a tool shows a client in its inputSchema, and I answer valueFrom: anArguments, which reads me out of the arguments of a request and answers the object the tool needs.

A required property signals when it is missing; an optional one answers the value it was created with.

Each tool creates the properties it takes in its own class side, in methods named after them, so a tool reads the arguments it declares and nothing else.!

!MCPClassToolProperty commentStamp: '<historical>' prior: 0!
I am the class a request names.

I answer the class itself rather than its name, and I do not report a missing className as a missing property: a client that sends none is told the class was not found, which is what it was asking for.!

!MCPPlainToolProperty commentStamp: '<historical>' prior: 0!
I am a property whose value is the one that came in the request, with nothing done to it.!

!MCPPluggableToolProperty commentStamp: '<historical>' prior: 0!
I am a property that turns the value that came in the request into the one the tool needs by evaluating the block I was created with.

When that block would be long, or would need state of its own, write a subclass of MCPToolProperty instead - MCPClassToolProperty is one.!

!MCPTransport commentStamp: '<historical>' prior: 0!
I am the way an MCPServer talks to its client.

My subclasses know how requests arrive and how answers go back: MCPTransportText reads and writes a pair of character streams, one message to a line, which is how the standard streams of the operating system process are served, and MCPTransportHttp listens on a TCP port and serves the MCP HTTP endpoint.!

!MCPTransportHttp commentStamp: '<historical>' prior: 0!
I serve MCP over TCP, speaking JSON-RPC on top of HTTP the same way RemoteControlMCP does.

I publish two entry points on a WebServer:
- my endpointPath (/mcp) answers POST with the response to the message in the body, which is all a Streamable HTTP client needs. GET on it opens a Server-Sent Events stream for clients that speak the older SSE transport, and DELETE ends that stream.
- my messagesPath (/messages) takes the messages of an event stream client, named by a sessionId parameter, and pushes each answer as a message event on that stream.

Every request goes through my authentication before it is served, and one that it turns down is answered 401. I listen on the interface I was created with, the loopback one by default, so the endpoint is reachable only from this machine. Configure a client with the url http://127.0.0.1:2358/mcp!

!MCPTransportText commentStamp: '<historical>' prior: 0!
I carry MCP messages over a pair of character streams, one message to a line.

I am created with the streams I read and write, so standard input and output are only one of the pairs I work on: onStandardInputOutput answers me on them, and readingFrom:writingTo: answers me on any other, which is how I am tested.

I read a line at a time and leave its text unparsed, so that a line that is not JSON is answered with a parse error by the server instead of raising here and stopping the loop.!

!MCPAuthentication methodsFor: 'authorizing' stamp: ''!
!methodProperties: {}!
authorizes: aWebRequest

	"Answer whether aWebRequest may be served."

	self subclassResponsibility! !

!MCPBearerTokenAuthentication methodsFor: 'initialization' stamp: ''!
!methodProperties: {}!
initializeRequiringToken: aToken

	token := aToken! !

!MCPBearerTokenAuthentication methodsFor: 'authorizing' stamp: ''!
!methodProperties: {}!
authorizes: aWebRequest

	"Answer whether aWebRequest carries my token. A request without an authorization
	header carries an empty one, which never matches."

	^(aWebRequest headerAt: self class authorizationHeaderName) = self expectedAuthorizationHeader! !

!MCPBearerTokenAuthentication methodsFor: 'authorizing' stamp: ''!
!methodProperties: {}!
expectedAuthorizationHeader

	"Answer the authorization header a request has to carry to be served."

	^self class bearerScheme, token! !

!MCPBearerTokenAuthentication class methodsFor: 'instance creation' stamp: ''!
!methodProperties: {}!
requiringToken: aToken

	self assertIsValidToken: aToken.

	^self new initializeRequiringToken: aToken! !

!MCPBearerTokenAuthentication class methodsFor: 'preconditions' stamp: ''!
!methodProperties: {}!
assertIsValidToken: aToken

	(aToken isString and: [ aToken notEmpty ])
		ifFalse: [ self error: self invalidTokenErrorDescription ]! !

!MCPBearerTokenAuthentication class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
invalidTokenErrorDescription

	^'The bearer token has to be a non empty String'! !

!MCPBearerTokenAuthentication class methodsFor: 'constants' stamp: ''!
!methodProperties: {}!
authorizationHeaderName

	^'authorization'! !

!MCPBearerTokenAuthentication class methodsFor: 'constants' stamp: ''!
!methodProperties: {}!
bearerScheme

	"Answer the authorization scheme that names a token, with its separating space."

	^'Bearer '! !

!MCPNoAuthentication methodsFor: 'authorizing' stamp: ''!
!methodProperties: {}!
authorizes: aWebRequest

	"Every request is served: the endpoint asks for no credentials."

	^true! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
finish

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
proceed

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
restart

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
stepInto

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
stepOver

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
through

	^self subclassResponsibility
! !

!MCPDebuggingSession class methodsFor: 'current session' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
current

	^Current ifNil: [ Current := MCPNoDebuggingSession new ]
! !

!MCPDebuggingSession class methodsFor: 'current session' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
openOnErrorAt: aSignalerContext

	"Open a debugger on the process signalling at aSignalerContext, which is the process
	evaluating the code and not the one answering the request."

	Current := MCPOpenDebuggingSession debugging: Processor activeProcess at: aSignalerContext
! !

!MCPDebuggingSession class methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
finishCurrent

	| answer |

	answer := self current finish.
	Current := MCPNoDebuggingSession new.

	^answer
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
finish

	^self class noDebuggerErrorDescriptionFor: 'finish'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
proceed

	^self class noDebuggerErrorDescriptionFor: 'proceed'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
restart

	^self class noDebuggerErrorDescriptionFor: 'restart'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
stepInto

	^self class noDebuggerErrorDescriptionFor: 'stepInto'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
stepOver

	^self class noDebuggerErrorDescriptionFor: 'stepOver'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
through

	^self class noDebuggerErrorDescriptionFor: 'through'
! !

!MCPNoDebuggingSession class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
noDebuggerErrorDescriptionFor: anActionName

	^'Error: no debugger to ', anActionName
! !

!MCPOpenDebuggingSession methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 2:13:21 pm (UTC)'!
!methodProperties: {}!
initializeDebugger: aDebugger

	debugger := aDebugger
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
finish

	"Close the window my debugger is the model of. Telling the debugger its window is closing
	is what terminates the process it was debugging, and the window is then let go of its
	model, because closing a debugger window that still has one asks it about code it has
	just thrown away."

	DebuggerWindow
		debuggerWindowsSatisfying: [ :aDebugger | aDebugger == debugger ]
		do: [ :aDebuggerWindow |
			debugger windowIsClosing.
			aDebuggerWindow model: nil.
			aDebuggerWindow delete ].

	^'Finished'
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:32:13 pm (UTC)'!
!methodProperties: {}!
proceed

	debugger proceed.

	^'Proceeded'
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
restart

	debugger restart.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
stepInto

	debugger send.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:32:11 pm (UTC)'!
!methodProperties: {}!
stepOver

	debugger doStep.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
through

	debugger stepIntoBlock.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
topOfStackDescription

	^debugger contextStackList first printString
! !

!MCPOpenDebuggingSession class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
debuggerLabel

	^'Debugged Debugger'
! !

!MCPOpenDebuggingSession class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 2:13:21 pm (UTC)'!
!methodProperties: {}!
debugging: aProcess at: aSignalerContext

	| debugger |

	debugger := Debugger new process: aProcess context: aSignalerContext.
	debugger openFullMorphicLabel: self debuggerLabel.

	^self new initializeDebugger: debugger
! !

!MCPHttpSession methodsFor: 'initialization' stamp: ''!
!methodProperties: {}!
initializeIdentifiedAs: anIdentifier writingTo: aStream

	identifier := anIdentifier.
	stream := aStream.
	open := true.
	writeMutualExclusion := Semaphore forMutualExclusion! !

!MCPHttpSession methodsFor: 'accessing' stamp: ''!
!methodProperties: {}!
identifier

	^identifier! !

!MCPHttpSession methodsFor: 'accessing' stamp: ''!
!methodProperties: {}!
stream

	^stream! !

!MCPHttpSession methodsFor: 'opening and closing' stamp: ''!
!methodProperties: {}!
close

	"Stop writing events to this session. Can be sent to an already closed session."

	open := false! !

!MCPHttpSession methodsFor: 'opening and closing' stamp: ''!
!methodProperties: {}!
isOpen

	"Answer whether events can still be written to this session."

	^open! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
!methodProperties: {}!
sendEndpointEvent: anEndpointUrl

	"Tell the client where it has to post the messages of this session."

	self sendEvent: 'endpoint' data: anEndpointUrl! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
!methodProperties: {}!
sendEvent: anEventName data: aDataString

	self sendFrame: 'event: ', anEventName, String crlfString,
		'data: ', aDataString, String crlfString, String crlfString! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
!methodProperties: {}!
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
!methodProperties: {}!
sendKeepAlive

	"Send a comment frame, so clients and proxies see the connection alive."

	self sendFrame: ': keep-alive', String crlfString, String crlfString! !

!MCPHttpSession methodsFor: 'sending events' stamp: ''!
!methodProperties: {}!
sendMessageEvent: aJsonString

	"Send one JSON-RPC answer as a message event."

	self sendEvent: 'message' data: aJsonString! !

!MCPHttpSession class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 10:55:26 pm (UTC)'!
!methodProperties: {}!
identifiedAs: anIdentifier writingTo: aStream

	^self new initializeIdentifiedAs: anIdentifier writingTo: aStream! !

!MCPServer methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
!methodProperties: {}!
initializeServingOver: aTransport smalltalk: aSmalltalk

	transport := aTransport.
	smalltalk := aSmalltalk.
	running := false.
	self initializeTools.
	self doNotLogMessages
! !

!MCPServer methodsFor: 'initialization' stamp: 'HAW 25/Aug/2026, 10:51:07 am (UTC)'!
!methodProperties: {}!
initializeTools

	tools := Dictionary new.
	self addDebuggingTools.
	self addClassTools.
	self addSearchTools.
	self addMiscTools.
	self addProvidedTools! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:32:05 pm (UTC)'!
!methodProperties: {}!
doNotLogMessages

	shouldLogMessages := false! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:31:54 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
logMessages

	shouldLogMessages := true! !

!MCPServer methodsFor: 'logging' stamp: 'HAW 19/Aug/2026, 8:31:54 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
isRunning

	"Answer whether I am still serving requests."

	^running! !

!MCPServer methodsFor: 'running' stamp: ''!
!methodProperties: {}!
run

	"Serve MCP requests over my transport until stopped. Whether this blocks the calling
	process is up to the transport."

	RunningInstance := self.
	running := true.
	transport serveRequestsFor: self! !

!MCPServer methodsFor: 'running' stamp: ''!
!methodProperties: {}!
stop

	running := false.
	transport stopServingRequests.
	RunningInstance := nil! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 9:05:34 pm (UTC)'!
!methodProperties: {}!
dispatch: aMethod with: aParams ifNone: aNoneBlock

	aMethod = 'initialize' ifTrue: [ ^ self handleInitialize: aParams ].
	aMethod = 'tools/list' ifTrue: [ ^ self handleToolsList: aParams ].
	aMethod = 'tools/call' ifTrue: [ ^ self handleToolsCall: aParams ].
	aMethod = 'ping' ifTrue: [ ^ Dictionary new ].
	
	^aNoneBlock value! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 9:09:59 pm (UTC)'!
!methodProperties: {}!
handleMethod: aMethod with: aParams identifiedAs: anId 

	^[ | methodResult |
		methodResult := self 
			dispatch: aMethod 
			with: aParams 
			ifNone: [ ^self methodNotFoundResponseFor: anId on: aMethod].
		self successResponseFor: anId result: methodResult ]
		on: Error
		do: [ :anError | self internalErrorResponseFor: anId withError: anError ].
	! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 9:02:12 pm (UTC)'!
!methodProperties: {}!
handleNotification: aMethod with: aParams
	
	"Right now it does nothing. Change to support  cancellation - Hernan"
	
	aMethod = 'notifications/initialized' ifTrue: [ ^ nil ].
	aMethod = 'notifications/cancelled' ifTrue: [ ^ nil ].
	
	^nil! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 8:57:28 pm (UTC)'!
!methodProperties: {}!
handleRequest: aRequest
	
	| method id params |

	method := aRequest at: 'method' ifAbsent: [ ^ nil ].
	id := aRequest at: 'id' ifAbsent: [ nil ].
	params := aRequest at: 'params' ifAbsent: [ Dictionary new ].
	
	^id 
		ifNil: [ self handleNotification: method with: params ]
		ifNotNil: [ self handleMethod: method with: params identifiedAs: id ]! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:12:43 pm (UTC)'!
!methodProperties: {}!
jsonResponseTo: aJsonString

	| request |

	request := [ Json readFrom: aJsonString readStream ]
		on: Error
		do: [ :aParseError | ^self jsonParseError ].

	^(self responseTo: request) ifNotNil: [ :response | Json render: response ]! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:13:30 pm (UTC)'!
!methodProperties: {}!
responseTo: aRequest

	| receivedTime response |

	receivedTime := self logReceived: aRequest.
	response := self handleRequest: aRequest.
	response ifNotNil: [ :anAnswer |
		self logAnswered: anAnswer receivedAt: receivedTime ].

	^response! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:08:53 pm (UTC)'!
!methodProperties: {}!
errorFor: aCode with: aMessage

	^OrderedDictionary new
		at: 'code' put: aCode;
		at: 'message' put: aMessage;
		yourself! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:12:07 pm (UTC)'!
!methodProperties: {}!
errorResponseFor: anId code: aCode message: aMessage
	
	^ (self responseFor: anId)
		at: 'error' put: (self errorFor: aCode with: aMessage);
		yourself.! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
!methodProperties: {}!
internalErrorResponseFor: anId withError: anError

	^ self errorResponseFor: anId code: -32603 message: anError printString! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 24/Aug/2026, 12:07:52 pm (UTC)'!
!methodProperties: {}!
jsonInternalErrorWith: anError

	^Json render: (self errorResponseFor: nil code: -32603 message: anError description)! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 24/Aug/2026, 1:50:33 pm (UTC)'!
!methodProperties: {}!
jsonParseError

	^Json render: (self errorResponseFor: nil code: -32700 message: self class parseErrorDescription)! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
!methodProperties: {}!
methodNotFoundResponseFor: anId on: aMethod

	^ self errorResponseFor: anId code: -32601 message: 'Unknown method: ' , aMethod! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 20/Aug/2026, 2:40:05 pm (UTC)'!
!methodProperties: {}!
responseFor: anId

	^ OrderedDictionary new
		at: 'jsonrpc' put: '2.0';
		at: 'id' put: anId;
		yourself! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 9:11:35 pm (UTC)'!
!methodProperties: {}!
successResponseFor: anId result: aResult
	
	^ (self responseFor: anId)
		at: 'result' put: aResult;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:17:21 pm (UTC)'!
!methodProperties: {}!
capabilities

	^ OrderedDictionary new
		at: 'tools' put: Dictionary new;
		yourself
					
					! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 24/Aug/2026, 12:02:27 pm (UTC)'!
!methodProperties: {}!
contentFor: resultText

	^ Dictionary new
		at: 'type' put: 'text';
		at: 'text' put: resultText;
		yourself! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:17:39 pm (UTC)'!
!methodProperties: {}!
handleInitialize: aParams
	
	^ OrderedDictionary new
		at: 'protocolVersion' put: '2024-11-05';
		at: 'capabilities' put: self capabilities;
		at: 'serverInfo' put: self serverInfo;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:19:59 pm (UTC)'!
!methodProperties: {}!
handleToolsCall: aParams

	| name arguments resultText |

	name := aParams at: 'name' ifAbsent: [ '' ].
	arguments := aParams at: 'arguments' ifAbsent: [ Dictionary new ].
	resultText := self executeTool: name arguments: arguments.
	
	^ Dictionary new
		at: 'content' put: { self contentFor: resultText };
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:20:20 pm (UTC)'!
!methodProperties: {}!
handleToolsList: params

	^ OrderedDictionary new
		at: 'tools' put: self toolDefinitions;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:17:52 pm (UTC)'!
!methodProperties: {}!
serverInfo
	
	^OrderedDictionary new
		at: 'name' put: 'cuis-smalltalk';
		at: 'version' put: '1.0.0';
		yourself! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 24/Aug/2026, 11:46:29 am (UTC)'!
!methodProperties: {}!
toolDefinitions

	^tools values collect: [ :eachTool | eachTool definition ]
! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 24/Aug/2026, 11:46:29 am (UTC)'!
!methodProperties: {}!
executeTool: aToolName arguments: anArguments

	^(self toolNamed: aToolName) valueWithArguments: anArguments

! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 21/Aug/2026, 6:14:03 pm (UTC)'!
!methodProperties: {}!
signalUnknownTool: aToolName

	self error: (self class unknownToolErrorDescriptionFor: aToolName)
! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 24/Aug/2026, 11:45:29 am (UTC)'!
!methodProperties: {}!
toolNamed: aToolName

	^tools at: aToolName ifAbsent: [ self signalUnknownTool: aToolName ]
! !

!MCPServer methodsFor: 'tool creation - debugging' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
debuggerProceedTool

	^MCPPluggableTool
		named: 'smalltalk_debugger_proceed'
		describedBy: 'It does a proceed on the debugger, that means running the debugging procees to the end'
		properties: #()
		executingWith: [ MCPDebuggingSession current proceed ]
! !

!MCPServer methodsFor: 'tool creation - debugging' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
debuggerRestartTool

	^MCPPluggableTool
		named: 'smalltalk_debugger_restart'
		describedBy: 'It does a restart on the debugger, that means restarting the current execution context, that is thisContext'
		properties: #()
		executingWith: [ MCPDebuggingSession current restart ]
! !

!MCPServer methodsFor: 'tool creation - debugging' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
debuggerStepIntoTool

	^MCPPluggableTool
		named: 'smalltalk_debugger_stepinto'
		describedBy: 'It does a step into on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack'
		properties: #()
		executingWith: [ MCPDebuggingSession current stepInto ]
! !

!MCPServer methodsFor: 'tool creation - debugging' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
debuggerStepOverTool

	^MCPPluggableTool
		named: 'smalltalk_debugger_stepover'
		describedBy: 'It does a step over on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack'
		properties: #()
		executingWith: [ MCPDebuggingSession current stepOver ]
! !

!MCPServer methodsFor: 'tool creation - debugging' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
debuggerThroughTool

	^MCPPluggableTool
		named: 'smalltalk_debugger_through'
		describedBy: 'It does a thought on the debugger created by smalltalk_evaluate_to_debug_on_error. Doing a through means going inside of the next block closure. If the next instruction is not a block closure it is the same as doind a step over. Returns the print string of the top of the stack'
		properties: #()
		executingWith: [ MCPDebuggingSession current through ]
! !

!MCPServer methodsFor: 'tool creation - debugging' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
evaluateToDebugOnErrorTool

	^MCPEvaluateToDebugOnErrorTool
		named: 'smalltalk_evaluate_to_debug_on_error'
		describedBy: 'Evaluate arbitrary Smalltalk code, return the result if no error, return the string ''Error: '' with the exception description and install a debugger to debug the error using the tools smalltalk_debugger_stepinto, smalltalk_debugger_stepover, smalltalk_debugger_through, smalltalk_debugger_proceed, smalltalk_debugger_restart, smalltalk_finish_debugging.'
		properties: { MCPPlainToolProperty named: 'code' describedBy: 'Smalltalk code to evaluate' }

! !

!MCPServer methodsFor: 'tool creation - misc' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
evaluateTool

	^MCPPluggableTool
		named: 'smalltalk_evaluate'
		describedBy: 'Evaluate arbitrary Smalltalk code and return the result.'
		properties: { MCPPlainToolProperty named: 'code' describedBy: 'Smalltalk code to evaluate' }
		executingWith: [ :aCode | (Compiler evaluate: aCode) printString ]
! !

!MCPServer methodsFor: 'tool creation - misc' stamp: 'HAW 24/Aug/2026, 1:56:00 pm (UTC)'!
!methodProperties: {}!
saveImageTool

	^MCPPluggableTool
		named: 'smalltalk_save_image'
		describedBy: 'Save the Smalltalk image to disk.'
		properties: #()
		executingWith: [
			[ smalltalk saveImage ] fork.
			(Delay forSeconds: 1) wait.
			'Image saved: ', smalltalk imageName ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
browseTool

	^MCPBrowseTool
		named: 'smalltalk_browse'
		describedBy: 'Browse a class to see its superclass, instance variables, class variables, and method selectors.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class to browse' }
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
classesInCategoryTool

	^MCPPluggableTool
		named: 'smalltalk_classes_in_category'
		describedBy: 'List all classes in a specific category.'
		properties: { MCPPlainToolProperty named: 'category' describedBy: 'Name of the category' }
		executingWith: [ :aCategory |
			Json render: ((SystemOrganization classesAt: aCategory) collect: [ :aClass | aClass name ]) asArray sorted ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
defineClassTool

	"The definition a request carries is parsed and judged before it is evaluated, which is more
	than a block should hold, so this tool is a class of its own."

	^MCPDefineClassTool
		named: 'smalltalk_define_class'
		describedBy: 'Define a new class or modify an existing class definition.'
		properties: { MCPPlainToolProperty named: 'definition' describedBy: 'Full class definition expression' }
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
defineMethodTool

	^MCPPluggableTool
		named: 'smalltalk_define_method'
		describedBy: 'Define or modify a method on a class.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'source' describedBy: 'Full method source including selector'.
			MCPPlainToolProperty
				named: 'category'
				describedBy: 'Optional method category. Defaults to as yet unclassified'
				defaultingTo: ClassOrganizer defaultMethodCategory }
		executingWith: [ :aClass :aSource :aMethodCategory |
			self class isDevMode
				ifTrue: [ aClass compile: aSource classified: aMethodCategory ]
				ifFalse: [ aClass compileSilently: aSource classified: aMethodCategory ].
			'Method defined successfully' ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
deleteClassTool

	^MCPPluggableTool
		named: 'smalltalk_delete_class'
		describedBy: 'Remove a class from the system.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class to remove' }
		executingWith: [ :aClass |
			aClass removeFromSystem.
			'Class deleted successfully' ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 25/Aug/2026, 10:59:11 am (UTC)'!
!methodProperties: {}!
deleteMethodTool

	^MCPPluggableTool
		named: 'smalltalk_delete_method'
		describedBy: 'Remove a method from a class.'
		properties: { MCPMethodProperty selectorDescribedBy: 'Selector of the method to remove' }
		executingWith: [ :aMethod |
			aMethod methodClass removeSelector: aMethod selector.
			'Method deleted successfully' ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
finishDebuggingTool

	^MCPPluggableTool
		named: 'smalltalk_finish_debugging'
		describedBy: 'It clean ups all the debugging session. It should always be sent when no more debugging is needed'
		properties: #()
		executingWith: [ MCPDebuggingSession finishCurrent ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
hierarchyTool

	^MCPPluggableTool
		named: 'smalltalk_hierarchy'
		describedBy: 'Get the inheritance hierarchy for a class (from Object down to the class).'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			Json render: (aClass withAllSuperclasses collect: [ :eachClass | eachClass name ]) asArray ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
listCategoriesTool

	^MCPPluggableTool
		named: 'smalltalk_list_categories'
		describedBy: 'List all system categories.'
		properties: #()
		executingWith: [ Json render: SystemOrganization categories asArray sorted ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 2:05:48 pm (UTC)'!
!methodProperties: {}!
listClassesTool

	^MCPPluggableTool
		named: 'smalltalk_list_classes'
		describedBy: 'List all classes in the system, optionally filtered by prefix.'
		properties: {
			MCPPlainToolProperty
				named: 'prefix'
				describedBy: 'Optional prefix to filter class names'
				defaultingTo: '' }
		executingWith: [ :aPrefix |
			Json render: (smalltalk allClasses
				select: [ :aClass | aClass name beginsWith: aPrefix ]
				thenCollect: [ :aClass | aClass name ]) asArray sorted ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 25/Aug/2026, 10:59:11 am (UTC)'!
!methodProperties: {}!
methodSourceTool

	^MCPPluggableTool
		named: 'smalltalk_method_source'
		describedBy: 'Get the source code of a specific method.'
		properties: { MCPMethodProperty ofAMethod }
		executingWith: [ :aMethod | aMethod sourceCode ]
! !

!MCPServer methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:49:22 am (UTC)'!
!methodProperties: {}!
subclassesTool

	^MCPPluggableTool
		named: 'smalltalk_subclasses'
		describedBy: 'Get the direct subclasses of a class.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			Json render: (aClass subclasses collect: [ :eachClass | eachClass name ]) asArray sorted ]

! !

!MCPServer methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
!methodProperties: {}!
addClassTools

	self
		addTool: self browseTool;
		addTool: self hierarchyTool;
		addTool: self subclassesTool;
		addTool: self listClassesTool;
		addTool: self listCategoriesTool;
		addTool: self classesInCategoryTool;
		addTool: self defineClassTool;
		addTool: self deleteClassTool;
		addTool: self methodSourceTool;
		addTool: self defineMethodTool;
		addTool: self deleteMethodTool! !

!MCPServer methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
!methodProperties: {}!
addDebuggingTools

	self
		addTool: self evaluateToDebugOnErrorTool;
		addTool: self debuggerStepIntoTool;
		addTool: self debuggerStepOverTool;
		addTool: self debuggerThroughTool;
		addTool: self debuggerProceedTool;
		addTool: self debuggerRestartTool;
		addTool: self finishDebuggingTool! !

!MCPServer methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
!methodProperties: {}!
addMiscTools

	self
		addTool: self evaluateTool;
		addTool: self saveImageTool! !

!MCPServer methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 1:36:52 pm (UTC)'!
!methodProperties: {}!
addProvidedTools

	"Ask every group of tools there is for the ones it has. A package that has tools has a
	subclass of MCPToolGroup, so a package that is not loaded adds none."

	MCPToolGroup allSubclasses do: [ :eachToolGroupClass |
		eachToolGroupClass isAbstract ifFalse: [
			(eachToolGroupClass for: smalltalk) addToolsTo: self ] ]

! !

!MCPServer methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
!methodProperties: {}!
addSearchTools

	self
		addTool: self sendersOfTool;
		addTool: self implementorsOfTool;
		addTool: self referencesToClassTool;
		addTool: self referencesToInstanceVariableTool;
		addTool: self referencesToClassVariableTool;
		addTool: self searchSourceTool! !

!MCPServer methodsFor: 'tool creation' stamp: 'HAW 24/Aug/2026, 12:58:40 pm (UTC)'!
!methodProperties: {}!
addTool: aTool

	tools at: aTool name put: aTool
! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
!methodProperties: {}!
implementorsOfTool

	^MCPPluggableTool
		named: 'smalltalk_implementors_of'
		describedBy: 'List the methods that implement a selector.'
		properties: {
			MCPPluggableToolProperty
				named: 'selector'
				describedBy: 'Selector the methods implement'
				valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aSelector | self renderReferences: (Smalltalk allImplementorsOf: aSelector) ]
! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
!methodProperties: {}!
referencesToClassTool

	^MCPPluggableTool
		named: 'smalltalk_references_to_class'
		describedBy: 'List the methods that refer to a class.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass | self renderReferences: (Smalltalk allCallsOn: (Smalltalk associationAt: aClass name)) ]
! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
referencesToClassVariableTool

	^MCPPluggableTool
		named: 'smalltalk_references_to_class_variable'
		describedBy: 'List the methods that refer to a class variable. A subclass sees the class variables of its superclass, so the methods of every subclass are listed too.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the class variable' }
		executingWith: [ :aClass :aVariableName |
			| definingClass |
			definingClass := aClass classThatDefinesClassVariable: aVariableName.
			definingClass ifNil: [ self error: (self class classVariableNotFoundErrorDescriptionFor: aVariableName in: aClass) ].
			self renderReferences: (Smalltalk allCallsOn: (definingClass classVarBindingOf: aVariableName asSymbol)) ]
! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
referencesToInstanceVariableTool

	^MCPPluggableTool
		named: 'smalltalk_references_to_instance_variable'
		describedBy: 'List the methods that read or write an instance variable. A subclass sees the instance variables of its superclass, so the methods of every subclass are listed too.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable' }
		executingWith: [ :aClass :aVariableName |
			(aClass allInstVarNames includes: aVariableName)
				ifFalse: [ self error: (self class instanceVariableNotFoundErrorDescriptionFor: aVariableName in: aClass) ].
			self renderReferences: (aClass allBroadAccessesTo: aVariableName) ]
! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
!methodProperties: {}!
renderReferences: aCollectionOfMethodReferences

	"Answer the methods a search found, each named the way a browser names it."

	^Json render: ((aCollectionOfMethodReferences collect: [ :eachReference | eachReference stringVersion ]) asArray sort)

! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
!methodProperties: {}!
searchSourceTool

	^MCPPluggableTool
		named: 'smalltalk_search_source'
		describedBy: 'List the methods whose source code contains a text, case sensitively. Class comments are searched too, and answered as the selector Comment.'
		properties: { MCPPlainToolProperty named: 'text' describedBy: 'Text the source code contains' }
		executingWith: [ :aText | self renderReferences: (Smalltalk allMethodsWithSourceString: aText matchCase: true) ]
! !

!MCPServer methodsFor: 'tool creation - search' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
!methodProperties: {}!
sendersOfTool

	^MCPPluggableTool
		named: 'smalltalk_senders_of'
		describedBy: 'List the methods that send a selector.'
		properties: {
			MCPPluggableToolProperty
				named: 'selector'
				describedBy: 'Selector the methods send'
				valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aSelector | self renderReferences: (Smalltalk allCallsOn: aSelector) ]
! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
!methodProperties: {}!
servingOver: aTransport

	"Answer a server that serves over aTransport and saves the image it is itself running in."

	^self servingOver: aTransport smalltalk: Smalltalk
! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
!methodProperties: {}!
servingOver: aTransport smalltalk: aSmalltalk

	^self new initializeServingOver: aTransport smalltalk: aSmalltalk
! !

!MCPServer class methodsFor: 'instance creation' stamp: ''!
!methodProperties: {}!
servingOverHttpAtPort: aPortNumber

	"Answer a server that answers the requests posted to the MCP endpoint on aPortNumber,
	authenticating them the way the environment asks for."

	^self servingOverHttpAtPort: aPortNumber authenticatingWith: self httpAuthentication! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:07:14 pm (UTC)'!
!methodProperties: {}!
servingOverHttpAtPort: aPortNumber authenticatingWith: anAuthentication

	^self servingOver: (MCPTransportHttp listeningAtPort: aPortNumber authenticatingWith: anAuthentication)! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
servingOverStandardInputOutput

	"Answer a server that reads its requests from standard input and answers on standard output."

	^self servingOver: MCPTransportText onStandardInputOutput

! !

!MCPServer class methodsFor: 'development mode' stamp: 'HAW 19/Aug/2026, 8:13:06 pm (UTC)'!
!methodProperties: {}!
isDevMode

	^Smalltalk startUpArguments includes: '--devMode' ! !

!MCPServer class methodsFor: 'class initialization' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
initialize

	Smalltalk addToStartUpList: self! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
!methodProperties: {}!
classVariableNotFoundErrorDescriptionFor: aVariableName in: aClass

	^'Class variable not found: ', aVariableName, ' in ', aClass name
! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 4:09:26 pm (UTC)'!
!methodProperties: {}!
instanceVariableNotFoundErrorDescriptionFor: aVariableName in: aClass

	^'Instance variable not found: ', aVariableName, ' in ', aClass name
! !

!MCPServer class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
parseErrorDescription

	^'Parse error'! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 6:14:03 pm (UTC)'!
!methodProperties: {}!
unknownToolErrorDescriptionFor: aToolName

	^'Unknown tool: ', aToolName
! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:06:48 pm (UTC)'!
!methodProperties: {}!
authenticationRequiring: aToken

	"Answer the authentication for aToken, reading an empty variable as no token at all."

	^aToken
		ifEmpty: [ MCPNoAuthentication new ]
		ifNotEmpty: [ MCPBearerTokenAuthentication requiringToken: aToken ]! !

!MCPServer class methodsFor: 'command line' stamp: ''!
!methodProperties: {}!
httpArgument

	"Answer the command line argument that asks for the HTTP transport on the default port."

	^'--mcpHttp'! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:35:32 pm (UTC)'!
!methodProperties: {}!
httpAuthentication

	"Answer who will decide which requests the endpoint serves, out of the command line the
	image was launched with and the token its environment carries."

	^self
		httpAuthenticationFor: Smalltalk startUpArguments
		token: (OSProcess accessor environmentAt: self httpTokenEnvironmentVariableName)

! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:42:42 pm (UTC)'!
!methodProperties: {}!
httpAuthenticationFor: someArguments token: aToken

	"Answer who decides which requests the endpoint serves. The command line can turn
	authentication off whatever the environment carries, which is what makes it useful: the
	token can be left in place and ignored for a while. Otherwise a token turns authentication
	on, and without one the endpoint serves any client that reaches it."

	^(self shouldNot: aToken beAuthenticated: someArguments)
		ifTrue: [ MCPNoAuthentication new ]
		ifFalse: [ self authenticationRequiring: aToken ]
! !

!MCPServer class methodsFor: 'command line' stamp: ''!
!methodProperties: {}!
httpPortArgumentPrefix

	"Answer the start of the command line argument that asks for the HTTP transport on a
	given port, as in --mcpHttpPort=2358"

	^'--mcpHttpPort='! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:23:51 pm (UTC)'!
!methodProperties: {}!
httpPortNumberFromArguments

	"Answer the port named on the command line, or the default one when none is named."

	^Smalltalk startUpArguments
		detect: [ :anArgument | anArgument beginsWith: self httpPortArgumentPrefix ]
		ifFound: [ :portArgument | self portNumberFrom: portArgument ]
		ifNone: [ MCPTransportHttp defaultPortNumber ].
! !

!MCPServer class methodsFor: 'command line' stamp: ''!
!methodProperties: {}!
httpTokenEnvironmentVariableName

	"Answer the environment variable that carries the bearer token the endpoint requires.
	It is read from the environment and not from the command line, because command line
	arguments are visible to anyone who lists the processes of this machine."

	^'SMALLTALK_MCP_TOKEN'! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:25:10 pm (UTC)'!
!methodProperties: {}!
isHttpArgument: anArgument

	^anArgument = self httpArgument or: [ anArgument beginsWith: self httpPortArgumentPrefix ]! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:24:57 pm (UTC)'!
!methodProperties: {}!
isHttpRequested

	"Answer whether the image was launched to serve MCP over HTTP, with or without naming
	a port."

	^Smalltalk startUpArguments anySatisfy: [ :anArgument | self isHttpArgument: anArgument ]! !

!MCPServer class methodsFor: 'command line' stamp: ''!
!methodProperties: {}!
isStandardInputOutputRequested

	^Smalltalk startUpArguments includes: self standardInputOutputArgument! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:35:30 pm (UTC)'!
!methodProperties: {}!
noAuthenticationArgument

	"Answer the command line argument that asks the endpoint to serve every client, whatever
	the environment says."

	^'--noAuthentication'
! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:24:05 pm (UTC)'!
!methodProperties: {}!
portNumberFrom: portArgument 

	^Integer readFrom: (portArgument allButFirst: self httpPortArgumentPrefix size) readStream! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:42:42 pm (UTC)'!
!methodProperties: {}!
shouldNot: aToken beAuthenticated: someArguments

	^ aToken isNil or: [ someArguments includes: self noAuthenticationArgument ]! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:25:49 pm (UTC)'!
!methodProperties: {}!
standardInputOutputArgument

	"Answer the command line argument that asks for the standard streams transport."

	^'--mcpStdIO'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 19/Aug/2026, 8:19:51 pm (UTC)'!
!methodProperties: {}!
startHttpServer

	"Serve MCP over HTTP. The web server listens in processes of its own, so running the
	server answers as soon as the listener is up. The delay lets the image finish starting."

	[ (Delay forMilliseconds: 500) wait.
	(self servingOverHttpAtPort: self httpPortNumberFromArguments) run ]
		forkAt: Processor userBackgroundPriority named: 'MCP HTTP Server'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 19/Aug/2026, 8:26:56 pm (UTC)'!
!methodProperties: {}!
startStdIOServer

	"Serve MCP over the standard streams in a background process, so the graphical interface
	initializes normally."

	[ (Delay forMilliseconds: 500) wait.
	self servingOverStandardInputOutput run ]
		forkAt: Processor userBackgroundPriority named: 'MCP StdIO Server'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 19/Aug/2026, 8:26:32 pm (UTC)'!
!methodProperties: {}!
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

!MCPServer class methodsFor: 'constants' stamp: 'HAW 20/Aug/2026, 3:14:08 pm (UTC)'!
!methodProperties: {}!
classCreationSelectors

	"Answer the messages Class understands to create a subclass."

	^Class organization listAtCategoryNamed: 'subclass creation'! !

!MCPTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties

	name := aName.
	description := aDescription.
	properties := aCollectionOfProperties
! !

!MCPTool methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
description

	^description
! !

!MCPTool methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
name

	^name
! !

!MCPTool methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
properties

	^properties
! !

!MCPTool methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
definition

	^OrderedDictionary new
		at: 'name' put: name;
		at: 'description' put: description;
		at: 'inputSchema' put: self inputSchema;
		yourself
! !

!MCPTool methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
inputSchema

	| schema |

	schema := OrderedDictionary new
		at: 'type' put: 'object';
		at: 'properties' put: self propertiesDefinition;
		yourself.
	self requiredPropertyNames ifNotEmpty: [ :aCollectionOfNames | schema at: 'required' put: aCollectionOfNames ].

	^schema
! !

!MCPTool methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 7:30:59 pm (UTC)'!
!methodProperties: {}!
propertiesDefinition

	^properties 
		inject: OrderedDictionary new
		into: [ :aProperties :aToolProperty  | aToolProperty addTo: aProperties ]! !

!MCPTool methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
!methodProperties: {}!
requiredPropertyNames

	^(properties
		inject: OrderedCollection new
		into: [ :someNames :aToolProperty | aToolProperty addRequiredNamesTo: someNames ]) asArray
! !

!MCPTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:33:45 am (UTC)'!
!methodProperties: {}!
valueWithArguments: anArguments

	^self subclassResponsibility
! !

!MCPTool methodsFor: 'executing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
valuesFrom: anArguments

	^properties collect: [ :eachProperty | eachProperty valueFrom: anArguments ]
! !

!MCPTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
named: aName describedBy: aDescription properties: aCollectionOfProperties

	^self new initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties
! !

!MCPBrowseTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:33:45 am (UTC)'!
!methodProperties: {}!
valueWithArguments: anArguments

	| requestedClass browsedClass |

	requestedClass := (self valuesFrom: anArguments) first.
	browsedClass := OrderedDictionary new.
	browsedClass
		at: 'name' put: requestedClass name;
		at: 'superclass' put: requestedClass superclass name;
		at: 'category' put: requestedClass category;
		at: 'instanceVariables' put: requestedClass instVarNames asArray;
		at: 'classVariables' put: requestedClass classVarNames asArray;
		at: 'methods' put: requestedClass selectors asArray sorted;
		at: 'comment' put: (requestedClass comment ifNil: [ '' ]).

	^Json render: browsedClass
! !

!MCPDefineClassTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:48:03 am (UTC)'!
!methodProperties: {}!
assertCreated: aCreatedClass isNamed: aClassName

	"Signal unless evaluating the definition really created the class it names."

	aCreatedClass isBehavior ifFalse: [ self class signalDidNotCreateAClass: aCreatedClass ].
	aCreatedClass name = aClassName
		ifFalse: [ self class signalCreatedAnotherClass: aCreatedClass insteadOf: aClassName ]

! !

!MCPDefineClassTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:48:03 am (UTC)'!
!methodProperties: {}!
valueWithArguments: anArguments

	| definition expectedClassName createdClass |

	definition := (self valuesFrom: anArguments) first.
	expectedClassName := self class classNameCreatedIn: definition.
	createdClass := Compiler evaluate: definition.
	self assertCreated: createdClass isNamed: expectedClassName.

	^'Class defined successfully'
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
classCreationMessageIn: aDefinition

	"Answer the message node aDefinition sends to create a class, signalling when aDefinition
	is not a single send of one of the class creation messages."

	| messageNode |

	messageNode := self messageSentIn: aDefinition.
	(self classCreationSelectors includes: messageNode selectorSymbol)
		ifFalse: [ self signalIsNotAClassCreationMessage: messageNode selectorSymbol ].

	^messageNode
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
classCreationSelectors

	"Answer the messages Class understands to create a subclass."

	^Class organization listAtCategoryNamed: 'subclass creation'
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
classNameCreatedIn: aDefinition

	"Answer the name of the class aDefinition creates, signalling when aDefinition is not a
	single send of one of the class creation messages naming its class with a literal."

	^self classNameIn: (self classCreationMessageIn: aDefinition)
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
classNameIn: aClassCreationMessage

	"Answer the name aClassCreationMessage gives to the class it creates."

	| nameArgument |

	nameArgument := aClassCreationMessage arguments first.
	nameArgument isLiteralNode ifFalse: [ self signalClassNameIsNotALiteral ].

	^nameArgument key
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
messageSentIn: aDefinition

	"Answer the only message node aDefinition sends, signalling when it does not send exactly one."

	| statements returnedStatement |

	statements := (Parser parse: aDefinition class: UndefinedObject noPattern: true) block statements.
	statements size = 1 ifFalse: [ self signalIsNotASingleMessageSend ].
	returnedStatement := statements first.
	(returnedStatement isReturn and: [ returnedStatement expr isMessageNode ])
		ifFalse: [ self signalIsNotASingleMessageSend ].

	^returnedStatement expr
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
classNameIsNotALiteralErrorDescription

	^'The name of the class to create has to be a literal symbol'
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName

	^'The class definition created ', aCreatedClass name, ' instead of ', anExpectedClassName
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
didNotCreateAClassErrorDescriptionFor: anObject

	^'The class definition did not create a class, it answered ', anObject printString
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
isNotAClassCreationMessageErrorDescriptionFor: aSelector

	^'The class definition has to send one of the class creation messages, but it sends #', aSelector
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
isNotASingleMessageSendErrorDescription

	^'The class definition has to be a single message send'
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
signalClassNameIsNotALiteral

	self error: self classNameIsNotALiteralErrorDescription
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
signalCreatedAnotherClass: aCreatedClass insteadOf: anExpectedClassName

	self error: (self createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
signalDidNotCreateAClass: anObject

	self error: (self didNotCreateAClassErrorDescriptionFor: anObject)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
signalIsNotAClassCreationMessage: aSelector

	self error: (self isNotAClassCreationMessageErrorDescriptionFor: aSelector)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
!methodProperties: {}!
signalIsNotASingleMessageSend

	self error: self isNotASingleMessageSendErrorDescription
! !

!MCPEvaluateToDebugOnErrorTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
valueWithArguments: anArguments

	"The evaluation runs in a process of its own so that the one answering the request is not
	the one left suspended at the error for the debugger to drive."

	| code result semaphore |

	code := (self valuesFrom: anArguments) first.
	MCPDebuggingSession finishCurrent.
	semaphore := Semaphore new.
	[[ result := Compiler evaluate: code.
	semaphore signal ]
		on: Error
		do: [ :anError |
			result := 'Error: ', anError messageText.
			MCPDebuggingSession openOnErrorAt: anError signalerContext.
			semaphore signal.
			Processor activeProcess suspend ]] fork.
	semaphore wait.

	^result printString
! !

!MCPPluggableTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties executingWith: aBlock

	self initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties.
	executeBlock := aBlock
! !

!MCPPluggableTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:33:45 am (UTC)'!
!methodProperties: {}!
valueWithArguments: anArguments

	^executeBlock valueWithArguments: (self valuesFrom: anArguments)
! !

!MCPPluggableTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
!methodProperties: {}!
named: aName describedBy: aDescription properties: aCollectionOfProperties executingWith: aBlock

	^self new
		initializeNamed: aName
		describedBy: aDescription
		properties: aCollectionOfProperties
		executingWith: aBlock
! !

!MCPToolGroup methodsFor: 'initialization' stamp: 'HAW 25/Aug/2026, 10:50:45 am (UTC)'!
!methodProperties: {}!
initializeFor: aSmalltalk

	smalltalk := aSmalltalk! !

!MCPToolGroup methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 10:50:45 am (UTC)'!
!methodProperties: {}!
addToolsTo: anMCPServer

	^self subclassResponsibility! !

!MCPToolGroup class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:50:45 am (UTC)'!
!methodProperties: {}!
for: aSmalltalk

	"Answer a provider of tools for aSmalltalk, which is the image its tools work on."

	^self new initializeFor: aSmalltalk! !

!MCPToolGroup class methodsFor: 'testing' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
isAbstract

	"Answer whether I only group other groups instead of having tools of my own. A server asks
	this before it looks for tools, because only a group that has them can be asked for them."

	^self == MCPToolGroup
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
apply: aRefactoring

	"Apply a refactoring the way a RefactoringApplier does once it has one, which is by sending
	it apply. What a client is told is that it worked, because a refactoring that could not be
	made signals instead of answering."

	aRefactoring apply.

	^'Refactoring applied'
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
apply: aRefactoring reportingNewSourceOf: aMethod

	"A refactoring that changes one method answers its new source once it has compiled it.
	Answer that source, naming the method it is now the source of."

	^self descriptionOfNewSource: aRefactoring apply of: aMethod methodClass at: aMethod selector
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
applyReportingChangedMethods: aRefactoring

	"Answer the methods the refactoring changed, which it says when it is applied. A client
	reads them back instead of looking through the system for what moved."

	^self descriptionOfChangedMethods: aRefactoring apply
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
applyReportingNewClass: aRefactoring

	"A refactoring that makes a class answers it. Answer its definition, which says everything
	a client would ask the class about."

	^'Refactoring applied. Class created:' , String newLineString , String newLineString ,
		aRefactoring apply definition
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
applyReportingRemovedVariables: aRefactoring

	"A refactoring that removes the variables it finds answers their names, which are the only
	way to know which ones it took."

	| removedVariableNames |

	removedVariableNames := aRefactoring apply.

	^removedVariableNames isEmpty
		ifTrue: [ 'Refactoring applied. No instance variable removed' ]
		ifFalse: [ 'Refactoring applied. ' , removedVariableNames size printString ,
			(removedVariableNames size = 1
				ifTrue: [ ' instance variable removed: ' ]
				ifFalse: [ ' instance variables removed: ' ]) ,
			(', ' join: removedVariableNames asSortedCollection) ]
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
applySourceChanging: aRefactoring to: aClass at: aSelector

	"A refactoring such as RenameTemporary answers the new source of the method instead of
	installing it, and it is its applier that compiles it. The method keeps the category it
	is already in."

	| newSourceCode |

	newSourceCode := aRefactoring apply.
	aClass compile: newSourceCode classified: (aClass organization categoryOfElement: aSelector).

	^self descriptionOfNewSource: newSourceCode of: aClass at: aSelector
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
categoryFor: aCategory of: aClass

	"Answer the category the new class is made in, which is the one of the class it came from
	unless a client named another."

	^aCategory isEmpty ifTrue: [ aClass category ] ifFalse: [ aCategory ]
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
classNamed: aClassName

	^(smalltalk classNamed: aClassName)
		ifNil: [ self error: (self class classNotFoundErrorDescriptionFor: aClassName) ]
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
descriptionOfChangedMethods: someMethods

	"Name each method the way a client asks for one, by the class that implements it and its
	selector. A method reference and a compiled method are both named this way."

	someMethods isEmpty ifTrue: [ ^'Refactoring applied. No method changed' ].

	^String streamContents: [ :aStream |
		aStream
			nextPutAll: 'Refactoring applied. ';
			print: someMethods size;
			nextPutAll: (someMethods size = 1 ifTrue: [ ' method changed:' ] ifFalse: [ ' methods changed:' ]).
		(someMethods collect: [ :eachMethod | eachMethod methodClass name , '>>' , eachMethod selector ])
			asSortedCollection do: [ :eachName | aStream newLine; nextPutAll: eachName ] ]
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
descriptionOfNewSource: aSourceCode of: aClass at: aSelector

	^'Refactoring applied. ' , aClass name , '>>' , aSelector , ' is now:' ,
		String newLineString , String newLineString , aSourceCode
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
namesFrom: aCommaSeparatedText

	"Answer the names a client sent as one text, which is how a list reaches a tool."

	^aCommaSeparatedText isEmpty
		ifTrue: [ OrderedCollection new ]
		ifFalse: [ ((aCommaSeparatedText subStrings: ',')
			collect: [ :eachName | eachName withBlanksTrimmed ]) asOrderedCollection ]
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:36:52 pm (UTC)'!
!methodProperties: {}!
positionsIn: aCompiledMethod of: someParameterNames

	"Answer where each parameter stands in the message, counting from one. A client names the
	parameters it wants extracted and not where they are, which the method already says."

	^someParameterNames collect: [ :eachName |
		aCompiledMethod methodNode argumentNames indexOf: eachName ]
! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
refactoringOn: aSelector builtWith: aBlock

	"Answer the refactoring the block builds over the whole system, gathering the implementors
	and the senders of aSelector the way a ScopedRefactoringApplier gathers them for its widest
	scope. The senders are answered as method references, and are handed over as the compiled
	methods they name, because a refactoring asks each of them hasLiteral:, which a reference
	answers about itself rather than about its method."

	| implementors senders |

	implementors := OrderedCollection new.
	senders := OrderedCollection new.
	ScopedRefactoring
		addImplementorsOf: aSelector
		to: implementors
		andSendersTo: senders
		inSystem: smalltalk.

	^aBlock value: implementors value: (senders collect: [ :eachSender | eachSender compiledMethod ])
! !

!MCPRefactoringToolGroup class methodsFor: 'testing' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
isAbstract

	^self == MCPRefactoringToolGroup
! !

!MCPRefactoringToolGroup class methodsFor: 'error descriptions' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
!methodProperties: {}!
classNotFoundErrorDescriptionFor: aClassName

	^'Class not found: ', aClassName
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
extractMethodFrom: aMethodReference at: anInterval to: aMessage within: aScope

	"Extract the code the interval covers into a method of its own, the way the applier does
	once it has been told what to call it: the finder says which pieces the new message
	replaces, each of them is told the message, and the extraction is made of the new method
	and of those pieces."

	| trimmedInterval finder replacements |

	trimmedInterval := anInterval trimToMatchExpressionOn: aMethodReference sourceCode.
	ExtractMethodNewMethod assertCanApplyRefactoringOn: aMethodReference at: trimmedInterval.

	finder := ExtractMethodReplacementsFinder ofCodeIn: trimmedInterval at: aMethodReference.
	finder value.
	replacements := self replacementsFoundBy: finder within: aScope.
	replacements do: [ :eachReplacement | eachReplacement newMessage: aMessage ].

	^self apply: (ExtractMethod
		newDefinition: (ExtractMethodNewMethod
			fromInterval: trimmedInterval
			of: aMethodReference
			to: aMessage
			categorizedAs: aMethodReference category
			withArgumentNames: Dictionary new)
		replacements: replacements)! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
extractMethodFromSimilarCodeIn: aMethodReference at: anInterval to: aMessage

	"Extract the code the interval covers into a method of its own and send it wherever code
	like it is written, whatever differs between them becoming a parameter. The finder says
	which pieces are alike, and which of the nodes to parameterize it could not account for."

	| trimmedInterval finder notParameterizable |

	trimmedInterval := anInterval trimToMatchExpressionOn: aMethodReference sourceCode.
	ExtractMethodNewMethod assertCanApplyRefactoringOn: aMethodReference at: trimmedInterval.

	finder := ExtractMethodReplacementsFinder ofCodeIn: trimmedInterval at: aMethodReference.
	finder value.
	finder useParameterizedToChangeReplacements.

	notParameterizable := (ExtractMethodParametersDetector
		valueFor: aMethodReference notOptimizedMethodNode
		at: trimmedInterval)
			reject: [ :eachParseNode |
				finder anyParameterizableNodeIncludes: eachParseNode at: trimmedInterval in: aMethodReference ].

	finder acceptParamReplacementsWithNodesToParameterized: notParameterizable to: aMessage.

	^self apply: (ExtractMethod
		newDefinition: (self
			newMethodFor: aMessage
			using: finder extractedCodeOrAnyParameterizableReplacement
			notParameterizing: notParameterizable)
		replacements: finder replacements)
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
extractToTemporaryNamed: aVariableName in: aMethodReference at: anInterval replacingAll: aBoolean

	"Let the finder say which pieces are being replaced. It answers the ones that are the same
	expression as the one selected, which is not the same as the ones written with the same
	characters: a comment or a string saying them is not one of them.

	ExtractToTemporary answers the refactoring that fits, which is ExtractMultipleToTemporary
	when there is more than one piece."

	| finder |

	finder := ExtractToTemporaryReplacementsFinder named: aVariableName at: anInterval from: aMethodReference.
	finder value.

	^self
		apply: (aBoolean
			ifTrue: [ ExtractToTemporary named: aVariableName intervals: finder replacements from: aMethodReference ]
			ifFalse: [ ExtractToTemporary named: aVariableName at: finder originalSelectionReplacement from: aMethodReference ])
		reportingNewSourceOf: aMethodReference
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
firstIntervalIn: aCompiledMethod matching: aText from: aStart to: aStop

	"Answer the piece of source a refactoring works on: the interval when a client sends one,
	and otherwise where aText is first said in the source of the method. It is answered as a
	SourceCodeInterval because that is what the refactorings ask to trim and to expand."

	| firstOccurrence |

	aStart isEmpty ifFalse: [ ^(aStart asNumber to: aStop asNumber) asSourceCodeInterval ].

	firstOccurrence := aCompiledMethod sourceCode findString: aText startingAt: 1.
	firstOccurrence = 0 ifTrue: [ self error: (self class textNotFoundErrorDescriptionFor: aText in: aCompiledMethod) ].

	^(firstOccurrence to: firstOccurrence + aText size - 1) asSourceCodeInterval! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
intervalIn: aCompiledMethod matching: aText from: aStart to: aStop

	"Answer the piece of source a refactoring works on, refusing a text the method says more
	than once instead of picking one of them. A refactoring that means to work on all of them
	asks for the first one instead."

	| interval |

	interval := self firstIntervalIn: aCompiledMethod matching: aText from: aStart to: aStop.
	(aStart isEmpty
		and: [ (aCompiledMethod sourceCode findString: aText startingAt: interval last + 1) ~= 0 ])
			ifTrue: [ self error: (self class textFoundMoreThanOnceErrorDescriptionFor: aText in: aCompiledMethod) ].

	^interval
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
messageNamed: aNewSelector withArgumentNames: someArgumentNames

	"Answer the message the extracted code becomes, named the way a client asked for it."

	^someArgumentNames isEmpty
		ifTrue: [ Message selector: aNewSelector asSymbol ]
		ifFalse: [ Message
			selector: aNewSelector asSymbol
			arguments: ((someArgumentNames subStrings: ',') collect: [ :eachName | eachName withBlanksTrimmed ]) asArray ]
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
messageSendIn: aCompiledMethod at: anInterval

	"Answer the send the interval falls on, named the way InlineMethod asks for it."

	| methodNode nodeAndRange |

	methodNode := aCompiledMethod methodNode.
	nodeAndRange := (methodNode
		parseNodesPathAt: anInterval first
		ifAbsent: [ self error: (self class noMessageSendErrorDescriptionIn: aCompiledMethod at: anInterval first) ]) first.
	(nodeAndRange key isKindOf: MessageNode)
		ifFalse: [ self error: (self class noMessageSendErrorDescriptionIn: aCompiledMethod at: anInterval first) ].

	^MessageNodeReference
		messageNode: nodeAndRange key
		selector: methodNode selector
		class: aCompiledMethod methodClass
		completeSourceRange: nodeAndRange value
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
newMethodFor: aMessage using: aParameterizableReplacement notParameterizing: someParseNodes

	"Build the new method the way the applier does for parameterized code. The pieces that
	vary become its parameters, and the nodes that could not be parameterized are added by
	the ranges they cover inside the piece being extracted."

	| parameterizableNodes replacementInterval replacementMethod |

	parameterizableNodes := aParameterizableReplacement parameterizableNodesWithInterval.
	replacementInterval := aParameterizableReplacement intervalToExtract.
	replacementMethod := aParameterizableReplacement methodToExtractFrom methodReference.

	someParseNodes do: [ :eachParseNode |
		| sourceRanges |
		sourceRanges := replacementMethod methodNode completeSourceRangesOf: eachParseNode ifAbsent: [ #() ].
		parameterizableNodes addAll: (sourceRanges
			select: [ :eachRange |
				(replacementInterval includesAllOf: eachRange)
					and: [ parameterizableNodes noneSatisfy: [ :eachNode | eachNode value includesAllOf: eachRange ] ] ]
			thenCollect: [ :eachRange | eachParseNode -> eachRange ]) ].

	^ExtractMethodNewMethod
		fromInterval: replacementInterval
		of: replacementMethod
		to: aMessage
		categorizedAs: replacementMethod category
		withArgumentNames: Dictionary new
		withParameterizableNodes: parameterizableNodes
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
!methodProperties: {}!
replacementsFoundBy: aFinder within: aScope

	"Answer the pieces the extraction replaces: only the one named, every piece in the method
	that is the same code, or every piece in the class."

	aScope = 'selection' ifTrue: [ ^Array with: aFinder originalSelectionReplacement ].
	aScope = 'method' ifTrue: [ ^aFinder replacements ].
	aScope = 'class' ifTrue: [ ^aFinder inClassReplacements ].

	self error: (self class unknownScopeErrorDescriptionFor: aScope)
! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addClassRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self renameClassRefactoringTool;
		addTool: self insertSuperclassRefactoringTool;
		addTool: self safelyRemoveClassRefactoringTool;
		addTool: self renameGlobalRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addExtractionRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self extractAsParameterRefactoringTool;
		addTool: self inlineMethodRefactoringTool;
		addTool: self extractToTemporaryRefactoringTool;
		addTool: self extractMethodRefactoringTool;
		addTool: self extractMethodFromSimilarCodeRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addInstanceVariableRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self addInstanceVariableRefactoringTool;
		addTool: self removeInstanceVariableRefactoringTool;
		addTool: self renameInstanceVariableRefactoringTool;
		addTool: self pushUpInstanceVariableRefactoringTool;
		addTool: self pushDownInstanceVariableRefactoringTool;
		addTool: self removeUnreferencedInstanceVariablesRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addMethodRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self pushUpMethodRefactoringTool;
		addTool: self pushDownMethodToSubclassesRefactoringTool;
		addTool: self pushDownMethodToOneSubclassRefactoringTool;
		addTool: self addAsSubclassResponsibilityRefactoringTool;
		addTool: self moveToInstanceOrClassMethodRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addSelectorRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self renameSelectorRefactoringTool;
		addTool: self changeKeywordsOrderRefactoringTool;
		addTool: self removeParameterRefactoringTool;
		addTool: self addParameterRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addTemporaryRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self temporaryToInstanceVariableRefactoringTool;
		addTool: self inlineTemporaryVariableRefactoringTool;
		addTool: self renameTemporaryRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
!methodProperties: {}!
addToolsTo: anMCPServer

	self
		addInstanceVariableRefactoringToolsTo: anMCPServer;
		addClassRefactoringToolsTo: anMCPServer;
		addSelectorRefactoringToolsTo: anMCPServer;
		addMethodRefactoringToolsTo: anMCPServer;
		addTemporaryRefactoringToolsTo: anMCPServer;
		addExtractionRefactoringToolsTo: anMCPServer! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
addInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_add_instance_variable'
		describedBy: 'Add an instance variable to a class.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to add' }
		executingWith: [ :aClass :aVariableName |
			self apply: (AddInstanceVariable named: aVariableName to: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
pushDownInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_push_down_instance_variable'
		describedBy: 'Move an instance variable of a class down to its subclasses.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to push down' }
		executingWith: [ :aClass :aVariableName |
			self apply: (PushDownInstanceVariable named: aVariableName from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
pushUpInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_push_up_instance_variable'
		describedBy: 'Move an instance variable of a class up to its superclass.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to push up' }
		executingWith: [ :aClass :aVariableName |
			self apply: (PushUpInstanceVariable named: aVariableName from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
removeInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_remove_instance_variable'
		describedBy: 'Remove an instance variable from a class.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to remove' }
		executingWith: [ :aClass :aVariableName |
			self apply: (RemoveInstanceVariable named: aVariableName from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
removeUnreferencedInstanceVariablesRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_remove_unreferenced_instance_variables'
		describedBy: 'Remove every instance variable of a class that no method reads or writes.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			self applyReportingRemovedVariables: (RemoveAllUnreferencedInstanceVariables from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
renameInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_rename_instance_variable'
		describedBy: 'Rename an instance variable of a class, in every method that uses it.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to rename'.
			MCPPlainToolProperty named: 'newVariableName' describedBy: 'Name to rename it to' }
		executingWith: [ :aClass :aVariableName :aNewVariableName |
			self applyReportingChangedMethods: (RenameInstanceVariable from: aVariableName to: aNewVariableName in: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
insertSuperclassRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_insert_superclass'
		describedBy: 'Insert a new class between a class and its superclass.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class to insert above it' }
		executingWith: [ :aClass :aNewClassName |
			self applyReportingNewClass: (InsertSuperclass to: aClass named: aNewClassName asSymbol) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
renameClassRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_rename_class'
		describedBy: 'Rename a class, in every method that names it.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name to rename it to' }
		executingWith: [ :aClass :aNewClassName |
			self applyReportingChangedMethods: (RenameClass from: aClass to: aNewClassName asSymbol in: Smalltalk undeclared: Undeclared) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
renameGlobalRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_rename_global'
		describedBy: 'Rename a global, in every method that names it.'
		properties: {
			MCPPlainToolProperty named: 'globalName' describedBy: 'Name of the global to rename'.
			MCPPlainToolProperty named: 'newGlobalName' describedBy: 'Name to rename it to' }
		executingWith: [ :aGlobalName :aNewGlobalName |
			self applyReportingChangedMethods: (RenameGlobal from: aGlobalName asSymbol to: aNewGlobalName asSymbol in: smalltalk) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
safelyRemoveClassRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_safely_remove_class'
		describedBy: 'Remove a class, refusing when something still refers to it.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass | self apply: (SafelyRemoveClass of: aClass) ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
addParameterRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_add_parameter'
		describedBy: 'Add a parameter to a selector, giving every sender the value to pass. A unary selector needs no keyword; a keyword one is told which keyword to add and where.'
		properties: {
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector to add the parameter to' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to add'.
			MCPPlainToolProperty named: 'parameterValue' describedBy: 'Expression every sender will pass for it'.
			MCPPlainToolProperty named: 'keyword' describedBy: 'Keyword to add, needed only when the selector is a keyword one' defaultingTo: ''.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position for the new keyword, counting from one. Defaults to the first' defaultingTo: '1' }
		executingWith: [ :aSelector :aParameterName :aParameterValue :aKeyword :aParameterIndex |
			self applyReportingChangedMethods: (self refactoringOn: aSelector builtWith: [ :implementors :senders |
				aSelector isUnary
					ifTrue: [ AddParameter
						named: aParameterName
						initializedWith: aParameterValue
						toUnarySelector: aSelector
						implementors: implementors
						senders: senders ]
					ifFalse: [ AddParameter
						named: aParameterName
						at: aParameterIndex asNumber
						initializedWith: aParameterValue
						using: aKeyword
						toKeywordSelector: aSelector
						implementors: implementors
						senders: senders ] ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
changeKeywordsOrderRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_change_keywords_order'
		describedBy: 'Reorder the keywords of a selector, moving the arguments of every sender with them.'
		properties: {
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector to reorder' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPluggableToolProperty named: 'newSelector' describedBy: 'Selector with the same keywords in the order wanted' valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aSelector :aNewSelector |
			self applyReportingChangedMethods: (self refactoringOn: aSelector builtWith: [ :implementors :senders |
				ChangeKeywordsSelectorOrder from: aSelector to: aNewSelector implementors: implementors senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
removeParameterRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_remove_parameter'
		describedBy: 'Remove a parameter from a selector, in every implementor and sender. It is refused when an implementor still uses the parameter.'
		properties: {
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector to remove the parameter from' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to remove'.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position of the parameter, counting from one. Defaults to the first' defaultingTo: '1' }
		executingWith: [ :aSelector :aParameterName :aParameterIndex |
			self applyReportingChangedMethods: (self refactoringOn: aSelector builtWith: [ :implementors :senders |
				RemoveParameter
					atIndex: aParameterIndex asNumber
					named: aParameterName
					from: aSelector
					implementors: implementors
					senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
renameSelectorRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_rename_selector'
		describedBy: 'Rename a selector, in every class that implements it and every method that sends it.'
		properties: {
			MCPPluggableToolProperty
				named: 'selector'
				describedBy: 'Selector to rename'
				valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPluggableToolProperty
				named: 'newSelector'
				describedBy: 'Selector to rename it to'
				valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aSelector :aNewSelector |
			self applyReportingChangedMethods: (self refactoringOn: aSelector builtWith: [ :implementors :senders |
				RenameSelector from: aSelector to: aNewSelector implementors: implementors senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
addAsSubclassResponsibilityRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_add_as_subclass_responsibility'
		describedBy: 'Declare a method of a class as the responsibility of its subclasses, adding it to the superclass as a subclassResponsibility.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method' }
		executingWith: [ :aMethod | self apply: (AddAsSubclassResponsibility for: aMethod) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
moveToInstanceOrClassMethodRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_move_to_instance_or_class_method'
		describedBy: 'Move a method from the instance side of a class to its class side, or back.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to move' }
		executingWith: [ :aMethod | self apply: (MoveToInstanceOrClassMethod for: aMethod) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
pushDownMethodToOneSubclassRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_push_down_method_to_one_subclass'
		describedBy: 'Move a method down into one subclass of the class that implements it.'
		properties: {
			MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to push down'.
			MCPClassToolProperty named: 'subclassName' describedBy: 'Name of the subclass to push it down to' }
		executingWith: [ :aMethod :aSubclass |
			self apply: (PushDownMethodToOneSubclass for: aMethod to: aSubclass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
pushDownMethodToSubclassesRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_push_down_method_to_subclasses'
		describedBy: 'Copy a method down into every subclass of the class that implements it.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to push down' }
		executingWith: [ :aMethod | self apply: (PushDownMethodToSubclasses for: aMethod) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
pushUpMethodRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_push_up_method'
		describedBy: 'Move a method up to the superclass of the class that implements it.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to push up' }
		executingWith: [ :aMethod |
			self apply: (PushUpMethod
				for: aMethod
				additionallyRemovingFrom: OrderedCollection new
				pushingUp: OrderedCollection new) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - temporary' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
inlineTemporaryVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_inline_temporary_variable'
		describedBy: 'Replace a use of a temporary by the value assigned to it. The use is named by the text it is written with, or by the interval it occupies when the text is written more than once.'
		properties: {
			MCPMethodProperty ofAMethod.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to inline'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the use to replace, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the use, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the use' defaultingTo: '' }
		executingWith: [ :aMethod :aVariableName :aText :aStart :aStop |
			self apply: (InlineTemporaryVariable
				named: aVariableName
				atUsageInterval: (self intervalIn: aMethod matching: aText from: aStart to: aStop)
				inMethod: aMethod) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - temporary' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
renameTemporaryRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_rename_temporary'
		describedBy: 'Rename a temporary or an argument of a method, in every use it has inside it.'
		properties: {
			MCPMethodProperty ofAMethod.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to rename'.
			MCPPlainToolProperty named: 'newVariableName' describedBy: 'Name to rename it to' }
		executingWith: [ :aMethod :aVariableName :aNewVariableName |
			self
				applySourceChanging: (RenameTemporary
					from: aVariableName
					to: aNewVariableName
					in: aMethod methodNode)
				to: aMethod methodClass
				at: aMethod selector ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - temporary' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
temporaryToInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_temporary_to_instance_variable'
		describedBy: 'Turn a temporary of a method into an instance variable of its class.'
		properties: {
			MCPMethodProperty ofAMethod.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to turn into an instance variable' }
		executingWith: [ :aMethod :aVariableName |
			self
				apply: (TemporaryToInstanceVariable named: aVariableName fromMethod: aMethod methodNode)
				reportingNewSourceOf: aMethod ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
extractAsParameterRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_as_parameter'
		describedBy: 'Turn a piece of a method into a parameter of it, giving every sender the piece to pass. The piece is named by the text it is written with, or by the interval it occupies.'
		properties: {
			MCPMethodProperty ofAMethod.
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to introduce'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: '' }
		executingWith: [ :aMethod :aParameterName :aText :aStart :aStop |
			self applyReportingChangedMethods: (self refactoringOn: aMethod selector builtWith: [ :implementors :senders |
				ExtractAsParameter
					named: aParameterName
					extractedFrom: (self intervalIn: aMethod matching: aText from: aStart to: aStop)
					at: aMethod
					implementors: implementors
					senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
extractMethodFromSimilarCodeRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_method_from_similar_code'
		describedBy: 'Extract a piece of a method into a method of its own and send it wherever code like it is written, whatever differs between them becoming a parameter of it. Unlike extracting a method, the code it replaces is not the same as the piece named, so the new selector takes one keyword for each part that varies.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to extract from'.
			MCPPlainToolProperty named: 'newSelector' describedBy: 'Selector of the method to create, with one keyword for each part that varies between the pieces'.
			MCPPlainToolProperty named: 'argumentNames' describedBy: 'Names of the parameters of the new method, separated by commas, in the order of its keywords' defaultingTo: ''.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: '' }
		executingWith: [ :aMethod :aNewSelector :someArgumentNames :aText :aStart :aStop |
			self
				extractMethodFromSimilarCodeIn: aMethod asMethodReference
				at: (self firstIntervalIn: aMethod matching: aText from: aStart to: aStop)
				to: (self messageNamed: aNewSelector withArgumentNames: someArgumentNames) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
extractMethodRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_method'
		describedBy: 'Extract a piece of a method into a method of its own and send it instead. The piece is named by the text it is written with, or by the interval it occupies. Only code that is the same as the piece is replaced.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to extract from'.
			MCPPlainToolProperty named: 'newSelector' describedBy: 'Selector of the method to create, with its keywords, as in totalFor:at:'.
			MCPPlainToolProperty named: 'argumentNames' describedBy: 'Names of the parameters of the new method, separated by commas, in the order of its keywords' defaultingTo: ''.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: ''.
			MCPPlainToolProperty named: 'scope' describedBy: 'Which pieces are replaced: selection for the one named, method for every piece of that method that is the same code, class for every piece of the class' defaultingTo: 'selection' }
		executingWith: [ :aMethod :aNewSelector :someArgumentNames :aText :aStart :aStop :aScope |
			self
				extractMethodFrom: aMethod asMethodReference
				at: (self firstIntervalIn: aMethod matching: aText from: aStart to: aStop)
				to: (self messageNamed: aNewSelector withArgumentNames: someArgumentNames)
				within: aScope ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 25/Aug/2026, 11:03:06 am (UTC)'!
!methodProperties: {}!
extractToTemporaryRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_to_temporary'
		describedBy: 'Extract a piece of a method into a temporary of it. The piece is named by the text it is written with, or by the interval it occupies. Replacing all of them replaces every piece that is the same expression, which is found in the parse tree and so does not include a comment or a string saying the same.'
		properties: {
			MCPMethodProperty ofAMethod.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to extract into'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: ''.
			MCPPlainToolProperty named: 'replaceAll' describedBy: 'Whether every piece that is the same expression is replaced, true or false. Defaults to replacing only the one named' defaultingTo: 'false' }
		executingWith: [ :aMethod :aVariableName :aText :aStart :aStop :aReplaceAllAnswer |
			| replacingAll |
			replacingAll := aReplaceAllAnswer = 'true'.
			self
				extractToTemporaryNamed: aVariableName
				in: aMethod asMethodReference
				at: (replacingAll
					ifTrue: [ self firstIntervalIn: aMethod matching: aText from: aStart to: aStop ]
					ifFalse: [ self intervalIn: aMethod matching: aText from: aStart to: aStop ])
				replacingAll: replacingAll ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
!methodProperties: {}!
inlineMethodRefactoringTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_inline_method'
		describedBy: 'Replace a send of a method by what the method does. The send is named by the method it is written in and by the text of its selector there, or by the interval that selector occupies. The text has to fall on the selector of the send and not on its receiver.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to inline'.
			MCPMethodProperty
				ofClass: (MCPClassToolProperty named: 'senderClassName' describedBy: 'Name of the class whose method sends it')
				andSelector: (MCPPluggableToolProperty
					named: 'senderSelector'
					describedBy: 'Selector of the method that sends it'
					valuedWith: [ :aSelector | aSelector asSymbol ]).
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the selector of the send, looked for in the source of the sending method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the selector of the send, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of it' defaultingTo: '' }
		executingWith: [ :aMethod :aSendingMethod :aText :aStart :aStop |
			self applyReportingChangedMethods: (InlineMethod
				from: aMethod
				intoSendersAndUsages: (Array with: (self
					messageSendIn: aSendingMethod
					at: (self intervalIn: aSendingMethod matching: aText from: aStart to: aStop)))
				removeMethod: false) ]
! !

!MCPRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
noMessageSendErrorDescriptionIn: aCompiledMethod at: anIndex

	^'No message send at character ', anIndex printString, ' of ',
		aCompiledMethod methodClass name, '>>', aCompiledMethod selector
! !

!MCPRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
textFoundMoreThanOnceErrorDescriptionFor: aText in: aCompiledMethod

	^'Text found more than once in ', aCompiledMethod methodClass name, '>>', aCompiledMethod selector,
		', send the interval instead: ', aText
! !

!MCPRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
textNotFoundErrorDescriptionFor: aText in: aCompiledMethod

	^'Text not found in ', aCompiledMethod methodClass name, '>>', aCompiledMethod selector, ': ', aText
! !

!MCPRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
!methodProperties: {}!
unknownScopeErrorDescriptionFor: aScope

	^'Unknown scope: ', aScope, '. It is one of selection, method or class'
! !

!MCPToolProperty methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 5:14:33 pm (UTC)'!
!methodProperties: {}!
initializeNamed: aName describedBy: aDescription required: isRequired ifAbsent: anAbsentBlock

	name := aName.
	description := aDescription.
	required := isRequired.
	absentBlock := anAbsentBlock
! !

!MCPToolProperty methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 3:21:38 pm (UTC)'!
!methodProperties: {}!
description

	^description
! !

!MCPToolProperty methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
!methodProperties: {}!
name

	^name
! !

!MCPToolProperty methodsFor: 'property definition' stamp: 'HAW 21/Aug/2026, 5:30:25 pm (UTC)'!
!methodProperties: {}!
addTo: aProperties

	aProperties at: name put: self definition.
	
	^aProperties ! !

!MCPToolProperty methodsFor: 'property definition' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
!methodProperties: {}!
definition

	^OrderedDictionary new
		at: 'type' put: self type;
		at: 'description' put: description;
		yourself
! !

!MCPToolProperty methodsFor: 'property definition' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
type

	^'string'
! !

!MCPToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
valueFor: aValue

	^self subclassResponsibility
! !

!MCPToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
!methodProperties: {}!
valueFrom: anArguments

	^anArguments
		at: name
		ifPresent: [ :aValue | self valueFor: aValue ]
		ifAbsent: [ self valueWhenAbsent ]
! !

!MCPToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 5:11:26 pm (UTC)'!
!methodProperties: {}!
valueWhenAbsent

	^absentBlock value: self
! !

!MCPToolProperty methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
!methodProperties: {}!
notProvidedErrorDescription

	^'No ', name, ' provided'
! !

!MCPToolProperty methodsFor: 'testing' stamp: 'HAW 21/Aug/2026, 5:03:59 pm (UTC)'!
!methodProperties: {}!
isRequired

	^required
! !

!MCPToolProperty methodsFor: 'error signaling' stamp: 'HAW 21/Aug/2026, 5:17:28 pm (UTC)'!
!methodProperties: {}!
signalNotProvided

	self error: self notProvidedErrorDescription
! !

!MCPToolProperty methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
!methodProperties: {}!
addRequiredNamesTo: someNames

	"Add the names a client has to send for me. A property answers one value but is not
	always one name, so it is asked to add them rather than asked what it is called."

	required ifTrue: [ someNames add: name ].

	^someNames
! !

!MCPToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:15:28 pm (UTC)'!
!methodProperties: {}!
named: aName describedBy: aDescription

	^self
		named: aName
		describedBy: aDescription
		required: true
		ifAbsent: [ :aProperty | aProperty signalNotProvided ]
! !

!MCPToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:15:28 pm (UTC)'!
!methodProperties: {}!
named: aName describedBy: aDescription defaultingTo: aDefaultValue

	^self
		named: aName
		describedBy: aDescription
		required: false
		ifAbsent: [ :aProperty | aDefaultValue ]
! !

!MCPToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:15:28 pm (UTC)'!
!methodProperties: {}!
named: aName describedBy: aDescription required: isRequired ifAbsent: anAbsentValueBlock

	^self new initializeNamed: aName describedBy: aDescription required: isRequired ifAbsent: anAbsentValueBlock
! !

!MCPClassToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
valueFor: aClassName

	^(Smalltalk classNamed: aClassName) ifNil: [ self signalClassNotFound: aClassName ]
! !

!MCPClassToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
valueWhenAbsent

	"A client that sends no class name is told the class was not found, and not that the
	property is missing, because that is what it is asking for."

	^self signalClassNotFound: self class classNameNotProvided
! !

!MCPClassToolProperty methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
signalClassNotFound: aClassName

	self error: (self class classNotFoundErrorDescriptionFor: aClassName)
! !

!MCPClassToolProperty class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
classNameNotProvided

	^'<not provided>'

! !

!MCPClassToolProperty class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
classNotFoundErrorDescriptionFor: aClassName

	^'Class not found: ', aClassName
! !

!MCPMethodProperty methodsFor: 'initialization' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
initializeOfClass: aClassProperty andSelector: aSelectorProperty

	classProperty := aClassProperty.
	selectorProperty := aSelectorProperty
! !

!MCPMethodProperty methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
!methodProperties: {}!
addRequiredNamesTo: someNames

	^selectorProperty addRequiredNamesTo: (classProperty addRequiredNamesTo: someNames)
! !

!MCPMethodProperty methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
!methodProperties: {}!
addTo: aProperties

	"A client sends a class and a selector, so that is what it is shown."

	^selectorProperty addTo: (classProperty addTo: aProperties)
! !

!MCPMethodProperty methodsFor: 'tool definition' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
isRequired

	"I am required when either of the two is: a client that leaves out the one that has to be
	sent has left out something required."

	^classProperty isRequired or: [ selectorProperty isRequired ]
! !

!MCPMethodProperty methodsFor: 'request arguments' stamp: 'HAW 25/Aug/2026, 11:53:10 am (UTC)'!
!methodProperties: {}!
assert: aSelector isImplementedBy: aClass

	(aClass includesSelector: aSelector)
		ifFalse: [ self error: (self class methodNotFoundErrorDescriptionFor: aSelector in: aClass) ]
! !

!MCPMethodProperty methodsFor: 'request arguments' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
valueFrom: anArguments

	"Answer the compiled method the class and the selector name. It is one value and not two:
	a tool that takes a method is handed the method, not the two names it was found by."

	| aClass aSelector |

	aClass := classProperty valueFrom: anArguments.
	aSelector := selectorProperty valueFrom: anArguments.
	self assert: aSelector isImplementedBy: aClass.

	^aClass >> aSelector

! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
classDescribedBy: aClassDescription selectorDescribedBy: aSelectorDescription

	^self
		ofClass: (MCPClassToolProperty named: 'className' describedBy: aClassDescription)
		andSelector: (MCPPluggableToolProperty
			named: 'selector'
			describedBy: aSelectorDescription
			valuedWith: [ :aSelector | aSelector asSymbol ])
! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
ofAMethod

	^self selectorDescribedBy: self defaultSelectorDescription
! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:57:38 am (UTC)'!
!methodProperties: {}!
ofClass: aClassProperty andSelector: aSelectorProperty

	"Answer a property made of those two. Both are given so that a tool that takes more than
	one method can name them apart, as a sender and the method it sends."

	^self new initializeOfClass: aClassProperty andSelector: aSelectorProperty
! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
selectorDescribedBy: aSelectorDescription

	^self classDescribedBy: self defaultClassDescription selectorDescribedBy: aSelectorDescription
! !

!MCPMethodProperty class methodsFor: 'defaults' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
defaultClassDescription

	^'Name of the class that implements the method'
! !

!MCPMethodProperty class methodsFor: 'defaults' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
defaultSelectorDescription

	^'Selector of the method'
! !

!MCPMethodProperty class methodsFor: 'error descriptions' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
methodNotFoundErrorDescriptionFor: aSelector in: aClass

	^'Method not found: ', aClass name, '>>', aSelector
! !

!MCPPlainToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
!methodProperties: {}!
valueFor: aValue

	^aValue
! !

!MCPPluggableToolProperty methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 5:14:33 pm (UTC)'!
!methodProperties: {}!
initializeNamed: aName describedBy: aDescription required: isRequired absentValue: anAbsentBlock valuedWith: aValueBlock

	self
		initializeNamed: aName
		describedBy: aDescription
		required: isRequired
		ifAbsent: anAbsentBlock.
	valueBlock := aValueBlock
! !

!MCPPluggableToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:22:30 pm (UTC)'!
!methodProperties: {}!
valueFor: aValue

	^valueBlock value: aValue
! !

!MCPPluggableToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 7:29:31 pm (UTC)'!
!methodProperties: {}!
named: aName describedBy: aDescription valuedWith: aBlock

	^self new
		initializeNamed: aName
		describedBy: aDescription
		required: true
		absentValue: [ :aProperty | aProperty signalNotProvided ]
		valuedWith: aBlock
! !

!MCPTransport methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:18:07 pm (UTC)'!
!methodProperties: {}!
serveRequestsFor: anMCPServer

	"Start serving MCP requests for anMCPServerCopy. Whether this blocks the calling
	process is up to each transport."

	self subclassResponsibility! !

!MCPTransport methodsFor: 'serving' stamp: ''!
!methodProperties: {}!
stopServingRequests

	"Stop serving and release whatever is held open. Can be sent to a transport that
	is not serving."

	self subclassResponsibility! !

!MCPTransport methodsFor: 'encoding' stamp: 'HAW 20/Aug/2026, 6:03:30 pm (UTC)'!
!methodProperties: {}!
utf8Decode: aByteString

	"Answer the text aByteString carries. A message arrives with one Character per UTF-8
	byte, so the characters of aByteString are the bytes to decode."

	^UnicodeString fromUtf8Bytes: aByteString asByteArray! !

!MCPTransportHttp methodsFor: 'initialization' stamp: ''!
!methodProperties: {}!
initializeListeningAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: anAuthentication

	portNumber := aPortNumber.
	interfaceAddress := anInterfaceAddress.
	authentication := anAuthentication.
	sessions := Dictionary new.
	sessionCounter := 0! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
!methodProperties: {}!
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
!methodProperties: {}!
interfaceAddressBytes

	"Answer my interface address as the four byte IPv4 address the socket primitive expects."

	^((interfaceAddress findTokens: '.') collect: [ :eachPart | Integer readFrom: eachPart readStream ]) asByteArray! !

!MCPTransportHttp methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:48:01 pm (UTC)'!
!methodProperties: {}!
newListeningWebServer

	"Answer a web server already listening on my port and interface."

	| newWebServer |

	Socket initializeNetwork.
	newWebServer := WebServer new.
	newWebServer listenOn: portNumber interface: self interfaceAddressBytes.

	^newWebServer! !

!MCPTransportHttp methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:48:17 pm (UTC)'!
!methodProperties: {}!
serveRequestsFor: anMCPServer

	"Start listening for the requests anMCPServerCopy has to answer. Answers as soon as
	the listener is up, because the web server serves each connection in a process of its own."

	mcpServer := anMCPServer.
	self stopServingRequests.
	webServer := self newListeningWebServer.
	self addServicesTo: webServer! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
!methodProperties: {}!
shutDown: aWebServer

	aWebServer stopListener.
	aWebServer destroyConnections.
	aWebServer listenerSocket ifNotNil: [ :aListenerSocket | aListenerSocket destroy ]! !

!MCPTransportHttp methodsFor: 'serving' stamp: ''!
!methodProperties: {}!
stopServingRequests

	"Stop listening and drop every open event stream."

	self closeAllSessions.
	webServer ifNotNil: [ :aWebServer | self shutDown: aWebServer ].
	webServer := nil! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
!methodProperties: {}!
endpointHttpMethods

	^#('POST' 'GET' 'DELETE')! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
!methodProperties: {}!
endpointPath

	"Answer the path where the MCP endpoint answers."

	^'/mcp'! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
!methodProperties: {}!
messagesEndpointFor: aSessionIdentifier

	"Answer the url an event stream client has to post the messages of its session to."

	^self messagesPath, '?sessionId=', aSessionIdentifier! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
!methodProperties: {}!
messagesHttpMethods

	^#('POST')! !

!MCPTransportHttp methodsFor: 'endpoints' stamp: ''!
!methodProperties: {}!
messagesPath

	"Answer the path where a client of the event stream transport posts its messages."

	^'/messages'! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
acknowledge: aWebRequest

	"Answer an empty 202: the message was accepted and there is nothing to send back."

	^aWebRequest sendResponseCode: 202 content: '' type: self plainTextContentType close: false! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
bodyOf: aWebRequest

	"Answer the request body as text. A byte oriented body arrives with one Character per
	byte, so it still has to be decoded."

	^self utf8Decode: (aWebRequest content ifNil: [ '' ]) asString! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
endpointResponders

	"Answer the message that responds to each HTTP method that is not a plain JSON-RPC post."

	^Dictionary newFromPairs: {
		'GET'. #openEventStreamFor:.
		'DELETE'. #closeEventStreamFor: }! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
jsonContentType

	^'application/json; charset=utf-8'! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
plainTextContentType

	^'text/plain; charset=utf-8'! !

!MCPTransportHttp methodsFor: 'responding' stamp: 'HAW 24/Aug/2026, 12:07:52 pm (UTC)'!
!methodProperties: {}!
pushAnswerTo: aWebRequest over: aSession

	"Send the answer to the message in the request body as a message event on aSession."

	| response |

	response := [ mcpServer jsonResponseTo: (self bodyOf: aWebRequest) ]
		on: Error
		do: [ :anError | mcpServer jsonInternalErrorWith: anError ].
	response ifNotNil: [ :aJsonString | aSession sendMessageEvent: aJsonString ]! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
respondToEndpointRequest: aWebRequest

	"POST carries one JSON-RPC message and is answered with its response. GET opens an
	event stream for clients speaking the Server-Sent Events transport, and DELETE ends one.
	A request my authentication turns down is served none of them."

	(authentication authorizes: aWebRequest) ifFalse: [ ^self respondWithUnauthorizedTo: aWebRequest ].

	^self perform: (self responderFor: aWebRequest method) with: aWebRequest! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
respondToJsonRpcRequest: aWebRequest

	"Answer the JSON-RPC response for the message in the request body. A notification has
	no answer, so it is acknowledged instead."

	^(mcpServer jsonResponseTo: (self bodyOf: aWebRequest))
		ifNil: [ self acknowledge: aWebRequest ]
		ifNotNil: [ :aJsonString |
			aWebRequest send200Response: aJsonString asUtf8Bytes contentType: self jsonContentType ]! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
respondToMessagesRequest: aWebRequest

	"Dispatch the message in the body and push its answer over the event stream the request
	names, acknowledging the post as the Server-Sent Events transport requires."

	| session |

	(authentication authorizes: aWebRequest) ifFalse: [ ^self respondWithUnauthorizedTo: aWebRequest ].
	session := self sessionFor: aWebRequest.
	session ifNil: [ ^self respondWithUnknownSessionTo: aWebRequest ].
	self pushAnswerTo: aWebRequest over: session.

	^self acknowledge: aWebRequest! !

!MCPTransportHttp methodsFor: 'responding' stamp: 'HAW 24/Aug/2026, 12:07:52 pm (UTC)'!
!methodProperties: {}!
respondWithServerError: anError to: aWebRequest

	"Answer a JSON-RPC internal error instead of the web server default error page."

	^aWebRequest
		sendResponseCode: 500
		content: (mcpServer jsonInternalErrorWith: anError) asUtf8Bytes
		type: self jsonContentType
		close: false! !

!MCPTransportHttp methodsFor: 'responding' stamp: 'HAW 19/Aug/2026, 7:27:54 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
respondWithUnknownSessionTo: aWebRequest

	^aWebRequest
		sendResponseCode: 404
		content: self class unknownSessionErrorDescription
		type: self plainTextContentType
		close: false! !

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
responderFor: anHttpMethod

	^self endpointResponders at: anHttpMethod ifAbsent: [ #respondToJsonRpcRequest: ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
!methodProperties: {}!
eventStreamHandshake

	"Answer the HTTP headers that open a Server-Sent Events stream."

	^'HTTP/1.1 200 OK', String crlfString,
		'Content-Type: text/event-stream; charset=utf-8', String crlfString,
		'Cache-Control: no-cache', String crlfString,
		'Connection: Keep-Alive', String crlfString,
		String crlfString! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
!methodProperties: {}!
keepAliveDelay

	^Delay forSeconds: 15! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
!methodProperties: {}!
keepAliveWhileOpen: aSession

	"Hold the connection with a comment frame now and then, so clients and proxies see it
	alive, until a write fails and closes the session."

	[ aSession isOpen ] whileTrue: [
		aSession sendKeepAlive.
		self keepAliveDelay wait ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
!methodProperties: {}!
newSessionIdentifier

	sessionCounter := sessionCounter + 1.

	^'mcp-', sessionCounter printString! !

!MCPTransportHttp methodsFor: 'event streams' stamp: 'HAW 19/Aug/2026, 8:06:54 pm (UTC)'!
!methodProperties: {}!
newSessionWritingTo: aStream

	| session |

	session := MCPHttpSession identifiedAs: self newSessionIdentifier writingTo: aStream.
	sessions at: session identifier put: session.

	^session! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
!methodProperties: {}!
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
!methodProperties: {}!
sessionFor: aWebRequest

	"Answer the session the request names in its sessionId parameter, or nil when it names
	none or names one that is no longer open."

	| requestedIdentifier |

	requestedIdentifier := aWebRequest getFields at: 'sessionId' ifAbsent: [ ^nil ].

	^sessions at: requestedIdentifier ifAbsent: [ nil ]! !

!MCPTransportHttp methodsFor: 'event streams' stamp: ''!
!methodProperties: {}!
writeHandshakeTo: aSession

	"Write the headers that turn the connection into an event stream and announce the
	messages endpoint of the session. A stream that cannot be written to is closed."

	[ aSession stream nextPutAll: self eventStreamHandshake asUtf8Bytes.
	aSession sendEndpointEvent: (self messagesEndpointFor: aSession identifier).
	aSession stream flush ]
		on: Error
		do: [ :aWriteError | aSession close ]! !

!MCPTransportHttp methodsFor: 'closing' stamp: ''!
!methodProperties: {}!
closeAllSessions

	"Close every open event stream and forget them all."

	sessions do: [ :eachSession | eachSession close ].
	sessions := Dictionary new! !

!MCPTransportHttp methodsFor: 'closing' stamp: 'HAW 19/Aug/2026, 7:28:07 pm (UTC)'!
!methodProperties: {}!
closeConnectionHeaderValue

	^'close'! !

!MCPTransportHttp methodsFor: 'closing' stamp: 'HAW 19/Aug/2026, 7:28:00 pm (UTC)'!
!methodProperties: {}!
closeConnectionOf: aWebRequest

	"Ask the web server not to keep this connection alive. The header has to be set on the
	request and not on the response, because the server takes the decision from the request
	and then overwrites whatever the response said."

	aWebRequest headerAt: self connectionHeaderName put: self closeConnectionHeaderValue! !

!MCPTransportHttp methodsFor: 'closing' stamp: ''!
!methodProperties: {}!
closeEventStreamFor: aWebRequest

	"End the event stream the request names, when it is still open, and acknowledge."

	(self sessionFor: aWebRequest) ifNotNil: [ :aSession | self closeSession: aSession ].

	^self acknowledge: aWebRequest! !

!MCPTransportHttp methodsFor: 'closing' stamp: ''!
!methodProperties: {}!
closeSession: aSession

	aSession close.
	sessions removeKey: aSession identifier ifAbsent: [ nil ]! !

!MCPTransportHttp methodsFor: 'closing' stamp: 'HAW 19/Aug/2026, 7:28:05 pm (UTC)'!
!methodProperties: {}!
connectionHeaderName

	^'Connection'! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:06:48 pm (UTC)'!
!methodProperties: {}!
listeningAtPort: aPortNumber

	"Answer a transport that serves any client that can reach the loopback interface."

	^self listeningAtPort: aPortNumber authenticatingWith: MCPNoAuthentication new! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: ''!
!methodProperties: {}!
listeningAtPort: aPortNumber authenticatingWith: anAuthentication

	^self
		listeningAtPort: aPortNumber
		onInterface: self defaultInterfaceAddress
		authenticatingWith: anAuthentication! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:06:48 pm (UTC)'!
!methodProperties: {}!
listeningAtPort: aPortNumber onInterface: anInterfaceAddress

	^self
		listeningAtPort: aPortNumber
		onInterface: anInterfaceAddress
		authenticatingWith: MCPNoAuthentication new! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 10:39:05 pm (UTC)'!
!methodProperties: {}!
listeningAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: anAuthentication

	self assertIsValidPortNumber: aPortNumber.
	self assertIsValidInterfaceAddress: anInterfaceAddress.
	
	^self new
		initializeListeningAtPort: aPortNumber
		onInterface: anInterfaceAddress
		authenticatingWith: anAuthentication! !

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:06:42 pm (UTC)'!
!methodProperties: {}!
listeningAtPort: aPortNumber requiringToken: aToken

	"Answer a transport that serves only the requests carrying aToken."

	^self
		listeningAtPort: aPortNumber
		authenticatingWith: (MCPBearerTokenAuthentication requiringToken: aToken)! !

!MCPTransportHttp class methodsFor: 'defaults' stamp: ''!
!methodProperties: {}!
defaultInterfaceAddress

	"Answer the loopback address: the endpoint is meant for tools running on this machine."

	^'127.0.0.1'! !

!MCPTransportHttp class methodsFor: 'defaults' stamp: ''!
!methodProperties: {}!
defaultPortNumber

	"Answer the port the MCP endpoint listens on. It sits next to the one RemoteControlMCP
	uses, so both can serve from the same image."

	^2358! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:40:09 pm (UTC)'!
!methodProperties: {}!
assertIsValidInterfaceAddress: anInterfaceAddress

	(anInterfaceAddress isString and: [ anInterfaceAddress notEmpty ])
		ifFalse: [ self signalInvalidInterfaceAddress ]! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:39:39 pm (UTC)'!
!methodProperties: {}!
assertIsValidPortNumber: aPortNumber

	(aPortNumber isInteger and: [ aPortNumber between: 1 and: 65535 ])
		ifFalse: [ self signalInvalidPortNumber ]! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:40:09 pm (UTC)'!
!methodProperties: {}!
signalInvalidInterfaceAddress

	^ self error: self invalidInterfaceAddressErrorDescription! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:39:39 pm (UTC)'!
!methodProperties: {}!
signalInvalidPortNumber

	^ self error: self invalidPortNumberErrorDescription! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
invalidInterfaceAddressErrorDescription

	^'The interface address has to be a non empty String, for example 127.0.0.1'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
invalidPortNumberErrorDescription

	^'The port number has to be an integer between 1 and 65535'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
unauthorizedErrorDescription

	^'Unauthorized'! !

!MCPTransportHttp class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
unknownSessionErrorDescription

	^'There is no open event stream with that session identifier'! !

!MCPTransportText methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
initializeReadingFrom: aReadStream writingTo: aWriteStream

	in := aReadStream.
	out := aWriteStream
! !

!MCPTransportText methodsFor: 'reading' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
readLine

	"Answer the next line of the input, or nil when it will give no more. Input that has
	nothing to give yet answers nil to next, which is what a non blocking standard input does
	while it waits, so I wait too and only give up when the input says it is closed."

	| line character |

	line := String new writeStream.
	[[ in closed ifTrue: [ ^nil ].
	character := in next.
	character isNil ] whileTrue: [ (Delay forMilliseconds: 10) wait ].
	line nextPut: character.
	character = Character lf ] whileFalse.

	^line contents
! !

!MCPTransportText methodsFor: 'reading' stamp: 'HAW 24/Aug/2026, 1:22:57 pm (UTC)'!
!methodProperties: {}!
readMessage

	"Answer the text of the next request, or nil when the input is exhausted. The text is
	left unparsed so that the server answers a parse error the way it does for every other
	transport, instead of the error being raised here and stopping the loop."

	^self readLine ifNotNil: [ :aLine | self utf8Decode: aLine ]
! !

!MCPTransportText methodsFor: 'writing' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
writeMessage: aJsonString

	"Write aJsonString as one line, because a message is delimited by the line it is on."

	| singleLine |

	out closed ifTrue: [ ^self ].
	singleLine := (aJsonString copyWithout: Character cr) copyWithout: Character lf.
	out
		nextPutAll: singleLine asUtf8Bytes asString;
		newLine;
		flush
! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:08:50 pm (UTC)'!
!methodProperties: {}!
dispatch: aJsonRequest using: anMCPServer

	| jsonResponse |
	
	jsonResponse := anMCPServer jsonResponseTo: aJsonRequest.
	
	^ jsonResponse ifNotNil: [ self writeMessage: jsonResponse ]! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:07:30 pm (UTC)'!
!methodProperties: {}!
readAndDispatchNextMessage: anMCPServer

	self readMessage
		ifNil: [ anMCPServer stop ]
		ifNotNil: [ :aJsonRequest | self dispatch: aJsonRequest using: anMCPServer ]! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
serveRequestsFor: anMCPServer

	"Read one message at a time and write the answer of anMCPServer out. Blocks the calling
	process until the server stops running."

	[ anMCPServer isRunning ] whileTrue: [ self readAndDispatchNextMessage: anMCPServer ]
! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
stopServingRequests

	"The input and the output are given to me, so releasing them is not mine to do."
! !

!MCPTransportText class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
onStandardInputOutput

	"Answer a transport on the standard input and output of the operating system process.
	Standard input is read without blocking so that waiting for a request does not stop
	every other process in the image."

	| operatingSystemProcess standardInput |

	operatingSystemProcess := OSProcess thisOSProcess.
	standardInput := operatingSystemProcess stdIn asAsyncFileReadStream.
	standardInput setNonBlocking.

	^self readingFrom: standardInput writingTo: operatingSystemProcess stdOut
! !

!MCPTransportText class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
readingFrom: aReadStream writingTo: aWriteStream

	^self new initializeReadingFrom: aReadStream writingTo: aWriteStream
! !
MCPServer initialize!
