'From Cuis7.9 [latest update: #8134] on 28 August 2026 at 12:24:44 pm'!
'Description File a method under a category without an evaluate'!
!provides: 'MCPServerTests' 1 44!
!requires: 'DynamicallyCodeCreatingTestSupport' 1 8 nil!
SystemOrganization addCategory: 'MCPServerTests'!


!classDefinition: #MCPTestInputStream category: 'MCPServerTests'!
ReadStream subclass: #MCPTestInputStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTestInputStream class' category: 'MCPServerTests'!
MCPTestInputStream class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportMock category: 'MCPServerTests'!
MCPTransport subclass: #MCPTransportMock
	instanceVariableNames: 'mcpServer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTransportMock class' category: 'MCPServerTests'!
MCPTransportMock class
	instanceVariableNames: ''!

!classDefinition: #MCPMockClient category: 'MCPServerTests'!
Object subclass: #MCPMockClient
	instanceVariableNames: 'transport requestCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPMockClient class' category: 'MCPServerTests'!
MCPMockClient class
	instanceVariableNames: ''!

!classDefinition: #MCPToolsTest category: 'MCPServerTests'!
DynamicallyCodeCreatingTest subclass: #MCPToolsTest
	instanceVariableNames: 'client server'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPToolsTest class' category: 'MCPServerTests'!
MCPToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggingToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPDebuggingToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPDebuggingToolsTest class' category: 'MCPServerTests'!
MCPDebuggingToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPImageToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPImageToolsTest
	instanceVariableNames: 'savedImageCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPImageToolsTest class' category: 'MCPServerTests'!
MCPImageToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPModelStructureToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPModelStructureToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPModelStructureToolsTest class' category: 'MCPServerTests'!
MCPModelStructureToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPRefactoringToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPRefactoringToolsTest class' category: 'MCPServerTests'!
MCPRefactoringToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPSearchToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPSearchToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPSearchToolsTest class' category: 'MCPServerTests'!
MCPSearchToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPServerToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPServerToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPServerToolsTest class' category: 'MCPServerTests'!
MCPServerToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPTestRunningToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPTestRunningToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTestRunningToolsTest class' category: 'MCPServerTests'!
MCPTestRunningToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPAuthenticationTest category: 'MCPServerTests'!
TestCase subclass: #MCPAuthenticationTest
	instanceVariableNames: 'headers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPAuthenticationTest class' category: 'MCPServerTests'!
MCPAuthenticationTest class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodPropertyTest category: 'MCPServerTests'!
TestCase subclass: #MCPMethodPropertyTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPMethodPropertyTest class' category: 'MCPServerTests'!
MCPMethodPropertyTest class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportTextTest category: 'MCPServerTests'!
TestCase subclass: #MCPTransportTextTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTransportTextTest class' category: 'MCPServerTests'!
MCPTransportTextTest class
	instanceVariableNames: ''!


!MCPTestInputStream commentStamp: '<historical>' prior: 0!
I am a stream on text that reports itself closed once it is exhausted.

A stream on a collection answers false to closed forever, while MCPTransportText waits for input until the input says it is closed, the way a non blocking standard input does. Being closed at the end is what lets a script of requests end the serving loop.!

!MCPToolsTest commentStamp: '<historical>' prior: 0!
I am the fixture a test of the tools a server serves runs in: a server over a mock transport and a mock client sending it requests the way a real one does, with no socket in between.

I hold no test of my own. Each group of tools is tested by a subclass of mine, and the classes and methods a test makes are made through the server, in a class category I take away when the test ends.!

!MCPDebuggingToolsTest commentStamp: '<historical>' prior: 0!
I test the seven tools that drive a debugger.

Six of my tests ask each tool what it answers when no debugger is open, which is what a client sees when it drives one out of turn. The rest let a real failure leave a real debugger open and drive that, so what they exercise is the debugger the server really opens.

My tearDown always finishes the session, so a test that fails does not leave a debugger behind.!

!MCPModelStructureToolsTest commentStamp: '<historical>' prior: 0!
I am the tests of MCPMetamodelTools, which read and change classes, their categories, their hierarchy and their methods.!

!MCPRefactoringToolsTest commentStamp: '<historical>' prior: 0!
I am the tests of MCPRefactoringTools, the refactorings that come with the image.!

!MCPSearchToolsTest commentStamp: '<historical>' prior: 0!
I am the tests of MCPSearchTools, which look through the image for who sends, who implements, what names a class or a variable, and what already answers a result.!

!MCPServerToolsTest commentStamp: '<historical>' prior: 0!
I am the tests of the tools a server serves itself rather than through a group of them, which are evaluating code and running tests, and of the protocol it answers.!

!MCPTransportTextTest commentStamp: '<historical>' prior: 0!
I test MCPTransportText by serving it a script of requests and reading what it writes out.

The server, the tools and the JSON are the real ones; only the streams are in memory, so what I exercise is the loop a real standard input would drive.!

!MCPTestInputStream methodsFor: 'testing' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
closed

	"Answer whether there is nothing more to read. A stream on a collection is never closed
	the way a file is, so reaching the end is the only end it has, and that is the end the
	transport waits for."

	^self atEnd
! !

!MCPTransportMock methodsFor: 'serving' stamp: 'HAW 20/Aug/2026, 5:51:53 pm (UTC)'!
!methodProperties: {}!
serveRequestsFor: anMCPServer

	"Remember the server whose answers I hand back. Nothing is listening on a socket here:
	my client hands me its requests directly."

	mcpServer := anMCPServer! !

!MCPTransportMock methodsFor: 'serving' stamp: 'HAW 20/Aug/2026, 5:51:55 pm (UTC)'!
!methodProperties: {}!
stopServingRequests

	mcpServer := nil! !

!MCPTransportMock methodsFor: 'responding' stamp: 'HAW 20/Aug/2026, 5:51:57 pm (UTC)'!
!methodProperties: {}!
responseTo: anEncodedRequest

	"Answer what the server responds to the bytes a client sent me, decoding them the way
	a transport reading a socket does."

	^mcpServer jsonResponseTo: (self utf8Decode: anEncodedRequest)! !

!MCPMockClient methodsFor: 'initialization' stamp: 'HAW 20/Aug/2026, 5:52:07 pm (UTC)'!
!methodProperties: {}!
initializeSendingThrough: aTransport

	transport := aTransport.
	requestCounter := 0! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:14 pm (UTC)'!
!methodProperties: {}!
encoded: aJsonString

	"Answer aJsonString as the bytes that travel over the wire, one Character per byte,
	which is how a transport receives a message."

	^aJsonString asUtf8Bytes asString! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 6:51:24 pm (UTC)'!
!methodProperties: {}!
nextRequestId

	^ requestCounter := requestCounter + 1.! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:43 pm (UTC)'!
!methodProperties: {}!
sendMethod: aMethodName

	^self sendMethod: aMethodName with: Dictionary new! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:16 pm (UTC)'!
!methodProperties: {}!
sendMethod: aMethodName with: aParams

	"Send one JSON-RPC request the way a real client does and answer the parsed response."

	| request |

	request := OrderedDictionary new
		at: 'jsonrpc' put: '2.0';
		at: 'id' put: self nextRequestId;
		at: 'method' put: aMethodName;
		at: 'params' put: aParams;
		yourself.

	^self sendRaw: (Json render: request)! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:18 pm (UTC)'!
!methodProperties: {}!
sendRaw: aJsonString

	"Send whatever text a client might put on the wire, even when it is not valid JSON,
	and answer the parsed response."

	| response |

	response := transport responseTo: (self encoded: aJsonString).

	^Json readFrom: response readStream! !

!MCPMockClient methodsFor: 'responses' stamp: 'HAW 20/Aug/2026, 5:52:26 pm (UTC)'!
!methodProperties: {}!
resultOf: aResponse

	"Answer the result the server sent, signalling when it sent a JSON-RPC error instead."

	aResponse at: 'error' ifPresent: [ :anError | self signalResponseError: anError ].

	^aResponse at: 'result'! !

!MCPMockClient methodsFor: 'responses' stamp: 'HAW 20/Aug/2026, 6:52:51 pm (UTC)'!
!methodProperties: {}!
signalResponseError: anError

	self error: (anError at: 'message')! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:31 pm (UTC)'!
!methodProperties: {}!
callTool: aToolName

	^self callTool: aToolName with: Dictionary new! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:29 pm (UTC)'!
!methodProperties: {}!
callTool: aToolName with: anArguments

	"Answer the text the server answers when aToolName is called with anArguments,
	signalling when it answers a JSON-RPC error instead."

	| result |

	result := self resultOf: (self sendMethod: 'tools/call' with: (self paramsForTool: aToolName with: anArguments)).

	^(result at: 'content') first at: 'text'! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:36 pm (UTC)'!
!methodProperties: {}!
initializeConnection

	"Do the MCP handshake and answer what the server tells about itself."

	^self resultOf: (self sendMethod: 'initialize' with: Dictionary new)! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:38 pm (UTC)'!
!methodProperties: {}!
listTools

	"Answer the tool definitions the server advertises."

	^(self resultOf: (self sendMethod: 'tools/list' with: Dictionary new)) at: 'tools'! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:27 pm (UTC)'!
!methodProperties: {}!
paramsForTool: aToolName with: anArguments

	^OrderedDictionary new
		at: 'name' put: aToolName;
		at: 'arguments' put: anArguments;
		yourself! !

