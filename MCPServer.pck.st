'From Cuis7.9 [latest update: #8134] on 21 August 2026 at 3:09:15 pm'!
'Description Add an MCPTool hierarchy and serve it from MCPToolBasedServer'!
!provides: 'MCPServer' 1 2!
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
	instanceVariableNames: 'debugger debuggerMorph'
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
	instanceVariableNames: 'transport running debugger debuggerMorph shouldLogMessages'
	classVariableNames: 'RunningInstance'
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPServer class' category: 'MCPServer'!
MCPServer class
	instanceVariableNames: ''!

!classDefinition: #MCPToolBasedServer category: 'MCPServer'!
MCPServer subclass: #MCPToolBasedServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolBasedServer class' category: 'MCPServer'!
MCPToolBasedServer class
	instanceVariableNames: ''!

!classDefinition: #MCPTool category: 'MCPServer'!
Object subclass: #MCPTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTool class' category: 'MCPServer'!
MCPTool class
	instanceVariableNames: ''!

!classDefinition: #MCPClassTool category: 'MCPServer'!
MCPTool subclass: #MCPClassTool
	instanceVariableNames: 'requestedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPClassTool class' category: 'MCPServer'!
MCPClassTool class
	instanceVariableNames: ''!

!classDefinition: #MCPBrowseTool category: 'MCPServer'!
MCPClassTool subclass: #MCPBrowseTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPBrowseTool class' category: 'MCPServer'!
MCPBrowseTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDeleteClassTool category: 'MCPServer'!
MCPClassTool subclass: #MCPDeleteClassTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDeleteClassTool class' category: 'MCPServer'!
MCPDeleteClassTool class
	instanceVariableNames: ''!

!classDefinition: #MCPHierarchyTool category: 'MCPServer'!
MCPClassTool subclass: #MCPHierarchyTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPHierarchyTool class' category: 'MCPServer'!
MCPHierarchyTool class
	instanceVariableNames: ''!

!classDefinition: #MCPSubclassesTool category: 'MCPServer'!
MCPClassTool subclass: #MCPSubclassesTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPSubclassesTool class' category: 'MCPServer'!
MCPSubclassesTool class
	instanceVariableNames: ''!

!classDefinition: #MCPClassesInCategoryTool category: 'MCPServer'!
MCPTool subclass: #MCPClassesInCategoryTool
	instanceVariableNames: 'category'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPClassesInCategoryTool class' category: 'MCPServer'!
MCPClassesInCategoryTool class
	instanceVariableNames: ''!

!classDefinition: #MCPCodeTool category: 'MCPServer'!
MCPTool subclass: #MCPCodeTool
	instanceVariableNames: 'code'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPCodeTool class' category: 'MCPServer'!
MCPCodeTool class
	instanceVariableNames: ''!

!classDefinition: #MCPEvaluateToDebugOnErrorTool category: 'MCPServer'!
MCPCodeTool subclass: #MCPEvaluateToDebugOnErrorTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPEvaluateToDebugOnErrorTool class' category: 'MCPServer'!
MCPEvaluateToDebugOnErrorTool class
	instanceVariableNames: ''!

!classDefinition: #MCPEvaluateTool category: 'MCPServer'!
MCPCodeTool subclass: #MCPEvaluateTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPEvaluateTool class' category: 'MCPServer'!
MCPEvaluateTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggingTool category: 'MCPServer'!
MCPTool subclass: #MCPDebuggingTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggingTool class' category: 'MCPServer'!
MCPDebuggingTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggerProceedTool category: 'MCPServer'!
MCPDebuggingTool subclass: #MCPDebuggerProceedTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggerProceedTool class' category: 'MCPServer'!
MCPDebuggerProceedTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggerRestartTool category: 'MCPServer'!
MCPDebuggingTool subclass: #MCPDebuggerRestartTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggerRestartTool class' category: 'MCPServer'!
MCPDebuggerRestartTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggerStepIntoTool category: 'MCPServer'!
MCPDebuggingTool subclass: #MCPDebuggerStepIntoTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggerStepIntoTool class' category: 'MCPServer'!
MCPDebuggerStepIntoTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggerStepOverTool category: 'MCPServer'!
MCPDebuggingTool subclass: #MCPDebuggerStepOverTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggerStepOverTool class' category: 'MCPServer'!
MCPDebuggerStepOverTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggerThroughTool category: 'MCPServer'!
MCPDebuggingTool subclass: #MCPDebuggerThroughTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggerThroughTool class' category: 'MCPServer'!
MCPDebuggerThroughTool class
	instanceVariableNames: ''!

!classDefinition: #MCPFinishDebuggingTool category: 'MCPServer'!
MCPDebuggingTool subclass: #MCPFinishDebuggingTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPFinishDebuggingTool class' category: 'MCPServer'!
MCPFinishDebuggingTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDefineClassTool category: 'MCPServer'!
MCPTool subclass: #MCPDefineClassTool
	instanceVariableNames: 'definition expectedClassName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDefineClassTool class' category: 'MCPServer'!
MCPDefineClassTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDefineMethodTool category: 'MCPServer'!
MCPTool subclass: #MCPDefineMethodTool
	instanceVariableNames: 'requestedClass source methodCategory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDefineMethodTool class' category: 'MCPServer'!
MCPDefineMethodTool class
	instanceVariableNames: ''!

!classDefinition: #MCPListCategoriesTool category: 'MCPServer'!
MCPTool subclass: #MCPListCategoriesTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPListCategoriesTool class' category: 'MCPServer'!
MCPListCategoriesTool class
	instanceVariableNames: ''!

!classDefinition: #MCPListClassesTool category: 'MCPServer'!
MCPTool subclass: #MCPListClassesTool
	instanceVariableNames: 'prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPListClassesTool class' category: 'MCPServer'!
MCPListClassesTool class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodTool category: 'MCPServer'!
MCPTool subclass: #MCPMethodTool
	instanceVariableNames: 'requestedClass selector'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPMethodTool class' category: 'MCPServer'!
MCPMethodTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDeleteMethodTool category: 'MCPServer'!
MCPMethodTool subclass: #MCPDeleteMethodTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDeleteMethodTool class' category: 'MCPServer'!
MCPDeleteMethodTool class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodSourceTool category: 'MCPServer'!
MCPMethodTool subclass: #MCPMethodSourceTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPMethodSourceTool class' category: 'MCPServer'!
MCPMethodSourceTool class
	instanceVariableNames: ''!

!classDefinition: #MCPSaveImageTool category: 'MCPServer'!
MCPTool subclass: #MCPSaveImageTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPSaveImageTool class' category: 'MCPServer'!
MCPSaveImageTool class
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

