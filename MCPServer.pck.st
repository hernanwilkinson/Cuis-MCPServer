'From Cuis7.9 [latest update: #8149] on 4 September 2026 at 10:40:52 am'!
'Description Name the parameters of an extracted method as the client asked'!
!provides: 'MCPServer' 1 68!
!requires: 'WebClient' nil nil nil!
!requires: 'JSON' nil nil nil!
!requires: 'OSProcess' nil nil nil!
SystemOrganization addCategory: #MCPServer!


!classDefinition: #MCPAuthentication category: #MCPServer!
Object subclass: #MCPAuthentication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPAuthentication class' category: #MCPServer!
MCPAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPBearerTokenAuthentication category: #MCPServer!
MCPAuthentication subclass: #MCPBearerTokenAuthentication
	instanceVariableNames: 'token'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPBearerTokenAuthentication class' category: #MCPServer!
MCPBearerTokenAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPNoAuthentication category: #MCPServer!
MCPAuthentication subclass: #MCPNoAuthentication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPNoAuthentication class' category: #MCPServer!
MCPNoAuthentication class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggingSession category: #MCPServer!
Object subclass: #MCPDebuggingSession
	instanceVariableNames: ''
	classVariableNames: 'Current'
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebuggingSession class' category: #MCPServer!
MCPDebuggingSession class
	instanceVariableNames: ''!

!classDefinition: #MCPNoDebuggingSession category: #MCPServer!
MCPDebuggingSession subclass: #MCPNoDebuggingSession
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPNoDebuggingSession class' category: #MCPServer!
MCPNoDebuggingSession class
	instanceVariableNames: ''!

!classDefinition: #MCPOpenDebuggingSession category: #MCPServer!
MCPDebuggingSession subclass: #MCPOpenDebuggingSession
	instanceVariableNames: 'debugger'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPOpenDebuggingSession class' category: #MCPServer!
MCPOpenDebuggingSession class
	instanceVariableNames: ''!

!classDefinition: #MCPHttpSession category: #MCPServer!
Object subclass: #MCPHttpSession
	instanceVariableNames: 'identifier stream writeMutualExclusion open'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPHttpSession class' category: #MCPServer!
MCPHttpSession class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringApplier category: #MCPServer!
Object subclass: #MCPRefactoringApplier
	instanceVariableNames: 'refactoring method'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPRefactoringApplier class' category: #MCPServer!
MCPRefactoringApplier class
	instanceVariableNames: ''!

!classDefinition: #MCPServer category: #MCPServer!
Object subclass: #MCPServer
	instanceVariableNames: 'transport running shouldLogMessages tools smalltalk calledTools'
	classVariableNames: 'OnStartupInstance'
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPServer class' category: #MCPServer!
MCPServer class
	instanceVariableNames: ''!

!classDefinition: #MCPTool category: #MCPServer!
Object subclass: #MCPTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTool class' category: #MCPServer!
MCPTool class
	instanceVariableNames: ''!

!classDefinition: #MCPToolDeclaration category: #MCPServer!
MCPTool subclass: #MCPToolDeclaration
	instanceVariableNames: 'name description properties'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolDeclaration class' category: #MCPServer!
MCPToolDeclaration class
	instanceVariableNames: ''!

!classDefinition: #MCPClassDefinitionTool category: #MCPServer!
MCPToolDeclaration subclass: #MCPClassDefinitionTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPClassDefinitionTool class' category: #MCPServer!
MCPClassDefinitionTool class
	instanceVariableNames: ''!

!classDefinition: #MCPDefineClassTool category: #MCPServer!
MCPToolDeclaration subclass: #MCPDefineClassTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDefineClassTool class' category: #MCPServer!
MCPDefineClassTool class
	instanceVariableNames: ''!

!classDefinition: #MCPEvaluateToDebugOnErrorTool category: #MCPServer!
MCPToolDeclaration subclass: #MCPEvaluateToDebugOnErrorTool
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPEvaluateToDebugOnErrorTool class' category: #MCPServer!
MCPEvaluateToDebugOnErrorTool class
	instanceVariableNames: ''!

!classDefinition: #MCPPluggableTool category: #MCPServer!
MCPToolDeclaration subclass: #MCPPluggableTool
	instanceVariableNames: 'executeBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPluggableTool class' category: #MCPServer!
MCPPluggableTool class
	instanceVariableNames: ''!

!classDefinition: #MCPToolDecorator category: #MCPServer!
MCPTool subclass: #MCPToolDecorator
	instanceVariableNames: 'decoratee smalltalk'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolDecorator class' category: #MCPServer!
MCPToolDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPToolGroup category: #MCPServer!
Object subclass: #MCPToolGroup
	instanceVariableNames: 'smalltalk'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolGroup class' category: #MCPServer!
MCPToolGroup class
	instanceVariableNames: ''!

!classDefinition: #MCPDebugTools category: #MCPServer!
MCPToolGroup subclass: #MCPDebugTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPDebugTools class' category: #MCPServer!
MCPDebugTools class
	instanceVariableNames: ''!

!classDefinition: #MCPImageTools category: #MCPServer!
MCPToolGroup subclass: #MCPImageTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPImageTools class' category: #MCPServer!
MCPImageTools class
	instanceVariableNames: ''!

!classDefinition: #MCPModelStructureTools category: #MCPServer!
MCPToolGroup subclass: #MCPModelStructureTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPModelStructureTools class' category: #MCPServer!
MCPModelStructureTools class
	instanceVariableNames: ''!

!classDefinition: #MCPPackageTools category: #MCPServer!
MCPToolGroup subclass: #MCPPackageTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPackageTools class' category: #MCPServer!
MCPPackageTools class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringToolGroup category: #MCPServer!
MCPToolGroup subclass: #MCPRefactoringToolGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPRefactoringToolGroup class' category: #MCPServer!
MCPRefactoringToolGroup class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringTools category: #MCPServer!
MCPRefactoringToolGroup subclass: #MCPRefactoringTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPRefactoringTools class' category: #MCPServer!
MCPRefactoringTools class
	instanceVariableNames: ''!

!classDefinition: #MCPSearchTools category: #MCPServer!
MCPToolGroup subclass: #MCPSearchTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPSearchTools class' category: #MCPServer!
MCPSearchTools class
	instanceVariableNames: ''!

!classDefinition: #MCPTestRunningTools category: #MCPServer!
MCPToolGroup subclass: #MCPTestRunningTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTestRunningTools class' category: #MCPServer!
MCPTestRunningTools class
	instanceVariableNames: ''!

!classDefinition: #MCPToolProperty category: #MCPServer!
Object subclass: #MCPToolProperty
	instanceVariableNames: 'name description required absentBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPToolProperty class' category: #MCPServer!
MCPToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPClassToolProperty category: #MCPServer!
MCPToolProperty subclass: #MCPClassToolProperty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPClassToolProperty class' category: #MCPServer!
MCPClassToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPCodePackageProperty category: #MCPServer!
MCPToolProperty subclass: #MCPCodePackageProperty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPCodePackageProperty class' category: #MCPServer!
MCPCodePackageProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodProperty category: #MCPServer!
MCPToolProperty subclass: #MCPMethodProperty
	instanceVariableNames: 'classProperty selectorProperty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPMethodProperty class' category: #MCPServer!
MCPMethodProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPPlainToolProperty category: #MCPServer!
MCPToolProperty subclass: #MCPPlainToolProperty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPlainToolProperty class' category: #MCPServer!
MCPPlainToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPPluggableToolProperty category: #MCPServer!
MCPToolProperty subclass: #MCPPluggableToolProperty
	instanceVariableNames: 'valueBlock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPPluggableToolProperty class' category: #MCPServer!
MCPPluggableToolProperty class
	instanceVariableNames: ''!

!classDefinition: #MCPTransport category: #MCPServer!
Object subclass: #MCPTransport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransport class' category: #MCPServer!
MCPTransport class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportHttp category: #MCPServer!
MCPTransport subclass: #MCPTransportHttp
	instanceVariableNames: 'portNumber interfaceAddress webServer mcpServer sessions sessionCounter authentication'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransportHttp class' category: #MCPServer!
MCPTransportHttp class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportText category: #MCPServer!
MCPTransport subclass: #MCPTransportText
	instanceVariableNames: 'in out'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServer'!
!classDefinition: 'MCPTransportText class' category: #MCPServer!
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

!MCPRefactoringApplier commentStamp: '<historical>' prior: 0!
I apply a refactoring and say what it changed, the way a client of the server reads it.

I am created with the refactoring, and with the method too when what is described is the new source of one, and I answer one message per way of reading the result: applyReportingChanges, applyReportingChangedClasses, applyReportingNewClass and the rest. What a refactoring answers when it is applied is not the same kind of thing for all of them - methods, classes, the names of what was removed, the new source of one method - so the sender picks the message that says the kind its refactoring answers.!

!MCPTool commentStamp: '<historical>' prior: 0!
I am something a server serves: I say my name, what I am for, the definition a client reads to know how to call me, and I answer what a client asked when it does.

My subclasses differ in where that comes from. One kind holds its own name, description and properties; another borrows them from a tool it decorates and adds to what it answers.!

!MCPToolDeclaration commentStamp: '<historical>' prior: 0!
I am a tool that holds its own name, description and properties.

My properties are what a client sends me, and I build my definition and turn the arguments of a request into what my subclasses work with out of them.!

!MCPClassDefinitionTool commentStamp: '<historical>' prior: 0!
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

!MCPToolDecorator commentStamp: '<historical>' prior: 0!
I am a tool that adds something to what another tool answers, which is how a package that is not always loaded reaches the tools of one that always is.

Every subclass of mine says which tool it decorates, and a server wraps that tool with it once every tool is in place. A decorator of a tool that is not there decorates nothing.!

!MCPToolGroup commentStamp: '<historical>' prior: 0!
I am a group of tools a server offers.

Every subclass of mine is asked to add its tools, so a package that has some is one that subclasses me, and a package that is not loaded adds none. There is nothing to register and nothing to forget to register.!

!MCPDebugTools commentStamp: '<historical>' prior: 0!
I am the tools that open a debugger on code that fails and drive the one that is open.!

!MCPImageTools commentStamp: '<historical>' prior: 0!
I am the tools that act on the image itself: evaluating code in it, seeing what it looks like, and saving it.!

!MCPModelStructureTools commentStamp: '<historical>' prior: 0!
I am the tools that read and change the metamodel: classes, their categories, their hierarchy and their methods.!

!MCPPackageTools commentStamp: '<historical>' prior: 0!
I am the tools that act on the code packages of the image: what each of them holds, describes itself as and requires, which of them have changes that their file does not have yet, and writing one out.

A package is saved only when it knows the file it is written to. Asking the image for that file opens a dialog on screen, which no request can answer, so a package that does not know it is reported instead of asked, and the file is named through a tool of mine.!

!MCPRefactoringToolGroup commentStamp: '<historical>' prior: 0!
I am a group of tools that apply refactorings.

I know how a refactoring is applied and what my subclasses need to build one: the scope a refactoring over a selector works on, the class a name stands for, and the names a client sent as one text.

A group of mine that has tools of its own is named after the refactorings it offers, as MCPRefactoringTools; a group of mine that only gathers others is named a tool group, as I am.!

!MCPRefactoringTools commentStamp: '<historical>' prior: 0!
I am every tool that applies a refactoring of the image I was made for.

A server asks me for my tools and offers them; what a refactoring needs to be built, and how a piece of source is named by the text it is written with or by the interval it occupies, is mine to know and not the server's.!

!MCPSearchTools commentStamp: '<historical>' prior: 0!
I am the tools that look for what the image already holds: who sends a selector, who implements it, what names a class or a variable, what a source text says, and what message answers a result that is already known.!

!MCPTestRunningTools commentStamp: '<historical>' prior: 0!
I am the tools that run tests, one of them or a whole suite, and answer how they went.!

!MCPToolProperty commentStamp: '<historical>' prior: 0!
I am a property a client can send to an MCP tool.

I know my propertyName, my description and whether I am required, which is what a tool shows a client in its inputSchema, and I answer valueFrom: anArguments, which reads me out of the arguments of a request and answers the object the tool needs.

A required property signals when it is missing; an optional one answers the value it was created with.

Each tool creates the properties it takes in its own class side, in methods named after them, so a tool reads the arguments it declares and nothing else.!

!MCPClassToolProperty commentStamp: '<historical>' prior: 0!
I am the class a request names.

I answer the class itself rather than its name, and I do not report a missing className as a missing property: a client that sends none is told the class was not found, which is what it was asking for.!

!MCPCodePackageProperty commentStamp: '<historical>' prior: 0!
I am the code package a request names.

I answer the package itself rather than its name, so a tool that takes a package is handed the package and not the name it was found by, and a name no installed package answers to is reported as a package that was not found.!

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

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
finish

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
proceed

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
restart

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
stepInto

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
stepOver

	^self subclassResponsibility
! !

!MCPDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
through

	^self subclassResponsibility
! !

!MCPDebuggingSession class methodsFor: 'current session' stamp: 'HAW 21/Aug/2026, 11:07:03 am (UTC)'!
current

	^Current ifNil: [ Current := MCPNoDebuggingSession new ]
! !

!MCPDebuggingSession class methodsFor: 'current session' stamp: 'HAW 26/Aug/2026, 10:24:09 pm (UTC)'!
openOnErrorAt: aSignalerContext

	"Open a debugger on the process signalling at aSignalerContext, which is the process
	evaluating the code and not the one answering the request. Whatever was being debugged is
	finished first: letting go of it would leave its window with nobody able to close it."

	self finishCurrent.
	Current := MCPOpenDebuggingSession debugging: Processor activeProcess at: aSignalerContext
! !

!MCPDebuggingSession class methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
finishCurrent

	| answer |

	answer := self current finish.
	Current := MCPNoDebuggingSession new.

	^answer
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
finish

	^self class noDebuggerErrorDescriptionFor: 'finish'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
proceed

	^self class noDebuggerErrorDescriptionFor: 'proceed'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
restart

	^self class noDebuggerErrorDescriptionFor: 'restart'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
stepInto

	^self class noDebuggerErrorDescriptionFor: 'stepInto'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
stepOver

	^self class noDebuggerErrorDescriptionFor: 'stepOver'
! !

!MCPNoDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
through

	^self class noDebuggerErrorDescriptionFor: 'through'
! !

!MCPNoDebuggingSession class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
noDebuggerErrorDescriptionFor: anActionName

	^'Error: no debugger to ', anActionName
! !

!MCPOpenDebuggingSession methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 2:13:21 pm (UTC)'!
initializeDebugger: aDebugger

	debugger := aDebugger
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 28/Aug/2026, 7:10:24 pm (UTC)'!
closeDebuggerWindow

	"Deleting the window is what tells the debugger its window is closing, which is what
	terminates the process it was debugging."

	DebuggerWindow
		debuggerWindowsSatisfying: [ :aDebugger | aDebugger == debugger ]
		do: [ :aDebuggerWindow | aDebuggerWindow delete ]! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 28/Aug/2026, 7:10:33 pm (UTC)'!
finish

	"Close the window my debugger is the model of, in the process that draws morphs. Taking a
	morph out of the world is that process's work: the taskbar takes the button of a window
	away as the window leaves the world, and doing that from here races with what it is drawing
	and leaves the button behind with nothing to show. Waiting for it is also what a window that
	is not up yet needs, because it is added to the world when that process gets to it."

	UISupervisor waitToDone: [ self closeDebuggerWindow ].

	^'Finished'! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:32:13 pm (UTC)'!
proceed

	debugger proceed.

	^'Proceeded'
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
restart

	debugger restart.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
stepInto

	debugger send.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 24/Aug/2026, 3:32:11 pm (UTC)'!
stepOver

	debugger doStep.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
through

	debugger stepIntoBlock.

	^self topOfStackDescription
! !

!MCPOpenDebuggingSession methodsFor: 'debugging' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
topOfStackDescription

	^debugger contextStackList first printString
! !

!MCPOpenDebuggingSession class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 11:07:04 am (UTC)'!
debuggerLabel

	^'Debugged Debugger'
! !

!MCPOpenDebuggingSession class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 2:13:21 pm (UTC)'!
debugging: aProcess at: aSignalerContext

	| debugger |

	debugger := Debugger new process: aProcess context: aSignalerContext.
	debugger openFullMorphicLabel: self debuggerLabel.

	^self new initializeDebugger: debugger
! !

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

!MCPHttpSession class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 10:55:26 pm (UTC)'!
identifiedAs: anIdentifier writingTo: aStream

	^self new initializeIdentifiedAs: anIdentifier writingTo: aStream! !