!MCPMockClient class methodsFor: 'instance creation' stamp: 'HAW 20/Aug/2026, 6:50:57 pm (UTC)'!
!methodProperties: {}!
sendingThrough: aTransport

	^self new initializeSendingThrough: aTransport! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 20/Aug/2026, 9:31:35 pm (UTC)'!
!methodProperties: {}!
registerClassCategoryOfTestData

	"The classes of these tests are created by the server under test instead of by
	createClassNamed:, so the category has to be registered for tearDown to empty it."

	classCategories add: self classCategoryOfTestData! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 12:47:57 am (UTC)'!
!methodProperties: {}!
setUp

	"Serve a server over a mock transport, so a mock client can send it requests the way a real
	one does without a socket in between."

	| transport |

	super setUp.
	self registerClassCategoryOfTestData.
	transport := MCPTransportMock new.
	server := self serverClass servingOver: transport smalltalk: self smalltalkForTheServer.
	transport serveRequestsFor: server.
	client := MCPMockClient sendingThrough: transport! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 20/Aug/2026, 9:31:36 pm (UTC)'!
!methodProperties: {}!
tearDown

	"My superclass empties the class category of the test data. The global is not a class, so
	it is removed here."

	Smalltalk removeKey: self class sideEffectGlobalName ifAbsent: [ nil ].
	super tearDown! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:48:02 am (UTC)'!
!methodProperties: {}!
answerOf: aToolName

	^client callTool: aToolName with: Dictionary new! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:06 pm (UTC)'!
!methodProperties: {}!
arguments: aKey being: aValue

	^Dictionary new
		at: aKey put: aValue;
		yourself! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:12 pm (UTC)'!
!methodProperties: {}!
arguments: aKey being: aValue and: anotherKey being: anotherValue

	^Dictionary new
		at: aKey put: aValue;
		at: anotherKey put: anotherValue;
		yourself! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 8:22:43 pm (UTC)'!
!methodProperties: {}!
arguments: aKey being: aValue and: anotherKey being: anotherValue and: aThirdKey being: aThirdValue

	^Dictionary new
		at: aKey put: aValue;
		at: anotherKey put: anotherValue;
		at: aThirdKey put: aThirdValue;
		yourself! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 6:33:22 pm (UTC)'!
!methodProperties: {}!
createdClassInTest

	"Answer the class the tests create through the server, or nil when it is not in the system.
	The name is a string and not a symbol on purpose: a symbol would be a reference to the
	class, and renaming it in a test would rewrite this method along with the rest."

	^Smalltalk classNamed: 'MCPTestSubject'
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
!methodProperties: {}!
defineClassWith: aDefinition

	^client callTool: 'smalltalk_define_class' with: (self arguments: 'definition' being: aDefinition)
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
!methodProperties: {}!
defineMethodIn: aClassName source: aSource

	^client callTool: 'smalltalk_define_method' with:
		(self arguments: 'className' being: aClassName and: 'source' being: aSource)
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:34 pm (UTC)'!
!methodProperties: {}!
defineTestSubjectClass

	^client callTool: 'smalltalk_define_class' with: (self arguments: 'definition' being: self subjectClassDefinition)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:43 pm (UTC)'!
!methodProperties: {}!
defineTestSubjectMethod

	^client callTool: 'smalltalk_define_method' with:
		(self arguments: 'className' being: 'MCPTestSubject' and: 'source' being: self subjectMethodSource)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:41 pm (UTC)'!
!methodProperties: {}!
defineTestSubjectSubclass

	^client callTool: 'smalltalk_define_class' with: (self arguments: 'definition' being: self subjectSubclassDefinition)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:50 pm (UTC)'!
!methodProperties: {}!
definitionOf: aClassName subclassOf: aSuperclassName

	"Answer the definition a client sends to create aClassName in the class category these
	tests clean up."

	^aSuperclassName, ' subclass: #', aClassName, '
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:44 pm (UTC)'!
!methodProperties: {}!
definitionOf: aClassName subclassOf: aSuperclassName instanceVariableNames: someInstanceVariableNames classVariableNames: someClassVariableNames

	^aSuperclassName, ' subclass: #', aClassName, '
	instanceVariableNames: ''', someInstanceVariableNames, '''
	classVariableNames: ''', someClassVariableNames, '''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:55:57 pm (UTC)'!
!methodProperties: {}!
jsonAnswerOf: aToolName with: anArguments

	"Answer the parsed value of a tool that answers JSON."

	^Json readFrom: (client callTool: aToolName with: anArguments) readStream! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:48:42 am (UTC)'!
!methodProperties: {}!
serverClass

	^MCPServer
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:18 pm (UTC)'!
!methodProperties: {}!
serverErrorTextFor: anErrorDescription

	"Answer the text the server puts on the wire when a tool fails: it sends the description
	of the exception, which starts with the name of its class."

	^'Error: ', anErrorDescription! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:47:50 am (UTC)'!
!methodProperties: {}!
smalltalkForTheServer

	"The image the server I serve works on. A test that watches what the server does to the
	image answers itself instead, and plays the part."

	^Smalltalk! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:52 pm (UTC)'!
!methodProperties: {}!
subjectClassDefinition

	^self definitionOf: 'MCPTestSubject' subclassOf: 'Object'! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:33 pm (UTC)'!