!classDefinition: #MCPTransportStdio category: 'MCPServer'!
MCPTransport subclass: #MCPTransportStdio
	instanceVariableNames: 'stdin stdout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransportStdio class' category: 'MCPServer'!
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

!MCPDebuggingSession commentStamp: '<historical>' prior: 0!
I am the debugger an MCP client is driving.

There is one at a time, so my class answers the current one: an MCPOpenDebuggingSession while an evaluation is suspended at an error, and an MCPNoDebuggingSession when there is none, which answers every message with the error a client gets for driving a debugger that is not there.!

!MCPHttpSession commentStamp: '<historical>' prior: 0!
I am one open Server-Sent Events stream between an MCPTransportHttpCopy and a client that speaks the older SSE transport.

I know my identifier, which the client sends back in the sessionId parameter of every message it posts, and the socket stream my events are written to. Only one writer at a time writes on that stream. A write that fails closes me, and a closed session never writes again.!

!MCPToolBasedServer commentStamp: '<historical>' prior: 0!
I am an MCP server that offers a tool for each concrete subclass of MCPTool, instead of a method of my own for each tool.

I answer the same tools as my superclass, so the same tests verify both of us.!

!MCPTool commentStamp: '<historical>' prior: 0!
I am a tool an MCP client can call.

My class side answers what a client is told about me - my toolName, my description and the inputSchema of the arguments I take - and creates one of my instances from the arguments of a request. The instance creation message reads the arguments it needs and validates them, so an instance is complete and valid before it is asked for its value.

My instance side implements the tool in value.

A subclass of mine that does not answer a toolName of its own is abstract, and concreteToolClasses leaves it out.!

!MCPDebuggingTool commentStamp: '<historical>' prior: 0!
I am a tool that drives the debugger a failed evaluation left open.

A request carries no arguments for me because what I work on is the debugger itself, which is already there.!

!MCPDefineMethodTool commentStamp: '<historical>' prior: 0!
I am the tool that defines or changes a method on a class.

I am not a MCPClassTool: the class a request names is where I put the method, not what I am about.!

!MCPMethodTool commentStamp: '<historical>' prior: 0!
I am a tool that works on a method, which a request names by the class that implements it and its selector.

I am not a MCPClassTool: knowing a class is something I need to find my method, not something I am.!

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
I am the way an MCPServerCopy talks to its client. My subclasses know how requests arrive and how answers go back: MCPTransportStdioCopy reads and writes the standard streams of the operating system process, MCPTransportHttpCopy listens on a TCP port and serves the MCP HTTP endpoint.

A server asks me to serveRequestsFor: it, and I answer each message by sending it responseTo: or jsonResponseTo:.!

!MCPTransportHttp commentStamp: '<historical>' prior: 0!
I serve MCP over TCP, speaking JSON-RPC on top of HTTP the same way RemoteControlMCP does.

I publish two entry points on a WebServer:
- my endpointPath (/mcp) answers POST with the response to the message in the body, which is all a Streamable HTTP client needs. GET on it opens a Server-Sent Events stream for clients that speak the older SSE transport, and DELETE ends that stream.
- my messagesPath (/messages) takes the messages of an event stream client, named by a sessionId parameter, and pushes each answer as a message event on that stream.

Every request goes through my authentication before it is served, and one that it turns down is answered 401. I listen on the interface I was created with, the loopback one by default, so the endpoint is reachable only from this machine. Configure a client with the url http://127.0.0.1:2358/mcp!

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

!MCPDebuggingSession class methodsFor: 'current session' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
finish

	| answer |

	answer := self current finish.
	Current := MCPNoDebuggingSession new.

	^answer
! !

!MCPDebuggingSession class methodsFor: 'current session' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
openOnErrorAt: aSignalerContext

	"Open a debugger on the process signalling at aSignalerContext, which is the process
	evaluating the code and not the one answering the request."

	Current := MCPOpenDebuggingSession debugging: Processor activeProcess at: aSignalerContext
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
finish

	^''
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

!MCPOpenDebuggingSession methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
initializeDebugger: aDebugger morph: aDebuggerMorph

	debugger := aDebugger.
	debuggerMorph := aDebuggerMorph
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
finish

	debuggerMorph delete.

	^''
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
proceed

	debugger proceed.

	^''
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

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
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

!MCPOpenDebuggingSession class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
debugging: aProcess at: aSignalerContext

	| debugger |

	debugger := Debugger new process: aProcess context: aSignalerContext.

	^self new initializeDebugger: debugger morph: (debugger openFullMorphicLabel: self debuggerLabel)
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

!MCPServer methodsFor: 'initialization' stamp: 'HAW 19/Aug/2026, 8:32:14 pm (UTC)'!
!methodProperties: {}!
initializeServingOver: aTransport

	transport := aTransport.
	running := false.
	self doNotLogMessages ! !

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

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:12:07 pm (UTC)'!
!methodProperties: {}!
jsonInternalErrorFor: anError

	^Json render: (self errorResponseFor: nil code: -32603 message: anError description)! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
!methodProperties: {}!
jsonParseError

	^Json render: (self errorResponseFor: nil code: -32700 message: self class parseErrorDescription)! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:12:43 pm (UTC)'!
!methodProperties: {}!
jsonResponseTo: aJsonString

	| request |

	request := [ Json readFrom: aJsonString readStream ]
		on: Error
		do: [ :aParseError | ^self jsonParseError ].

	^(self responseTo: request) ifNotNil: [ :response | Json render: response ]! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:15:10 pm (UTC)'!
!methodProperties: {}!
process: aRequest

	aRequest
		ifNil: [ self stop ]
		ifNotNil: [ :request |
			(self responseTo: request) ifNotNil: [ :response |
				transport writeMessage: (Json render: response) ] ]! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:13:30 pm (UTC)'!
!methodProperties: {}!
responseTo: aRequest

	| receivedTime response |

	receivedTime := self logReceived: aRequest.
	response := self handleRequest: aRequest.
	response ifNotNil: [ :anAnswer |
		self logAnswered: anAnswer receivedAt: receivedTime ].

	^response! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 9:08:53 pm (UTC)'!
!methodProperties: {}!
errorFor: aCode with: aMessage

	^OrderedDictionary new
		at: 'code' put: aCode;
		at: 'message' put: aMessage;
		yourself! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 9:12:07 pm (UTC)'!
!methodProperties: {}!
errorResponseFor: anId code: aCode message: aMessage
	
	^ (self responseFor: anId)
		at: 'error' put: (self errorFor: aCode with: aMessage);
		yourself.! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