!MCPRefactoringApplier methodsFor: 'initialization' stamp: 'HAW 2/Sep/2026, 11:02:26 pm (UTC)'!
initializeApplying: aRefactoring changing: aMethod

	refactoring := aRefactoring.
	method := aMethod! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyCompilingNewSource

	"A refactoring such as RenameTemporary answers the new source of the method instead of
	installing it, and it is its applier that compiles it. The method keeps the category it
	is already in."

	| refactoredClass |

	refactoredClass := method methodClass.
	refactoredClass
		compile: refactoring apply
		classified: (refactoredClass organization categoryOfElement: method selector).

	^self descriptionOfNewSource! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingChangedClass

	"A refactoring that changes one class answers that class and not a collection of them, so
	the one class it answers is described as the only one that changed."

	^self descriptionOfChangedClasses: (Array with: refactoring apply)! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingChangedClasses

	^self descriptionOfChangedClasses: refactoring apply! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingChanges

	^self descriptionOfChanges: refactoring apply! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingNewClass

	"A refactoring that makes a class answers it. Answer its definition, which says everything
	a client would ask the class about."

	^'Refactoring applied. Class created:' , String newLineString , String newLineString ,
		refactoring apply definition! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingNewSource

	"A refactoring that changes one method compiles it itself, so what it answers says nothing
	a client needs and the source that was saved is what is described."

	refactoring apply.

	^self descriptionOfNewSource! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingRemovedClasses

	"A refactoring that takes a class away answers the names of the ones it removed, which are
	all that is left of them."

	| removedClassNames |

	removedClassNames := refactoring apply.

	^String streamContents: [ :aStream |
		aStream
			nextPutAll: 'Refactoring applied. ';
			print: removedClassNames size;
			space;
			nextPutAll: ('class' pluralize: removedClassNames size ~= 1);
			space;
			nextPutAll: 'removed:';
			space;
			nextPutAll: (', ' join: removedClassNames asSortedCollection) ]! !

!MCPRefactoringApplier methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 11:02:40 pm (UTC)'!
applyReportingRemovedVariables

	"A refactoring that removes the variables it finds answers their names, which are the only
	way to know which ones it took."

	| removedVariableNames |

	removedVariableNames := refactoring apply.

	removedVariableNames ifEmpty: [ ^'Refactoring applied. No instance variable removed' ].

	^String streamContents: [ :aStream |
		aStream
			nextPutAll: 'Refactoring applied. ';
			print: removedVariableNames size;
			space;
			nextPutAll: ('instance variable' pluralize: removedVariableNames size ~= 1);
			space;
			nextPutAll: 'removed:';
			space;
			nextPutAll: (', ' join: removedVariableNames asSortedCollection) ]! !

!MCPRefactoringApplier methodsFor: 'describing' stamp: 'HAW 2/Sep/2026, 11:02:53 pm (UTC)'!
description: someMethods asHavingBeen: aChange

	^String streamContents: [ :aStream |
		aStream
			print: someMethods size;
			space;
			nextPutAll: ('method' pluralize: someMethods size ~= 1);
			space;
			nextPutAll: aChange;
			nextPut: $:.
		(someMethods collect: [ :eachMethod | eachMethod classAndSelector ]) asSortedCollection
			do: [ :eachName | aStream newLine; nextPutAll: eachName ] ]! !

!MCPRefactoringApplier methodsFor: 'describing' stamp: 'HAW 2/Sep/2026, 11:02:53 pm (UTC)'!
descriptionOfChangedClasses: someClasses

	"Answer the definition of each class that changed, which says where the variable is now
	and what else the class holds."

	^String streamContents: [ :aStream |
		aStream
			nextPutAll: 'Refactoring applied. ';
			print: someClasses size;
			space;
			nextPutAll: ('class' pluralize: someClasses size ~= 1);
			space;
			nextPutAll: 'changed:'.
		(someClasses asSortedCollection: [ :aClass :anotherClass | aClass name <= anotherClass name ])
			do: [ :eachClass | aStream newLine; newLine; nextPutAll: eachClass definition ] ]! !

!MCPRefactoringApplier methodsFor: 'describing' stamp: 'HAW 3/Sep/2026, 4:34:32 pm (UTC)'!
descriptionOfChanges: someMethods

	"A refactoring that takes a method away names it among its changes just as it names the
	ones it wrote, and the one that is gone is the one that is no longer implemented."

	| changedMethods removedMethods sections |

	changedMethods := someMethods select: [ :eachMethod | eachMethod isValid ].
	removedMethods := someMethods reject: [ :eachMethod | eachMethod isValid ].

	sections := OrderedCollection new.
	changedMethods ifNotEmpty: [ sections add: (self description: changedMethods asHavingBeen: 'changed') ].
	removedMethods ifNotEmpty: [ sections add: (self description: removedMethods asHavingBeen: 'removed') ].

	sections ifEmpty: [ ^'Refactoring applied. No method changed' ].

	^'Refactoring applied. ' , (String newLineString join: sections)! !

!MCPRefactoringApplier methodsFor: 'describing' stamp: 'HAW 2/Sep/2026, 11:02:53 pm (UTC)'!
descriptionOfNewSource

	"The source is read from the system and not from what the refactoring answered, so a client
	sees the source that was really saved."

	| refactoredMethod |

	refactoredMethod := method methodClass >> method selector.

	^String streamContents: [ :aStream |
		aStream nextPutAll: 'Refactoring applied. '.
		refactoredMethod printClassAndSelectorOn: aStream.
		aStream
			nextPutAll: ' is now:';
			newLine;
			newLine;
			nextPutAll: refactoredMethod sourceCode ]! !

!MCPRefactoringApplier class methodsFor: 'instance creation' stamp: 'HAW 3/Sep/2026, 8:15:52 pm (UTC)'!
applying: aRefactoring

	^self applying: aRefactoring changing: (MethodReference class: self selector: #notExisting) ! !

!MCPRefactoringApplier class methodsFor: 'instance creation' stamp: 'HAW 2/Sep/2026, 11:02:26 pm (UTC)'!
applying: aRefactoring changing: aMethod

	^self new initializeApplying: aRefactoring changing: aMethod! !

!MCPServer methodsFor: 'initialization' stamp: 'HAW 27/Aug/2026, 9:44:59 pm (UTC)'!
initializeServingOver: aTransport smalltalk: aSmalltalk

	transport := aTransport.
	smalltalk := aSmalltalk.
	running := false.
	calledTools := Bag new.
	
	self 
		initializeTools;
		doNotLogMessages
! !

!MCPServer methodsFor: 'initialization' stamp: 'HAW 28/Aug/2026, 12:36:49 am (UTC)'!
initializeTools

	tools := Dictionary new.
	self
		addProvidedTools;
		decorateTools

! !

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

!MCPServer methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 3:52:53 pm (UTC)'!
run

	"Serve MCP requests over my transport until stopped. Whether this blocks the calling
	process is up to the transport."

	running := true.
	transport serveRequestsFor: self! !

!MCPServer methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 6:05:46 pm (UTC)'!
stop

	running := false.
	transport stopServingRequests! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 9:05:34 pm (UTC)'!
dispatch: aMethod with: aParams ifNone: aNoneBlock

	aMethod = 'initialize' ifTrue: [ ^ self handleInitialize: aParams ].
	aMethod = 'tools/list' ifTrue: [ ^ self handleToolsList: aParams ].
	aMethod = 'tools/call' ifTrue: [ ^ self handleToolsCall: aParams ].
	aMethod = 'ping' ifTrue: [ ^ Dictionary new ].
	
	^aNoneBlock value! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 9:09:59 pm (UTC)'!
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
handleNotification: aMethod with: aParams
	
	"Right now it does nothing. Change to support  cancellation - Hernan"
	
	aMethod = 'notifications/initialized' ifTrue: [ ^ nil ].
	aMethod = 'notifications/cancelled' ifTrue: [ ^ nil ].
	
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

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:12:43 pm (UTC)'!
jsonResponseTo: aJsonString

	| request |

	request := [ Json readFrom: aJsonString readStream ]
		on: Error
		do: [ :aParseError | ^self jsonParseError ].

	^(self responseTo: request) ifNotNil: [ :response | Json render: response ]! !

!MCPServer methodsFor: 'request handling' stamp: 'HAW 19/Aug/2026, 10:13:30 pm (UTC)'!
responseTo: aRequest

	| receivedTime response |

	receivedTime := self logReceived: aRequest.
	response := self handleRequest: aRequest.
	response ifNotNil: [ :anAnswer |
		self logAnswered: anAnswer receivedAt: receivedTime ].

	^response! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:08:53 pm (UTC)'!
errorFor: aCode with: aMessage

	^OrderedDictionary new
		at: 'code' put: aCode;
		at: 'message' put: aMessage;
		yourself! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:12:07 pm (UTC)'!
errorResponseFor: anId code: aCode message: aMessage
	
	^ (self responseFor: anId)
		at: 'error' put: (self errorFor: aCode with: aMessage);
		yourself.! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
internalErrorResponseFor: anId withError: anError

	^ self errorResponseFor: anId code: -32603 message: anError printString! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 24/Aug/2026, 12:07:52 pm (UTC)'!
jsonInternalErrorWith: anError

	^Json render: (self errorResponseFor: nil code: -32603 message: anError description)! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 24/Aug/2026, 1:50:33 pm (UTC)'!
jsonParseError

	^Json render: (self errorResponseFor: nil code: -32700 message: self class parseErrorDescription)! !

!MCPServer methodsFor: 'responses - error' stamp: 'HAW 19/Aug/2026, 9:09:32 pm (UTC)'!
methodNotFoundResponseFor: anId on: aMethod

	^ self errorResponseFor: anId code: -32601 message: 'Unknown method: ' , aMethod! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 20/Aug/2026, 2:40:05 pm (UTC)'!
responseFor: anId

	^ OrderedDictionary new
		at: 'jsonrpc' put: '2.0';
		at: 'id' put: anId;
		yourself! !

!MCPServer methodsFor: 'responses' stamp: 'HAW 19/Aug/2026, 9:11:35 pm (UTC)'!
successResponseFor: anId result: aResult
	
	^ (self responseFor: anId)
		at: 'result' put: aResult;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:17:21 pm (UTC)'!
capabilities

	^ OrderedDictionary new
		at: 'tools' put: Dictionary new;
		yourself
					
					! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 24/Aug/2026, 12:02:27 pm (UTC)'!
contentFor: resultText

	^ Dictionary new
		at: 'type' put: 'text';
		at: 'text' put: resultText;
		yourself! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:17:39 pm (UTC)'!
handleInitialize: aParams
	
	^ OrderedDictionary new
		at: 'protocolVersion' put: '2024-11-05';
		at: 'capabilities' put: self capabilities;
		at: 'serverInfo' put: self serverInfo;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:19:59 pm (UTC)'!
handleToolsCall: aParams

	| name arguments resultText |

	name := aParams at: 'name' ifAbsent: [ '' ].
	arguments := aParams at: 'arguments' ifAbsent: [ Dictionary new ].
	resultText := self executeTool: name arguments: arguments.
	
	^ Dictionary new
		at: 'content' put: { self contentFor: resultText };
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:20:20 pm (UTC)'!
handleToolsList: params

	^ OrderedDictionary new
		at: 'tools' put: self toolDefinitions;
		yourself.! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 19/Aug/2026, 9:17:52 pm (UTC)'!
serverInfo
	
	^OrderedDictionary new
		at: 'name' put: 'cuis-smalltalk';
		at: 'version' put: '1.0.0';
		yourself! !

!MCPServer methodsFor: 'MCP handlers' stamp: 'HAW 24/Aug/2026, 11:46:29 am (UTC)'!
toolDefinitions

	^tools values collect: [ :eachTool | eachTool definition ]
! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 27/Aug/2026, 9:45:29 pm (UTC)'!
executeTool: aToolName arguments: anArguments

	calledTools add: aToolName.
	
	^(self toolNamed: aToolName) valueWithArguments: anArguments

! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 21/Aug/2026, 6:14:03 pm (UTC)'!
signalUnknownTool: aToolName

	self error: (self class unknownToolErrorDescriptionFor: aToolName)
! !

!MCPServer methodsFor: 'tool dispatch' stamp: 'HAW 24/Aug/2026, 11:45:29 am (UTC)'!
toolNamed: aToolName

	^tools at: aToolName ifAbsent: [ self signalUnknownTool: aToolName ]
! !

!MCPServer methodsFor: 'tool installation' stamp: 'HAW 27/Aug/2026, 8:58:38 pm (UTC)'!
addProvidedTools

	"Ask every group of tools there is for the ones it has. A package that has tools has a
	subclass of MCPToolGroup, so a package that is not loaded adds none."

	MCPToolGroup allSubclasses 
		reject: [ :eachToolGroupClass | eachToolGroupClass isAbstract ]
		thenDo: [ :eachToolGroupClass | (eachToolGroupClass for: smalltalk) addToolsTo: self ]

! !

!MCPServer methodsFor: 'tool installation' stamp: 'HAW 24/Aug/2026, 12:58:40 pm (UTC)'!
addTool: aTool

	tools at: aTool name put: aTool
! !

!MCPServer methodsFor: 'tool installation' stamp: 'HAW 27/Aug/2026, 7:45:51 pm (UTC)'!
decorateToolNamed: aToolName with: aDecoratorClass

	"A decorator of a tool that is not there decorates nothing, which is what happens when the
	package that has the tool is not loaded."

	tools at: aToolName ifPresent: [ :aTool |
		tools at: aToolName put: (aDecoratorClass decorating: aTool in: smalltalk) ]

! !

!MCPServer methodsFor: 'tool installation' stamp: 'HAW 27/Aug/2026, 8:58:00 pm (UTC)'!
decorateTools

	"Ask every decorator there is to wrap the tool it decorates, once every tool is in place.
	A package that decorates a tool has a subclass of MCPToolDecorator, so a package that is
	not loaded decorates none."

	MCPToolDecorator allSubclasses 
		reject: [ :eachDecoratorClass | eachDecoratorClass isAbstract ]
		thenDo: [:eachDecoratorClass |
			self 
				decorateToolNamed: eachDecoratorClass decoratedToolName 
				with: eachDecoratorClass ] 
! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
servingOver: aTransport

	"Answer a server that serves over aTransport and saves the image it is itself running in."

	^self servingOver: aTransport smalltalk: Smalltalk
! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
servingOver: aTransport smalltalk: aSmalltalk

	^self new initializeServingOver: aTransport smalltalk: aSmalltalk
! !

!MCPServer class methodsFor: 'instance creation' stamp: ''!
servingOverHttpAtPort: aPortNumber

	"Answer a server that answers the requests posted to the MCP endpoint on aPortNumber,
	authenticating them the way the environment asks for."

	^self servingOverHttpAtPort: aPortNumber authenticatingWith: self httpAuthentication! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 8:07:14 pm (UTC)'!
servingOverHttpAtPort: aPortNumber authenticatingWith: anAuthentication

	^self servingOver: (MCPTransportHttp listeningAtPort: aPortNumber authenticatingWith: anAuthentication)! !

!MCPServer class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
servingOverStandardInputOutput

	"Answer a server that reads its requests from standard input and answers on standard output."

	^self servingOver: MCPTransportText onStandardInputOutput

! !

!MCPServer class methodsFor: 'class initialization' stamp: 'HAW 28/Aug/2026, 6:05:12 pm (UTC)'!
initialize

	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 4:09:27 pm (UTC)'!
classVariableNotFoundErrorDescriptionFor: aVariableName in: aClass

	^'Class variable not found: ', aVariableName, ' in ', aClass name
! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 4:09:26 pm (UTC)'!
instanceVariableNotFoundErrorDescriptionFor: aVariableName in: aClass

	^'Instance variable not found: ', aVariableName, ' in ', aClass name
! !

!MCPServer class methodsFor: 'error descriptions' stamp: ''!
parseErrorDescription

	^'Parse error'! !

!MCPServer class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 6:14:03 pm (UTC)'!
unknownToolErrorDescriptionFor: aToolName

	^'Unknown tool: ', aToolName
! !

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

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:35:32 pm (UTC)'!
httpAuthentication

	"Answer who will decide which requests the endpoint serves, out of the command line the
	image was launched with and the token its environment carries."

	^self
		httpAuthenticationFor: Smalltalk startUpArguments
		token: (OSProcess accessor environmentAt: self httpTokenEnvironmentVariableName)

! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:42:42 pm (UTC)'!
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

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:35:30 pm (UTC)'!
noAuthenticationArgument

	"Answer the command line argument that asks the endpoint to serve every client, whatever
	the environment says."

	^'--noAuthentication'
! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:24:05 pm (UTC)'!
portNumberFrom: portArgument 

	^Integer readFrom: (portArgument allButFirst: self httpPortArgumentPrefix size) readStream! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 24/Aug/2026, 10:42:42 pm (UTC)'!
shouldNot: aToken beAuthenticated: someArguments

	^ aToken isNil or: [ someArguments includes: self noAuthenticationArgument ]! !

!MCPServer class methodsFor: 'command line' stamp: 'HAW 19/Aug/2026, 8:25:49 pm (UTC)'!
standardInputOutputArgument

	"Answer the command line argument that asks for the standard streams transport."

	^'--mcpStdIO'! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 28/Aug/2026, 6:05:27 pm (UTC)'!
shutDown: isQuitting

	"Stop the server the image was started for when the image goes down, so that nothing is
	left holding a socket. Saving the image without quitting is not the image going down: the
	shut down list is processed then too, and starting up afterwards does not start a server
	because the image is not resuming, so stopping it here would leave it stopped."

	isQuitting ifFalse: [ ^self ].

	OnStartupInstance ifNotNil: [ :aServer | aServer stop ].
	OnStartupInstance := nil! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 28/Aug/2026, 6:05:34 pm (UTC)'!
startHttpServer

	"Serve MCP over HTTP. The web server listens in processes of its own, so running the
	server answers as soon as the listener is up. The delay lets the image finish starting."

	| server |

	server := self servingOverHttpAtPort: self httpPortNumberFromArguments.
	[ (Delay forMilliseconds: 500) wait.
	server run ]
		forkAt: Processor userBackgroundPriority named: 'MCP HTTP Server'.

	^server! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 28/Aug/2026, 6:05:39 pm (UTC)'!
startStdIOServer

	"Serve MCP over the standard streams in a background process, so the graphical interface
	initializes normally."

	| server |

	server := self servingOverStandardInputOutput.
	[ (Delay forMilliseconds: 500) wait.
	server run ]
		forkAt: Processor userBackgroundPriority named: 'MCP StdIO Server'.

	^server! !

!MCPServer class methodsFor: 'startup' stamp: 'HAW 28/Aug/2026, 6:05:20 pm (UTC)'!
startUp: isResuming

	"Start the server the image was launched for. A server left running by the previous life
	of the image is stopped first, because its streams and its sockets are gone."

	isResuming ifFalse: [ ^self ].
	OnStartupInstance ifNotNil: [ :aPreviousServer | aPreviousServer stop ].
	self isHttpRequested ifTrue: [ ^OnStartupInstance := self startHttpServer ].
	self isStandardInputOutputRequested ifTrue: [ ^OnStartupInstance := self startStdIOServer ].
	
	"I do not signal an error becuase the image is starting - Hernan"
	Transcript 
		show: 'No MCP Server started. Check image arguments'; 
		newLine! !

!MCPServer class methodsFor: 'constants' stamp: 'HAW 20/Aug/2026, 3:14:08 pm (UTC)'!
classCreationSelectors

	"Answer the messages Class understands to create a subclass."

	^Class organization listAtCategoryNamed: 'subclass creation'! !

!MCPTool methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:50:46 pm (UTC)'!
definition

	^self subclassResponsibility
! !

!MCPTool methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:50:46 pm (UTC)'!
description

	^self subclassResponsibility
! !

!MCPTool methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:50:46 pm (UTC)'!
name

	^self subclassResponsibility
! !

!MCPTool methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:50:46 pm (UTC)'!
valueWithArguments: anArguments

	^self subclassResponsibility

! !

!MCPTool class methodsFor: 'testing' stamp: 'HAW 27/Aug/2026, 10:10:11 pm (UTC)'!
isAbstract

	^self hasSubclasses 
! !

!MCPToolDeclaration methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties

	name := aName.
	description := aDescription.
	properties := aCollectionOfProperties
! !

!MCPToolDeclaration methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
description

	^description
! !

!MCPToolDeclaration methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
name

	^name
! !

!MCPToolDeclaration methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
properties

	^properties
! !

!MCPToolDeclaration methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
definition

	^OrderedDictionary new
		at: 'name' put: name;
		at: 'description' put: description;
		at: 'inputSchema' put: self inputSchema;
		yourself
! !

!MCPToolDeclaration methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
inputSchema

	| schema |

	schema := OrderedDictionary new
		at: 'type' put: 'object';
		at: 'properties' put: self propertiesDefinition;
		yourself.
	self requiredPropertyNames ifNotEmpty: [ :aCollectionOfNames | schema at: 'required' put: aCollectionOfNames ].

	^schema
! !

!MCPToolDeclaration methodsFor: 'tool definition' stamp: 'HAW 21/Aug/2026, 7:30:59 pm (UTC)'!
propertiesDefinition

	^properties 
		inject: OrderedDictionary new
		into: [ :aProperties :aToolProperty  | aToolProperty addTo: aProperties ]! !

!MCPToolDeclaration methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
requiredPropertyNames

	^(properties
		inject: OrderedCollection new
		into: [ :someNames :aToolProperty | aToolProperty addRequiredNamesTo: someNames ]) asArray
! !

!MCPToolDeclaration methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:33:45 am (UTC)'!
valueWithArguments: anArguments

	^self subclassResponsibility
! !

!MCPToolDeclaration methodsFor: 'executing' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
valuesFrom: anArguments

	^properties collect: [ :eachProperty | eachProperty valueFrom: anArguments ]
! !

!MCPToolDeclaration class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
named: aName describedBy: aDescription properties: aCollectionOfProperties

	^self new initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties
! !

!MCPClassDefinitionTool methodsFor: 'executing' stamp: 'HAW 1/Sep/2026, 5:49:21 pm (UTC)'!
requestedClassFrom: anArguments

	^ (self valuesFrom: anArguments) first! !

!MCPClassDefinitionTool methodsFor: 'executing' stamp: 'HAW 1/Sep/2026, 5:49:23 pm (UTC)'!
valueWithArguments: anArguments

	| requestedClass browsedClass |

	requestedClass := self requestedClassFrom: anArguments.
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
assertCreated: aCreatedClass isNamed: aClassName

	"Signal unless evaluating the definition really created the class it names."

	aCreatedClass isBehavior ifFalse: [ self class signalDidNotCreateAClass: aCreatedClass ].
	aCreatedClass name = aClassName
		ifFalse: [ self class signalCreatedAnotherClass: aCreatedClass insteadOf: aClassName ]

! !

!MCPDefineClassTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:48:03 am (UTC)'!
valueWithArguments: anArguments

	| definition expectedClassName createdClass |

	definition := (self valuesFrom: anArguments) first.
	expectedClassName := self class classNameCreatedIn: definition.
	createdClass := Compiler evaluate: definition.
	self assertCreated: createdClass isNamed: expectedClassName.

	^'Class defined successfully'
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
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
classCreationSelectors

	"Answer the messages Class understands to create a subclass."

	^Class organization listAtCategoryNamed: 'subclass creation'
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
classNameCreatedIn: aDefinition

	"Answer the name of the class aDefinition creates, signalling when aDefinition is not a
	single send of one of the class creation messages naming its class with a literal."

	^self classNameIn: (self classCreationMessageIn: aDefinition)
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
classNameIn: aClassCreationMessage

	"Answer the name aClassCreationMessage gives to the class it creates."

	| nameArgument |

	nameArgument := aClassCreationMessage arguments first.
	nameArgument isLiteralNode ifFalse: [ self signalClassNameIsNotALiteral ].

	^nameArgument key
! !

!MCPDefineClassTool class methodsFor: 'class definitions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
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
classNameIsNotALiteralErrorDescription

	^'The name of the class to create has to be a literal symbol'
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName

	^'The class definition created ', aCreatedClass name, ' instead of ', anExpectedClassName
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
didNotCreateAClassErrorDescriptionFor: anObject

	^'The class definition did not create a class, it answered ', anObject printString
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
isNotAClassCreationMessageErrorDescriptionFor: aSelector

	^'The class definition has to send one of the class creation messages, but it sends #', aSelector
! !

!MCPDefineClassTool class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
isNotASingleMessageSendErrorDescription

	^'The class definition has to be a single message send'
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
signalClassNameIsNotALiteral

	self error: self classNameIsNotALiteralErrorDescription
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
signalCreatedAnotherClass: aCreatedClass insteadOf: anExpectedClassName

	self error: (self createdAnotherClassErrorDescriptionFor: aCreatedClass insteadOf: anExpectedClassName)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
signalDidNotCreateAClass: anObject

	self error: (self didNotCreateAClassErrorDescriptionFor: anObject)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
signalIsNotAClassCreationMessage: aSelector

	self error: (self isNotAClassCreationMessageErrorDescriptionFor: aSelector)
! !

!MCPDefineClassTool class methodsFor: 'errors' stamp: 'HAW 24/Aug/2026, 11:47:49 am (UTC)'!
signalIsNotASingleMessageSend

	self error: self isNotASingleMessageSendErrorDescription
! !

!MCPEvaluateToDebugOnErrorTool methodsFor: 'executing' stamp: 'HAW 3/Sep/2026, 10:23:22 pm (UTC)'!
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
			Processor activeProcess suspend ]]
		forkNamed: self class evaluatedCodeProcessName.
	semaphore wait.

	^result printString! !