!methodProperties: {}!
subjectMethodSource

	"Answer a method whose comment and literal carry non ascii characters, so that a test
	using it also checks they survive the trip through the transport."

	^'saludo

	"Un comentario con acentos: ñ, é y 日本語."

	^''¡Hola, Hernán!!'''! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:54 pm (UTC)'!
!methodProperties: {}!
subjectSubclassDefinition

	^self definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'! !

!MCPToolsTest class methodsFor: 'test constants' stamp: 'HAW 27/Aug/2026, 6:10:18 pm (UTC)'!
!methodProperties: {}!
sideEffectGlobalName

	"Answer the name a rejected definition would bind if the server evaluated it anyway."

	^#MCPTestSideEffect! !

!MCPToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:48:42 am (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	"The leading and trailing underscores keep it out of every package, and it carries no
	hyphen so that Cuis does not register a package for a root category named after part of it."

	^'__MCPServerTestData__'

! !

!MCPToolsTest class methodsFor: 'testing' stamp: 'HAW 27/Aug/2026, 10:11:09 pm (UTC)'!
!methodProperties: {}!
isAbstract

	^self hasSubclasses ! !

!MCPDebuggingToolsTest methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 12:49:13 am (UTC)'!
!methodProperties: {}!
tearDown

	"Leave no debugger open behind me, whatever the test did with one."

	MCPDebuggingSession finishCurrent.

	super tearDown! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:49:19 am (UTC)'!
!methodProperties: {}!
answerOfEvaluatingToDebug: aCodeString

	^client
		callTool: 'smalltalk_evaluate_to_debug_on_error'
		with: (self arguments: 'code' being: aCodeString)! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:20:11 pm (UTC)'!
!methodProperties: {}!
debuggerWindowsOnScreen

	^DebuggerWindow allInstances select: [ :eachWindow |
		eachWindow world notNil and: [ eachWindow label = MCPOpenDebuggingSession debuggerLabel ] ]
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
failingCode

	^'nil error: ''boom'''
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:51:26 pm (UTC)'!
!methodProperties: {}!
openADebugger

	| answer |

	answer := self answerOfEvaluatingToDebug: self failingCode.
	self waitForTheDebuggerWindow.
	
	^answer 
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:23:18 pm (UTC)'!
!methodProperties: {}!
waitForTheDebuggerWindow

	"The window is put on screen by the process that draws morphs and not by the one that
	answered the request, so it is not there the moment the tool answers. Finishing cannot
	close a window that has not been put up yet, which is why every test that leaves a
	debugger waits for it before it ends."

	| attempts |

	attempts := 0.
	[ self debuggerWindowsOnScreen isEmpty and: [ attempts < 200 ] ] whileTrue: [
		attempts := attempts + 1.
		(Delay forMilliseconds: 20) wait ]
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testFinishingWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_finish_debugging')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'finish')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testGoingThroughWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_through')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'through')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testProceedingWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_proceed')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'proceed')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testRestartingWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_restart')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'restart')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testSteppingIntoWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_stepinto')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepInto')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testSteppingOverWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_stepover')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepOver')
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testEvaluatingCodeThatDoesNotFailAnswersItsResult

	self assert: (self answerOfEvaluatingToDebug: '6 * 7') equals: '42'
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
testEvaluatingCodeThatDoesNotFailLeavesNoDebugger

	self answerOfEvaluatingToDebug: '6 * 7'.

	self
		assert: (self answerOf: 'smalltalk_debugger_stepover')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepOver')
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:52:08 pm (UTC)'!
!methodProperties: {}!
testEvaluatingCodeThatFailsAnswersTheErrorItRaised

	| answer |

	answer := self openADebugger.

	self assert: answer equals: 'Error: boom' printString

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:20:11 pm (UTC)'!
!methodProperties: {}!
testEvaluatingCodeThatFailsOpensADebugger

	self openADebugger.

	self assert: self debuggerWindowsOnScreen size equals: 1

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:35:06 pm (UTC)'!
!methodProperties: {}!
testFinishingClosesTheDebuggerWindow

	self openADebugger.
	
	self assert: (self answerOf: 'smalltalk_finish_debugging') equals: 'Finished'.

	self assert: self debuggerWindowsOnScreen isEmpty

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 26/Aug/2026, 10:24:11 pm (UTC)'!
!methodProperties: {}!
testFinishingClosesTheDebuggerWindowThatIsNotOnScreenYet

	"The window is put up by the process that draws morphs, so it is not there yet when the
	tool that opened it answers. Finishing right then has to close it just the same, or it
	turns up afterwards with no session holding it and nothing able to close it."

	self answerOfEvaluatingToDebug: self failingCode.

	self assert: (self answerOf: 'smalltalk_finish_debugging') equals: 'Finished'.

	self assert: self debuggerWindowsOnScreen isEmpty

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testFinishingLeavesNoDebuggerToDrive

	self openADebugger.

	self assert: (self answerOf: 'smalltalk_finish_debugging') equals: 'Finished'.
	self
		assert: (self answerOf: 'smalltalk_debugger_stepover')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepOver')
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testGoingThroughDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_through'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testProceedingRunsTheDebuggedProcessToItsEnd

	self openADebugger.

	self assert: (self answerOf: 'smalltalk_debugger_proceed') equals: 'Proceeded'
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testRestartingDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_restart'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testSteppingIntoDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_stepinto'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
testSteppingOverDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_stepover'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testEvaluateAnswersThePrintStringOfTheResult

	self assert: (self evaluate: '3 + 4') equals: '7'! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testEvaluateDecodesNonAsciiCharacters

	"An accented character travels as the two bytes of its utf8 encoding. Unless the
	transport decodes them, the compiler reads a two character string instead of one."

	self assert: (self evaluate: '''é'' size') equals: '1'! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:48:42 am (UTC)'!
!methodProperties: {}!
testSavingTheImageAnswersTheNameOfTheImageItSaved

	self assert: (self answerOf: 'smalltalk_save_image') equals: 'Image saved: ', self imageName! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:48:47 am (UTC)'!
!methodProperties: {}!
testSavingTheImageSavesItOnce

	self answerOf: 'smalltalk_save_image'.

	self assert: savedImageCount equals: 1! !

!MCPImageToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
evaluate: aCodeString

	^client callTool: 'smalltalk_evaluate' with: (self arguments: 'code' being: aCodeString)! !

!MCPImageToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:48:22 am (UTC)'!
!methodProperties: {}!
smalltalkForTheServer

	"I am the image the server saves, so that saving it in a test writes nothing to disk and I
	can be asked afterwards what the server did to me."

	^self! !

!MCPImageToolsTest methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 12:48:15 am (UTC)'!
!methodProperties: {}!
setUp

	super setUp.
	savedImageCount := 0! !

!MCPImageToolsTest methodsFor: 'smalltalk protocol' stamp: 'HAW 28/Aug/2026, 12:48:28 am (UTC)'!
!methodProperties: {}!
imageName

	^'/somewhere/Cuis-UnderTest.image'! !

!MCPImageToolsTest methodsFor: 'smalltalk protocol' stamp: 'HAW 28/Aug/2026, 12:48:35 am (UTC)'!
!methodProperties: {}!
saveImage

	savedImageCount := savedImageCount + 1! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
!methodProperties: {}!
defineTestSubjectMethodIn: aMethodCategory

	^client callTool: 'smalltalk_define_method' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'source' being: self subjectMethodSource
		and: 'category' being: aMethodCategory)
! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
definitionWithANonLiteralClassName

	^'Object subclass: someName
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
!methodProperties: {}!
jsonAnswerOf: aToolName

	^self jsonAnswerOf: aToolName with: Dictionary new! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
!methodProperties: {}!
propertyNamed: aPropertyName of: aToolName

	"Answer the property the server really reads for aToolName, so a test asserting on the
	message a missing argument produces asks the object that produces it."

	^(server toolNamed: aToolName) properties
		detect: [ :eachProperty | eachProperty name = aPropertyName ]
! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testBrowseAnswersTheSuperclassOfTheClass

	self defineTestSubjectClass.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_browse' with: (self arguments: 'className' being: 'MCPTestSubject')) at: 'superclass')
		equals: 'Object'! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testHierarchyAnswersTheClassAndAllItsSuperclasses

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_hierarchy' 
			with: (self arguments: 'className' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubject' 'Object' 'ProtoObject')! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testListClassesAnswersOnlyTheClassesWithTheGivenPrefix

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_list_classes' 
			with: (self arguments: 'prefix' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubject')! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testSubclassesAnswersTheDirectSubclassesOfTheClass

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_subclasses' 
			with: (self arguments: 'className' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubjectChild')! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a method' stamp: 'HAW 27/Aug/2026, 7:07:13 pm (UTC)'!
!methodProperties: {}!
testMethodSourceAnswersTheSourceOfTheMethodWithItsNonAsciiCharacters

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_method_source'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'saludo')) at: 'source')
		equals: self subjectMethodSource

! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a method' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testMethodSourceOfAnUnknownClassFails

	self
		should: [ client 
			callTool: 'smalltalk_method_source' 
			with: (self arguments: 'className' being: 'NoSuchClassAtAll' and: 'selector' being: 'anything') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: 'Class not found: NoSuchClassAtAll')! !

!MCPModelStructureToolsTest methodsFor: 'tests - class categories' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testClassesInCategoryAnswersTheClassesOfThatCategory

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_classes_in_category' 
			with: (self arguments: 'category' being: self classCategoryOfTestData)) asArray
		equals: #('MCPTestSubject')! !

!MCPModelStructureToolsTest methodsFor: 'tests - class categories' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testListCategoriesIncludesTheCategoryOfTheServer

	self assert: ((self jsonAnswerOf: 'smalltalk_list_categories') includes: MCPServer category)! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
!methodProperties: {}!
testClassOrganizationAnswersTheMethodCategoriesOfTheClassSideWhenItIsNamed

	self defineTestSubjectClass.
	client callTool: 'smalltalk_define_method' with: (self
		arguments: 'className' being: 'MCPTestSubject class'
		and: 'source' being: 'saludoDeClase

	^''¡Hola!!'''
		and: 'category' being: 'saludos').

	self
		assert: ((self jsonAnswerOf: 'smalltalk_class_organization'
			with: (self arguments: 'className' being: 'MCPTestSubject class')) at: 'saludos')
		equals: #('saludoDeClase')
! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
!methodProperties: {}!
testClassOrganizationAnswersTheSelectorsFiledUnderEachMethodCategory

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_class_organization'
			with: (self arguments: 'className' being: 'MCPTestSubject')) at: 'saludos')
		equals: #('saludo')
! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:23:25 pm (UTC)'!
!methodProperties: {}!
testClassifyMethodAnswersWhereTheMethodWasFiledBefore

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_classify_method' with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'saludo'
			and: 'category' being: 'despedidas')) at: 'wasUnder')
		equals: 'saludos'! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:23:10 pm (UTC)'!
!methodProperties: {}!
testClassifyMethodFilesTheMethodUnderTheCategoryNamed

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	client callTool: 'smalltalk_classify_method' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'selector' being: 'saludo'
		and: 'category' being: 'despedidas').

	self assert: (self createdClassInTest organization categoryOfElement: #saludo) equals: 'despedidas'! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:23:19 pm (UTC)'!
!methodProperties: {}!
testClassifyMethodTakesAwayTheCategoryItLeftEmpty

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	client callTool: 'smalltalk_classify_method' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'selector' being: 'saludo'
		and: 'category' being: 'despedidas').

	self deny: (self createdClassInTest organization categories includes: 'saludos')! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
!methodProperties: {}!
testMethodsInACategoryAnswerTheSelectorsFiledUnderIt

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: (self jsonAnswerOf: 'smalltalk_methods_in_category'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'category' being: 'saludos'))
		equals: #('saludo')
! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 12:28:59 am (UTC)'!
!methodProperties: {}!
testMethodsInACategoryTheClassDoesNotHaveFails

	self defineTestSubjectClass.

	self
		should: [ client
			callTool: 'smalltalk_methods_in_category'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'category' being: 'despedidas') ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(MCPModelStructureTools methodCategoryNotFoundErrorDescriptionFor: 'despedidas' in: self createdClassInTest))

! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassCreatesTheClass

	self defineTestSubjectClass.

	self assert: self createdClassInTest notNil! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassDoesNotEvaluateADefinitionThatDoesNotCreateAClass

	"A definition that is turned down has to be turned down before it is evaluated, or a
	request that is not a class definition would change the image anyway."

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: 'Smalltalk at: #MCPTestSideEffect put: 42') ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: anError messageText
				equals: (self serverErrorTextFor: (MCPDefineClassTool isNotAClassCreationMessageErrorDescriptionFor: #at:put:)).
			self deny: (Smalltalk includesKey: self class sideEffectGlobalName) ]! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheClassNameIsNotALiteral

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self definitionWithANonLiteralClassName) ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool classNameIsNotALiteralErrorDescription)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionDoesNotSendAClassCreationMessage

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: (MCPDefineClassTool isNotAClassCreationMessageErrorDescriptionFor: #+))! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionHasMoreThanOneStatement

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self subjectClassDefinition , '. 3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool isNotASingleMessageSendErrorDescription)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionIsNotAMessageSend

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool isNotASingleMessageSendErrorDescription)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineClassWithoutADefinitionFails

	self
		should: [ client callTool: 'smalltalk_define_class' ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(self propertyNamed: 'definition' of: 'smalltalk_define_class') notProvidedErrorDescription)

! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDeleteClassRemovesTheClassFromTheSystem

	self defineTestSubjectClass.

	client callTool: 'smalltalk_delete_class' with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: self createdClassInTest isNil! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineMethodAddsTheMethodToTheClass

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self assert: (self createdClassInTest includesSelector: #saludo)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineMethodFilesTheMethodUnderTheGivenCategory

	self defineTestSubjectClass.

	client callTool: 'smalltalk_define_method' with:
		(self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'source' being: self subjectMethodSource
			and: 'category' being: 'saludos').

	self assert: (self createdClassInTest organization categoryOfElement: #saludo) equals: 'saludos'! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDefineMethodWithoutACategoryFilesTheMethodUnderTheDefaultCategory

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		assert: (self createdClassInTest organization categoryOfElement: #saludo)
		equals: ClassOrganizer defaultMethodCategory! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
testDeleteMethodRemovesTheMethodFromTheClass

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	client callTool: 'smalltalk_delete_method' with:
		(self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'saludo').

	self deny: (self createdClassInTest includesSelector: #saludo)! !

!MCPRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:08:37 pm (UTC)'!
!methodProperties: {}!
applyRefactoring: aToolName with: anArguments

	^client callTool: aToolName with: anArguments
! !

!MCPRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
!methodProperties: {}!
arguments: aKey being: aValue and: anotherKey being: anotherValue and: aThirdKey being: aThirdValue and: aFourthKey being: aFourthValue

	^Dictionary new
		at: aKey put: aValue;
		at: anotherKey put: anotherValue;
		at: aThirdKey put: aThirdValue;
		at: aFourthKey put: aFourthValue;
		yourself

! !

!MCPRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
!methodProperties: {}!
defineTestSubjectSiblingImplementingProbe

	"A class of its own implementing the same selector, which is what a scope narrower than
	the system has to leave alone."

	self defineClassWith: (self definitionOf: 'MCPTestSibling' subclassOf: 'Object').
	self defineMethodIn: 'MCPTestSibling' source: 'mcpProbe

	^42'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testAddInstanceVariableRefactoringAddsItToTheClass

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_add_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'addedVariable').

	self assert: (self createdClassInTest instVarNames includes: 'addedVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testAddInstanceVariableRefactoringAnswersTheDefinitionOfTheClass

	self defineTestSubjectClass.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_add_instance_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'addedVariable'))
		equals: 'Refactoring applied. 1 class changed:' , String newLineString , String newLineString ,
			self createdClassInTest definition
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushDownInstanceVariableRefactoringMovesItToTheSubclasses

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'travellingVariable' classVariableNames: '').
	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'
		instanceVariableNames: '' classVariableNames: '').

	self applyRefactoring: 'smalltalk_refactor_push_down_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'travellingVariable').

	self deny: (self createdClassInTest instVarNames includes: 'travellingVariable').
	self assert: ((Smalltalk classNamed: #MCPTestSubjectChild) instVarNames includes: 'travellingVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushUpInstanceVariableRefactoringAnswersTheDefinitionsOfTheClassesItChanged

	"The definitions say where the variable ended up, which is what a client asks the classes
	after moving one."

	self defineTestSubjectClass.
	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'
		instanceVariableNames: 'travellingVariable' classVariableNames: '').

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_push_up_instance_variable'
			with: (self arguments: 'className' being: 'MCPTestSubjectChild' and: 'variableName' being: 'travellingVariable'))
		equals: 'Refactoring applied. 2 classes changed:' , String newLineString , String newLineString ,
			self createdClassInTest definition , String newLineString , String newLineString ,
			(Smalltalk classNamed: 'MCPTestSubjectChild') definition
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushUpInstanceVariableRefactoringMovesItToTheSuperclass

	self defineTestSubjectClass.
	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'
		instanceVariableNames: 'travellingVariable' classVariableNames: '').

	self applyRefactoring: 'smalltalk_refactor_push_up_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubjectChild' and: 'variableName' being: 'travellingVariable').

	self assert: (self createdClassInTest instVarNames includes: 'travellingVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRemoveInstanceVariableRefactoringRemovesItFromTheClass

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'doomedVariable' classVariableNames: '').

	self applyRefactoring: 'smalltalk_refactor_remove_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'doomedVariable').

	self deny: (self createdClassInTest instVarNames includes: 'doomedVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRemoveUnreferencedInstanceVariablesRefactoringAnswersTheVariablesItRemoved

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'usedVariable unusedVariable' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeUsingIt

	^usedVariable printString'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_remove_unreferenced_instance_variables'
			with: (self arguments: 'className' being: 'MCPTestSubject'))
		equals: 'Refactoring applied. 1 instance variable removed: unusedVariable'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRemoveUnreferencedInstanceVariablesRefactoringRemovesOnlyTheUnusedOnes

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'usedVariable unusedVariable' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeUsingIt

	^usedVariable printString'.

	self applyRefactoring: 'smalltalk_refactor_remove_unreferenced_instance_variables'
		with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: (self createdClassInTest instVarNames includes: 'usedVariable').
	self deny: (self createdClassInTest instVarNames includes: 'unusedVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameInstanceVariableRefactoringAnswersTheMethodsItChanged

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'oldVariable' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeUsingIt

	^oldVariable printString'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_rename_instance_variable'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'variableName' being: 'oldVariable'
				and: 'newVariableName' being: 'newVariable'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubject>>#mcpProbeUsingIt'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameInstanceVariableRefactoringRenamesItEverywhereItIsUsed

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'oldVariable' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeUsingIt

	^oldVariable printString'.

	self applyRefactoring: 'smalltalk_refactor_rename_instance_variable'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'variableName' being: 'oldVariable'
			and: 'newVariableName' being: 'newVariable').

	self assert: (self createdClassInTest instVarNames includes: 'newVariable').
	self assert: ((self createdClassInTest sourceCodeAt: #mcpProbeUsingIt) includesSubstring: 'newVariable' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInsertSuperclassRefactoringAnswersTheClassItCreated

	self defineTestSubjectClass.

	self
		assert: ((self applyRefactoring: 'smalltalk_refactor_insert_superclass'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'newClassName' being: 'MCPTestSubjectChild'))
				includesSubstring: 'Object subclass: #MCPTestSubjectChild' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInsertSuperclassRefactoringPutsTheNewClassBetween

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_insert_superclass'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'newClassName' being: 'MCPTestSubjectChild').

	self assert: self createdClassInTest superclass name equals: #MCPTestSubjectChild
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameClassRefactoringAnswersTheMethodsItChanged

	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectToRename' subclassOf: 'Object'
		instanceVariableNames: '' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubjectToRename' source: 'mcpProbeNamingItsClass

	^MCPTestSubjectToRename'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_rename_class'
			with: (self
				arguments: 'className' being: 'MCPTestSubjectToRename'
				and: 'newClassName' being: 'MCPTestSubjectRenamed'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubjectRenamed>>#mcpProbeNamingItsClass'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameClassRefactoringRenamesTheClass

	"The class renamed here is one of its own, and not the subject the other tests share,
	because renaming a class rewrites every method that names it, this test case included."

	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectToRename' subclassOf: 'Object'
		instanceVariableNames: '' classVariableNames: '').

	self applyRefactoring: 'smalltalk_refactor_rename_class'
		with: (self
			arguments: 'className' being: 'MCPTestSubjectToRename'
			and: 'newClassName' being: 'MCPTestSubjectRenamed').

	self assert: (Smalltalk classNamed: 'MCPTestSubjectToRename') isNil.
	self assert: (Smalltalk classNamed: 'MCPTestSubjectRenamed') notNil

! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameGlobalRefactoringAnswersTheMethodsItChanged

	[ Smalltalk at: 'MCPTestGlobalProbe' asSymbol put: 42.
	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeNamingTheGlobal

	^MCPTestGlobalProbe'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_rename_global'
			with: (self
				arguments: 'globalName' being: 'MCPTestGlobalProbe'
				and: 'newGlobalName' being: 'MCPTestGlobalProbeRenamed'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubject>>#mcpProbeNamingTheGlobal' ]
		ensure: [
			Smalltalk removeKey: 'MCPTestGlobalProbe' asSymbol ifAbsent: [ nil ].
			Smalltalk removeKey: 'MCPTestGlobalProbeRenamed' asSymbol ifAbsent: [ nil ] ]
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameGlobalRefactoringRenamesItEverywhereItIsNamed

	[ Smalltalk at: 'MCPTestGlobalProbe' asSymbol put: 42.

	self applyRefactoring: 'smalltalk_refactor_rename_global'
		with: (self
			arguments: 'globalName' being: 'MCPTestGlobalProbe'
			and: 'newGlobalName' being: 'MCPTestGlobalProbeRenamed').

	self assert: (Smalltalk includesKey: 'MCPTestGlobalProbeRenamed' asSymbol).
	self deny: (Smalltalk includesKey: 'MCPTestGlobalProbe' asSymbol) ]
		ensure: [
			Smalltalk removeKey: 'MCPTestGlobalProbe' asSymbol ifAbsent: [ nil ].
			Smalltalk removeKey: 'MCPTestGlobalProbeRenamed' asSymbol ifAbsent: [ nil ] ]

! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testSafelyRemoveClassRefactoringAnswersTheClassesItRemoved

	"The name is all that is left of a class that is out of the system, so it is what a client
	is told."

	self defineTestSubjectClass.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_safely_remove_class'
			with: (self arguments: 'className' being: 'MCPTestSubject'))
		equals: 'Refactoring applied. 1 class removed: MCPTestSubject'

! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testSafelyRemoveClassRefactoringRemovesAClassNothingUses

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_safely_remove_class'
		with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: self createdClassInTest isNil

! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testAddParameterRefactoringGivesTheSendersTheValueToPass

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self applyRefactoring: 'smalltalk_refactor_add_parameter'
		with: (self
			arguments: 'selector' being: 'mcpProbe'
			and: 'parameterName' being: 'anArgument'
			and: 'parameterValue' being: '7').

	self assert: (self createdClassInTest includesSelector: 'mcpProbe:' asSymbol).
	self assert: ((self createdClassInTest sourceCodeAt: #mcpProbeCaller) includesSubstring: 'self mcpProbe: 7' caseSensitive: true)

! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testChangeKeywordsOrderRefactoringReordersThemInTheSendersToo

	"Reordering keeps the keywords and only moves them, so the new selector is made of the
	very same keywords in another order, and every sender has its arguments moved with them."

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeFirst: aFirstArgument second: aSecondArgument

	^aFirstArgument'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbeFirst: 1 second: 2'.

	self applyRefactoring: 'smalltalk_refactor_change_keywords_order'
		with: (self
			arguments: 'selector' being: 'mcpProbeFirst:second:'
			and: 'newSelector' being: 'second:mcpProbeFirst:').

	self assert: (self createdClassInTest includesSelector: 'second:mcpProbeFirst:' asSymbol).
	self assert: ((self createdClassInTest sourceCodeAt: #mcpProbeCaller) includesSubstring: 'second: 2 mcpProbeFirst: 1' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRemoveParameterRefactoringRemovesItFromTheSelectorAndTheSenders

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeWith: anArgument

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbeWith: 7'.

	self applyRefactoring: 'smalltalk_refactor_remove_parameter'
		with: (self arguments: 'selector' being: 'mcpProbeWith:' and: 'parameterName' being: 'anArgument').

	self assert: (self createdClassInTest includesSelector: 'mcpProbeWith' asSymbol).
	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbeCaller' asSymbol) includesSubstring: 'self mcpProbeWith' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameSelectorRefactoringAnswersTheMethodsItChanged

	"The new implementor and the sender are the methods that are still there, and the one the
	rename left behind is named as removed."

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_rename_selector'
			with: (self arguments: 'selector' being: 'mcpProbe' and: 'newSelector' being: 'mcpProbeRenamed'))
		equals: 'Refactoring applied. 2 methods changed:
MCPTestSubject>>#mcpProbeCaller
MCPTestSubject>>#mcpProbeRenamed
1 method removed:
MCPTestSubject>>#mcpProbe'

! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameSelectorRefactoringInAScopeNarrowerThanTheSystemNeedsAClassName

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		should: [ self applyRefactoring: 'smalltalk_refactor_rename_selector'
			with: (self
				arguments: 'selector' being: 'mcpProbe'
				and: 'newSelector' being: 'mcpProbeRenamed'
				and: 'scope' being: 'hierarchy') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPRefactoringToolGroup classNameNeededErrorDescription)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameSelectorRefactoringInAnUnknownScopeFails

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		should: [ self applyRefactoring: 'smalltalk_refactor_rename_selector'
			with: (self
				arguments: 'selector' being: 'mcpProbe'
				and: 'newSelector' being: 'mcpProbeRenamed'
				and: 'scope' being: 'package'
				and: 'className' being: 'MCPTestSubject') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: (MCPRefactoringToolGroup unknownScopeErrorDescriptionFor: 'package'))

! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameSelectorRefactoringInTheClassScopeLeavesTheOtherClassesAlone

	self defineTestSubjectClass.
	self defineTestSubjectMethod.
	self defineTestSubjectSiblingImplementingProbe.

	self applyRefactoring: 'smalltalk_refactor_rename_selector'
		with: (self
			arguments: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpProbeRenamed'
			and: 'scope' being: 'class'
			and: 'className' being: 'MCPTestSubject').

	self assert: ((Smalltalk classNamed: 'MCPTestSibling') includesSelector: 'mcpProbe' asSymbol)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameSelectorRefactoringInTheHierarchyScopeReachesTheSubclasses

	self defineTestSubjectClass.
	self defineTestSubjectMethod.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbe

	^43'.

	self applyRefactoring: 'smalltalk_refactor_rename_selector'
		with: (self
			arguments: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpProbeRenamed'
			and: 'scope' being: 'hierarchy'
			and: 'className' being: 'MCPTestSubject').

	self assert: ((Smalltalk classNamed: 'MCPTestSubjectChild') includesSelector: 'mcpProbeRenamed' asSymbol)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameSelectorRefactoringRenamesItInItsImplementorsAndItsSenders

	"The selectors are named here as strings, never as symbols, because renaming a selector
	rewrites every method that holds it, this test case included."

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self applyRefactoring: 'smalltalk_refactor_rename_selector'
		with: (self arguments: 'selector' being: 'mcpProbe' and: 'newSelector' being: 'mcpProbeRenamed').

	self assert: (self createdClassInTest includesSelector: #mcpProbeRenamed).
	self deny: (self createdClassInTest includesSelector: 'mcpProbe' asSymbol).
	self assert: ((self createdClassInTest sourceCodeAt: #mcpProbeCaller) includesSubstring: 'mcpProbeRenamed' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testAddAsSubclassResponsibilityRefactoringAnswersTheMethodItWrote

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbe

	^42'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_add_as_subclass_responsibility'
			with: (self arguments: 'className' being: 'MCPTestSubjectChild' and: 'selector' being: 'mcpProbe'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubject>>#mcpProbe'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testAddAsSubclassResponsibilityRefactoringDeclaresItInTheSuperclass

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbe

	^42'.

	self applyRefactoring: 'smalltalk_refactor_add_as_subclass_responsibility'
		with: (self arguments: 'className' being: 'MCPTestSubjectChild' and: 'selector' being: 'mcpProbe').

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'subclassResponsibility' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testMoveToInstanceOrClassMethodRefactoringAnswersTheMethodItWroteAndTheOneItRemoved

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_move_to_instance_or_class_method'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'mcpProbe'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubject class>>#mcpProbe
1 method removed:
MCPTestSubject>>#mcpProbe'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testMoveToInstanceOrClassMethodRefactoringMovesItToTheClassSide

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self applyRefactoring: 'smalltalk_refactor_move_to_instance_or_class_method'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'mcpProbe').

	self assert: (self createdClassInTest class includesSelector: 'mcpProbe' asSymbol).
	self deny: (self createdClassInTest includesSelector: 'mcpProbe' asSymbol)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushDownMethodToOneSubclassRefactoringAnswersTheMethodItWroteAndTheOneItRemoved

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_push_down_method_to_one_subclass'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'subclassName' being: 'MCPTestSubjectChild'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubjectChild>>#mcpProbe
1 method removed:
MCPTestSubject>>#mcpProbe'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushDownMethodToOneSubclassRefactoringMovesItThere

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self applyRefactoring: 'smalltalk_refactor_push_down_method_to_one_subclass'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'subclassName' being: 'MCPTestSubjectChild').

	self assert: ((Smalltalk classNamed: 'MCPTestSubjectChild') includesSelector: 'mcpProbe' asSymbol).
	self deny: (self createdClassInTest includesSelector: 'mcpProbe' asSymbol)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushDownMethodToSubclassesRefactoringAnswersTheMethodsItChanged

	"The method it came from is left saying it is the responsibility of the subclasses, so it
	is a method that changed and not one that went away."

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_push_down_method_to_subclasses'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'mcpProbe'))
		equals: 'Refactoring applied. 2 methods changed:
MCPTestSubject>>#mcpProbe
MCPTestSubjectChild>>#mcpProbe'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushDownMethodToSubclassesRefactoringGivesItToEverySubclass

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self applyRefactoring: 'smalltalk_refactor_push_down_method_to_subclasses'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'mcpProbe').

	self assert: ((Smalltalk classNamed: 'MCPTestSubjectChild') includesSelector: 'mcpProbe' asSymbol)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testPushUpMethodRefactoringAnswersTheMethodItWroteAndTheOneItRemoved

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbe

	^42'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_push_up_method'
			with: (self arguments: 'className' being: 'MCPTestSubjectChild' and: 'selector' being: 'mcpProbe'))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubject>>#mcpProbe
1 method removed:
MCPTestSubjectChild>>#mcpProbe'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - method' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testPushUpMethodRefactoringMovesItToTheSuperclass

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbe

	^42'.

	self applyRefactoring: 'smalltalk_refactor_push_up_method'
		with: (self arguments: 'className' being: 'MCPTestSubjectChild' and: 'selector' being: 'mcpProbe').

	self assert: (self createdClassInTest includesSelector: 'mcpProbe' asSymbol).
	self deny: ((Smalltalk classNamed: 'MCPTestSubjectChild') includesSelector: 'mcpProbe' asSymbol)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInlineTemporaryVariableRefactoringAnswersTheNewSourceOfTheMethod

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary + 1'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_inline_temporary_variable'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'variableName' being: 'aTemporary'
				and: 'text' being: 'aTemporary + 1'))
		equals: 'Refactoring applied. MCPTestSubject>>#mcpProbe is now:

mcpProbe

	^42 + 1'

! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInlineTemporaryVariableRefactoringRefusesATextTheMethodSaysTwice

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary + aTemporary'.

	self
		should: [ self applyRefactoring: 'smalltalk_refactor_inline_temporary_variable'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'variableName' being: 'aTemporary'
				and: 'text' being: 'aTemporary') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: (MCPRefactoringTools
			textFoundMoreThanOnceErrorDescriptionFor: 'aTemporary'
			in: (self createdClassInTest compiledMethodAt: 'mcpProbe' asSymbol)))

! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInlineTemporaryVariableRefactoringReplacesTheUseNamedByItsText

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary + 1'.

	self applyRefactoring: 'smalltalk_refactor_inline_temporary_variable'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'variableName' being: 'aTemporary'
			and: 'text' being: 'aTemporary + 1').

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: '^42 + 1' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameTemporaryRefactoringAnswersTheNewSourceOfTheMethod

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_rename_temporary'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'variableName' being: 'aTemporary'
				and: 'newVariableName' being: 'aRenamedTemporary'))
		equals: 'Refactoring applied. MCPTestSubject>>#mcpProbe is now:

mcpProbe

	| aRenamedTemporary |

	aRenamedTemporary := 42.
	^aRenamedTemporary'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
!methodProperties: {}!
testRenameTemporaryRefactoringRenamesItInEveryUseInsideTheMethod

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary'.

	self applyRefactoring: 'smalltalk_refactor_rename_temporary'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'variableName' being: 'aTemporary'
			and: 'newVariableName' being: 'aRenamedTemporary').

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'aRenamedTemporary' caseSensitive: true).
	self deny: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'aTemporary :=' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:37 pm (UTC)'!
!methodProperties: {}!
testTemporaryToInstanceVariableRefactoringAnswersTheNewSourceOfTheMethod

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary'.

	self
		assert: ((self applyRefactoring: 'smalltalk_refactor_temporary_to_instance_variable'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'variableName' being: 'aTemporary'))
				includesSubstring: 'MCPTestSubject>>#mcpProbe is now:' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - temporary' stamp: 'HAW 27/Aug/2026, 6:08:37 pm (UTC)'!
!methodProperties: {}!
testTemporaryToInstanceVariableRefactoringMovesItToTheClass

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	| aTemporary |

	aTemporary := 42.
	^aTemporary'.

	self applyRefactoring: 'smalltalk_refactor_temporary_to_instance_variable'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'variableName' being: 'aTemporary').

	self assert: (self createdClassInTest instVarNames includes: 'aTemporary')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractAsParameterRefactoringAnswersTheMethodsItChanged

	"The method that took the piece as a parameter is a new one, and the one it came from is
	gone, which the refactoring says apart from the methods that are still there."

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_extract_as_parameter'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'parameterName' being: 'aNumber'
				and: 'text' being: '42'))
		equals: 'Refactoring applied. 2 methods changed:
MCPTestSubject>>#mcpProbe:
MCPTestSubject>>#mcpProbeCaller
1 method removed:
MCPTestSubject>>#mcpProbe'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractAsParameterRefactoringGivesTheSendersThePieceToPass

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self applyRefactoring: 'smalltalk_refactor_extract_as_parameter'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'parameterName' being: 'aNumber'
			and: 'text' being: '42').

	self assert: (self createdClassInTest includesSelector: 'mcpProbe:' asSymbol).
	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbeCaller' asSymbol)
		includesSubstring: 'self mcpProbe: 42' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractMethodFromSimilarCodeMakesWhatDiffersAParameter

	"The piece named is sent with 1, and the code like it is sent with 2, so what differs
	between them is what the new method takes."

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpFoo: aNumber

	^aNumber'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	self mcpFoo: 1.
	self mcpFoo: 2.
	^self mcpFoo: 1'.

	self applyRefactoring: 'smalltalk_refactor_extract_method_from_similar_code'
		with: ((self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpExtracted:'
			and: 'argumentNames' being: 'aNumber')
				at: 'text' put: 'self mcpFoo: 1';
				yourself).

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpExtracted:' asSymbol)
		includesSubstring: 'self mcpFoo: aNumber' caseSensitive: true).
	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'self mcpExtracted: 2' caseSensitive: true).
	self deny: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'mcpFoo' caseSensitive: true)! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractMethodRefactoringAnswersTheMethodItCreatedAndTheOneItChanged

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42 + 1'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_extract_method'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'newSelector' being: 'mcpExtracted'
				and: 'text' being: '42 + 1'))
		equals: 'Refactoring applied. 2 methods changed:
MCPTestSubject>>#mcpExtracted
MCPTestSubject>>#mcpProbe'

! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractMethodRefactoringCreatesTheMethodAndSendsItInstead

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self applyRefactoring: 'smalltalk_refactor_extract_method'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpExtracted'
			and: 'text' being: '42').

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpExtracted' asSymbol)
		includesSubstring: '42' caseSensitive: true).
	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'self mcpExtracted' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractMethodRefactoringInTheClassLeavesThePieceInTheSubclassesAlone

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^3 + 4'.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbeInTheChild

	^3 + 4'.

	self applyRefactoring: 'smalltalk_refactor_extract_method'
		with: ((self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpExtracted'
			and: 'text' being: '3 + 4')
				at: 'replacing' put: 'class';
				yourself).

	self assert: (((Smalltalk classNamed: 'MCPTestSubjectChild') sourceCodeAt: 'mcpProbeInTheChild' asSymbol)
		includesSubstring: '^3 + 4' caseSensitive: true)

! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractMethodRefactoringInTheHierarchyReplacesThePieceInTheSubclassesToo

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^3 + 4'.
	self defineTestSubjectSubclass.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbeInTheChild

	^3 + 4'.

	self applyRefactoring: 'smalltalk_refactor_extract_method'
		with: ((self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpExtracted'
			and: 'text' being: '3 + 4')
				at: 'replacing' put: 'hierarchy';
				yourself).

	self assert: (((Smalltalk classNamed: 'MCPTestSubjectChild') sourceCodeAt: 'mcpProbeInTheChild' asSymbol)
		includesSubstring: 'self mcpExtracted' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
!methodProperties: {}!
testExtractMethodRefactoringWithinTheMethodReplacesEverySamePiece

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^(3 + 4) * (3 + 4)'.

	self applyRefactoring: 'smalltalk_refactor_extract_method'
		with: ((self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'newSelector' being: 'mcpExtracted'
			and: 'text' being: '3 + 4')
				at: 'replacing' put: 'method';
				yourself).

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: '(self mcpExtracted) * (self mcpExtracted)' caseSensitive: true)

! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testExtractToTemporaryRefactoringAnswersTheNewSourceOfTheMethod

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42 + 1'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_extract_to_temporary'
			with: (self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'variableName' being: 'aNumber'
				and: 'text' being: '42'))
		equals: 'Refactoring applied. MCPTestSubject>>#mcpProbe is now:

mcpProbe

	| aNumber |
	aNumber := 42.
	^aNumber + 1'

! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testExtractToTemporaryRefactoringExtractsThePieceNamedByItsText

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42 + 1'.

	self applyRefactoring: 'smalltalk_refactor_extract_to_temporary'
		with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'variableName' being: 'aNumber'
			and: 'text' being: '42').

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'aNumber := 42' caseSensitive: true).
	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: '^aNumber + 1' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testExtractToTemporaryRefactoringReplacingAllReplacesEverySameExpression

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^(42 + 1) * (42 + 1)'.

	self applyRefactoring: 'smalltalk_refactor_extract_to_temporary'
		with: ((self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'variableName' being: 'aNumber'
			and: 'text' being: '42 + 1')
				at: 'replaceAll' put: 'true';
				yourself).

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: 'aNumber := 42 + 1' caseSensitive: true).
	self assert: ((self createdClassInTest sourceCodeAt: 'mcpProbe' asSymbol)
		includesSubstring: '^(aNumber) * (aNumber)' caseSensitive: true)! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInlineMethodRefactoringAnswersTheMethodsItChanged

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^10'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpCallerOfIt

	^self mcpProbe'.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_inline_method'
			with: ((self
				arguments: 'className' being: 'MCPTestSubject'
				and: 'selector' being: 'mcpProbe'
				and: 'senderClassName' being: 'MCPTestSubject'
				and: 'senderSelector' being: 'mcpCallerOfIt')
					at: 'text' put: 'mcpProbe';
					yourself))
		equals: 'Refactoring applied. 1 method changed:
MCPTestSubject>>#mcpCallerOfIt'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - extraction' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
!methodProperties: {}!
testInlineMethodRefactoringReplacesTheSendByWhatTheMethodDoes

	"The send is named by the text of its selector, which the sending method has to say once,
	so the method that sends it is not named after the one being inlined."

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^10'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpCallerOfIt

	^self mcpProbe'.

	self applyRefactoring: 'smalltalk_refactor_inline_method'
		with: ((self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selector' being: 'mcpProbe'
			and: 'senderClassName' being: 'MCPTestSubject'
			and: 'senderSelector' being: 'mcpCallerOfIt')
				at: 'text' put: 'mcpProbe';
				yourself).

	self assert: ((self createdClassInTest sourceCodeAt: 'mcpCallerOfIt' asSymbol)
		includesSubstring: '^10' caseSensitive: true)

! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
expressionsFoundWith: anArguments

	^(self jsonAnswerOf: 'smalltalk_find_messages_by_example' with: anArguments)
		collect: [ :eachMessageFound | eachMessageFound at: 'expression' ]
! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
messagesFoundWith: anArguments

	"Answer the name of each message the finder found, which is what names it in the image."

	^(self jsonAnswerOf: 'smalltalk_find_messages_by_example' with: anArguments)
		collect: [ :eachMessageFound | eachMessageFound at: 'message' ]
! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
methodsFoundBy: aToolName with: anArguments

	^((self jsonAnswerOf: aToolName with: anArguments) at: 'methods') asSortedCollection asArray

! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
!methodProperties: {}!
phraseNoOtherMethodCarries

	"Built out of pieces so that the source of this method does not carry the phrase itself,
	which would make the search that looks for it find this method too."

	^'una ', 'frase ', 'que ', 'nadie ', 'mas ', 'dice'
! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
!methodProperties: {}!
sortedAnswerOf: aToolName with: anArguments

	^(self jsonAnswerOf: aToolName with: anArguments) asSortedCollection asArray
! !

!MCPSearchToolsTest methodsFor: 'tests - senders and implementors' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
testImplementorsOfAnswersEveryMethodThatImplementsTheSelector

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self
		assert: (self methodsFoundBy: 'smalltalk_implementors_of' with: (self arguments: 'selector' being: 'mcpProbe'))
		equals: #('MCPTestSubject mcpProbe')
! !

!MCPSearchToolsTest methodsFor: 'tests - senders and implementors' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
testSendersOfAnswersEveryMethodThatSendsTheSelector

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self
		assert: (self methodsFoundBy: 'smalltalk_senders_of' with: (self arguments: 'selector' being: 'mcpProbe'))
		equals: #('MCPTestSubject mcpProbeCaller')
! !

!MCPSearchToolsTest methodsFor: 'tests - references' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
testReferencesToAClassAnswerEveryMethodThatNamesIt

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeNamingItsClass

	^MCPTestSubject'.

	self
		assert: (self methodsFoundBy: 'smalltalk_references_to_class' with: (self arguments: 'className' being: 'MCPTestSubject'))
		equals: #('MCPTestSubject mcpProbeNamingItsClass')
! !

!MCPSearchToolsTest methodsFor: 'tests - references' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
testReferencesToAClassVariableIncludeTheSubclassesThatSeeIt

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: '' classVariableNames: 'ProbeVariable').
	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'
		instanceVariableNames: '' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeWriting

	ProbeVariable := 42'.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbeReading

	^ProbeVariable'.

	self
		assert: (self methodsFoundBy: 'smalltalk_references_to_class_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'ProbeVariable'))
		equals: #('MCPTestSubject mcpProbeWriting' 'MCPTestSubjectChild mcpProbeReading')

! !

!MCPSearchToolsTest methodsFor: 'tests - references' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testReferencesToAClassVariableTheClassDoesNotHaveFails

	self defineTestSubjectClass.

	self
		should: [ client
			callTool: 'smalltalk_references_to_class_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'NoSuchVariable') ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(MCPServer classVariableNotFoundErrorDescriptionFor: 'NoSuchVariable' in: self createdClassInTest))

! !

!MCPSearchToolsTest methodsFor: 'tests - references' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
testReferencesToAnInstanceVariableIncludeTheSubclassesThatSeeIt

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'probeVariable' classVariableNames: '').
	self defineClassWith: (self
		definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'
		instanceVariableNames: '' classVariableNames: '').
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeWriting

	probeVariable := 42'.
	self defineMethodIn: 'MCPTestSubjectChild' source: 'mcpProbeReading

	^probeVariable printString'.

	self
		assert: (self methodsFoundBy: 'smalltalk_references_to_instance_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'probeVariable'))
		equals: #('[read] - MCPTestSubjectChild mcpProbeReading' '[write] - MCPTestSubject mcpProbeWriting')
! !

!MCPSearchToolsTest methodsFor: 'tests - references' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testReferencesToAnInstanceVariableTheClassDoesNotHaveFails

	self defineTestSubjectClass.

	self
		should: [ client
			callTool: 'smalltalk_references_to_instance_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'noSuchVariable') ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(MCPServer instanceVariableNotFoundErrorDescriptionFor: 'noSuchVariable' in: self createdClassInTest))
! !

!MCPSearchToolsTest methodsFor: 'tests - searching by text' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testSearchingSelectorsAnswersNoneWhenNoSelectorContainsTheText

	self
		assert: (self sortedAnswerOf: 'smalltalk_search_selectors' with: (self arguments: 'text' being: self phraseNoOtherMethodCarries))
		equals: #()

! !

!MCPSearchToolsTest methodsFor: 'tests - searching by text' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testSearchingSelectorsAnswersTheOnesWhoseNameContainsTheText

	self
		assert: (self sortedAnswerOf: 'smalltalk_search_selectors' with: (self arguments: 'text' being: 'pluralize'))
		equals: #('pluralize:')
! !

!MCPSearchToolsTest methodsFor: 'tests - searching by text' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
!methodProperties: {}!
testSearchingTheSourceAnswersEveryMethodWhoseTextContainsIt

	| phrase |

	phrase := self phraseNoOtherMethodCarries.
	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCarryingAPhrase

	"', phrase, '"

	^42'.

	self
		assert: (self methodsFoundBy: 'smalltalk_search_source' with: (self arguments: 'text' being: phrase))
		equals: #('MCPTestSubject mcpProbeCarryingAPhrase')

! !

!MCPSearchToolsTest methodsFor: 'tests - finding messages by example' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersNoneWhenNoMessageAnswersTheExpectedResult

	self
		assert: (self messagesFoundWith: (self
			arguments: 'receiver' being: '''method'''
			and: 'expected' being: '''zzz not the plural of anything'''))
		equals: #()
! !

!MCPSearchToolsTest methodsFor: 'tests - finding messages by example' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheBlockTheEnumeratingMessageNeeds

	"The block is built out of a message the elements of the collection understand, and it is
	only the expression that says which one, because the message found is just select:."

	self assert: ((self expressionsFoundWith: (self
		arguments: 'receiver' being: '#(1 2 3 4)'
		and: 'expected' being: '#(1 3)'))
			anySatisfy: [ :anExpression |
				anExpression includesSubstring: '[:aSmallInteger | aSmallInteger odd]' caseSensitive: true ])

! !

!MCPSearchToolsTest methodsFor: 'tests - finding messages by example' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheEnumeratingMessageACollectionAnswersTheResultWith

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '#(1 2 3 4)'
		and: 'expected' being: '#(1 3)')) includes: 'SequenceableCollection>>#select:')
! !