!methodProperties: {}!
internalErrorResponseFor: anId withError: anError

	^ self errorResponseFor: anId code: -32603 message: anError printString! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
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

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:19:49 pm (UTC)'!
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

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefBrowse

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_browse';
		at: 'description' put: 'Browse a class to see its superclass, instance variables, class variables, and method selectors.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class to browse';
					yourself);
				yourself);
			at: 'required' put: #('className');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefClassesInCategory

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_classes_in_category';
		at: 'description' put: 'List all classes in a specific category.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'category' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the category';
					yourself);
				yourself);
			at: 'required' put: #('category');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDebuggerProceed

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_debugger_proceed';
		at: 'description' put: 'It does a proceed on the debugger, that means running the debugging procees to the end';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDebuggerRestart

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_debugger_restart';
		at: 'description' put: 'It does a restart on the debugger, that means restarting the current execution context, that is thisContext';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDebuggerStepInto

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_debugger_stepinto';
		at: 'description' put: 'It does a step into on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDebuggerStepOver

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_debugger_stepover';
		at: 'description' put: 'It does a step over on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDebuggerThrough

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_debugger_through';
		at: 'description' put: 'It does a thought on the debugger created by smalltalk_evaluate_to_debug_on_error. Doing a through means going inside of the next block closure. If the next instruction is not a block closure it is the same as doind a step over. Returns the print string of the top of the stack';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDefineClass

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_define_class';
		at: 'description' put: 'Define a new class or modify an existing class definition.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'definition' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Full class definition expression';
					yourself);
				yourself);
			at: 'required' put: #('definition');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDefineMethod

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_define_method';
		at: 'description' put: 'Define or modify a method on a class.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class';
					yourself);
				at: 'source' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Full method source including selector';
					yourself);
				at: 'category' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Optional method category. Defaults to as yet unclassified';
					yourself);
				yourself);
			at: 'required' put: #('className' 'source');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDeleteClass

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_delete_class';
		at: 'description' put: 'Remove a class from the system.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class to remove';
					yourself);
				yourself);
			at: 'required' put: #('className');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefDeleteMethod

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_delete_method';
		at: 'description' put: 'Remove a method from a class.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class';
					yourself);
				at: 'selector' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Selector of the method to remove';
					yourself);
				yourself);
			at: 'required' put: #('className' 'selector');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefEvaluate

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_evaluate';
		at: 'description' put: 'Evaluate arbitrary Smalltalk code and return the result.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'code' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Smalltalk code to evaluate';
					yourself);
				yourself);
			at: 'required' put: #('code');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 21/Aug/2026, 10:26:32 am (UTC)'!
!methodProperties: {}!
toolDefEvaluateToDebugOnError

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_evaluate_to_debug_on_error';
		at: 'description' put: 'Evaluate arbitrary Smalltalk code, return the result if no error, return the string ''Error: '' with the exception description and install a debugger to debug the error using the tools smalltalk_debugger_stepinto, smalltalk_debugger_stepover, smalltalk_debugger_through, smalltalk_debugger_proceed, smalltalk_debugger_restart, smalltalk_finish_debugging.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'code' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Smalltalk code to evaluate';
					yourself);
				yourself);
			at: 'required' put: #('code');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefFinishDebugging

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_finish_debugging';
		at: 'description' put: 'It clean ups all the debugging session. It should always be sent when no more debugging is needed';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefHierarchy

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_hierarchy';
		at: 'description' put: 'Get the inheritance hierarchy for a class (from Object down to the class).';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class';
					yourself);
				yourself);
			at: 'required' put: #('className');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefListCategories

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_list_categories';
		at: 'description' put: 'List all system categories.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefListClasses

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_list_classes';
		at: 'description' put: 'List all classes in the system, optionally filtered by prefix.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'prefix' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Optional prefix to filter class names';
					yourself);
				yourself);
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefMethodSource

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_method_source';
		at: 'description' put: 'Get the source code of a specific method.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class';
					yourself);
				at: 'selector' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Method selector';
					yourself);
				yourself);
			at: 'required' put: #('className' 'selector');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefSaveImage

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_save_image';
		at: 'description' put: 'Save the Smalltalk image to disk.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: Dictionary new;
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 20/Aug/2026, 10:09:54 pm (UTC)'!
!methodProperties: {}!
toolDefSubclasses

	^OrderedDictionary new
		at: 'name' put: 'smalltalk_subclasses';
		at: 'description' put: 'Get the direct subclasses of a class.';
		at: 'inputSchema' put: (OrderedDictionary new
			at: 'type' put: 'object';
			at: 'properties' put: (OrderedDictionary new
				at: 'className' put: (OrderedDictionary new
					at: 'type' put: 'string';
					at: 'description' put: 'Name of the class';
					yourself);
				yourself);
			at: 'required' put: #('className');
			yourself);
		yourself! !