!MCPEvaluateToDebugOnErrorTool class methodsFor: 'process names' stamp: 'HAW 3/Sep/2026, 10:23:27 pm (UTC)'!
evaluatedCodeProcessName

	"The process the code runs in, which is the one a debugger drives when it fails, so it is
	named to be told apart in the process browser from the one answering the request."

	^'MCP evaluating to debug on error'! !

!MCPPluggableTool methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties executingWith: aBlock

	self initializeNamed: aName describedBy: aDescription properties: aCollectionOfProperties.
	executeBlock := aBlock
! !

!MCPPluggableTool methodsFor: 'executing' stamp: 'HAW 24/Aug/2026, 11:33:45 am (UTC)'!
valueWithArguments: anArguments

	^executeBlock valueWithArguments: (self valuesFrom: anArguments)
! !

!MCPPluggableTool class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 7:18:19 pm (UTC)'!
named: aName describedBy: aDescription properties: aCollectionOfProperties executingWith: aBlock

	^self new
		initializeNamed: aName
		describedBy: aDescription
		properties: aCollectionOfProperties
		executingWith: aBlock
! !

!MCPToolDecorator methodsFor: 'initialization' stamp: 'HAW 27/Aug/2026, 10:15:22 pm (UTC)'!
initializeDecorating: aTool in: aSmalltalk

	decoratee := aTool.
	smalltalk := aSmalltalk
! !

!MCPToolDecorator methodsFor: 'decorating' stamp: 'HAW 27/Aug/2026, 10:15:30 pm (UTC)'!
decoratee

	^decoratee
! !

!MCPToolDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
addedProperties

	"The properties I add to the ones the tool I decorate already takes. A decorator that needs
	nothing of its own adds none."

	^#()
! !

!MCPToolDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 10:15:22 pm (UTC)'!
decorateeAnswerFor: anArguments

	^ Json readFrom: (decoratee valueWithArguments: anArguments) readStream! !

!MCPToolDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:39:14 pm (UTC)'!
definition

	"What I show a client is what the tool I decorate shows, with what I add to it: the
	properties of my own, and my description, which is the only place a client is told that
	the tool answers more than the one I decorate would."

	| definition properties |

	definition := decoratee definition.
	definition at: 'description' put: self description.
	properties := (definition at: 'inputSchema') at: 'properties'.
	self addedProperties do: [ :eachProperty | eachProperty addTo: properties ].

	^definition! !

!MCPToolDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 10:15:22 pm (UTC)'!
description

	^decoratee description
! !

!MCPToolDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 10:15:22 pm (UTC)'!
name

	^decoratee name
! !

!MCPToolDecorator class methodsFor: 'instance creation' stamp: 'HAW 27/Aug/2026, 7:45:50 pm (UTC)'!
decorating: aTool in: aSmalltalk

	^self new initializeDecorating: aTool in: aSmalltalk
! !

!MCPToolDecorator class methodsFor: 'decorating' stamp: 'HAW 27/Aug/2026, 7:07:12 pm (UTC)'!
decoratedToolName

	^self subclassResponsibility
! !

!MCPToolGroup methodsFor: 'initialization' stamp: 'HAW 25/Aug/2026, 10:50:45 am (UTC)'!
initializeFor: aSmalltalk

	smalltalk := aSmalltalk! !

!MCPToolGroup methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 10:50:45 am (UTC)'!
addToolsTo: anMCPServer

	^self subclassResponsibility! !

!MCPToolGroup methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:53:57 pm (UTC)'!
namesFrom: aCommaSeparatedText

	^self class namesFrom: aCommaSeparatedText! !

!MCPToolGroup class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:50:45 am (UTC)'!
for: aSmalltalk

	"Answer a provider of tools for aSmalltalk, which is the image its tools work on."

	^self new initializeFor: aSmalltalk! !

!MCPToolGroup class methodsFor: 'testing' stamp: 'HAW 27/Aug/2026, 10:10:27 pm (UTC)'!
isAbstract

	^self hasSubclasses 
! !

!MCPToolGroup class methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:53:57 pm (UTC)'!
namesFrom: aCommaSeparatedText

	"Answer the names a client sent as one text, which is how a list reaches a tool."

	^(aCommaSeparatedText findTokens: $,) collect: [ :eachName | eachName withBlanksTrimmed ]! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
debuggerProceedTool

	^MCPPluggableTool
		named: self class debuggerProceedToolName
		describedBy: 'It does a proceed on the debugger, that means running the debugging procees to the end'
		properties: #()
		executingWith: [ MCPDebuggingSession current proceed ]
! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
debuggerRestartTool

	^MCPPluggableTool
		named: self class debuggerRestartToolName
		describedBy: 'It does a restart on the debugger, that means restarting the current execution context, that is thisContext'
		properties: #()
		executingWith: [ MCPDebuggingSession current restart ]
! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
debuggerStepIntoTool

	^MCPPluggableTool
		named: self class debuggerStepIntoToolName
		describedBy: 'It does a step into on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack'
		properties: #()
		executingWith: [ MCPDebuggingSession current stepInto ]
! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
debuggerStepOverTool

	^MCPPluggableTool
		named: self class debuggerStepOverToolName
		describedBy: 'It does a step over on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack'
		properties: #()
		executingWith: [ MCPDebuggingSession current stepOver ]
! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
debuggerThroughTool

	^MCPPluggableTool
		named: self class debuggerThroughToolName
		describedBy: 'It does a thought on the debugger created by smalltalk_evaluate_to_debug_on_error. Doing a through means going inside of the next block closure. If the next instruction is not a block closure it is the same as doind a step over. Returns the print string of the top of the stack'
		properties: #()
		executingWith: [ MCPDebuggingSession current through ]
! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
evaluateToDebugOnErrorTool

	^MCPEvaluateToDebugOnErrorTool
		named: self class evaluateToDebugOnErrorToolName
		describedBy: 'Evaluate arbitrary Smalltalk code, return the result if no error, return the string ''Error: '' with the exception description and install a debugger to debug the error using the tools smalltalk_debugger_stepinto, smalltalk_debugger_stepover, smalltalk_debugger_through, smalltalk_debugger_proceed, smalltalk_debugger_restart, smalltalk_finish_debugging.'
		properties: { MCPPlainToolProperty named: 'code' describedBy: 'Smalltalk code to evaluate' }

! !

!MCPDebugTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:24 pm (UTC)'!
finishDebuggingTool

	^MCPPluggableTool
		named: self class finishDebuggingToolName
		describedBy: 'It clean ups all the debugging session. It should always be sent when no more debugging is needed'
		properties: #()
		executingWith: [ MCPDebuggingSession finishCurrent ]
! !

!MCPDebugTools methodsFor: 'tools' stamp: 'HAW 26/Aug/2026, 11:02:00 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self evaluateToDebugOnErrorTool;
		addTool: self debuggerStepIntoTool;
		addTool: self debuggerStepOverTool;
		addTool: self debuggerThroughTool;
		addTool: self debuggerProceedTool;
		addTool: self debuggerRestartTool;
		addTool: self finishDebuggingTool
! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
debuggerProceedToolName

	^'smalltalk_debugger_proceed'! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
debuggerRestartToolName

	^'smalltalk_debugger_restart'! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
debuggerStepIntoToolName

	^'smalltalk_debugger_stepinto'! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
debuggerStepOverToolName

	^'smalltalk_debugger_stepover'! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
debuggerThroughToolName

	^'smalltalk_debugger_through'! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:25:53 pm (UTC)'!
evaluateToDebugOnErrorToolName

	^'smalltalk_evaluate_to_debug_on_error'! !

!MCPDebugTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
finishDebuggingToolName

	^'smalltalk_finish_debugging'! !

!MCPImageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
evaluateTool

	^MCPPluggableTool
		named: self class evaluateToolName
		describedBy: 'Evaluate arbitrary Smalltalk code and return the result.'
		properties: { MCPPlainToolProperty named: 'code' describedBy: 'Smalltalk code to evaluate' }
		executingWith: [ :aCode | (Compiler evaluate: aCode) printString ]
! !

!MCPImageTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 10:23:09 pm (UTC)'!
saveImageTool

	^MCPPluggableTool
		named: self class saveImageToolName
		describedBy: 'Save the Smalltalk image to disk.'
		properties: #()
		executingWith: [
			[ smalltalk saveImage ] forkNamed: self class saveImageProcessName.
			(Delay forSeconds: 1) wait.
			'Image saved: ', smalltalk imageName ]! !

!MCPImageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
screenshotTool

	^MCPPluggableTool
		named: self class screenshotToolName
		describedBy: 'Write what the image looks like right now to a JPEG file and answer the name of the file, so that a change to something on screen can be looked at instead of guessed at.'
		properties: { MCPPlainToolProperty named: 'fileName' describedBy: 'Absolute path of the JPEG file to write' }
		executingWith: [ :aFileName | self writeScreenshotTo: aFileName ]
! !

!MCPImageTools methodsFor: 'tool creation' stamp: 'HAW 28/Aug/2026, 6:57:02 pm (UTC)'!
writeScreenshotTo: aFileName

	"The world is drawn by the process that draws morphs, so the picture is taken there, and
	this answers once the file has been written. Asking for the world that is running answers
	one only from that process, which is the one the picture has to be taken from."

	UISupervisor waitToDone: [
		(self runningWorld imageForm: 32) writeJPEGfileNamed: aFileName ].

	^aFileName! !

!MCPImageTools methodsFor: 'tools' stamp: 'HAW 28/Aug/2026, 12:36:49 am (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self evaluateTool;
		addTool: self screenshotTool;
		addTool: self saveImageTool
! !

!MCPImageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
evaluateToolName

	^'smalltalk_evaluate'! !

!MCPImageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
saveImageToolName

	^'smalltalk_save_image'! !

!MCPImageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
screenshotToolName

	^'smalltalk_screenshot'! !

!MCPImageTools class methodsFor: 'process names' stamp: 'HAW 3/Sep/2026, 10:23:14 pm (UTC)'!
saveImageProcessName

	^'MCP saving the image'! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