!MCPSearchToolsTest methodsFor: 'tests - finding messages by example' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheExpressionThatAnswersTheExpectedResult

	self assert: ((self expressionsFoundWith: (self
		arguments: 'receiver' being: '''method'''
		and: 'expected' being: '''methods''')) includes: '''method'' asPlural')
! !

!MCPSearchToolsTest methodsFor: 'tests - finding messages by example' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheMessageThatAnswersTheExpectedResult

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '''method'''
		and: 'expected' being: '''methods''')) includes: 'CharacterSequence>>#asPlural')
! !

!MCPSearchToolsTest methodsFor: 'tests - finding messages by example' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleSendsTheArgumentsItIsGiven

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '3'
		and: 'expected' being: '7'
		and: 'arguments' being: '#(4)')) includes: 'SmallInteger>>#+')
! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testCallingAnUnknownToolFails

	| invalidTool |
	
	invalidTool := 'no_such_tool'.
	
	self
		should: [ client callTool: invalidTool ]
		raise: Error
		withMessageText: (self serverErrorTextFor: 'Unknown tool: ', invalidTool)! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testEveryAdvertisedToolHasADescriptionAndAnInputSchema

	self assert: (
		client listTools allSatisfy: [ :eachToolDefinition |
			(eachToolDefinition includesKey: 'description') and: [ eachToolDefinition includesKey: 'inputSchema' ] ])! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testInitializeAnswersTheProtocolVersion

	self assert: (client initializeConnection at: 'protocolVersion') equals: '2024-11-05'! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testInitializeAnswersTheServerInformation

	self assert: (client initializeConnection includesKey: 'serverInfo')! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testInvalidJsonAnswersAParseError

	| response |

	response := client sendRaw: 'this is not json at all'.

	self assert: ((response at: 'error') at: 'message') equals: MCPServer parseErrorDescription! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
!methodProperties: {}!
testUnknownMethodAnswersAMethodNotFoundError

	| response |

	response := client sendMethod: 'no/such/method'.

	self assert: ((response at: 'error') at: 'message') equals: 'Unknown method: no/such/method'! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testRunningATestClassCountsTheTestsThatPassedFailedAndSignalled

	self defineTestCaseProbe.

	self
		assert: (self countsOfRunning: 'smalltalk_run_test_class'
			with: (self arguments: 'className' being: 'MCPTestProbeCase'))
		equals: #(1 1 1)
! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testRunningATestClassTellsTheTestThatFailedFromTheOneThatSignalled

	| answer |

	self defineTestCaseProbe.

	answer := self jsonAnswerOf: 'smalltalk_run_test_class'
		with: (self arguments: 'className' being: 'MCPTestProbeCase').

	self
		assert: (Array with: (answer at: 'failed') with: (answer at: 'errors'))
		equals: #(#('MCPTestProbeCase>>#testThatFails') #('MCPTestProbeCase>>#testThatSignals'))
! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testRunningOneTestMethodRunsThatOneAlone

	self defineTestCaseProbe.

	self
		assert: (self countsOfRunning: 'smalltalk_run_test_method'
			with: (self arguments: 'className' being: 'MCPTestProbeCase' and: 'selector' being: 'testThatPasses'))
		equals: #(1 0 0)
! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testRunningTheTestsForSeveralClassesRunsTheTestsOfEachOne

	self defineTestCaseProbe.
	self defineClassWith: (self definitionOf: 'MCPTestOtherProbeCase' subclassOf: 'TestCase').
	self defineMethodIn: 'MCPTestOtherProbeCase' source: 'testThatAlsoPasses

	self assert: true'.

	self
		assert: (self countsOfRunning: 'smalltalk_run_tests_for_classes'
			with: (self arguments: 'classNames' being: 'MCPTestProbeCase, MCPTestOtherProbeCase'))
		equals: #(2 1 1)

! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
testRunningTheTestsOfAClassCategoryRunsEveryOneOfThem

	self defineTestCaseProbe.

	self
		assert: (self countsOfRunning: 'smalltalk_run_tests_in_category'
			with: (self arguments: 'categoryName' being: self classCategoryOfTestData))
		equals: #(1 1 1)
! !

!MCPTestRunningToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
countsOfRunning: aToolName with: anArguments

	| answer |

	answer := self jsonAnswerOf: aToolName with: anArguments.

	^Array
		with: (answer at: 'passedCount')
		with: (answer at: 'failedCount')
		with: (answer at: 'errorCount')
! !

!MCPTestRunningToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
!methodProperties: {}!
defineTestCaseProbe

	"A test case class with one test that passes, one that fails and one that signals, which
	is what tells the three counts and the two lists apart."

	self defineClassWith: (self definitionOf: 'MCPTestProbeCase' subclassOf: 'TestCase').
	self defineMethodIn: 'MCPTestProbeCase' source: 'testThatPasses

	self assert: true'.
	self defineMethodIn: 'MCPTestProbeCase' source: 'testThatFails

	self assert: false'.
	self defineMethodIn: 'MCPTestProbeCase' source: 'testThatSignals

	self error: ''probing'''
! !

!MCPAuthenticationTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
!methodProperties: {}!
setUp

	headers := Dictionary new
! !

!MCPAuthenticationTest methodsFor: 'being the request' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
!methodProperties: {}!
headerAt: aHeaderName

	"I am the request the authentication is asked about. A request that carries no such
	header carries an empty one."

	^headers at: aHeaderName ifAbsent: [ '' ]
! !

!MCPAuthenticationTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
!methodProperties: {}!
carryingTheToken: aToken

	headers at: MCPBearerTokenAuthentication authorizationHeaderName put: MCPBearerTokenAuthentication bearerScheme , aToken
! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:59:05 pm (UTC)'!
!methodProperties: {}!
testARequestCarryingNoTokenIsNotServedWhenTheEnvironmentCarriesOne

	| authentication |

	authentication := MCPServer httpAuthenticationFor: #() token: 'a-secret-token'.

	self deny: (authentication authorizes: self)! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:59:05 pm (UTC)'!
!methodProperties: {}!
testARequestCarryingTheTokenOfTheEnvironmentIsServed

	| authentication |

	authentication := MCPServer httpAuthenticationFor: #() token: 'a-secret-token'.
	self carryingTheToken: 'a-secret-token'.

	self assert: (authentication authorizes: self)! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
!methodProperties: {}!
testAWrongTokenIsNotServed

	| authentication |

	authentication := MCPServer httpAuthenticationFor: #() token: 'a-secret-token'.
	self carryingTheToken: 'another-token'.

	self deny: (authentication authorizes: self)

! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
!methodProperties: {}!
testEveryClientIsServedWhenTheEnvironmentCarriesNoToken

	self assert: ((MCPServer httpAuthenticationFor: #() token: nil) authorizes: self)
! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
!methodProperties: {}!
testTheCommandLineCanTurnAuthenticationOffWhateverTheEnvironmentSays

	| authentication |

	authentication := MCPServer
		httpAuthenticationFor: (Array with: MCPServer noAuthenticationArgument)
		token: 'a-secret-token'.

	self assert: (authentication authorizes: self)
! !

!MCPMethodPropertyTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
!methodProperties: {}!
argumentsForClassNamed: aClassName selector: aSelector

	^Dictionary new
		at: 'className' put: aClassName;
		at: 'selector' put: aSelector;
		yourself
! !

!MCPMethodPropertyTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
!methodProperties: {}!
toolTakingAMethod

	^MCPPluggableTool
		named: 'smalltalk_probe'
		describedBy: 'A tool that takes a method.'
		properties: { MCPMethodProperty
			classDescribedBy: 'Name of the class that implements it'
			selectorDescribedBy: 'Selector of the method' }
		executingWith: [ :aCompiledMethod | aCompiledMethod ]
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
!methodProperties: {}!
testAMethodPropertyAnswersTheCompiledMethodItNames

	self
		assert: (self toolTakingAMethod valueWithArguments:
			(self argumentsForClassNamed: 'Object' selector: 'printString'))
		equals: Object >> #printString
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
!methodProperties: {}!
testAMethodPropertyDescribesEachOfItsPartsOnItsOwn

	| properties |

	properties := (self toolTakingAMethod inputSchema) at: 'properties'.

	self assert: ((properties at: 'className') at: 'description') equals: 'Name of the class that implements it'.
	self assert: ((properties at: 'selector') at: 'description') equals: 'Selector of the method'
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
!methodProperties: {}!
testAMethodPropertyIsShownToAClientAsTheClassAndTheSelector

	| properties |

	properties := (self toolTakingAMethod inputSchema) at: 'properties'.

	self assert: properties keys asSortedCollection asArray equals: #('className' 'selector')
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
!methodProperties: {}!
testAMethodPropertyRefusesASelectorTheClassDoesNotImplement

	self
		should: [ self toolTakingAMethod valueWithArguments:
			(self argumentsForClassNamed: 'Object' selector: 'mcpNoSuchSelector') ]
		raise: Error
		withMessageText: (MCPMethodProperty methodNotFoundErrorDescriptionFor: 'mcpNoSuchSelector' asSymbol in: Object)

! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
!methodProperties: {}!
testBothOfThePartsOfAMethodPropertyAreRequired

	| required |

	required := (self toolTakingAMethod inputSchema) at: 'required'.

	self assert: required asSortedCollection asArray equals: #('className' 'selector')
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:22:42 pm (UTC)'!
!methodProperties: {}!
answersServing: aScript

	"Answer the answers a server writes out while it serves aScript to exhaustion. Every
	answer is written on a line of its own, so the empty text after the last line end is not
	one of them."

	| output |

	output := WriteStream on: String new.
	(self serverReading: aScript writingTo: output) run.

	^output contents lines reject: [ :eachLine | eachLine isEmpty ]

! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
!methodProperties: {}!
errorOf: aJsonAnswer

	^(self parsed: aJsonAnswer) at: 'error'
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
evaluateRequestWithIdentifier: anIdentifier code: aCode

	^'{"jsonrpc":"2.0","id":', anIdentifier printString,
		',"method":"tools/call","params":{"name":"smalltalk_evaluate","arguments":{"code":"', aCode, '"}}}', self lineEnd
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
lineEnd

	^String with: Character lf
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
!methodProperties: {}!
parsed: aJsonAnswer

	^Json readFrom: aJsonAnswer readStream
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
!methodProperties: {}!
resultTextOf: aJsonAnswer

	"Answer the text a tool answered, out of the JSON-RPC answer it was wrapped in."

	^(((self parsed: aJsonAnswer) at: 'result') at: 'content') first at: 'text'
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
serverReading: aScript writingTo: aWriteStream

	^MCPServer servingOver: (self transportReading: aScript writingTo: aWriteStream)
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
transportReading: aScript writingTo: aWriteStream

	^MCPTransportText readingFrom: (MCPTestInputStream on: aScript) writingTo: aWriteStream
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
!methodProperties: {}!
testAnswersAParseErrorForALineThatIsNotJson

	"The text of a request is left unparsed by the transport so that a line that is not JSON
	is answered instead of raising while it is read and stopping the loop."

	| answers error |

	answers := self answersServing: 'this is not json at all {', self lineEnd.

	self assert: answers size equals: 1.
	error := self errorOf: answers first.
	self assert: (error at: 'code') equals: -32700.
	self assert: (error at: 'message') equals: 'Parse error'
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
!methodProperties: {}!
testAnswersEveryRequestUntilTheInputIsExhausted

	| answers |

	answers := self answersServing:
		(self evaluateRequestWithIdentifier: 1 code: '6 * 7') ,
		(self evaluateRequestWithIdentifier: 2 code: '100 - 1').

	self assert: answers size equals: 2.
	self assert: (self resultTextOf: answers first) equals: '42'.
	self assert: (self resultTextOf: answers second) equals: '99'

! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
testDoesNotAnswerANotification

	| answers |

	answers := self answersServing: '{"jsonrpc":"2.0","method":"notifications/initialized"}', self lineEnd.

	self assert: answers isEmpty
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
!methodProperties: {}!
testKeepsServingAfterALineThatIsNotJson

	| answers |

	answers := self answersServing:
		'not json', self lineEnd,
		(self evaluateRequestWithIdentifier: 1 code: '6 * 7').

	self assert: answers size equals: 2.
	self assert: ((self errorOf: answers first) at: 'code') equals: -32700.
	self assert: (self resultTextOf: answers second) equals: '42'
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
testReadMessageAnswersNilWhenTheInputIsExhausted

	| transport |

	transport := self transportReading: '' writingTo: (WriteStream on: String new).

	self assert: transport readMessage isNil
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
testReadsEachLineOfTheInputInTurn

	| transport |

	transport := self
		transportReading: 'first', self lineEnd, 'second', self lineEnd
		writingTo: (WriteStream on: String new).

	self assert: transport readMessage equals: 'first', self lineEnd.
	self assert: transport readMessage equals: 'second', self lineEnd
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
testStopsWhenTheInputIsExhausted

	| server |

	server := self serverReading: '' writingTo: (WriteStream on: String new).
	server run.

	self deny: server isRunning
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
!methodProperties: {}!
testWriteMessagePutsTheAnswerOnASingleLine

	| output transport |

	output := WriteStream on: String new.
	transport := self transportReading: '' writingTo: output.

	transport writeMessage: 'one', self lineEnd, 'two'.

	self assert: output contents equals: 'onetwo', self lineEnd

! !