!MCPServer methodsFor: 'tool definitions' stamp: 'HAW 21/Aug/2026, 10:28:23 am (UTC)'!
!methodProperties: {}!
toolDefinitions
	
	^ {
	self toolDefEvaluate. 
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

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 19/Aug/2026, 9:21:01 pm (UTC)'!
!methodProperties: {}!
executeTool: name arguments: args

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

!MCPServer methodsFor: 'request arguments' stamp: 'HAW 19/Aug/2026, 9:44:45 pm (UTC)'!
!methodProperties: {}!
classFrom: args
	
	^args 
		at: 'className'
		ifPresent: [ :aClassName | self classNamed: aClassName ] 
		ifAbsent: [  self signalClassNotFound: '<not provided>'  ].
! !

!MCPServer methodsFor: 'request arguments' stamp: 'HAW 19/Aug/2026, 9:29:08 pm (UTC)'!
!methodProperties: {}!
classNamed: aClassName 
	
	^(Smalltalk classNamed: aClassName) ifNil: [ self signalClassNotFound: aClassName ]
	! !

!MCPServer methodsFor: 'request arguments' stamp: 'HAW 19/Aug/2026, 9:59:15 pm (UTC)'!
!methodProperties: {}!
codeFrom: args
	
	^args at: 'code' ifAbsent: [ self error: 'No code provided' ].! !

!MCPServer methodsFor: 'request arguments' stamp: 'HAW 19/Aug/2026, 10:09:10 pm (UTC)'!
!methodProperties: {}!
selectorFrom: args in: aClass
	
	| selector |
	
	selector := (args at: 'selector' ifAbsent: [ self error: 'No selector provided' ]) asSymbol.
	(aClass includesSelector: selector) ifFalse: [ self error: 'Method not found: ' , aClass name , '>>' , selector ].
	
	^selector
	! !

!MCPServer methodsFor: 'request arguments' stamp: 'HAW 19/Aug/2026, 9:23:11 pm (UTC)'!
!methodProperties: {}!
signalClassNotFound: className

	self error: 'Class not found: ' , className! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:10 pm (UTC)'!
!methodProperties: {}!
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

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 9:47:09 pm (UTC)'!
!methodProperties: {}!
toolBrowse: args
	
	| class result |
	
	class := self classFrom: args.
	result := OrderedDictionary new.
	result
		at: 'name' put: class name;
		at: 'superclass' put: class superclass name; "nil answers to name - Henran" 
		at: 'category' put: class category;
		at: 'instanceVariables' put: class instVarNames asArray;
		at: 'classVariables' put: class classVarNames asArray;
		at: 'methods' put: class selectors asArray sorted;
		at: 'comment' put: (class comment ifNil: [ '' ]).
		
	^ Json render: result.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 9:51:28 pm (UTC)'!
!methodProperties: {}!
toolClassesInCategory: args

	| category classes classNames |

	category := args at: 'category' ifAbsent: [ self error: 'No category provided' ].
	classes := SystemOrganization classesAt: category.
	classNames := (classes collect: [ :aClass | aClass name ]) asArray sorted.
	
	^ Json render: classNames.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
toolDebuggerProceed: args

	debugger ifNil: [ ^'Error: no debugger to proceed' ].
	debugger proceed.
	
	^ ''! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
toolDebuggerRestart: args

	debugger ifNil: [ ^'Error: no debugger to restart' ].
	debugger restart.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
toolDebuggerStepInto: args

	debugger ifNil:  [ ^'Error: no debugger to stepInto' ].
	debugger send.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
toolDebuggerStepOver: args

	debugger ifNil: [ ^'Error: no debugger to stepOver' ].
	debugger doStep.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
toolDebuggerThrough: args

	debugger ifNil:  [ ^'Error: no debugger to through' ].
	debugger stepIntoBlock.
	
	^ debugger contextStackList first printString! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 20/Aug/2026, 6:44:21 pm (UTC)'!
!methodProperties: {}!
toolDefineClass: args

	| definition expectedClassName createdClass |

	definition := args at: 'definition' ifAbsent: [ self signalNoDefinitionProvided ].
	expectedClassName := self classNameCreatedIn: definition.
	createdClass := Compiler evaluate: definition.
	self assert: createdClass isNamed: expectedClassName.

	^'Class defined successfully'! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 20/Aug/2026, 8:23:21 pm (UTC)'!
!methodProperties: {}!
toolDefineMethod: args
	
	| source category class |
	
	class := self classFrom: args.
	source := args at: 'source' ifAbsent: [ self error: 'No source provided' ].
	category := args at: 'category' ifAbsent: [ ClassOrganizer defaultMethodCategory ].
	
	MCPServer isDevMode
		ifTrue: [ class compile: source classified: category ]
		ifFalse: [ class compileSilently: source classified: category ].
	
	^ 'Method defined successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 9:57:32 pm (UTC)'!
!methodProperties: {}!
toolDeleteClass: args
	
	| class |
	
	class := self classFrom: args.
	
	class removeFromSystem.
	
	^ 'Class deleted successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 10:08:37 pm (UTC)'!
!methodProperties: {}!
toolDeleteMethod: args

	| selector class |

	class := self classFrom: args.
	selector := self selectorFrom: args in: class.
	
	class removeSelector: selector.

	^ 'Method deleted successfully'.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 9:59:32 pm (UTC)'!
!methodProperties: {}!
toolEvaluate: args
	
	| code result |
	
	code := self codeFrom: args.
	
	result := Compiler evaluate: code.
	
	^ result printString.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 9:59:07 pm (UTC)'!
!methodProperties: {}!
toolEvaluateToDebugOnError: args
	
	| code |

	code := self codeFrom: args.
	
	^self evaluateToDebugOnError: code! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
toolFinishDebugging: args
	
	debuggerMorph ifNotNil: [ :morph | morph delete ].
	debugger := nil.
	debuggerMorph := nil.
	
	^ ''! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 21/Aug/2026, 11:13:45 am (UTC)'!
!methodProperties: {}!
toolHierarchy: args

	| class superclassNames |

	class := self classFrom: args.
	
	superclassNames := class withAllSuperclasses collect: [ :aClass | aClass name].
	
	^ Json render: superclassNames asArray.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 10:02:09 pm (UTC)'!
!methodProperties: {}!
toolListCategories: args

	| categories |

	categories := SystemOrganization categories asArray sorted.

	^ Json render: categories.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 10:05:33 pm (UTC)'!
!methodProperties: {}!
toolListClasses: args

	| prefix classNames |

	prefix := args at: 'prefix' ifAbsent: [ '' ].
	
	classNames := Smalltalk allClasses 
		select: [ :aClass | aClass name beginsWith: prefix ]
		thenCollect: [ :aClass | aClass name ].
	
	^ Json render: classNames asArray sorted.
	! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 10:10:04 pm (UTC)'!
!methodProperties: {}!
toolMethodSource: args

	| selector class |

	class := self classFrom: args.
	selector := self selectorFrom: args in: class.
	
	^ (class compiledMethodAt: selector) sourceCode.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 10:10:19 pm (UTC)'!
!methodProperties: {}!
toolSaveImage: args
	
	[ Smalltalk saveImage ] fork.
	(Delay forSeconds: 1) wait.
	
	^ 'Image saved: ' , Smalltalk imageName.! !

!MCPServer methodsFor: 'tool implementations' stamp: 'HAW 19/Aug/2026, 10:11:44 pm (UTC)'!
!methodProperties: {}!
toolSubclasses: args
	
	| class subclassNames |
	
	class := self classFrom: args.
	
	subclassNames := class subclasses collect: [ :aClass | aClass name].

	^ Json render: subclassNames asArray sorted.! !

!MCPServer methodsFor: 'class definitions' stamp: 'HAW 20/Aug/2026, 6:44:21 pm (UTC)'!
!methodProperties: {}!
assert: aCreatedClass isNamed: anExpectedClassName

	"Signal unless evaluating the definition really created the class it names."

	aCreatedClass isBehavior ifFalse: [ self signalDidNotCreateAClass: aCreatedClass ].
	aCreatedClass name = anExpectedClassName
		ifFalse: [ self signalCreatedAnotherClass: aCreatedClass insteadOf: anExpectedClassName ]! !

!MCPServer methodsFor: 'class definitions' stamp: 'HAW 20/Aug/2026, 3:14:30 pm (UTC)'!
!methodProperties: {}!
classCreationMessageIn: aDefinition

	"Answer the message node aDefinition sends to create a class, signalling when aDefinition
	is not a single send of one of the class creation messages."

	| messageNode |

	messageNode := self messageSentIn: aDefinition.
	(self class classCreationSelectors includes: messageNode selectorSymbol)
		ifFalse: [ self signalIsNotAClassCreationMessage: messageNode selectorSymbol ].

	^messageNode! !

!MCPServer methodsFor: 'class definitions' stamp: 'HAW 20/Aug/2026, 3:15:59 pm (UTC)'!
!methodProperties: {}!
classNameCreatedIn: aDefinition

	"Answer the name of the class aDefinition creates, signalling when aDefinition is not a
	single send of one of the class creation messages naming its class with a literal."

	^self classNameIn: (self classCreationMessageIn: aDefinition)! !

!MCPServer methodsFor: 'class definitions' stamp: 'HAW 20/Aug/2026, 3:14:35 pm (UTC)'!
!methodProperties: {}!
classNameIn: aClassCreationMessage

	"Answer the name aClassCreationMessage gives to the class it creates."

	| nameArgument |

	nameArgument := aClassCreationMessage arguments first.
	nameArgument isLiteralNode ifFalse: [ self signalClassNameIsNotALiteral ].

	^nameArgument key! !

!MCPServer methodsFor: 'class definitions' stamp: 'HAW 20/Aug/2026, 3:14:28 pm (UTC)'!
!methodProperties: {}!
messageSentIn: aDefinition

	"Answer the only message node aDefinition sends, signalling when it does not send exactly one."

	| statements returnedStatement |

	statements := (Parser parse: aDefinition class: UndefinedObject noPattern: true) block statements.
	statements size = 1 ifFalse: [ self signalIsNotASingleMessageSend ].
	returnedStatement := statements first.
	(returnedStatement isReturn and: [ returnedStatement expr isMessageNode ])
		ifFalse: [ self signalIsNotASingleMessageSend ].

	^returnedStatement expr! !

!MCPServer methodsFor: 'errors' stamp: 'HAW 20/Aug/2026, 3:14:19 pm (UTC)'!
!methodProperties: {}!
signalClassNameIsNotALiteral

	self error: self class classNameIsNotALiteralErrorDescription! !

!MCPServer methodsFor: 'errors' stamp: 'HAW 20/Aug/2026, 3:14:25 pm (UTC)'!
!methodProperties: {}!
signalCreatedAnotherClass: aCreatedClass insteadOf: anExpectedClassName

	self error: (self class createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName)! !

!MCPServer methodsFor: 'errors' stamp: 'HAW 20/Aug/2026, 3:14:24 pm (UTC)'!
!methodProperties: {}!
signalDidNotCreateAClass: anObject

	self error: (self class didNotCreateAClassErrorDescriptionFor: anObject)! !

!MCPServer methodsFor: 'errors' stamp: 'HAW 20/Aug/2026, 3:14:17 pm (UTC)'!
!methodProperties: {}!
signalIsNotAClassCreationMessage: aSelector

	self error: (self class isNotAClassCreationMessageErrorDescriptionFor: aSelector)! !

!MCPServer methodsFor: 'errors' stamp: 'HAW 20/Aug/2026, 3:14:15 pm (UTC)'!
!methodProperties: {}!
signalIsNotASingleMessageSend

	self error: self class isNotASingleMessageSendErrorDescription! !

!MCPServer methodsFor: 'errors' stamp: 'HAW 20/Aug/2026, 3:14:13 pm (UTC)'!
!methodProperties: {}!
signalNoDefinitionProvided

	self error: self class noDefinitionProvidedErrorDescription! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:18:55 pm (UTC)'!
!methodProperties: {}!
servingOver: aTransport

	^self new initializeServingOver: aTransport! !

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

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:07:20 pm (UTC)'!
!methodProperties: {}!
servingOverStandardInputOutput

	"Answer a server that reads its requests from standard input and answers on standard output."

	^self servingOver: MCPTransportStdio new! !

!MCPServer class methodsFor: 'development mode' stamp: 'HAW 19/Aug/2026, 8:13:06 pm (UTC)'!
!methodProperties: {}!
isDevMode

	^Smalltalk startUpArguments includes: '--devMode' ! !

!MCPServer class methodsFor: 'class initialization' stamp: 'HAW 19/Aug/2026, 12:59:11 pm (UTC)'!
!methodProperties: {}!
initialize

	Smalltalk addToStartUpList: self! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 20/Aug/2026, 3:14:03 pm (UTC)'!
!methodProperties: {}!
classNameIsNotALiteralErrorDescription

	^'The name of the class to create has to be a literal symbol'! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 20/Aug/2026, 3:14:06 pm (UTC)'!
!methodProperties: {}!
createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName

	^'The class definition created ', aCreatedClass name, ' instead of ', anExpectedClassName! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 20/Aug/2026, 3:14:05 pm (UTC)'!
!methodProperties: {}!
didNotCreateAClassErrorDescriptionFor: anObject

	^'The class definition did not create a class, it answered ', anObject printString! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 20/Aug/2026, 3:13:58 pm (UTC)'!
!methodProperties: {}!
isNotAClassCreationMessageErrorDescriptionFor: aSelector

	^'The class definition has to send one of the class creation messages, but it sends #', aSelector! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 20/Aug/2026, 3:13:56 pm (UTC)'!
!methodProperties: {}!
isNotASingleMessageSendErrorDescription

	^'The class definition has to be a single message send'! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 20/Aug/2026, 3:13:54 pm (UTC)'!
!methodProperties: {}!
noDefinitionProvidedErrorDescription

	^'No definition provided'! !

!MCPServer class methodsFor: 'error descriptions' stamp: ''!
!methodProperties: {}!
parseErrorDescription

	^'Parse error'! !

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

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:17:12 pm (UTC)'!
!methodProperties: {}!
httpAuthentication

	"Answer who will decide which requests the endpoint serves. A token in the environment
	turns authentication on, and without one the endpoint serves any client that reaches it."

	^(OSProcess accessor environmentAt: self httpTokenEnvironmentVariableName)
		ifNil: [ MCPNoAuthentication new ]
		ifNotNil: [ :aToken | self authenticationRequiring: aToken ]! !

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

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:24:05 pm (UTC)'!
!methodProperties: {}!
portNumberFrom: portArgument 

	^Integer readFrom: (portArgument allButFirst: self httpPortArgumentPrefix size) readStream! !

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

!MCPToolBasedServer methodsFor: 'MCP handlers' stamp: 'HAW 21/Aug/2026, 11:21:05 am (UTC)'!
!methodProperties: {}!
toolDefinitions

	^MCPTool concreteToolClasses collect: [ :eachToolClass | eachToolClass toolDefinition ]! !

!MCPToolBasedServer methodsFor: 'tool dispatch' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
executeTool: aToolName arguments: anArguments

	^(self toolClassNamed: aToolName) valueFrom: anArguments
! !

!MCPToolBasedServer methodsFor: 'tool dispatch' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
toolClassNamed: aToolName

	^MCPTool concreteToolClasses
		detect: [ :eachToolClass | eachToolClass toolName = aToolName ]
		ifNone: [ self signalUnknownTool: aToolName ]
! !

!MCPToolBasedServer methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
signalUnknownTool: aToolName

	self error: (self class unknownToolErrorDescriptionFor: aToolName)

! !

!MCPToolBasedServer class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
!methodProperties: {}!
unknownToolErrorDescriptionFor: aToolName

	^'Unknown tool: ', aToolName
! !

!MCPTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^self subclassResponsibility
! !

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:01 am (UTC)'!
!methodProperties: {}!
description

	^self subclassResponsibility
! !

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 1:13:56 pm (UTC)'!
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

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 5:30:51 pm (UTC)'!
!methodProperties: {}!
propertiesDefinition

	^self toolProperties 
		inject: OrderedDictionary new
		into: [ :aProperties :aToolProperty  | aToolProperty addTo: aProperties ]! !

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 5:33:26 pm (UTC)'!
!methodProperties: {}!
requiredPropertyNames

	^self toolProperties 
		select: [ :aToolProperty | aToolProperty isRequired ]
		thenCollect: [ :aToolProperty | aToolProperty name ]

! !

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:21:05 am (UTC)'!
!methodProperties: {}!
toolDefinition

	^OrderedDictionary new
		at: 'name' put: self toolName;
		at: 'description' put: self description;
		at: 'inputSchema' put: self inputSchema;
		yourself! !

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:01 am (UTC)'!
!methodProperties: {}!
toolName

	^self subclassResponsibility
! !

!MCPTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 1:13:56 pm (UTC)'!
!methodProperties: {}!
toolProperties

	"Answer the properties a client can send me, in the order a client is shown them."

	^self subclassResponsibility
! !

!MCPTool class methodsFor: 'tool classes' stamp: 'HAW 21/Aug/2026, 5:46:15 pm (UTC)'!
!methodProperties: {}!
concreteToolClasses

	^((self allSubclasses select: [ :aToolClass | aToolClass isConcrete ])
		asSortedCollection: [ :left :right | left toolName <= right toolName ]) asArray
! !

!MCPTool class methodsFor: 'tool classes' stamp: 'HAW 21/Aug/2026, 5:45:06 pm (UTC)'!
!methodProperties: {}!
isConcrete

	^self subclasses isEmpty! !

!MCPTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 11:07:01 am (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self subclassResponsibility
! !

!MCPTool class methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:01 am (UTC)'!
!methodProperties: {}!
valueFrom: anArguments

	^(self newFrom: anArguments) value
! !

!MCPClassTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
initializeRequestedClass: aClass

	requestedClass := aClass
! !

!MCPClassTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self classNameProperty }
! !

!MCPClassTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new initializeRequestedClass: (self classNameProperty valueFrom: anArguments)
! !

!MCPClassTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
classNameProperty

	^`MCPClassToolProperty named: 'className' describedBy: 'Name of the class'`
! !

!MCPBrowseTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	| browsedClass |

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

!MCPBrowseTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
description

	^'Browse a class to see its superclass, instance variables, class variables, and method selectors.'! !

!MCPBrowseTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_browse'! !

!MCPBrowseTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
classNameProperty

	^`MCPClassToolProperty named: 'className' describedBy: 'Name of the class to browse'`
! !

!MCPDeleteClassTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	requestedClass removeFromSystem.

	^'Class deleted successfully'
! !

!MCPDeleteClassTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Remove a class from the system.'! !

!MCPDeleteClassTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_delete_class'! !

!MCPDeleteClassTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
classNameProperty

	^`MCPClassToolProperty named: 'className' describedBy: 'Name of the class to remove'`
! !

!MCPHierarchyTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:13:23 am (UTC)'!
!methodProperties: {}!
value

	^Json render: (requestedClass withAllSuperclasses collect: [ :aClass | aClass name ]) asArray
! !

!MCPHierarchyTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Get the inheritance hierarchy for a class (from Object down to the class).'! !

!MCPHierarchyTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_hierarchy'! !

!MCPSubclassesTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^Json render: (requestedClass subclasses collect: [ :aClass | aClass name ]) asArray sorted
! !

!MCPSubclassesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Get the direct subclasses of a class.'! !

!MCPSubclassesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_subclasses'! !

!MCPClassesInCategoryTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
initializeCategory: aCategory

	category := aCategory
! !

!MCPClassesInCategoryTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
value

	^Json render: ((SystemOrganization classesAt: category) collect: [ :aClass | aClass name ]) asArray sorted

! !

!MCPClassesInCategoryTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'List all classes in a specific category.'! !

!MCPClassesInCategoryTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_classes_in_category'! !

!MCPClassesInCategoryTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self categoryProperty }
! !

!MCPClassesInCategoryTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new initializeCategory: (self categoryProperty valueFrom: anArguments)

! !

!MCPClassesInCategoryTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
categoryProperty

	^`MCPPlainToolProperty named: 'category' describedBy: 'Name of the category'`
! !

!MCPCodeTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
initializeCode: aCode

	code := aCode
! !

!MCPCodeTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self codeProperty }
! !

!MCPCodeTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new initializeCode: (self codeProperty valueFrom: anArguments)
! !

!MCPCodeTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
codeProperty

	^`MCPPlainToolProperty named: 'code' describedBy: 'Smalltalk code to evaluate'`
! !

!MCPEvaluateToDebugOnErrorTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	"The evaluation runs in a process of its own so that the one answering the request is not
	the one left suspended at the error for the debugger to drive."

	| result semaphore |

	MCPDebuggingSession finish.
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

!MCPEvaluateToDebugOnErrorTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Evaluate arbitrary Smalltalk code, return the result if no error, return the string ''Error: '' with the exception description and install a debugger to debug the error using the tools smalltalk_debugger_stepinto, smalltalk_debugger_stepover, smalltalk_debugger_through, smalltalk_debugger_proceed, smalltalk_debugger_restart, smalltalk_finish_debugging.'! !

!MCPEvaluateToDebugOnErrorTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_evaluate_to_debug_on_error'! !

!MCPEvaluateTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^(Compiler evaluate: code) printString
! !

!MCPEvaluateTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
description

	^'Evaluate arbitrary Smalltalk code and return the result.'! !

!MCPEvaluateTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_evaluate'! !

!MCPDebuggingTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new
! !

!MCPDebuggingTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^#()
! !

!MCPDebuggerProceedTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^MCPDebuggingSession current proceed
! !

!MCPDebuggerProceedTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'It does a proceed on the debugger, that means running the debugging procees to the end'! !

!MCPDebuggerProceedTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_debugger_proceed'! !

!MCPDebuggerRestartTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^MCPDebuggingSession current restart
! !

!MCPDebuggerRestartTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'It does a restart on the debugger, that means restarting the current execution context, that is thisContext'! !

!MCPDebuggerRestartTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_debugger_restart'! !

!MCPDebuggerStepIntoTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^MCPDebuggingSession current stepInto
! !

!MCPDebuggerStepIntoTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'It does a step into on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack'! !

!MCPDebuggerStepIntoTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_debugger_stepinto'! !

!MCPDebuggerStepOverTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^MCPDebuggingSession current stepOver
! !

!MCPDebuggerStepOverTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'It does a step over on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack'! !

!MCPDebuggerStepOverTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_debugger_stepover'! !

!MCPDebuggerThroughTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^MCPDebuggingSession current through
! !

!MCPDebuggerThroughTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'It does a thought on the debugger created by smalltalk_evaluate_to_debug_on_error. Doing a through means going inside of the next block closure. If the next instruction is not a block closure it is the same as doind a step over. Returns the print string of the top of the stack'! !

!MCPDebuggerThroughTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_debugger_through'! !

!MCPFinishDebuggingTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^MCPDebuggingSession finish
! !

!MCPFinishDebuggingTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'It clean ups all the debugging session. It should always be sent when no more debugging is needed'! !

!MCPFinishDebuggingTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_finish_debugging'! !

!MCPDefineClassTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
initializeDefinition: aDefinition expectedClassName: anExpectedClassName

	definition := aDefinition.
	expectedClassName := anExpectedClassName
! !

!MCPDefineClassTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
assertCreated: aCreatedClass

	"Signal unless evaluating the definition really created the class it names."

	aCreatedClass isBehavior ifFalse: [ self class signalDidNotCreateAClass: aCreatedClass ].
	aCreatedClass name = expectedClassName
		ifFalse: [ self class signalCreatedAnotherClass: aCreatedClass insteadOf: expectedClassName ]
! !

!MCPDefineClassTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
value

	| createdClass |

	createdClass := Compiler evaluate: definition.
	self assertCreated: createdClass.

	^'Class defined successfully'
! !

!MCPDefineClassTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
description

	^'Define a new class or modify an existing class definition.'! !

!MCPDefineClassTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_define_class'! !

!MCPDefineClassTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self definitionProperty }
! !

!MCPDefineClassTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	| definition |

	definition := self definitionProperty valueFrom: anArguments.

	^self new initializeDefinition: definition expectedClassName: (self classNameCreatedIn: definition)
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
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

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
classCreationSelectors

	"Answer the messages Class understands to create a subclass."

	^Class organization listAtCategoryNamed: 'subclass creation'
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
classNameCreatedIn: aDefinition

	"Answer the name of the class aDefinition creates, signalling when aDefinition is not a
	single send of one of the class creation messages naming its class with a literal."

	^self classNameIn: (self classCreationMessageIn: aDefinition)
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
classNameIn: aClassCreationMessage

	"Answer the name aClassCreationMessage gives to the class it creates."

	| nameArgument |

	nameArgument := aClassCreationMessage arguments first.
	nameArgument isLiteralNode ifFalse: [ self signalClassNameIsNotALiteral ].

	^nameArgument key
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
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

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
signalClassNameIsNotALiteral

	self error: self classNameIsNotALiteralErrorDescription
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
signalCreatedAnotherClass: aCreatedClass insteadOf: anExpectedClassName

	self error: (self createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
signalDidNotCreateAClass: anObject

	self error: (self didNotCreateAClassErrorDescriptionFor: anObject)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
signalIsNotAClassCreationMessage: aSelector

	self error: (self isNotAClassCreationMessageErrorDescriptionFor: aSelector)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
signalIsNotASingleMessageSend

	self error: self isNotASingleMessageSendErrorDescription
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
classNameIsNotALiteralErrorDescription

	^'The name of the class to create has to be a literal symbol'
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName

	^'The class definition created ', aCreatedClass name, ' instead of ', anExpectedClassName
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
didNotCreateAClassErrorDescriptionFor: anObject

	^'The class definition did not create a class, it answered ', anObject printString
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
isNotAClassCreationMessageErrorDescriptionFor: aSelector

	^'The class definition has to send one of the class creation messages, but it sends #', aSelector
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
isNotASingleMessageSendErrorDescription

	^'The class definition has to be a single message send'
! !

!MCPDefineClassTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
definitionProperty

	^`MCPPlainToolProperty named: 'definition' describedBy: 'Full class definition expression'`
! !

!MCPDefineMethodTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 6:06:12 pm (UTC)'!
!methodProperties: {}!
initializeRequestedClass: aClass source: aSource methodCategory: aMethodCategory

	requestedClass := aClass.
	source := aSource.
	methodCategory := aMethodCategory! !

!MCPDefineMethodTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
value

	MCPServer isDevMode
		ifTrue: [ requestedClass compile: source classified: methodCategory ]
		ifFalse: [ requestedClass compileSilently: source classified: methodCategory ].

	^'Method defined successfully'
! !

!MCPDefineMethodTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Define or modify a method on a class.'! !

!MCPDefineMethodTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_define_method'! !

!MCPDefineMethodTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self classNameProperty. self sourceProperty. self categoryProperty }
! !

!MCPDefineMethodTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new
		initializeRequestedClass: (self classNameProperty valueFrom: anArguments)
		source: (self sourceProperty valueFrom: anArguments)
		methodCategory: (self categoryProperty valueFrom: anArguments)
! !

!MCPDefineMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:15:17 pm (UTC)'!
!methodProperties: {}!
categoryProperty

	^`MCPPlainToolProperty
		named: 'category'
		describedBy: 'Optional method category. Defaults to as yet unclassified'
		defaultingTo: ClassOrganizer defaultMethodCategory`
! !

!MCPDefineMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
classNameProperty

	^`MCPClassToolProperty named: 'className' describedBy: 'Name of the class'`
! !

!MCPDefineMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
sourceProperty

	^`MCPPlainToolProperty named: 'source' describedBy: 'Full method source including selector'`
! !

!MCPListCategoriesTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	^Json render: SystemOrganization categories asArray sorted
! !

!MCPListCategoriesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'List all system categories.'! !

!MCPListCategoriesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_list_categories'! !

!MCPListCategoriesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^#()
! !

!MCPListCategoriesTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new
! !

!MCPListClassesTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
initializePrefix: aPrefix

	prefix := aPrefix
! !

!MCPListClassesTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
value

	^Json render: (Smalltalk allClasses
		select: [ :aClass | aClass name beginsWith: prefix ]
		thenCollect: [ :aClass | aClass name ]) asArray sorted
! !

!MCPListClassesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'List all classes in the system, optionally filtered by prefix.'! !

!MCPListClassesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_list_classes'! !

!MCPListClassesTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self prefixProperty }
! !

!MCPListClassesTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new initializePrefix: (self prefixProperty valueFrom: anArguments)
! !

!MCPListClassesTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:15:17 pm (UTC)'!
!methodProperties: {}!
prefixProperty

	^`MCPPlainToolProperty
		named: 'prefix'
		describedBy: 'Optional prefix to filter class names'
		defaultingTo: ''`
! !

!MCPMethodTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
initializeRequestedClass: aClass selector: aSelector

	requestedClass := aClass.
	selector := aSelector
! !

!MCPMethodTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^{ self classNameProperty. self selectorProperty }
! !

!MCPMethodTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 1:13:56 pm (UTC)'!
!methodProperties: {}!
assert: aSelector isImplementedBy: aClass

	(aClass includesSelector: aSelector)
		ifFalse: [ self error: (self methodNotFoundErrorDescriptionFor: aSelector in: aClass) ]
! !

!MCPMethodTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	| requestedClass selector |

	requestedClass := self classNameProperty valueFrom: anArguments.
	selector := self selectorProperty valueFrom: anArguments.
	self assert: selector isImplementedBy: requestedClass.

	^self new initializeRequestedClass: requestedClass selector: selector
! !

!MCPMethodTool class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
methodNotFoundErrorDescriptionFor: aSelector in: aClass

	^'Method not found: ', aClass name, '>>', aSelector
! !

!MCPMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
classNameProperty

	^`MCPClassToolProperty named: 'className' describedBy: 'Name of the class'`
! !

!MCPMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
selectorProperty

	^`MCPPluggableToolProperty
		named: 'selector'
		description: 'Method selector'
		valuedWith: [ :aSelector | aSelector asSymbol ]`
! !

!MCPDeleteMethodTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
value

	requestedClass removeSelector: selector.

	^'Method deleted successfully'
! !

!MCPDeleteMethodTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Remove a method from a class.'! !

!MCPDeleteMethodTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_delete_method'! !

!MCPDeleteMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 5:14:59 pm (UTC)'!
!methodProperties: {}!
classNameProperty

	^`MCPClassToolProperty named: 'className' describedBy: 'Name of the class'`
! !

!MCPDeleteMethodTool class methodsFor: 'tool properties' stamp: 'HAW 21/Aug/2026, 4:57:14 pm (UTC)'!
!methodProperties: {}!
selectorProperty

	^`MCPPluggableToolProperty
		named: 'selector'
		description: 'Selector of the method to remove'
		valuedWith: [ :aSelector | aSelector asSymbol ]`
! !

!MCPMethodSourceTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
!methodProperties: {}!
value

	^(requestedClass compiledMethodAt: selector) sourceCode
! !

!MCPMethodSourceTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
description

	^'Get the source code of a specific method.'! !

!MCPMethodSourceTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:31 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_method_source'! !

!MCPSaveImageTool methodsFor: 'evaluating' stamp: 'HAW 21/Aug/2026, 11:07:02 am (UTC)'!
!methodProperties: {}!
value

	[ Smalltalk saveImage ] fork.
	(Delay forSeconds: 1) wait.

	^'Image saved: ', Smalltalk imageName
! !

!MCPSaveImageTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
description

	^'Save the Smalltalk image to disk.'! !

!MCPSaveImageTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 11:07:32 am (UTC)'!
!methodProperties: {}!
toolName

	^'smalltalk_save_image'! !

!MCPSaveImageTool class methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
toolProperties

	^#()

! !

!MCPSaveImageTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:54:25 pm (UTC)'!
!methodProperties: {}!
newFrom: anArguments

	^self new
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

!MCPPluggableToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:14:19 pm (UTC)'!
!methodProperties: {}!
named: aName description: aDescription valuedWith: aBlock

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

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
pushAnswerTo: aWebRequest over: aSession

	"Send the answer to the message in the request body as a message event on aSession."

	| response |

	response := [ mcpServer jsonResponseTo: (self bodyOf: aWebRequest) ]
		on: Error
		do: [ :anError | mcpServer jsonInternalErrorFor: anError ].
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

!MCPTransportHttp methodsFor: 'responding' stamp: ''!
!methodProperties: {}!
respondWithServerError: anError to: aWebRequest

	"Answer a JSON-RPC internal error instead of the web server default error page."

	^aWebRequest
		sendResponseCode: 500
		content: (mcpServer jsonInternalErrorFor: anError) asUtf8Bytes
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

!MCPTransportStdio methodsFor: 'initialization' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
!methodProperties: {}!
initialize

	| osProc |

	osProc := OSProcess thisOSProcess.
	stdin := osProc stdIn asAsyncFileReadStream.
	stdin setNonBlocking.
	stdout := osProc stdOut.! !

!MCPTransportStdio methodsFor: 'reading' stamp: 'HAW 19/Aug/2026, 12:59:16 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
readMessage
	"Read a JSON message from stdin"
	| line |

	line := self readLine.
	line isNil ifTrue: [ ^ nil ].

	^ Json readFrom: (self utf8Decode: line) readStream.! !

!MCPTransportStdio methodsFor: 'writing' stamp: 'HAW 19/Aug/2026, 10:37:21 pm (UTC)'!
!methodProperties: {}!
writeMessage: jsonString
	"Write a JSON message to stdout, ensuring no embedded newlines"
	| clean |

	stdout closed ifTrue: [ ^self ].

	clean := jsonString copyWithout: Character cr.
	clean := clean copyWithout: Character lf.
	stdout
		nextPutAll: clean asUtf8Bytes asString;
		newLine;
		flush.! !

!MCPTransportStdio methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:37:38 pm (UTC)'!
!methodProperties: {}!
serveRequestsFor: anMCPServer

	"Read one message at a time from standard input and let anMCPServerCopy answer it on
	standard output. Blocks the calling process until the server stops running."

	[ anMCPServer isRunning ] whileTrue: [ anMCPServer process: self readMessage ]! !

!MCPTransportStdio methodsFor: 'serving' stamp: ''!
!methodProperties: {}!
stopServingRequests

	"Standard input and output belong to the operating system process, so there is
	nothing to release here."! !
MCPServer initialize!