classDefinitionTool

	^MCPClassDefinitionTool
		named: self class classDefinitionToolName
		describedBy: 'Read the definition of a class: its superclass, its instance and class variables, its selectors and its comment.'
		properties: { MCPClassToolProperty default }! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
classOrganizationTool

	^MCPPluggableTool
		named: self class classOrganizationToolName
		describedBy: 'List the method categories of a class, each with the selectors filed under it, in the order the class holds them. Name the class side the way it prints, as in MCPServer class.'
		properties: { MCPClassToolProperty default }
		executingWith: [ :aClass | Json render: (self organizationOf: aClass) ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
classesInCategoryTool

	^MCPPluggableTool
		named: self class classesInCategoryToolName
		describedBy: 'List all classes in a specific category.'
		properties: { MCPPlainToolProperty named: 'category' describedBy: 'Name of the category' }
		executingWith: [ :aCategory |
			Json render: ((SystemOrganization classesAt: aCategory) collect: [ :aClass | aClass name ]) asArray sorted ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
classifyMethodsTool

	^MCPPluggableTool
		named: self class classifyMethodsToolName
		describedBy: 'File methods of a class under a method category, making the category when the class does not have it yet and taking away the ones they left behind when nothing else is filed under them. Answers where each method was filed before, which is what nothing says once it has moved.'
		properties: {
			MCPClassToolProperty default.
			MCPPlainToolProperty named: 'selectors' describedBy: 'Selectors of the methods to file, separated by commas'.
			MCPPlainToolProperty named: 'category' describedBy: 'Name of the method category to file them under' }
		executingWith: [ :aClass :someSelectors :aMethodCategory |
			self classify: someSelectors of: aClass under: aMethodCategory ]! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
defineClassTool

	"The definition a request carries is parsed and judged before it is evaluated, which is more
	than a block should hold, so this tool is a class of its own."

	^MCPDefineClassTool
		named: self class defineClassToolName
		describedBy: 'Define a new class or modify an existing class definition.'
		properties: { MCPPlainToolProperty named: 'definition' describedBy: 'Full class definition expression' }
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
defineMethodTool

	^MCPPluggableTool
		named: self class defineMethodToolName
		describedBy: 'Define or modify a method on a class.'
		properties: {
			MCPClassToolProperty default.
			MCPPlainToolProperty named: 'source' describedBy: 'Full method source including selector'.
			MCPPlainToolProperty
				named: 'category'
				describedBy: 'Optional method category. Defaults to as yet unclassified'
				defaultingTo: ClassOrganizer defaultMethodCategory }
		executingWith: [ :aClass :aSource :aMethodCategory |
			aClass compile: aSource classified: aMethodCategory.
			'Method defined successfully' ]! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
deleteClassTool

	^MCPPluggableTool
		named: self class deleteClassToolName
		describedBy: 'Remove a class from the system.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class to remove' }
		executingWith: [ :aClass |
			aClass removeFromSystem.
			'Class deleted successfully' ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
deleteMethodTool

	^MCPPluggableTool
		named: self class deleteMethodToolName
		describedBy: 'Remove a method from a class.'
		properties: { MCPMethodProperty selectorDescribedBy: 'Selector of the method to remove' }
		executingWith: [ :aMethod |
			aMethod methodClass removeSelector: aMethod selector.
			'Method deleted successfully' ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
hierarchyTool

	^MCPPluggableTool
		named: self class hierarchyToolName
		describedBy: 'Get the inheritance hierarchy for a class (from Object down to the class).'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			Json render: (aClass withAllSuperclasses collect: [ :eachClass | eachClass name ]) asArray ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
listCategoriesTool

	^MCPPluggableTool
		named: self class listCategoriesToolName
		describedBy: 'List all system categories.'
		properties: #()
		executingWith: [ Json render: SystemOrganization categories asArray sorted ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
listClassesTool

	^MCPPluggableTool
		named: self class listClassesToolName
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

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
methodSourceTool

	^MCPPluggableTool
		named: self class methodSourceToolName
		describedBy: 'Get the source code of a specific method, as the source field of the answer.'
		properties: { MCPMethodProperty default }
		executingWith: [ :aMethod |
			Json render: (OrderedDictionary new at: 'source' put: aMethod sourceCode; yourself) ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
methodSourcesInCategoryTool

	^MCPPluggableTool
		named: self class methodSourcesInCategoryToolName
		describedBy: 'Read the source of every method a class files under one of its method categories, each under its selector, so that what a category says is read at once instead of a method at a time. Name the class side the way it prints, as in MCPServer class.'
		properties: {
			MCPClassToolProperty default.
			MCPPlainToolProperty named: 'category' describedBy: 'Name of the method category' }
		executingWith: [ :aClass :aMethodCategory |
			Json render: (self sourcesIn: aMethodCategory of: aClass) ]! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
methodSourcesOfClassTool

	^MCPPluggableTool
		named: self class methodSourcesOfClassToolName
		describedBy: 'Read the source of every method of a class, each under its selector and grouped by the method category it is filed under, in the order the class holds its categories, so that a whole class is read at once. A category holding no method is left out. Name the class side the way it prints, as in MCPServer class.'
		properties: { MCPClassToolProperty default }
		executingWith: [ :aClass | Json render: (self sourcesOf: aClass) ]! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
methodsInCategoryTool

	^MCPPluggableTool
		named: self class methodsInCategoryToolName
		describedBy: 'List the selectors a class files under one of its method categories. Name the class side the way it prints, as in MCPServer class.'
		properties: {
			MCPClassToolProperty default.
			MCPPlainToolProperty named: 'category' describedBy: 'Name of the method category' }
		executingWith: [ :aClass :aMethodCategory |
			Json render: (self selectorsIn: aMethodCategory of: aClass) ]
! !

!MCPModelStructureTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:34 pm (UTC)'!
subclassesTool

	^MCPPluggableTool
		named: self class subclassesToolName
		describedBy: 'Get the direct subclasses of a class.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			Json render: (aClass subclasses collect: [ :eachClass | eachClass name ]) asArray sorted ]

! !

!MCPModelStructureTools methodsFor: 'tools' stamp: 'HAW 2/Sep/2026, 4:47:13 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self classDefinitionTool;
		addTool: self classOrganizationTool;
		addTool: self methodsInCategoryTool;
		addTool: self methodSourceTool;
		addTool: self methodSourcesInCategoryTool;
		addTool: self methodSourcesOfClassTool;
		addTool: self listClassesTool;
		addTool: self hierarchyTool;
		addTool: self subclassesTool;
		addTool: self listCategoriesTool;
		addTool: self classesInCategoryTool;
		addTool: self defineClassTool;
		addTool: self defineMethodTool;
		addTool: self classifyMethodsTool;
		addTool: self deleteClassTool;
		addTool: self deleteMethodTool! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 28/Aug/2026, 7:48:59 pm (UTC)'!
classify: someSelectors of: aClass under: aMethodCategory

	"Answer where each method was filed before, which is the one thing that is gone once it has
	moved, along with the categories left with nothing under them, which are taken away because
	an empty method category says nothing and is what a class fills up with when methods are
	moved about."

	| classified previousCategories classOrganization |

	classified := OrderedCollection new.
	previousCategories := Set new.
	classOrganization := aClass organization.
	(self selectorsFrom: someSelectors implementedBy: aClass) do: [ :eachSelector |
		| previousCategory |
		previousCategory := classOrganization categoryOfElement: eachSelector.
		previousCategories add: previousCategory.
		classOrganization classify: eachSelector under: aMethodCategory.
		classified add: (OrderedDictionary new
			at: 'method' put: (aClass >> eachSelector) classAndSelector;
			at: 'wasUnder' put: previousCategory asString;
			yourself) ].

	^Json render: (OrderedDictionary new
		at: 'category' put: aMethodCategory;
		at: 'classified' put: classified asArray;
		at: 'emptied' put: (self removedEmptyCategoriesOf: previousCategories using: classOrganization);
		yourself)! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 27/Aug/2026, 6:31:34 pm (UTC)'!
organizationOf: aClass

	"Answer each method category with the selectors filed under it, keeping the order the class
	holds them in, which is the order whoever wrote it put them in."

	^aClass organization categories
		inject: OrderedDictionary new
		into: [ :anOrganization :eachMethodCategory |
			anOrganization
				at: eachMethodCategory asString
				put: (aClass organization listAtCategoryNamed: eachMethodCategory) asArray sorted;
				yourself ]
! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 28/Aug/2026, 7:49:31 pm (UTC)'!
removedEmptyCategoriesOf: someMethodCategories using: aClassOrganization

	| emptyCategories  |
	
	emptyCategories := someMethodCategories select: [ :aCategory | (aClassOrganization listAtCategoryNamed: aCategory) isEmpty ].
	emptyCategories do: [ :aCategory | aClassOrganization removeCategory: aCategory ].
	
	^(emptyCategories collect: [ :aCategory | aCategory asString ]) asArray sort! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 28/Aug/2026, 3:41:32 pm (UTC)'!
selectorsFrom: someSelectors implementedBy: aClass

	"A selector the class does not implement is a mistake worth telling a client about, and not
	a method to leave where it is without saying so."

	^(self namesFrom: someSelectors) collect: [ :eachName |
		| selector |
		selector := eachName asSymbol.
		(aClass includesSelector: selector)
			ifFalse: [ self error: (MCPMethodProperty methodNotFoundErrorDescriptionFor: selector in: aClass) ].
		selector ]! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 27/Aug/2026, 6:31:34 pm (UTC)'!
selectorsIn: aMethodCategory of: aClass

	"A category the class does not have answers no selector, which reads the same as one that
	is there and empty, so it is told apart here."

	(aClass organization categories anySatisfy: [ :eachMethodCategory |
		eachMethodCategory asString = aMethodCategory ])
			ifFalse: [ self error: (self class methodCategoryNotFoundErrorDescriptionFor: aMethodCategory in: aClass) ].

	^(aClass organization listAtCategoryNamed: aMethodCategory) asArray sorted
! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 2/Sep/2026, 4:39:24 pm (UTC)'!
sourcesIn: aMethodCategory of: aClass

	"Answer the source of each method filed under aMethodCategory, under its selector, in the
	order the selectors of that category are listed in."

	| sourcesBySelector |

	sourcesBySelector := OrderedDictionary new.
	(self selectorsIn: aMethodCategory of: aClass) do: [ :eachSelector |
		sourcesBySelector at: eachSelector asString put: (aClass >> eachSelector) sourceCode ].

	^sourcesBySelector! !

!MCPModelStructureTools methodsFor: 'model structure' stamp: 'HAW 2/Sep/2026, 4:48:07 pm (UTC)'!
sourcesOf: aClass

	"Answer the source of every method of aClass under its selector, grouped by the method
	category it is filed under and keeping the order the class holds its categories in, which
	is the order whoever wrote it put them in. A category holding no method is left out: it
	says nothing about the class, and Cuis gives every new one an empty as yet unclassified."

	| sourcesByCategory |

	sourcesByCategory := OrderedDictionary new.
	aClass organization categories do: [ :eachMethodCategory | | sourcesInCategory |
		sourcesInCategory := self sourcesIn: eachMethodCategory asString of: aClass.
		sourcesInCategory ifNotEmpty: [
			sourcesByCategory at: eachMethodCategory asString put: sourcesInCategory ] ].

	^sourcesByCategory! !

!MCPModelStructureTools class methodsFor: 'error descriptions' stamp: 'HAW 27/Aug/2026, 6:31:34 pm (UTC)'!
methodCategoryNotFoundErrorDescriptionFor: aMethodCategory in: aClass

	^'Method category not found: ', aMethodCategory, ' in ', aClass name
! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
classDefinitionToolName

	^'smalltalk_class_definition'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
classOrganizationToolName

	^'smalltalk_class_organization'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
classesInCategoryToolName

	^'smalltalk_classes_in_category'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
classifyMethodsToolName

	^'smalltalk_classify_methods'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
defineClassToolName

	^'smalltalk_define_class'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
defineMethodToolName

	^'smalltalk_define_method'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
deleteClassToolName

	^'smalltalk_delete_class'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
deleteMethodToolName

	^'smalltalk_delete_method'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
hierarchyToolName

	^'smalltalk_hierarchy'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
listCategoriesToolName

	^'smalltalk_list_categories'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
listClassesToolName

	^'smalltalk_list_classes'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
methodSourceToolName

	^'smalltalk_method_source'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 2/Sep/2026, 4:39:12 pm (UTC)'!
methodSourcesInCategoryToolName

	^'smalltalk_method_sources_in_category'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 2/Sep/2026, 4:46:56 pm (UTC)'!
methodSourcesOfClassToolName

	^'smalltalk_method_sources_of_class'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
methodsInCategoryToolName

	^'smalltalk_methods_in_category'! !

!MCPModelStructureTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:05 pm (UTC)'!
subclassesToolName

	^'smalltalk_subclasses'! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:58:35 pm (UTC)'!
changePackageDescriptionTool

	^MCPPluggableTool
		named: self class changePackageDescriptionToolName
		describedBy: 'Change what a package describes itself as, which is the line its file carries as its header. Changing it leaves the package with changes to write out.'
		properties: {
			self packageProperty.
			MCPPlainToolProperty named: 'description' describedBy: 'What the package describes itself as' }
		executingWith: [ :aCodePackage :aDescription |
			aCodePackage description: aDescription.
			Json render: (self summaryOf: aCodePackage) ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:58:55 pm (UTC)'!
changePackageFileNameTool

	^MCPPluggableTool
		named: self class changePackageFileNameToolName
		describedBy: 'Name the file a package is written to, and answer it. A package that was never written, or whose image was moved away from where it was written, does not know one and cannot be saved until it is told.'
		properties: {
			self packageProperty.
			MCPPlainToolProperty named: 'fileName' describedBy: 'Absolute path of the .pck.st file the package is written to' }
		executingWith: [ :aCodePackage :aFileName | self name: aFileName asTheFileOf: aCodePackage ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:58:49 pm (UTC)'!
changePackageRequirementsTool

	^MCPPluggableTool
		named: self class changePackageRequirementsToolName
		describedBy: 'Change the packages a package requires, replacing the ones it required with the ones named, and answer what it requires now. Each requirement asks for any version.'
		properties: {
			self packageProperty.
			MCPPlainToolProperty
				named: 'requiredPackageNames'
				describedBy: 'Names of the packages it requires, separated by commas. An empty text leaves it requiring nothing' }
		executingWith: [ :aCodePackage :someRequiredPackageNames |
			self require: (self namesFrom: someRequiredPackageNames) in: aCodePackage.
			Json render: (self requirementNamesOf: aCodePackage) ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:56:38 pm (UTC)'!
listPackagesTool

	^MCPPluggableTool
		named: self class listPackagesToolName
		describedBy: 'List the code packages installed in the image, each with what it describes itself as and whether it holds changes its file does not have yet, optionally filtered by prefix.'
		properties: {
			MCPPlainToolProperty
				named: 'prefix'
				describedBy: 'Optional prefix to filter package names'
				defaultingTo: '' }
		executingWith: [ :aPrefix |
			Json render: ((self packagesNamedStartingWith: aPrefix)
				collect: [ :eachPackage | self summaryOf: eachPackage ]) ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:56:43 pm (UTC)'!
packageDefinitionTool

	^MCPPluggableTool
		named: self class packageDefinitionToolName
		describedBy: 'Read the definition of a code package: what it describes itself as, the file it is written to, whether the image holds changes that file does not, what it requires, and the system categories and classes it holds.'
		properties: { self packageProperty }
		executingWith: [ :aCodePackage | Json render: (self definitionOf: aCodePackage) ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:38:18 pm (UTC)'!
packageOfClassTool

	^MCPPluggableTool
		named: self class packageOfClassToolName
		describedBy: 'Answer the package a class belongs to, which is the one a change to the class leaves with changes to write out.'
		properties: { MCPClassToolProperty default }
		executingWith: [ :aClass | self nameOfPackageOf: aClass ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
packageOfMethodTool

	^MCPPluggableTool
		named: self class packageOfMethodToolName
		describedBy: 'Answer the package a method belongs to, which is the package of its class unless it is filed under a method category naming another one, as an extension of a package is.'
		properties: { MCPMethodProperty default }
		executingWith: [ :aMethod | self nameOfPackageOfMethod: aMethod ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:58:29 pm (UTC)'!
savePackageTool

	^MCPPluggableTool
		named: self class savePackageToolName
		describedBy: 'Write a package to its file and answer the name of the file it was written to.'
		properties: { self packageProperty }
		executingWith: [ :aCodePackage | self save: aCodePackage ]! !

!MCPPackageTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:56:57 pm (UTC)'!
unsavedPackagesTool

	^MCPPluggableTool
		named: self class unsavedPackagesToolName
		describedBy: 'List the packages that hold changes their file does not have yet, which are the ones a change to the image left to be written out.'
		properties: #()
		executingWith: [
			Json render: (self installedPackages
				select: [ :eachPackage | eachPackage hasUnsavedChanges ]
				thenCollect: [ :eachPackage | eachPackage packageName ]) ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:59:40 pm (UTC)'!
assertDirectoryExistsFor: aFileName

	aFileName asFullFileEntry parent exists
		ifFalse: [ self error: (self class directoryDoesNotExistErrorDescriptionFor: aFileName) ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:59:26 pm (UTC)'!
assertKnowsItsFile: aCodePackage

	(self knowsItsFile: aCodePackage)
		ifFalse: [ self error: (self class doesNotKnowItsFileErrorDescriptionFor: aCodePackage) ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:57:18 pm (UTC)'!
definitionOf: aCodePackage

	"A package that was never written, or whose image was moved, knows no file, which is
	answered as no file name rather than as none of the answer."

	^OrderedDictionary new
		at: 'name' put: aCodePackage packageName;
		at: 'version' put: aCodePackage packageNameAndVersion;
		at: 'description' put: aCodePackage description;
		at: 'fileName' put: (aCodePackage fullFileName ifNil: [ '' ]);
		at: 'hasUnsavedChanges' put: aCodePackage hasUnsavedChanges;
		at: 'requires' put: (self requirementNamesOf: aCodePackage);
		at: 'systemCategories' put: aCodePackage systemCategories asArray sorted;
		at: 'classes' put: aCodePackage classNames asArray sorted;
		at: 'extensionMethodCount' put: aCodePackage extensionMethodCount;
		yourself! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:57:02 pm (UTC)'!
installedPackages

	"Answer every package installed in the image, sorted by name, so that the same request is
	always answered with the same list."

	^(CodePackage installedPackages values asSortedCollection: [ :onePackage :anotherPackage |
		onePackage packageName <= anotherPackage packageName ]) asArray! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:59:21 pm (UTC)'!
knowsItsFile: aCodePackage

	"Answer whether aCodePackage can be written without being asked where, which is what its
	own save looks at: a file it was named with, in a directory that is still there."

	^aCodePackage fullFileName
		ifNil: [ false ]
		ifNotNil: [ :aFileName | aFileName asFullFileEntry parent exists ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:59:35 pm (UTC)'!
name: aFileName asTheFileOf: aCodePackage

	"The directory has to be there before the name is taken: a package named a file in a
	directory that is gone asks on screen where to save itself, which is what naming it avoided."

	self assertDirectoryExistsFor: aFileName.
	aCodePackage fullFileName: aFileName.

	^aFileName! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 2:00:09 pm (UTC)'!
nameOfPackageOf: aClass

	"A class no package holds - one just created, or one of the base image - is said to be in
	none rather than signalled about: being in no package is an answer and not a failure."

	^(CodePackage packageOfClass: aClass ifNone: [ nil ])
		ifNil: [ self class notInAnyPackageDescription ]
		ifNotNil: [ :aCodePackage | aCodePackage packageName ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 2:00:14 pm (UTC)'!
nameOfPackageOfMethod: aMethod

	"A method is looked for by its reference and not by its class, so that a method filed under
	a category naming another package is answered with that one and not with its class's."

	^(CodePackage packageOfMethod: aMethod asMethodReference ifNone: [ nil ])
		ifNil: [ self class notInAnyPackageDescription ]
		ifNotNil: [ :aCodePackage | aCodePackage packageName ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:57:06 pm (UTC)'!
packagesNamedStartingWith: aPrefix

	^self installedPackages select: [ :eachPackage | eachPackage packageName beginsWith: aPrefix ]! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:59:50 pm (UTC)'!
require: someRequiredPackageNames in: aCodePackage

	"Replace what aCodePackage requires. A feature spec is told what it provides and what it
	requires together, so what it already provides is handed back to it untouched, and the
	package is left with changes to write out the way changing its description leaves it."

	| featureSpec |

	featureSpec := aCodePackage featureSpec.
	featureSpec
		provides: featureSpec provides
		requires: (someRequiredPackageNames
			collect: [ :eachName | FeatureRequirement name: eachName asSymbol ]) asSet.
	aCodePackage hasUnsavedChanges: true! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:57:23 pm (UTC)'!
requirementNamesOf: aCodePackage

	"Answer the names of the packages aCodePackage requires. A requirement also holds the
	versions it accepts, and every package of this image accepts any of them, so the name is
	all there is to say."

	^(aCodePackage requires collect: [ :eachRequirement | eachRequirement name asString ]) asArray sorted! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 4/Sep/2026, 11:14:56 am (UTC)'!
save: aCodePackage

	"Asking a package that does not know its file to save itself opens a dialog on screen asking
	where, and that dialog blocks the process that draws the world, so every other piece of work
	waiting on it waits for ever. It must never be reached."

	self assertKnowsItsFile: aCodePackage.
	aCodePackage save.

	^aCodePackage fullFileName! !

!MCPPackageTools methodsFor: 'packages' stamp: 'HAW 1/Sep/2026, 1:57:11 pm (UTC)'!
summaryOf: aCodePackage

	"Answer what is worth knowing about a package without asking for it by name: what it is
	called, what it is for, and whether what the image holds is in its file."

	^OrderedDictionary new
		at: 'name' put: aCodePackage packageName;
		at: 'description' put: aCodePackage description;
		at: 'hasUnsavedChanges' put: aCodePackage hasUnsavedChanges;
		yourself! !

!MCPPackageTools methodsFor: 'arguments' stamp: 'HAW 1/Sep/2026, 1:55:56 pm (UTC)'!
packageProperty

	^MCPCodePackageProperty
		named: 'packageName'
		describedBy: 'Name of the package'! !

!MCPPackageTools methodsFor: 'tools' stamp: 'HAW 1/Sep/2026, 2:00:23 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self listPackagesTool;
		addTool: self packageDefinitionTool;
		addTool: self unsavedPackagesTool;
		addTool: self packageOfClassTool;
		addTool: self packageOfMethodTool;
		addTool: self savePackageTool;
		addTool: self changePackageDescriptionTool;
		addTool: self changePackageRequirementsTool;
		addTool: self changePackageFileNameTool! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:15 pm (UTC)'!
changePackageDescriptionToolName

	^'smalltalk_change_package_description'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:23 pm (UTC)'!
changePackageFileNameToolName

	^'smalltalk_change_package_file_name'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:19 pm (UTC)'!
changePackageRequirementsToolName

	^'smalltalk_change_package_requirements'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:00 pm (UTC)'!
listPackagesToolName

	^'smalltalk_list_packages'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:03 pm (UTC)'!
packageDefinitionToolName

	^'smalltalk_package_definition'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:27 pm (UTC)'!
packageOfClassToolName

	^'smalltalk_package_of_class'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:32 pm (UTC)'!
packageOfMethodToolName

	^'smalltalk_package_of_method'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:11 pm (UTC)'!
savePackageToolName

	^'smalltalk_save_package'! !

!MCPPackageTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:56:07 pm (UTC)'!
unsavedPackagesToolName

	^'smalltalk_unsaved_packages'! !

!MCPPackageTools class methodsFor: 'error descriptions' stamp: 'HAW 1/Sep/2026, 1:59:44 pm (UTC)'!
directoryDoesNotExistErrorDescriptionFor: aFileName

	^'There is no directory to write ', aFileName, ' in'! !

!MCPPackageTools class methodsFor: 'error descriptions' stamp: 'HAW 1/Sep/2026, 1:59:30 pm (UTC)'!
doesNotKnowItsFileErrorDescriptionFor: aCodePackage

	^'The package ', aCodePackage packageName, ' does not know the file to write itself to. Name it with ', self changePackageFileNameToolName, ' first'! !

!MCPPackageTools class methodsFor: 'constants' stamp: 'HAW 1/Sep/2026, 2:00:18 pm (UTC)'!
notInAnyPackageDescription

	^'It is not in any package'! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
apply: aRefactoring reportingNewSourceOf: aMethod

	^(MCPRefactoringApplier applying: aRefactoring changing: aMethod) applyReportingNewSource! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applyReportingChangedClass: aRefactoring

	^(MCPRefactoringApplier applying: aRefactoring) applyReportingChangedClass! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applyReportingChangedClasses: aRefactoring

	^(MCPRefactoringApplier applying: aRefactoring) applyReportingChangedClasses! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applyReportingChanges: aRefactoring

	^(MCPRefactoringApplier applying: aRefactoring) applyReportingChanges! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applyReportingNewClass: aRefactoring

	^(MCPRefactoringApplier applying: aRefactoring) applyReportingNewClass! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applyReportingRemovedClasses: aRefactoring

	^(MCPRefactoringApplier applying: aRefactoring) applyReportingRemovedClasses! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applyReportingRemovedVariables: aRefactoring

	^(MCPRefactoringApplier applying: aRefactoring) applyReportingRemovedVariables! !

!MCPRefactoringToolGroup methodsFor: 'applying' stamp: 'HAW 3/Sep/2026, 7:13:06 pm (UTC)'!
applySourceChanging: aRefactoring to: aMethod

	^(MCPRefactoringApplier applying: aRefactoring changing: aMethod) applyCompilingNewSource! !

!MCPRefactoringToolGroup methodsFor: 'scope' stamp: 'HAW 27/Aug/2026, 1:36:28 pm (UTC)'!
implementors: anImplementorsCollection andSenders: aSendersCollection of: aSelector in: aClassName when: aScopeName

	"Gather the implementors and the senders the scope a client named takes in. The whole
	system takes every send in, so it is the only one that needs no class to look around."

	aScopeName caseOf: {
		[ 'class' ] -> [ ScopedRefactoring
			addImplementorsOf: aSelector
			to: anImplementorsCollection
			andSendersTo: aSendersCollection
			forClassAndMetaOf: (self classNamed: aClassName) ].
		[ 'hierarchy' ] -> [ ScopedRefactoring
			addImplementorsOf: aSelector
			to: anImplementorsCollection
			andSendersTo: aSendersCollection
			inHierarchyOf: (self classNamed: aClassName) ].
		[ 'category' ] -> [ ScopedRefactoring
			addImplementorsOf: aSelector
			to: anImplementorsCollection
			andSendersTo: aSendersCollection
			inCategory: (self classNamed: aClassName) category
			organizedBy: smalltalk organization ].
		[ 'hierarchyAndCategories' ] -> [ ScopedRefactoring
			addImplementorsOf: aSelector
			to: anImplementorsCollection
			andSendersTo: aSendersCollection
			inCategoriesAndHierarchyOf: (self classNamed: aClassName)
			organizedBy: smalltalk organization ].
		[ 'system' ] -> [ ScopedRefactoring
			addImplementorsOf: aSelector
			to: anImplementorsCollection
			andSendersTo: aSendersCollection
			inSystem: smalltalk ] }
		otherwise: [ self error: (self class unknownScopeErrorDescriptionFor: aScopeName) ]
! !

!MCPRefactoringToolGroup methodsFor: 'scope' stamp: 'HAW 27/Aug/2026, 1:36:28 pm (UTC)'!
refactoringOn: aSelector around: aClassName within: aScopeName builtWith: aBlock

	"Answer the refactoring the block builds over the implementors and the senders the scope
	takes in. The senders are gathered as method references, and are handed over as the
	compiled methods they name, because a refactoring asks each of them hasLiteral:, which a
	reference answers about itself rather than about its method."

	| implementors senders |

	implementors := OrderedCollection new.
	senders := OrderedCollection new.
	self
		implementors: implementors
		andSenders: senders
		of: aSelector
		in: aClassName
		when: aScopeName.

	^aBlock value: implementors value: (senders collect: [ :eachSender | eachSender compiledMethod ])

! !

!MCPRefactoringToolGroup methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:50:11 pm (UTC)'!
categoryFor: aCategory of: aClass

	^self class categoryFor: aCategory of: aClass! !

!MCPRefactoringToolGroup methodsFor: 'arguments' stamp: 'HAW 27/Aug/2026, 1:17:47 pm (UTC)'!
classNamed: aClassName

	^aClassName
		ifEmpty: [ self error: self class classNameNeededErrorDescription ]
		ifNotEmpty: [ :aName |
			(smalltalk classNamed: aName)
				ifNil: [ self error: (self class classNotFoundErrorDescriptionFor: aName) ] ]
! !

!MCPRefactoringToolGroup methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:50:11 pm (UTC)'!
positionsIn: aCompiledMethod of: someParameterNames

	^self class positionsIn: aCompiledMethod of: someParameterNames! !

!MCPRefactoringToolGroup methodsFor: 'arguments' stamp: 'HAW 27/Aug/2026, 11:46:05 am (UTC)'!
scopeClassProperty

	^MCPPlainToolProperty
		named: 'className'
		describedBy: 'Name of the class the sends are looked for around, needed by every scope but system'
		defaultingTo: ''

! !

!MCPRefactoringToolGroup methodsFor: 'arguments' stamp: 'HAW 1/Sep/2026, 3:35:57 pm (UTC)'!
scopeProperty

	^MCPPlainToolProperty
		named: self class scopePropertyName
		describedBy: 'Where the sends to change are looked for: class, hierarchy, category, hierarchyAndCategories or system. Every one but system needs className too. category is the whole tree of the root class category, which is what a package usually is, but a class category tree does not always have a package of its own. Defaults to system'
		defaultingTo: 'system'! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 2/Sep/2026, 8:50:46 pm (UTC)'!
firstIntervalIn: aCompiledMethod matching: aText from: aStart to: aStop

	^self class firstIntervalIn: aCompiledMethod matching: aText from: aStart to: aStop! !

!MCPRefactoringToolGroup methodsFor: 'refactoring' stamp: 'HAW 2/Sep/2026, 8:50:11 pm (UTC)'!
intervalIn: aCompiledMethod matching: aText from: aStart to: aStop

	^self class intervalIn: aCompiledMethod matching: aText from: aStart to: aStop! !

!MCPRefactoringToolGroup class methodsFor: 'error descriptions' stamp: 'HAW 27/Aug/2026, 1:17:47 pm (UTC)'!
classNameNeededErrorDescription

	^'Class name needed'
! !

!MCPRefactoringToolGroup class methodsFor: 'error descriptions' stamp: 'HAW 25/Aug/2026, 1:36:51 pm (UTC)'!
classNotFoundErrorDescriptionFor: aClassName

	^'Class not found: ', aClassName
! !

!MCPRefactoringToolGroup class methodsFor: 'error descriptions' stamp: 'HAW 1/Sep/2026, 3:44:28 pm (UTC)'!
textFoundMoreThanOnceErrorDescriptionFor: aText in: aCompiledMethod

	^'Text found more than once in ', aCompiledMethod methodClass name, '>>', aCompiledMethod selector,
		', send the interval instead: ', aText
! !

!MCPRefactoringToolGroup class methodsFor: 'error descriptions' stamp: 'HAW 1/Sep/2026, 3:44:23 pm (UTC)'!
textNotFoundErrorDescriptionFor: aText in: aCompiledMethod

	^'Text not found in ', aCompiledMethod methodClass name, '>>', aCompiledMethod selector, ': ', aText
! !

!MCPRefactoringToolGroup class methodsFor: 'error descriptions' stamp: 'HAW 27/Aug/2026, 11:46:05 am (UTC)'!
unknownScopeErrorDescriptionFor: aScopeName

	^'Unknown scope: ', aScopeName
! !

!MCPRefactoringToolGroup class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 3:35:39 pm (UTC)'!
scopePropertyName

	"The name a client sends the scope under. A package that adds a scope of its own reads it
	from the arguments by this name and not by a text of its own."

	^'scope'! !

!MCPRefactoringToolGroup class methodsFor: 'refactoring' stamp: 'HAW 2/Sep/2026, 8:51:18 pm (UTC)'!
firstIntervalIn: aCompiledMethod matching: aText from: aStart to: aStop

	"Answer the piece of source a refactoring works on: the interval when a client sends one,
	and otherwise where aText is first said in the source of the method. It is answered as a
	SourceCodeInterval because that is what the refactorings ask to trim and to expand."

	| firstOccurrence |

	aStart isEmpty ifFalse: [ ^(aStart asNumber to: aStop asNumber) asSourceCodeInterval ].

	firstOccurrence := aCompiledMethod sourceCode findString: aText startingAt: 1.
	firstOccurrence = 0 ifTrue: [ self error: (self textNotFoundErrorDescriptionFor: aText in: aCompiledMethod) ].

	^(firstOccurrence to: firstOccurrence + aText size - 1) asSourceCodeInterval! !

!MCPRefactoringToolGroup class methodsFor: 'refactoring' stamp: 'HAW 2/Sep/2026, 8:51:26 pm (UTC)'!
intervalIn: aCompiledMethod matching: aText from: aStart to: aStop

	"Answer the piece of source a refactoring works on, refusing a text the method says more
	than once instead of picking one of them. A refactoring that means to work on all of them
	asks for the first one instead."

	| interval |

	interval := self firstIntervalIn: aCompiledMethod matching: aText from: aStart to: aStop.
	(aStart isEmpty
		and: [ (aCompiledMethod sourceCode findString: aText startingAt: interval last + 1) ~= 0 ])
			ifTrue: [ self error: (self textFoundMoreThanOnceErrorDescriptionFor: aText in: aCompiledMethod) ].

	^interval! !

!MCPRefactoringToolGroup class methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:50:11 pm (UTC)'!
categoryFor: aCategory of: aClass

	"Answer the category the new class is made in, which is the one of the class it came from
	unless a client named another."

	^aCategory isEmpty ifTrue: [ aClass category ] ifFalse: [ aCategory ]
! !

!MCPRefactoringToolGroup class methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:50:11 pm (UTC)'!
positionsIn: aCompiledMethod of: someParameterNames

	"Answer where each parameter stands in the message, counting from one. A client names the
	parameters it wants extracted and not where they are, which the method already says."

	^someParameterNames collect: [ :eachName |
		aCompiledMethod methodNode argumentNames indexOf: eachName ]
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 4/Sep/2026, 1:04:04 pm (UTC)'!
assert: someParameters isNamedBy: someAskedNames

	"The new selector needs one keyword for each parameter the extracted code uses, which is
	what the applier checks before it lets the extraction be made."

	someParameters size = someAskedNames size
		ifFalse: [ ExtractMethodNewMethod signalExtractMethodWithWrongNumberOfArgumentsError ]! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 4/Sep/2026, 1:04:02 pm (UTC)'!
extractMethodFrom: aMethodReference at: anInterval named: aNewSelector withArgumentNames: someArgumentNames replacing: aReplacing

	"Extract the code the interval covers into a method of its own, the way the applier does
	once it has been told what to call it: the finder says which pieces the new message
	replaces, each of them is told the message, and the extraction is made of the new method
	and of those pieces.

	The message is named with the parameters the extracted code really uses and not with the
	names a client asked for, because the message is what replaces the code and there it is the
	variables already there that are passed. What the new method calls each of them is said
	apart, in the names it renames them to."

	| trimmedInterval finder replacements parameters newMessage |

	trimmedInterval := anInterval trimToMatchExpressionOn: aMethodReference sourceCode.
	ExtractMethodNewMethod assertCanApplyRefactoringOn: aMethodReference at: trimmedInterval.

	parameters := ExtractMethodParametersDetector
		valueFor: aMethodReference notOptimizedMethodNode
		at: trimmedInterval.
	newMessage := self messageNamed: aNewSelector takingTheNamesOf: parameters.

	finder := ExtractMethodReplacementsFinder ofCodeIn: trimmedInterval at: aMethodReference.
	finder value.
	replacements := self replacementsFoundBy: finder replacing: aReplacing.
	replacements do: [ :eachReplacement | eachReplacement newMessage: newMessage ].

	^self applyReportingChanges: (ExtractMethod
		newDefinition: (ExtractMethodNewMethod
			fromInterval: trimmedInterval
			of: aMethodReference
			to: newMessage
			categorizedAs: aMethodReference category
			withArgumentNames: (self namesRenaming: parameters asAskedIn: someArgumentNames))
		replacements: replacements)! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 26/Aug/2026, 4:31:09 pm (UTC)'!
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

	^self applyReportingChanges: (ExtractMethod
		newDefinition: (self
			newMethodFor: aMessage
			using: finder extractedCodeOrAnyParameterizableReplacement
			notParameterizing: notParameterizable)
		replacements: finder replacements)
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
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

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 4/Sep/2026, 1:04:04 pm (UTC)'!
messageNamed: aNewSelector takingTheNamesOf: someParameters

	^someParameters
		ifEmpty: [ Message selector: aNewSelector asSymbol ]
		ifNotEmpty: [ Message
			selector: aNewSelector asSymbol
			arguments: (someParameters collect: [ :eachParameter | eachParameter name ]) asArray ]! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
messageNamed: aNewSelector withArgumentNames: someArgumentNames

	"Answer the message the extracted code becomes, named the way a client asked for it."

	^someArgumentNames isEmpty
		ifTrue: [ Message selector: aNewSelector asSymbol ]
		ifFalse: [ Message
			selector: aNewSelector asSymbol
			arguments: ((someArgumentNames subStrings: ',') collect: [ :eachName | eachName withBlanksTrimmed ]) asArray ]
! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 12:13:17 pm (UTC)'!
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

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 4/Sep/2026, 1:04:04 pm (UTC)'!
namesRenaming: someParameters asAskedIn: someArgumentNames

	"Answer what the new method calls each parameter a client asked to name differently. One it
	named the way the code already does is left out, because only the differences are renamed."

	| askedNames renamedNames |

	askedNames := self namesFrom: someArgumentNames.
	self assert: someParameters isNamedBy: askedNames.

	renamedNames := Dictionary new.
	someParameters with: askedNames do: [ :eachParameter :eachAskedName |
		eachParameter name = eachAskedName ifFalse: [ renamedNames at: eachParameter name put: eachAskedName ] ].

	^renamedNames! !

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
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

!MCPRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 27/Aug/2026, 1:17:48 pm (UTC)'!
replacementsFoundBy: aFinder replacing: aReplacing

	"Answer the pieces the extraction replaces. The finder looks through the class and all its
	subclasses, so which of them are replaced is what a client says here."

	^aReplacing caseOf: {
		[ 'selection' ] -> [ Array with: aFinder originalSelectionReplacement ].
		[ 'method' ] -> [ aFinder sourceMethodReplacements ].
		[ 'class' ] -> [ aFinder inClassReplacements ].
		[ 'hierarchy' ] -> [ aFinder replacements ] }
		otherwise: [ self error: (self class unknownReplacingErrorDescriptionFor: aReplacing) ]

! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addClassRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self renameClassRefactoringTool;
		addTool: self insertSuperclassRefactoringTool;
		addTool: self safelyRemoveClassRefactoringTool;
		addTool: self renameGlobalRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addExtractionRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self extractAsParameterRefactoringTool;
		addTool: self inlineMethodRefactoringTool;
		addTool: self extractToTemporaryRefactoringTool;
		addTool: self extractMethodRefactoringTool;
		addTool: self extractMethodFromSimilarCodeRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addInstanceVariableRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self addInstanceVariableRefactoringTool;
		addTool: self removeInstanceVariableRefactoringTool;
		addTool: self renameInstanceVariableRefactoringTool;
		addTool: self pushUpInstanceVariableRefactoringTool;
		addTool: self pushDownInstanceVariableRefactoringTool;
		addTool: self removeUnreferencedInstanceVariablesRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addMethodRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self pushUpMethodRefactoringTool;
		addTool: self pushDownMethodToSubclassesRefactoringTool;
		addTool: self pushDownMethodToOneSubclassRefactoringTool;
		addTool: self addAsSubclassResponsibilityRefactoringTool;
		addTool: self moveToInstanceOrClassMethodRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addSelectorRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self renameSelectorRefactoringTool;
		addTool: self changeKeywordsOrderRefactoringTool;
		addTool: self removeParameterRefactoringTool;
		addTool: self addParameterRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addTemporaryRefactoringToolsTo: anMCPServer

	anMCPServer
		addTool: self temporaryToInstanceVariableRefactoringTool;
		addTool: self inlineTemporaryVariableRefactoringTool;
		addTool: self renameTemporaryRefactoringTool! !

!MCPRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:16:21 pm (UTC)'!
addToolsTo: anMCPServer

	self
		addInstanceVariableRefactoringToolsTo: anMCPServer;
		addClassRefactoringToolsTo: anMCPServer;
		addSelectorRefactoringToolsTo: anMCPServer;
		addMethodRefactoringToolsTo: anMCPServer;
		addTemporaryRefactoringToolsTo: anMCPServer;
		addExtractionRefactoringToolsTo: anMCPServer! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
addInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: self class addInstanceVariableRefactoringToolName
		describedBy: 'Add an instance variable to a class.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to add' }
		executingWith: [ :aClass :aVariableName |
			self applyReportingChangedClass: (AddInstanceVariable named: aVariableName to: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
pushDownInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: self class pushDownInstanceVariableRefactoringToolName
		describedBy: 'Move an instance variable of a class down to its subclasses.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to push down' }
		executingWith: [ :aClass :aVariableName |
			self applyReportingChangedClasses: (PushDownInstanceVariable named: aVariableName from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
pushUpInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: self class pushUpInstanceVariableRefactoringToolName
		describedBy: 'Move an instance variable of a class up to its superclass.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to push up' }
		executingWith: [ :aClass :aVariableName |
			self applyReportingChangedClasses: (PushUpInstanceVariable named: aVariableName from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
removeInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: self class removeInstanceVariableRefactoringToolName
		describedBy: 'Remove an instance variable from a class.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to remove' }
		executingWith: [ :aClass :aVariableName |
			self applyReportingChangedClass: (RemoveInstanceVariable named: aVariableName from: aClass) ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
removeUnreferencedInstanceVariablesRefactoringTool

	^MCPPluggableTool
		named: self class removeUnreferencedInstanceVariablesRefactoringToolName
		describedBy: 'Remove every instance variable of a class that no method reads or writes.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			self applyReportingRemovedVariables: (RemoveAllUnreferencedInstanceVariables from: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - instance variable' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
renameInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: self class renameInstanceVariableRefactoringToolName
		describedBy: 'Rename an instance variable of a class, in every method that uses it.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to rename'.
			MCPPlainToolProperty named: 'newVariableName' describedBy: 'Name to rename it to' }
		executingWith: [ :aClass :aVariableName :aNewVariableName |
			self applyReportingChanges: (RenameInstanceVariable from: aVariableName to: aNewVariableName in: aClass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
insertSuperclassRefactoringTool

	^MCPPluggableTool
		named: self class insertSuperclassRefactoringToolName
		describedBy: 'Insert a new class between a class and its superclass.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class to insert above it' }
		executingWith: [ :aClass :aNewClassName |
			self applyReportingNewClass: (InsertSuperclass to: aClass named: aNewClassName asSymbol) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
renameClassRefactoringTool

	^MCPPluggableTool
		named: self class renameClassRefactoringToolName
		describedBy: 'Rename a class, in every method that names it.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name to rename it to' }
		executingWith: [ :aClass :aNewClassName |
			self applyReportingChanges: (RenameClass from: aClass to: aNewClassName asSymbol in: Smalltalk undeclared: Undeclared) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
renameGlobalRefactoringTool

	^MCPPluggableTool
		named: self class renameGlobalRefactoringToolName
		describedBy: 'Rename a global, in every method that names it.'
		properties: {
			MCPPlainToolProperty named: 'globalName' describedBy: 'Name of the global to rename'.
			MCPPlainToolProperty named: 'newGlobalName' describedBy: 'Name to rename it to' }
		executingWith: [ :aGlobalName :aNewGlobalName |
			self applyReportingChanges: (RenameGlobal from: aGlobalName asSymbol to: aNewGlobalName asSymbol in: smalltalk) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - class' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
safelyRemoveClassRefactoringTool

	^MCPPluggableTool
		named: self class safelyRemoveClassRefactoringToolName
		describedBy: 'Remove a class, refusing when something still refers to it.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass | self applyReportingRemovedClasses: (SafelyRemoveClass of: aClass) ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
addParameterRefactoringTool

	^MCPPluggableTool
		named: self class addParameterRefactoringToolName
		describedBy: 'Add a parameter to a selector, giving every sender the scope takes in the value to pass. A unary selector needs no keyword; a keyword one is told which keyword to add and where.'
		properties: {
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector to add the parameter to' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to add'.
			MCPPlainToolProperty named: 'parameterValue' describedBy: 'Expression every sender will pass for it'.
			MCPPlainToolProperty named: 'keyword' describedBy: 'Keyword to add, needed only when the selector is a keyword one' defaultingTo: ''.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position for the new keyword, counting from one. Defaults to the first' defaultingTo: '1'.
			self scopeProperty.
			self scopeClassProperty }
		executingWith: [ :aSelector :aParameterName :aParameterValue :aKeyword :aParameterIndex :aScopeName :aClassName |
			self applyReportingChanges: (self
				refactoringOn: aSelector
				around: aClassName
				within: aScopeName
				builtWith: [ :implementors :senders |
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

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
changeKeywordsOrderRefactoringTool

	^MCPPluggableTool
		named: self class changeKeywordsOrderRefactoringToolName
		describedBy: 'Reorder the keywords of a selector, moving the arguments of every sender the scope takes in with them.'
		properties: {
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector to reorder' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPluggableToolProperty named: 'newSelector' describedBy: 'Selector with the same keywords in the order wanted' valuedWith: [ :aSelector | aSelector asSymbol ].
			self scopeProperty.
			self scopeClassProperty }
		executingWith: [ :aSelector :aNewSelector :aScopeName :aClassName |
			self applyReportingChanges: (self
				refactoringOn: aSelector
				around: aClassName
				within: aScopeName
				builtWith: [ :implementors :senders |
					ChangeKeywordsSelectorOrder from: aSelector to: aNewSelector implementors: implementors senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
removeParameterRefactoringTool

	^MCPPluggableTool
		named: self class removeParameterRefactoringToolName
		describedBy: 'Remove a parameter from a selector, in the implementors and the senders the scope takes in. It is refused when an implementor still uses the parameter.'
		properties: {
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector to remove the parameter from' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to remove'.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position of the parameter, counting from one. Defaults to the first' defaultingTo: '1'.
			self scopeProperty.
			self scopeClassProperty }
		executingWith: [ :aSelector :aParameterName :aParameterIndex :aScopeName :aClassName |
			self applyReportingChanges: (self
				refactoringOn: aSelector
				around: aClassName
				within: aScopeName
				builtWith: [ :implementors :senders |
					RemoveParameter
						atIndex: aParameterIndex asNumber
						named: aParameterName
						from: aSelector
						implementors: implementors
						senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - selector' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
renameSelectorRefactoringTool

	^MCPPluggableTool
		named: self class renameSelectorRefactoringToolName
		describedBy: 'Rename a selector, in the implementors and the senders the scope takes in.'
		properties: {
			MCPPluggableToolProperty
				named: 'selector'
				describedBy: 'Selector to rename'
				valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPluggableToolProperty
				named: 'newSelector'
				describedBy: 'Selector to rename it to'
				valuedWith: [ :aSelector | aSelector asSymbol ].
			self scopeProperty.
			self scopeClassProperty }
		executingWith: [ :aSelector :aNewSelector :aScopeName :aClassName |
			self applyReportingChanges: (self
				refactoringOn: aSelector
				around: aClassName
				within: aScopeName
				builtWith: [ :implementors :senders |
					RenameSelector from: aSelector to: aNewSelector implementors: implementors senders: senders ]) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
addAsSubclassResponsibilityRefactoringTool

	^MCPPluggableTool
		named: self class addAsSubclassResponsibilityRefactoringToolName
		describedBy: 'Declare a method of a class as the responsibility of its subclasses, adding it to the superclass as a subclassResponsibility.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method' }
		executingWith: [ :aMethod | self applyReportingChanges: (AddAsSubclassResponsibility for: aMethod) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
moveToInstanceOrClassMethodRefactoringTool

	^MCPPluggableTool
		named: self class moveToInstanceOrClassMethodRefactoringToolName
		describedBy: 'Move a method from the instance side of a class to its class side, or back.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to move' }
		executingWith: [ :aMethod | self applyReportingChanges: (MoveToInstanceOrClassMethod for: aMethod) ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
pushDownMethodToOneSubclassRefactoringTool

	^MCPPluggableTool
		named: self class pushDownMethodToOneSubclassRefactoringToolName
		describedBy: 'Move a method down into one subclass of the class that implements it.'
		properties: {
			MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to push down'.
			MCPClassToolProperty named: 'subclassName' describedBy: 'Name of the subclass to push it down to' }
		executingWith: [ :aMethod :aSubclass |
			self applyReportingChanges: (PushDownMethodToOneSubclass for: aMethod to: aSubclass) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
pushDownMethodToSubclassesRefactoringTool

	^MCPPluggableTool
		named: self class pushDownMethodToSubclassesRefactoringToolName
		describedBy: 'Copy a method down into every subclass of the class that implements it.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to push down' }
		executingWith: [ :aMethod | self applyReportingChanges: (PushDownMethodToSubclasses for: aMethod) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - method' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
pushUpMethodRefactoringTool

	^MCPPluggableTool
		named: self class pushUpMethodRefactoringToolName
		describedBy: 'Move a method up to the superclass of the class that implements it.'
		properties: { MCPMethodProperty classDescribedBy: 'Name of the class that implements it' selectorDescribedBy: 'Selector of the method to push up' }
		executingWith: [ :aMethod |
			self applyReportingChanges: (PushUpMethod
				for: aMethod
				additionallyRemovingFrom: OrderedCollection new
				pushingUp: OrderedCollection new) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - temporary' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
inlineTemporaryVariableRefactoringTool

	^MCPPluggableTool
		named: self class inlineTemporaryVariableRefactoringToolName
		describedBy: 'Replace a use of a temporary by the value assigned to it. The use is named by the text it is written with, or by the interval it occupies when the text is written more than once.'
		properties: {
			MCPMethodProperty default.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to inline'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the use to replace, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the use, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the use' defaultingTo: '' }
		executingWith: [ :aMethod :aVariableName :aText :aStart :aStop |
			self
				apply: (InlineTemporaryVariable
					named: aVariableName
					atUsageInterval: (self intervalIn: aMethod matching: aText from: aStart to: aStop)
					inMethod: aMethod)
				reportingNewSourceOf: aMethod ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - temporary' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
renameTemporaryRefactoringTool

	^MCPPluggableTool
		named: self class renameTemporaryRefactoringToolName
		describedBy: 'Rename a temporary or an argument of a method, in every use it has inside it.'
		properties: {
			MCPMethodProperty default.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to rename'.
			MCPPlainToolProperty named: 'newVariableName' describedBy: 'Name to rename it to' }
		executingWith: [ :aMethod :aVariableName :aNewVariableName |
			self
				applySourceChanging: (RenameTemporary
					from: aVariableName
					to: aNewVariableName
					in: aMethod methodNode)
				to: aMethod ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - temporary' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
temporaryToInstanceVariableRefactoringTool

	^MCPPluggableTool
		named: self class temporaryToInstanceVariableRefactoringToolName
		describedBy: 'Turn a temporary of a method into an instance variable of its class.'
		properties: {
			MCPMethodProperty default.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to turn into an instance variable' }
		executingWith: [ :aMethod :aVariableName |
			self
				apply: (TemporaryToInstanceVariable named: aVariableName fromMethod: aMethod methodNode)
				reportingNewSourceOf: aMethod ]
! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 3/Sep/2026, 9:30:14 pm (UTC)'!
extractAsParameterRefactoringTool

	^MCPPluggableTool
		named: self class extractAsParameterRefactoringToolName
		describedBy: 'Turn a piece of a method into a parameter of it, giving every sender the scope takes in the piece to pass. The piece is named by the text it is written with, or by the interval it occupies.'
		properties: {
			MCPMethodProperty default.
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to introduce'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: ''.
			self scopeProperty }
		executingWith: [ :aMethod :aParameterName :aText :aStart :aStop :aScopeName |
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				around: aMethod methodClass name
				within: aScopeName
				builtWith: [ :implementors :senders |
					ExtractAsParameter
						named: aParameterName
						extractedFrom: (self intervalIn: aMethod matching: aText from: aStart to: aStop)
						at: aMethod
						implementors: implementors
						senders: senders ]) ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
extractMethodFromSimilarCodeRefactoringTool

	^MCPPluggableTool
		named: self class extractMethodFromSimilarCodeRefactoringToolName
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

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 4/Sep/2026, 11:53:30 am (UTC)'!
extractToTemporaryRefactoringTool

	^MCPPluggableTool
		named: self class extractToTemporaryRefactoringToolName
		describedBy: 'Extract a piece of a method into a temporary of it. The piece is named by the text it is written with, or by the interval it occupies. Replacing all of them replaces every piece that is the same expression, which is found in the parse tree and so does not include a comment or a string saying the same.'
		properties: {
			MCPMethodProperty default.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the temporary to extract into'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: ''.
			MCPPlainToolProperty named: 'replaceAll' describedBy: 'Whether every piece that is the same expression is replaced, true or false. Defaults to replacing only the one named' defaultingTo: 'false' }
		executingWith: [ :aMethod :aVariableName :aText :aStart :aStop :aReplaceAllAnswer |
			| replacingAll |
			replacingAll := aReplaceAllAnswer isTrue.
			self
				extractToTemporaryNamed: aVariableName
				in: aMethod asMethodReference
				at: (replacingAll
					ifTrue: [ self firstIntervalIn: aMethod matching: aText from: aStart to: aStop ]
					ifFalse: [ self intervalIn: aMethod matching: aText from: aStart to: aStop ])
				replacingAll: replacingAll ]

! !

!MCPRefactoringTools methodsFor: 'tool creation - extraction' stamp: 'HAW 1/Sep/2026, 1:28:35 pm (UTC)'!
inlineMethodRefactoringTool

	^MCPPluggableTool
		named: self class inlineMethodRefactoringToolName
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
			self applyReportingChanges: (InlineMethod
				from: aMethod
				intoSendersAndUsages: (Array with: (self
					messageSendIn: aSendingMethod
					at: (self intervalIn: aSendingMethod matching: aText from: aStart to: aStop)))
				removeMethod: false) ]
! !

!MCPRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 4/Sep/2026, 1:04:18 pm (UTC)'!
extractMethodRefactoringTool

	^MCPPluggableTool
		named: self class extractMethodRefactoringToolName
		describedBy: 'Extract a piece of a method into a method of its own and send it instead. The piece is named by the text it is written with, or by the interval it occupies. Only code that is the same as the piece is replaced, and how far it is looked for is what replacing says.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to extract from'.
			MCPPlainToolProperty named: 'newSelector' describedBy: 'Selector of the method to create, with its keywords, as in totalFor:at:'.
			MCPPlainToolProperty named: 'argumentNames' describedBy: 'Names of the parameters of the new method, separated by commas, in the order of its keywords' defaultingTo: ''.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: ''.
			MCPPlainToolProperty named: 'replacing' describedBy: 'Which pieces the new message replaces: selection for the one named, method for every piece of that method that is the same code, class for every piece of that class, hierarchy for every piece of that class and of all its subclasses. Defaults to selection' defaultingTo: 'selection' }
		executingWith: [ :aMethod :aNewSelector :someArgumentNames :aText :aStart :aStop :aReplacing |
			self
				extractMethodFrom: aMethod asMethodReference
				at: (self firstIntervalIn: aMethod matching: aText from: aStart to: aStop)
				named: aNewSelector
				withArgumentNames: someArgumentNames
				replacing: aReplacing ]! !

!MCPRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:26:44 pm (UTC)'!
noMessageSendErrorDescriptionIn: aCompiledMethod at: anIndex

	^'No message send at character ', anIndex printString, ' of ',
		aCompiledMethod methodClass name, '>>', aCompiledMethod selector
! !

!MCPRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 27/Aug/2026, 1:17:48 pm (UTC)'!
unknownReplacingErrorDescriptionFor: aReplacing

	^'Unknown replacing: ', aReplacing, '. It is one of selection, method, class or hierarchy'
! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
addAsSubclassResponsibilityRefactoringToolName

	^'smalltalk_refactor_add_as_subclass_responsibility'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
addInstanceVariableRefactoringToolName

	^'smalltalk_refactor_add_instance_variable'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
addParameterRefactoringToolName

	^'smalltalk_refactor_add_parameter'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
changeKeywordsOrderRefactoringToolName

	^'smalltalk_refactor_change_keywords_order'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
extractAsParameterRefactoringToolName

	^'smalltalk_refactor_extract_as_parameter'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
extractMethodFromSimilarCodeRefactoringToolName

	^'smalltalk_refactor_extract_method_from_similar_code'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
extractMethodRefactoringToolName

	^'smalltalk_refactor_extract_method'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
extractToTemporaryRefactoringToolName

	^'smalltalk_refactor_extract_to_temporary'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
inlineMethodRefactoringToolName

	^'smalltalk_refactor_inline_method'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
inlineTemporaryVariableRefactoringToolName

	^'smalltalk_refactor_inline_temporary_variable'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
insertSuperclassRefactoringToolName

	^'smalltalk_refactor_insert_superclass'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
moveToInstanceOrClassMethodRefactoringToolName

	^'smalltalk_refactor_move_to_instance_or_class_method'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
pushDownInstanceVariableRefactoringToolName

	^'smalltalk_refactor_push_down_instance_variable'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
pushDownMethodToOneSubclassRefactoringToolName

	^'smalltalk_refactor_push_down_method_to_one_subclass'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
pushDownMethodToSubclassesRefactoringToolName

	^'smalltalk_refactor_push_down_method_to_subclasses'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
pushUpInstanceVariableRefactoringToolName

	^'smalltalk_refactor_push_up_instance_variable'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
pushUpMethodRefactoringToolName

	^'smalltalk_refactor_push_up_method'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
removeInstanceVariableRefactoringToolName

	^'smalltalk_refactor_remove_instance_variable'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
removeParameterRefactoringToolName

	^'smalltalk_refactor_remove_parameter'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
removeUnreferencedInstanceVariablesRefactoringToolName

	^'smalltalk_refactor_remove_unreferenced_instance_variables'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
renameClassRefactoringToolName

	^'smalltalk_refactor_rename_class'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
renameGlobalRefactoringToolName

	^'smalltalk_refactor_rename_global'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
renameInstanceVariableRefactoringToolName

	^'smalltalk_refactor_rename_instance_variable'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
renameSelectorRefactoringToolName

	^'smalltalk_refactor_rename_selector'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
renameTemporaryRefactoringToolName

	^'smalltalk_refactor_rename_temporary'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
safelyRemoveClassRefactoringToolName

	^'smalltalk_refactor_safely_remove_class'! !

!MCPRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
temporaryToInstanceVariableRefactoringToolName

	^'smalltalk_refactor_temporary_to_instance_variable'! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
implementorsOfTool

	^MCPPluggableTool
		named: self class implementorsOfToolName
		describedBy: 'List the methods that implement a selector, in the methods field of the answer.'
		properties: {
			MCPPluggableToolProperty
				named: 'selector'
				describedBy: 'Selector the methods implement'
				valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aSelector | self renderReferences: (Smalltalk allImplementorsOf: aSelector) ]
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
referencesToClassTool

	^MCPPluggableTool
		named: self class referencesToClassToolName
		describedBy: 'List the methods that refer to a class.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass | self renderReferences: (Smalltalk allCallsOn: (Smalltalk associationAt: aClass name)) ]
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
referencesToClassVariableTool

	^MCPPluggableTool
		named: self class referencesToClassVariableToolName
		describedBy: 'List the methods that refer to a class variable. A subclass sees the class variables of its superclass, so the methods of every subclass are listed too.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the class variable' }
		executingWith: [ :aClass :aVariableName |
			| definingClass |
			definingClass := aClass classThatDefinesClassVariable: aVariableName.
			definingClass ifNil: [ self error: (MCPServer classVariableNotFoundErrorDescriptionFor: aVariableName in: aClass) ].
			self renderReferences: (Smalltalk allCallsOn: (definingClass classVarBindingOf: aVariableName asSymbol)) ]
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
referencesToInstanceVariableTool

	^MCPPluggableTool
		named: self class referencesToInstanceVariableToolName
		describedBy: 'List the methods that read or write an instance variable. A subclass sees the instance variables of its superclass, so the methods of every subclass are listed too.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable' }
		executingWith: [ :aClass :aVariableName |
			(aClass allInstVarNames includes: aVariableName)
				ifFalse: [ self error: (MCPServer instanceVariableNotFoundErrorDescriptionFor: aVariableName in: aClass) ].
			self renderReferences: (aClass allBroadAccessesTo: aVariableName) ]
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
renderReferences: aCollectionOfMethodReferences

	"Answer the methods a search found in a field of their own, so that a package loaded
	afterwards can add what it knows about them beside it."

	^Json render: (OrderedDictionary new
		at: 'methods' put: ((aCollectionOfMethodReferences collect: [ :eachReference | eachReference stringVersion ]) asArray sort);
		yourself)
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 11:01:30 pm (UTC)'!
renderSelectors: someSelectors

	^Json render: (someSelectors collect: [ :eachSelector | eachSelector asString ])
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
searchSelectorsTool

	^MCPPluggableTool
		named: self class searchSelectorsToolName
		describedBy: 'List the selectors that contain a text, which tells whether a message doing what is about to be written already has a name. A * in the text matches any text and a # any character, and several texts can be sent separated by semicolons.'
		properties: { MCPPlainToolProperty named: 'text' describedBy: 'Text the selector contains' }
		executingWith: [ :aText | self renderSelectors: (self selectorsContaining: aText) ]
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
searchSourceTool

	^MCPPluggableTool
		named: self class searchSourceToolName
		describedBy: 'List the methods whose source code contains a text, case sensitively. Class comments are searched too, and answered as the selector Comment.'
		properties: { MCPPlainToolProperty named: 'text' describedBy: 'Text the source code contains' }
		executingWith: [ :aText | self renderReferences: (Smalltalk allMethodsWithSourceString: aText matchCase: true) ]
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 11:01:30 pm (UTC)'!
selectorsContaining: aText

	| messageNames |

	messageNames := MessageNames new.
	messageNames searchString: aText.

	^messageNames computeSelectorListFromSearchString
! !

!MCPSearchTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
sendersOfTool

	^MCPPluggableTool
		named: self class sendersOfToolName
		describedBy: 'List the methods that send a selector, in the methods field of the answer. A method that writes the selector but sends it to something else is one of them, because the text is all this looks at.'
		properties: {
			MCPPluggableToolProperty
				named: 'selector'
				describedBy: 'Selector the methods send'
				valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aSelector | self renderReferences: (Smalltalk allCallsOn: aSelector) ]
! !

!MCPSearchTools methodsFor: 'tools' stamp: 'HAW 31/Aug/2026, 10:11:43 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self sendersOfTool;
		addTool: self implementorsOfTool;
		addTool: self referencesToClassTool;
		addTool: self referencesToInstanceVariableTool;
		addTool: self referencesToClassVariableTool;
		addTool: self searchSourceTool;
		addTool: self searchSelectorsTool! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
implementorsOfToolName

	^'smalltalk_implementors_of'! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
referencesToClassToolName

	^'smalltalk_references_to_class'! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
referencesToClassVariableToolName

	^'smalltalk_references_to_class_variable'! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
referencesToInstanceVariableToolName

	^'smalltalk_references_to_instance_variable'! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
searchSelectorsToolName

	^'smalltalk_search_selectors'! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
searchSourceToolName

	^'smalltalk_search_source'! !

!MCPSearchTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
sendersOfToolName

	^'smalltalk_senders_of'! !

!MCPTestRunningTools methodsFor: 'tool creation' stamp: 'HAW 28/Aug/2026, 3:42:19 pm (UTC)'!
classesNamed: aCommaSeparatedText

	^(self namesFrom: aCommaSeparatedText) collect: [ :eachClassName |
		(smalltalk classNamed: eachClassName)
			ifNil: [ self error: (MCPClassToolProperty classNotFoundErrorDescriptionFor: eachClassName) ] ]! !

!MCPTestRunningTools methodsFor: 'tool creation' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
namesOfTests: someTests

	"A test says its own name, which is the class that holds it and the selector it is run by."

	^(someTests collect: [ :eachTest | eachTest printString ]) asSortedCollection asArray
! !

!MCPTestRunningTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
runTestClassTool

	^MCPPluggableTool
		named: self class runTestClassToolName
		describedBy: 'Run every test of a test case class and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the test case class' }
		executingWith: [ :aClass | self runTestsIn: (TestSuite forTestCaseClass: aClass) ]
! !

!MCPTestRunningTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:30:14 pm (UTC)'!
runTestMethodTool

	^MCPPluggableTool
		named: self class runTestMethodToolName
		describedBy: 'Run one test and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled.'
		properties: { MCPMethodProperty default }
		executingWith: [ :aMethod | self runTestsIn: (TestSuite forTestMethod: aMethod) ]
! !

!MCPTestRunningTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
runTestsForClassesTool

	^MCPPluggableTool
		named: self class runTestsForClassesToolName
		describedBy: 'Run the tests of several classes as one suite and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled. A class that is not a test case class contributes the tests that exercise it.'
		properties: { MCPPlainToolProperty named: 'classNames' describedBy: 'Names of the classes, separated by commas' }
		executingWith: [ :someClassNames |
			self runTestsIn: (TestSuite
				forClasses: (self classesNamed: someClassNames)
				named: someClassNames) ]
! !

!MCPTestRunningTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:36 pm (UTC)'!
runTestsInCategoryTool

	^MCPPluggableTool
		named: self class runTestsInCategoryToolName
		describedBy: 'Run every test of the test case classes of a class category and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled. A category holding no test case class contributes the tests that exercise the classes it does hold.'
		properties: { MCPPlainToolProperty named: 'categoryName' describedBy: 'Name of the class category' }
		executingWith: [ :aCategoryName |
			self runTestsIn: (TestSuite forSystemCategoryNamed: aCategoryName using: smalltalk organization) ]
! !

!MCPTestRunningTools methodsFor: 'tools' stamp: 'HAW 28/Aug/2026, 12:36:49 am (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self runTestMethodTool;
		addTool: self runTestClassTool;
		addTool: self runTestsInCategoryTool;
		addTool: self runTestsForClassesTool
! !

!MCPTestRunningTools methodsFor: 'running tests' stamp: 'HAW 3/Sep/2026, 10:26:43 pm (UTC)'!
descriptionOf: aTestResult

	^OrderedDictionary new
		at: 'passedCount' put: aTestResult passedCount;
		at: 'failedCount' put: aTestResult failureCount;
		at: 'errorCount' put: aTestResult errorCount;
		at: 'failed' put: (self namesOfTests: aTestResult failures);
		at: 'errors' put: (self namesOfTests: aTestResult errors);
		yourself! !

!MCPTestRunningTools methodsFor: 'running tests' stamp: 'HAW 4/Sep/2026, 11:28:53 am (UTC)'!
runTestsIn: aTestSuite

	"The suite runs in a process of its own and this one waits for it. Not for concurrency: a
	test that signals is recorded by TestResult only when what it signalled goes unhandled,
	because runCase: catches UnhandledError and not Error, and the handler that turns an error
	into an answer for a client is on the stack of the process answering the request. On that
	stack the error is caught before it can go unhandled, so one signalling test would fail the
	whole call and lose the results of every test beside it. A process of its own carries no
	such handler.

	The semaphore is signalled however the run ends, so that a process terminated before it
	finished frees this one instead of leaving it waiting for a signal nobody sends. Then there
	is no result, and that is what is said rather than a failure to read one."

	| result done |

	done := Semaphore new.
	[ [ result := aTestSuite run ] ensure: [ done signal ] ] forkNamed: aTestSuite name.
	done wait.

	^result
		ifNil: [ self error: (self class testsDidNotFinishErrorDescriptionFor: aTestSuite) ]
		ifNotNil: [ :aTestResult | Json render: (self descriptionOf: aTestResult) ]! !

!MCPTestRunningTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
runTestClassToolName

	^'smalltalk_run_test_class'! !

!MCPTestRunningTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
runTestMethodToolName

	^'smalltalk_run_test_method'! !

!MCPTestRunningTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
runTestsForClassesToolName

	^'smalltalk_run_tests_for_classes'! !

!MCPTestRunningTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:06 pm (UTC)'!
runTestsInCategoryToolName

	^'smalltalk_run_tests_in_category'! !

!MCPTestRunningTools class methodsFor: 'error descriptions' stamp: 'HAW 4/Sep/2026, 11:14:56 am (UTC)'!
testsDidNotFinishErrorDescriptionFor: aTestSuite

	^'The tests of ', aTestSuite name, ' did not finish: the process running them was terminated before it answered'! !

!MCPToolProperty methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 5:14:33 pm (UTC)'!
initializeNamed: aName describedBy: aDescription required: isRequired ifAbsent: anAbsentBlock

	name := aName.
	description := aDescription.
	required := isRequired.
	absentBlock := anAbsentBlock
! !

!MCPToolProperty methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 3:21:38 pm (UTC)'!
description

	^description
! !

!MCPToolProperty methodsFor: 'accessing' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
name

	^name
! !

!MCPToolProperty methodsFor: 'property definition' stamp: 'HAW 21/Aug/2026, 5:30:25 pm (UTC)'!
addTo: aProperties

	aProperties at: name put: self definition.
	
	^aProperties ! !

!MCPToolProperty methodsFor: 'property definition' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
definition

	^OrderedDictionary new
		at: 'type' put: self type;
		at: 'description' put: description;
		yourself
! !

!MCPToolProperty methodsFor: 'property definition' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
type

	^'string'
! !

!MCPToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
valueFor: aValue

	^self subclassResponsibility
! !

!MCPToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
valueFrom: anArguments

	^anArguments
		at: name
		ifPresent: [ :aValue | self valueFor: aValue ]
		ifAbsent: [ self valueWhenAbsent ]
! !

!MCPToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 5:11:26 pm (UTC)'!
valueWhenAbsent

	^absentBlock value: self
! !

!MCPToolProperty methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 4:56:48 pm (UTC)'!
notProvidedErrorDescription

	^'No ', name, ' provided'
! !

!MCPToolProperty methodsFor: 'error signaling' stamp: 'HAW 21/Aug/2026, 5:17:28 pm (UTC)'!
signalNotProvided

	self error: self notProvidedErrorDescription
! !

!MCPToolProperty methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
addRequiredNamesTo: someNames

	"Add the names a client has to send for me. A property answers one value but is not
	always one name, so it is asked to add them rather than asked what it is called."

	required ifTrue: [ someNames add: name ].

	^someNames
! !

!MCPToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:15:28 pm (UTC)'!
named: aName describedBy: aDescription

	^self
		named: aName
		describedBy: aDescription
		required: true
		ifAbsent: [ :aProperty | aProperty signalNotProvided ]
! !

!MCPToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:15:28 pm (UTC)'!
named: aName describedBy: aDescription defaultingTo: aDefaultValue

	^self
		named: aName
		describedBy: aDescription
		required: false
		ifAbsent: [ :aProperty | aDefaultValue ]
! !

!MCPToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 5:15:28 pm (UTC)'!
named: aName describedBy: aDescription required: isRequired ifAbsent: anAbsentValueBlock

	^self new initializeNamed: aName describedBy: aDescription required: isRequired ifAbsent: anAbsentValueBlock
! !

!MCPClassToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
valueFor: aClassName

	^(Smalltalk classNamed: aClassName) ifNil: [ self signalClassNotFound: aClassName ]
! !

!MCPClassToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
valueWhenAbsent

	"A client that sends no class name is told the class was not found, and not that the
	property is missing, because that is what it is asking for."

	^self signalClassNotFound: self class classNameNotProvided
! !

!MCPClassToolProperty methodsFor: 'errors' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
signalClassNotFound: aClassName

	self error: (self class classNotFoundErrorDescriptionFor: aClassName)
! !

!MCPClassToolProperty class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
classNameNotProvided

	^'<not provided>'

! !

!MCPClassToolProperty class methodsFor: 'error descriptions' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
classNotFoundErrorDescriptionFor: aClassName

	^'Class not found: ', aClassName
! !

!MCPClassToolProperty class methodsFor: 'defaults' stamp: 'HAW 3/Sep/2026, 9:04:23 pm (UTC)'!
defaultDescription

	^'Name of the class, or of its class side as in MCPServer class'! !

!MCPClassToolProperty class methodsFor: 'defaults' stamp: 'HAW 3/Sep/2026, 9:04:18 pm (UTC)'!
defaultName

	"The name a client sends the class under. Whoever declares a property for it, or reads it
	out of the arguments, does so by this name and not by a text of its own."

	^'className'! !

!MCPClassToolProperty class methodsFor: 'instance creation' stamp: 'HAW 3/Sep/2026, 9:30:01 pm (UTC)'!
default

	^self withDefaultNameDescribedBy: self defaultDescription! !

!MCPClassToolProperty class methodsFor: 'instance creation' stamp: 'HAW 3/Sep/2026, 9:29:56 pm (UTC)'!
withDefaultNameDescribedBy: aDescription

	"Answer one named the way a client always sends the class, described the way the tool that
	takes it needs, which is what a tool asking for a class of its own kind describes itself."

	^self named: self defaultName describedBy: aDescription! !

!MCPCodePackageProperty methodsFor: 'request arguments' stamp: 'HAW 1/Sep/2026, 1:55:42 pm (UTC)'!
valueFor: aPackageName

	^CodePackage installedPackages
		at: aPackageName
		ifAbsent: [ self signalPackageNotFound: aPackageName ]! !

!MCPCodePackageProperty methodsFor: 'errors' stamp: 'HAW 1/Sep/2026, 1:55:47 pm (UTC)'!
signalPackageNotFound: aPackageName

	self error: (self class packageNotFoundErrorDescriptionFor: aPackageName)! !

!MCPCodePackageProperty class methodsFor: 'error descriptions' stamp: 'HAW 1/Sep/2026, 1:55:51 pm (UTC)'!
packageNotFoundErrorDescriptionFor: aPackageName

	^'Package not found: ', aPackageName! !

!MCPMethodProperty methodsFor: 'initialization' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
initializeOfClass: aClassProperty andSelector: aSelectorProperty

	classProperty := aClassProperty.
	selectorProperty := aSelectorProperty
! !

!MCPMethodProperty methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
addRequiredNamesTo: someNames

	^selectorProperty addRequiredNamesTo: (classProperty addRequiredNamesTo: someNames)
! !

!MCPMethodProperty methodsFor: 'tool definition' stamp: 'HAW 24/Aug/2026, 11:24:41 pm (UTC)'!
addTo: aProperties

	"A client sends a class and a selector, so that is what it is shown."

	^selectorProperty addTo: (classProperty addTo: aProperties)
! !

!MCPMethodProperty methodsFor: 'request arguments' stamp: 'HAW 25/Aug/2026, 11:53:10 am (UTC)'!
assert: aSelector isImplementedBy: aClass

	(aClass includesSelector: aSelector)
		ifFalse: [ self error: (self class methodNotFoundErrorDescriptionFor: aSelector in: aClass) ]
! !

!MCPMethodProperty methodsFor: 'request arguments' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
valueFrom: anArguments

	"Answer the compiled method the class and the selector name. It is one value and not two:
	a tool that takes a method is handed the method, not the two names it was found by."

	| aClass aSelector |

	aClass := classProperty valueFrom: anArguments.
	aSelector := selectorProperty valueFrom: anArguments.
	self assert: aSelector isImplementedBy: aClass.

	^aClass >> aSelector

! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 3/Sep/2026, 9:30:08 pm (UTC)'!
classDescribedBy: aClassDescription selectorDescribedBy: aSelectorDescription

	^self
		ofClass: (MCPClassToolProperty withDefaultNameDescribedBy: aClassDescription)
		andSelector: (MCPPluggableToolProperty
			named: 'selector'
			describedBy: aSelectorDescription
			valuedWith: [ :aSelector | aSelector asSymbol ])! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
default

	^self selectorDescribedBy: self defaultSelectorDescription
! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:57:38 am (UTC)'!
ofClass: aClassProperty andSelector: aSelectorProperty

	"Answer a property made of those two. Both are given so that a tool that takes more than
	one method can name them apart, as a sender and the method it sends."

	^self new initializeOfClass: aClassProperty andSelector: aSelectorProperty
! !

!MCPMethodProperty class methodsFor: 'instance creation' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
selectorDescribedBy: aSelectorDescription

	^self classDescribedBy: self defaultClassDescription selectorDescribedBy: aSelectorDescription
! !

!MCPMethodProperty class methodsFor: 'defaults' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
defaultClassDescription

	^'Name of the class that implements the method'
! !

!MCPMethodProperty class methodsFor: 'defaults' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
defaultSelectorDescription

	^'Selector of the method'
! !

!MCPMethodProperty class methodsFor: 'error descriptions' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
methodNotFoundErrorDescriptionFor: aSelector in: aClass

	^'Method not found: ', aClass name, '>>', aSelector
! !

!MCPPlainToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:21:39 pm (UTC)'!
valueFor: aValue

	^aValue
! !

!MCPPluggableToolProperty methodsFor: 'initialization' stamp: 'HAW 21/Aug/2026, 5:14:33 pm (UTC)'!
initializeNamed: aName describedBy: aDescription required: isRequired absentValue: anAbsentBlock valuedWith: aValueBlock

	self
		initializeNamed: aName
		describedBy: aDescription
		required: isRequired
		ifAbsent: anAbsentBlock.
	valueBlock := aValueBlock
! !

!MCPPluggableToolProperty methodsFor: 'request arguments' stamp: 'HAW 21/Aug/2026, 3:22:30 pm (UTC)'!
valueFor: aValue

	^valueBlock value: aValue
! !

!MCPPluggableToolProperty class methodsFor: 'instance creation' stamp: 'HAW 21/Aug/2026, 7:29:31 pm (UTC)'!
named: aName describedBy: aDescription valuedWith: aBlock

	^self new
		initializeNamed: aName
		describedBy: aDescription
		required: true
		absentValue: [ :aProperty | aProperty signalNotProvided ]
		valuedWith: aBlock
! !

!MCPTransport methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:18:07 pm (UTC)'!
serveRequestsFor: anMCPServer

	"Start serving MCP requests for anMCPServerCopy. Whether this blocks the calling
	process is up to each transport."

	self subclassResponsibility! !

!MCPTransport methodsFor: 'serving' stamp: ''!
stopServingRequests

	"Stop serving and release whatever is held open. Can be sent to a transport that
	is not serving."

	self subclassResponsibility! !

!MCPTransport methodsFor: 'encoding' stamp: 'HAW 20/Aug/2026, 6:03:30 pm (UTC)'!
utf8Decode: aByteString

	"Answer the text aByteString carries. A message arrives with one Character per UTF-8
	byte, so the characters of aByteString are the bytes to decode."

	^UnicodeString fromUtf8Bytes: aByteString asByteArray! !

!MCPTransportHttp methodsFor: 'initialization' stamp: ''!
initializeListeningAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: anAuthentication

	portNumber := aPortNumber.
	interfaceAddress := anInterfaceAddress.
	authentication := anAuthentication.
	sessions := Dictionary new.
	sessionCounter := 0! !

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

!MCPTransportHttp methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:48:01 pm (UTC)'!
newListeningWebServer

	"Answer a web server already listening on my port and interface."

	| newWebServer |

	Socket initializeNetwork.
	newWebServer := WebServer new.
	newWebServer listenOn: portNumber interface: self interfaceAddressBytes.

	^newWebServer! !

!MCPTransportHttp methodsFor: 'serving' stamp: 'HAW 19/Aug/2026, 10:48:17 pm (UTC)'!
serveRequestsFor: anMCPServer

	"Start listening for the requests anMCPServerCopy has to answer. Answers as soon as
	the listener is up, because the web server serves each connection in a process of its own."

	mcpServer := anMCPServer.
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

!MCPTransportHttp methodsFor: 'responding' stamp: 'HAW 24/Aug/2026, 12:07:52 pm (UTC)'!
pushAnswerTo: aWebRequest over: aSession

	"Send the answer to the message in the request body as a message event on aSession."

	| response |

	response := [ mcpServer jsonResponseTo: (self bodyOf: aWebRequest) ]
		on: Error
		do: [ :anError | mcpServer jsonInternalErrorWith: anError ].
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

!MCPTransportHttp methodsFor: 'responding' stamp: 'HAW 24/Aug/2026, 12:07:52 pm (UTC)'!
respondWithServerError: anError to: aWebRequest

	"Answer a JSON-RPC internal error instead of the web server default error page."

	^aWebRequest
		sendResponseCode: 500
		content: (mcpServer jsonInternalErrorWith: anError) asUtf8Bytes
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

!MCPTransportHttp methodsFor: 'closing' stamp: ''!
closeAllSessions

	"Close every open event stream and forget them all."

	sessions do: [ :eachSession | eachSession close ].
	sessions := Dictionary new! !

!MCPTransportHttp methodsFor: 'closing' stamp: 'HAW 19/Aug/2026, 7:28:07 pm (UTC)'!
closeConnectionHeaderValue

	^'close'! !

!MCPTransportHttp methodsFor: 'closing' stamp: 'HAW 19/Aug/2026, 7:28:00 pm (UTC)'!
closeConnectionOf: aWebRequest

	"Ask the web server not to keep this connection alive. The header has to be set on the
	request and not on the response, because the server takes the decision from the request
	and then overwrites whatever the response said."

	aWebRequest headerAt: self connectionHeaderName put: self closeConnectionHeaderValue! !

!MCPTransportHttp methodsFor: 'closing' stamp: ''!
closeEventStreamFor: aWebRequest

	"End the event stream the request names, when it is still open, and acknowledge."

	(self sessionFor: aWebRequest) ifNotNil: [ :aSession | self closeSession: aSession ].

	^self acknowledge: aWebRequest! !

!MCPTransportHttp methodsFor: 'closing' stamp: ''!
closeSession: aSession

	aSession close.
	sessions removeKey: aSession identifier ifAbsent: [ nil ]! !

!MCPTransportHttp methodsFor: 'closing' stamp: 'HAW 19/Aug/2026, 7:28:05 pm (UTC)'!
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

!MCPTransportHttp class methodsFor: 'instance creation' stamp: 'HAW 19/Aug/2026, 10:39:05 pm (UTC)'!
listeningAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: anAuthentication

	self assertIsValidPortNumber: aPortNumber.
	self assertIsValidInterfaceAddress: anInterfaceAddress.
	
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

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:40:09 pm (UTC)'!
assertIsValidInterfaceAddress: anInterfaceAddress

	(anInterfaceAddress isString and: [ anInterfaceAddress notEmpty ])
		ifFalse: [ self signalInvalidInterfaceAddress ]! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:39:39 pm (UTC)'!
assertIsValidPortNumber: aPortNumber

	(aPortNumber isInteger and: [ aPortNumber between: 1 and: 65535 ])
		ifFalse: [ self signalInvalidPortNumber ]! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:40:09 pm (UTC)'!
signalInvalidInterfaceAddress

	^ self error: self invalidInterfaceAddressErrorDescription! !

!MCPTransportHttp class methodsFor: 'preconditions' stamp: 'HAW 19/Aug/2026, 10:39:39 pm (UTC)'!
signalInvalidPortNumber

	^ self error: self invalidPortNumberErrorDescription! !

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

!MCPTransportText methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
initializeReadingFrom: aReadStream writingTo: aWriteStream

	in := aReadStream.
	out := aWriteStream
! !

!MCPTransportText methodsFor: 'reading' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
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
readMessage

	"Answer the text of the next request, or nil when the input is exhausted. The text is
	left unparsed so that the server answers a parse error the way it does for every other
	transport, instead of the error being raised here and stopping the loop."

	^self readLine ifNotNil: [ :aLine | self utf8Decode: aLine ]
! !

!MCPTransportText methodsFor: 'writing' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
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
dispatch: aJsonRequest using: anMCPServer

	| jsonResponse |
	
	jsonResponse := anMCPServer jsonResponseTo: aJsonRequest.
	
	^ jsonResponse ifNotNil: [ self writeMessage: jsonResponse ]! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:07:30 pm (UTC)'!
readAndDispatchNextMessage: anMCPServer

	self readMessage
		ifNil: [ anMCPServer stop ]
		ifNotNil: [ :aJsonRequest | self dispatch: aJsonRequest using: anMCPServer ]! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
serveRequestsFor: anMCPServer

	"Read one message at a time and write the answer of anMCPServer out. Blocks the calling
	process until the server stops running."

	[ anMCPServer isRunning ] whileTrue: [ self readAndDispatchNextMessage: anMCPServer ]
! !

!MCPTransportText methodsFor: 'serving requests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
stopServingRequests

	"The input and the output are given to me, so releasing them is not mine to do."
! !

!MCPTransportText class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
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
readingFrom: aReadStream writingTo: aWriteStream

	^self new initializeReadingFrom: aReadStream writingTo: aWriteStream
! !

!CharacterSequence methodsFor: '*MCPServer' stamp: 'HAW 4/Sep/2026, 12:06:49 pm (UTC)'!
isTrue

	"Answer whether I say what a client sends for true. Every value reaches a tool as text, so
	what stands for a boolean is read here once instead of at each place that takes one."

	^self = 'true'! !

!UISupervisor class methodsFor: '*MCPServer' stamp: 'HAW 28/Aug/2026, 6:40:03 pm (UTC)'!
waitToDone: aBlock

	"Have the process that draws morphs evaluate the block, and answer only once it has. It
	runs what it is given in the order it was given, so a block queued after a window was
	queued to be put up runs when the window is already up."

	| done |

	(self isUIProcess: Processor activeProcess) ifTrue: [ ^aBlock value ].

	done := Semaphore new.
	self whenUIinSafeState: [ aBlock value. done signal ].
	done wait! !
MCPServer initialize!
