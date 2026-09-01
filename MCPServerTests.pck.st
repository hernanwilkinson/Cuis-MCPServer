'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 9:14:51 am'!
'Description Call the tool that reads a class what it reads'!
!provides: 'MCPServerTests' 1 49!
!requires: 'DynamicallyCodeCreatingTestSupport' 1 7 nil!
!requires: 'MCPServer' nil nil nil!
SystemOrganization addCategory: #MCPServerTests!


!classDefinition: #MCPTestInputStream category: #MCPServerTests!
ReadStream subclass: #MCPTestInputStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTestInputStream class' category: #MCPServerTests!
MCPTestInputStream class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportMock category: #MCPServerTests!
MCPTransport subclass: #MCPTransportMock
	instanceVariableNames: 'mcpServer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTransportMock class' category: #MCPServerTests!
MCPTransportMock class
	instanceVariableNames: ''!

!classDefinition: #MCPMockClient category: #MCPServerTests!
Object subclass: #MCPMockClient
	instanceVariableNames: 'transport requestCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPMockClient class' category: #MCPServerTests!
MCPMockClient class
	instanceVariableNames: ''!

!classDefinition: #MCPToolsTest category: #MCPServerTests!
DynamicallyCodeCreatingTest subclass: #MCPToolsTest
	instanceVariableNames: 'client server'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPToolsTest class' category: #MCPServerTests!
MCPToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggingToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPDebuggingToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPDebuggingToolsTest class' category: #MCPServerTests!
MCPDebuggingToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPImageToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPImageToolsTest
	instanceVariableNames: 'savedImageCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPImageToolsTest class' category: #MCPServerTests!
MCPImageToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPModelStructureToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPModelStructureToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPModelStructureToolsTest class' category: #MCPServerTests!
MCPModelStructureToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPRefactoringToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPRefactoringToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPRefactoringToolsTest class' category: #MCPServerTests!
MCPRefactoringToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPSearchToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPSearchToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPSearchToolsTest class' category: #MCPServerTests!
MCPSearchToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPServerToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPServerToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPServerToolsTest class' category: #MCPServerTests!
MCPServerToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPTestRunningToolsTest category: #MCPServerTests!
MCPToolsTest subclass: #MCPTestRunningToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTestRunningToolsTest class' category: #MCPServerTests!
MCPTestRunningToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPAuthenticationTest category: #MCPServerTests!
TestCase subclass: #MCPAuthenticationTest
	instanceVariableNames: 'headers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPAuthenticationTest class' category: #MCPServerTests!
MCPAuthenticationTest class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodPropertyTest category: #MCPServerTests!
TestCase subclass: #MCPMethodPropertyTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPMethodPropertyTest class' category: #MCPServerTests!
MCPMethodPropertyTest class
	instanceVariableNames: ''!

!classDefinition: #MCPTransportTextTest category: #MCPServerTests!
TestCase subclass: #MCPTransportTextTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPTransportTextTest class' category: #MCPServerTests!
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
closed

	"Answer whether there is nothing more to read. A stream on a collection is never closed
	the way a file is, so reaching the end is the only end it has, and that is the end the
	transport waits for."

	^self atEnd
! !

!MCPTransportMock methodsFor: 'serving' stamp: 'HAW 20/Aug/2026, 5:51:53 pm (UTC)'!
serveRequestsFor: anMCPServer

	"Remember the server whose answers I hand back. Nothing is listening on a socket here:
	my client hands me its requests directly."

	mcpServer := anMCPServer! !

!MCPTransportMock methodsFor: 'serving' stamp: 'HAW 20/Aug/2026, 5:51:55 pm (UTC)'!
stopServingRequests

	mcpServer := nil! !

!MCPTransportMock methodsFor: 'responding' stamp: 'HAW 20/Aug/2026, 5:51:57 pm (UTC)'!
responseTo: anEncodedRequest

	"Answer what the server responds to the bytes a client sent me, decoding them the way
	a transport reading a socket does."

	^mcpServer jsonResponseTo: (self utf8Decode: anEncodedRequest)! !

!MCPMockClient methodsFor: 'initialization' stamp: 'HAW 20/Aug/2026, 5:52:07 pm (UTC)'!
initializeSendingThrough: aTransport

	transport := aTransport.
	requestCounter := 0! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:14 pm (UTC)'!
encoded: aJsonString

	"Answer aJsonString as the bytes that travel over the wire, one Character per byte,
	which is how a transport receives a message."

	^aJsonString asUtf8Bytes asString! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 6:51:24 pm (UTC)'!
nextRequestId

	^ requestCounter := requestCounter + 1.! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:43 pm (UTC)'!
sendMethod: aMethodName

	^self sendMethod: aMethodName with: Dictionary new! !

!MCPMockClient methodsFor: 'sending' stamp: 'HAW 20/Aug/2026, 5:52:16 pm (UTC)'!
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
sendRaw: aJsonString

	"Send whatever text a client might put on the wire, even when it is not valid JSON,
	and answer the parsed response."

	| response |

	response := transport responseTo: (self encoded: aJsonString).

	^Json readFrom: response readStream! !

!MCPMockClient methodsFor: 'responses' stamp: 'HAW 20/Aug/2026, 5:52:26 pm (UTC)'!
resultOf: aResponse

	"Answer the result the server sent, signalling when it sent a JSON-RPC error instead."

	aResponse at: 'error' ifPresent: [ :anError | self signalResponseError: anError ].

	^aResponse at: 'result'! !

!MCPMockClient methodsFor: 'responses' stamp: 'HAW 20/Aug/2026, 6:52:51 pm (UTC)'!
signalResponseError: anError

	self error: (anError at: 'message')! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:31 pm (UTC)'!
callTool: aToolName

	^self callTool: aToolName with: Dictionary new! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:29 pm (UTC)'!
callTool: aToolName with: anArguments

	"Answer the text the server answers when aToolName is called with anArguments,
	signalling when it answers a JSON-RPC error instead."

	| result |

	result := self resultOf: (self sendMethod: 'tools/call' with: (self paramsForTool: aToolName with: anArguments)).

	^(result at: 'content') first at: 'text'! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:36 pm (UTC)'!
initializeConnection

	"Do the MCP handshake and answer what the server tells about itself."

	^self resultOf: (self sendMethod: 'initialize' with: Dictionary new)! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:38 pm (UTC)'!
listTools

	"Answer the tool definitions the server advertises."

	^(self resultOf: (self sendMethod: 'tools/list' with: Dictionary new)) at: 'tools'! !

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:27 pm (UTC)'!
paramsForTool: aToolName with: anArguments

	^OrderedDictionary new
		at: 'name' put: aToolName;
		at: 'arguments' put: anArguments;
		yourself! !

!MCPMockClient class methodsFor: 'instance creation' stamp: 'HAW 20/Aug/2026, 6:50:57 pm (UTC)'!
sendingThrough: aTransport

	^self new initializeSendingThrough: aTransport! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 20/Aug/2026, 9:31:35 pm (UTC)'!
registerClassCategoryOfTestData

	"The classes of these tests are created by the server under test instead of by
	createClassNamed:, so the category has to be registered for tearDown to empty it."

	classCategories add: self classCategoryOfTestData! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 12:47:57 am (UTC)'!
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
tearDown

	"My superclass empties the class category of the test data. The global is not a class, so
	it is removed here."

	Smalltalk removeKey: self class sideEffectGlobalName ifAbsent: [ nil ].
	super tearDown! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:48:02 am (UTC)'!
answerOf: aToolName

	^client callTool: aToolName with: Dictionary new! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:06 pm (UTC)'!
arguments: aKey being: aValue

	^Dictionary new
		at: aKey put: aValue;
		yourself! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:12 pm (UTC)'!
arguments: aKey being: aValue and: anotherKey being: anotherValue

	^Dictionary new
		at: aKey put: aValue;
		at: anotherKey put: anotherValue;
		yourself! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 8:22:43 pm (UTC)'!
arguments: aKey being: aValue and: anotherKey being: anotherValue and: aThirdKey being: aThirdValue

	^Dictionary new
		at: aKey put: aValue;
		at: anotherKey put: anotherValue;
		at: aThirdKey put: aThirdValue;
		yourself! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 6:33:22 pm (UTC)'!
createdClassInTest

	"Answer the class the tests create through the server, or nil when it is not in the system.
	The name is a string and not a symbol on purpose: a symbol would be a reference to the
	class, and renaming it in a test would rewrite this method along with the rest."

	^Smalltalk classNamed: 'MCPTestSubject'
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
defineClassWith: aDefinition

	^client callTool: 'smalltalk_define_class' with: (self arguments: 'definition' being: aDefinition)
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
defineMethodIn: aClassName source: aSource

	^client callTool: 'smalltalk_define_method' with:
		(self arguments: 'className' being: aClassName and: 'source' being: aSource)
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:34 pm (UTC)'!
defineTestSubjectClass

	^client callTool: 'smalltalk_define_class' with: (self arguments: 'definition' being: self subjectClassDefinition)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:43 pm (UTC)'!
defineTestSubjectMethod

	^client callTool: 'smalltalk_define_method' with:
		(self arguments: 'className' being: 'MCPTestSubject' and: 'source' being: self subjectMethodSource)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:41 pm (UTC)'!
defineTestSubjectSubclass

	^client callTool: 'smalltalk_define_class' with: (self arguments: 'definition' being: self subjectSubclassDefinition)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:50 pm (UTC)'!
definitionOf: aClassName subclassOf: aSuperclassName

	"Answer the definition a client sends to create aClassName in the class category these
	tests clean up."

	^aSuperclassName, ' subclass: #', aClassName, '
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:44 pm (UTC)'!
definitionOf: aClassName subclassOf: aSuperclassName instanceVariableNames: someInstanceVariableNames classVariableNames: someClassVariableNames

	^aSuperclassName, ' subclass: #', aClassName, '
	instanceVariableNames: ''', someInstanceVariableNames, '''
	classVariableNames: ''', someClassVariableNames, '''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:55:57 pm (UTC)'!
jsonAnswerOf: aToolName with: anArguments

	"Answer the parsed value of a tool that answers JSON."

	^Json readFrom: (client callTool: aToolName with: anArguments) readStream! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:48:42 am (UTC)'!
serverClass

	^MCPServer
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:18 pm (UTC)'!
serverErrorTextFor: anErrorDescription

	"Answer the text the server puts on the wire when a tool fails: it sends the description
	of the exception, which starts with the name of its class."

	^'Error: ', anErrorDescription! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:47:50 am (UTC)'!
smalltalkForTheServer

	"The image the server I serve works on. A test that watches what the server does to the
	image answers itself instead, and plays the part."

	^Smalltalk! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:52 pm (UTC)'!
subjectClassDefinition

	^self definitionOf: 'MCPTestSubject' subclassOf: 'Object'! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 6:06:33 pm (UTC)'!
subjectMethodSource

	"Answer a method whose comment and literal carry non ascii characters, so that a test
	using it also checks they survive the trip through the transport."

	^'saludo

	"Un comentario con acentos: ñ, é y 日本語."

	^''¡Hola, Hernán!!'''! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:54 pm (UTC)'!
subjectSubclassDefinition

	^self definitionOf: 'MCPTestSubjectChild' subclassOf: 'MCPTestSubject'! !

!MCPToolsTest class methodsFor: 'test constants' stamp: 'HAW 27/Aug/2026, 6:10:18 pm (UTC)'!
sideEffectGlobalName

	"Answer the name a rejected definition would bind if the server evaluated it anyway."

	^#MCPTestSideEffect! !

!MCPToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:48:42 am (UTC)'!
classCategoryOfTestData

	"The leading and trailing underscores keep it out of every package, and it carries no
	hyphen so that Cuis does not register a package for a root category named after part of it."

	^'__MCPServerTestData__'

! !

!MCPToolsTest class methodsFor: 'testing' stamp: 'HAW 27/Aug/2026, 10:11:09 pm (UTC)'!
isAbstract

	^self hasSubclasses ! !

!MCPDebuggingToolsTest methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 12:49:13 am (UTC)'!
tearDown

	"Leave no debugger open behind me, whatever the test did with one."

	MCPDebuggingSession finishCurrent.

	super tearDown! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:49:19 am (UTC)'!
answerOfEvaluatingToDebug: aCodeString

	^client
		callTool: 'smalltalk_evaluate_to_debug_on_error'
		with: (self arguments: 'code' being: aCodeString)! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:20:11 pm (UTC)'!
debuggerWindowsOnScreen

	^DebuggerWindow allInstances select: [ :eachWindow |
		eachWindow world notNil and: [ eachWindow label = MCPOpenDebuggingSession debuggerLabel ] ]
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
failingCode

	^'nil error: ''boom'''
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:51:26 pm (UTC)'!
openADebugger

	| answer |

	answer := self answerOfEvaluatingToDebug: self failingCode.
	self waitForTheDebuggerWindow.
	
	^answer 
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:23:18 pm (UTC)'!
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
testFinishingWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_finish_debugging')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'finish')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testGoingThroughWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_through')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'through')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testProceedingWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_proceed')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'proceed')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testRestartingWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_restart')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'restart')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testSteppingIntoWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_stepinto')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepInto')
! !

!MCPDebuggingToolsTest methodsFor: 'tests without a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testSteppingOverWithoutADebuggerSaysThereIsNone

	self
		assert: (self answerOf: 'smalltalk_debugger_stepover')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepOver')
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testEvaluatingCodeThatDoesNotFailAnswersItsResult

	self assert: (self answerOfEvaluatingToDebug: '6 * 7') equals: '42'
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
testEvaluatingCodeThatDoesNotFailLeavesNoDebugger

	self answerOfEvaluatingToDebug: '6 * 7'.

	self
		assert: (self answerOf: 'smalltalk_debugger_stepover')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepOver')
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:52:08 pm (UTC)'!
testEvaluatingCodeThatFailsAnswersTheErrorItRaised

	| answer |

	answer := self openADebugger.

	self assert: answer equals: 'Error: boom' printString

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 2:20:11 pm (UTC)'!
testEvaluatingCodeThatFailsOpensADebugger

	self openADebugger.

	self assert: self debuggerWindowsOnScreen size equals: 1

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:35:06 pm (UTC)'!
testFinishingClosesTheDebuggerWindow

	self openADebugger.
	
	self assert: (self answerOf: 'smalltalk_finish_debugging') equals: 'Finished'.

	self assert: self debuggerWindowsOnScreen isEmpty

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 26/Aug/2026, 10:24:11 pm (UTC)'!
testFinishingClosesTheDebuggerWindowThatIsNotOnScreenYet

	"The window is put up by the process that draws morphs, so it is not there yet when the
	tool that opened it answers. Finishing right then has to close it just the same, or it
	turns up afterwards with no session holding it and nothing able to close it."

	self answerOfEvaluatingToDebug: self failingCode.

	self assert: (self answerOf: 'smalltalk_finish_debugging') equals: 'Finished'.

	self assert: self debuggerWindowsOnScreen isEmpty

! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
testFinishingLeavesNoDebuggerToDrive

	self openADebugger.

	self assert: (self answerOf: 'smalltalk_finish_debugging') equals: 'Finished'.
	self
		assert: (self answerOf: 'smalltalk_debugger_stepover')
		equals: (MCPNoDebuggingSession noDebuggerErrorDescriptionFor: 'stepOver')
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
testGoingThroughDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_through'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
testProceedingRunsTheDebuggedProcessToItsEnd

	self openADebugger.

	self assert: (self answerOf: 'smalltalk_debugger_proceed') equals: 'Proceeded'
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
testRestartingDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_restart'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
testSteppingIntoDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_stepinto'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPDebuggingToolsTest methodsFor: 'tests with a debugger' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
testSteppingOverDrivesTheDebuggerLeftByAFailure

	| answer |

	self openADebugger.
	answer := self answerOf: 'smalltalk_debugger_stepover'.

	self assert: answer equals: MCPDebuggingSession current topOfStackDescription
! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
testEvaluateAnswersThePrintStringOfTheResult

	self assert: (self evaluate: '3 + 4') equals: '7'! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
testEvaluateDecodesNonAsciiCharacters

	"An accented character travels as the two bytes of its utf8 encoding. Unless the
	transport decodes them, the compiler reads a two character string instead of one."

	self assert: (self evaluate: '''é'' size') equals: '1'! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:48:42 am (UTC)'!
testSavingTheImageAnswersTheNameOfTheImageItSaved

	self assert: (self answerOf: 'smalltalk_save_image') equals: 'Image saved: ', self imageName! !

!MCPImageToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:48:47 am (UTC)'!
testSavingTheImageSavesItOnce

	self answerOf: 'smalltalk_save_image'.

	self assert: savedImageCount equals: 1! !

!MCPImageToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
evaluate: aCodeString

	^client callTool: 'smalltalk_evaluate' with: (self arguments: 'code' being: aCodeString)! !

!MCPImageToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:48:22 am (UTC)'!
smalltalkForTheServer

	"I am the image the server saves, so that saving it in a test writes nothing to disk and I
	can be asked afterwards what the server did to me."

	^self! !

!MCPImageToolsTest methodsFor: 'running' stamp: 'HAW 28/Aug/2026, 12:48:15 am (UTC)'!
setUp

	super setUp.
	savedImageCount := 0! !

!MCPImageToolsTest methodsFor: 'smalltalk protocol' stamp: 'HAW 28/Aug/2026, 12:48:28 am (UTC)'!
imageName

	^'/somewhere/Cuis-UnderTest.image'! !

!MCPImageToolsTest methodsFor: 'smalltalk protocol' stamp: 'HAW 28/Aug/2026, 12:48:35 am (UTC)'!
saveImage

	savedImageCount := savedImageCount + 1! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
defineTestSubjectMethodIn: aMethodCategory

	^client callTool: 'smalltalk_define_method' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'source' being: self subjectMethodSource
		and: 'category' being: aMethodCategory)
! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
definitionWithANonLiteralClassName

	^'Object subclass: someName
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
jsonAnswerOf: aToolName

	^self jsonAnswerOf: aToolName with: Dictionary new! !

!MCPModelStructureToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
propertyNamed: aPropertyName of: aToolName

	"Answer the property the server really reads for aToolName, so a test asserting on the
	message a missing argument produces asks the object that produces it."

	^(server toolNamed: aToolName) properties
		detect: [ :eachProperty | eachProperty name = aPropertyName ]
! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 1/Sep/2026, 12:13:42 pm (UTC)'!
testClassDefinitionAnswersTheSuperclassOfTheClass

	self defineTestSubjectClass.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_class_definition' with: (self arguments: 'className' being: 'MCPTestSubject')) at: 'superclass')
		equals: 'Object'! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testHierarchyAnswersTheClassAndAllItsSuperclasses

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_hierarchy' 
			with: (self arguments: 'className' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubject' 'Object' 'ProtoObject')! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testListClassesAnswersOnlyTheClassesWithTheGivenPrefix

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_list_classes' 
			with: (self arguments: 'prefix' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubject')! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a class' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testSubclassesAnswersTheDirectSubclassesOfTheClass

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_subclasses' 
			with: (self arguments: 'className' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubjectChild')! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a method' stamp: 'HAW 27/Aug/2026, 7:07:13 pm (UTC)'!
testMethodSourceAnswersTheSourceOfTheMethodWithItsNonAsciiCharacters

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_method_source'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'saludo')) at: 'source')
		equals: self subjectMethodSource

! !

!MCPModelStructureToolsTest methodsFor: 'tests - reading a method' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testMethodSourceOfAnUnknownClassFails

	self
		should: [ client 
			callTool: 'smalltalk_method_source' 
			with: (self arguments: 'className' being: 'NoSuchClassAtAll' and: 'selector' being: 'anything') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: 'Class not found: NoSuchClassAtAll')! !

!MCPModelStructureToolsTest methodsFor: 'tests - class categories' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testClassesInCategoryAnswersTheClassesOfThatCategory

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_classes_in_category' 
			with: (self arguments: 'category' being: self classCategoryOfTestData)) asArray
		equals: #('MCPTestSubject')! !

!MCPModelStructureToolsTest methodsFor: 'tests - class categories' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testListCategoriesIncludesTheCategoryOfTheServer

	self assert: ((self jsonAnswerOf: 'smalltalk_list_categories') includes: MCPServer category)! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
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
testClassOrganizationAnswersTheSelectorsFiledUnderEachMethodCategory

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_class_organization'
			with: (self arguments: 'className' being: 'MCPTestSubject')) at: 'saludos')
		equals: #('saludo')
! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:43:10 pm (UTC)'!
testClassifyMethodsAnswersWhereEachMethodWasFiledBefore

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: (((self jsonAnswerOf: 'smalltalk_classify_methods' with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selectors' being: 'saludo'
			and: 'category' being: 'despedidas')) at: 'classified') first at: 'wasUnder')
		equals: 'saludos'! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:42:57 pm (UTC)'!
testClassifyMethodsFilesEveryMethodNamed

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.
	client callTool: 'smalltalk_define_method' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'source' being: 'despedida

	^''¡Chau!!'''
		and: 'category' being: 'saludos').

	client callTool: 'smalltalk_classify_methods' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'selectors' being: 'saludo, despedida'
		and: 'category' being: 'despedidas').

	self
		assert: (self createdClassInTest organization listAtCategoryNamed: 'despedidas') asSortedCollection asArray
		equals: #(#despedida #saludo)! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:42:47 pm (UTC)'!
testClassifyMethodsFilesTheMethodUnderTheCategoryNamed

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	client callTool: 'smalltalk_classify_methods' with: (self
		arguments: 'className' being: 'MCPTestSubject'
		and: 'selectors' being: 'saludo'
		and: 'category' being: 'despedidas').

	self assert: (self createdClassInTest organization categoryOfElement: #saludo) equals: 'despedidas'! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:43:04 pm (UTC)'!
testClassifyMethodsTakesAwayTheCategoriesItLeftEmpty

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_classify_methods' with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selectors' being: 'saludo'
			and: 'category' being: 'despedidas')) at: 'emptied')
		equals: #('saludos')! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 3:43:17 pm (UTC)'!
testClassifyMethodsWithASelectorTheClassDoesNotImplementFails

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		should: [ client callTool: 'smalltalk_classify_methods' with: (self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'selectors' being: 'saludo, despedida'
			and: 'category' being: 'despedidas') ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(MCPMethodProperty methodNotFoundErrorDescriptionFor: #despedida in: self createdClassInTest))! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 27/Aug/2026, 6:31:35 pm (UTC)'!
testMethodsInACategoryAnswerTheSelectorsFiledUnderIt

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: (self jsonAnswerOf: 'smalltalk_methods_in_category'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'category' being: 'saludos'))
		equals: #('saludo')
! !

!MCPModelStructureToolsTest methodsFor: 'tests - method categories' stamp: 'HAW 28/Aug/2026, 12:28:59 am (UTC)'!
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
testDefineClassCreatesTheClass

	self defineTestSubjectClass.

	self assert: self createdClassInTest notNil! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
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
testDefineClassFailsWhenTheClassNameIsNotALiteral

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self definitionWithANonLiteralClassName) ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool classNameIsNotALiteralErrorDescription)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineClassFailsWhenTheDefinitionDoesNotSendAClassCreationMessage

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: (MCPDefineClassTool isNotAClassCreationMessageErrorDescriptionFor: #+))! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineClassFailsWhenTheDefinitionHasMoreThanOneStatement

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self subjectClassDefinition , '. 3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool isNotASingleMessageSendErrorDescription)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineClassFailsWhenTheDefinitionIsNotAMessageSend

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool isNotASingleMessageSendErrorDescription)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineClassWithoutADefinitionFails

	self
		should: [ client callTool: 'smalltalk_define_class' ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(self propertyNamed: 'definition' of: 'smalltalk_define_class') notProvidedErrorDescription)

! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing classes' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDeleteClassRemovesTheClassFromTheSystem

	self defineTestSubjectClass.

	client callTool: 'smalltalk_delete_class' with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: self createdClassInTest isNil! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineMethodAddsTheMethodToTheClass

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self assert: (self createdClassInTest includesSelector: #saludo)! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineMethodFilesTheMethodUnderTheGivenCategory

	self defineTestSubjectClass.

	client callTool: 'smalltalk_define_method' with:
		(self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'source' being: self subjectMethodSource
			and: 'category' being: 'saludos').

	self assert: (self createdClassInTest organization categoryOfElement: #saludo) equals: 'saludos'! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 31/Aug/2026, 11:30:41 pm (UTC)'!
testDefineMethodKeepsTheSourceItWasGiven

	"A method compiled without leaving a trail keeps no source, and what is read back is a
	decompilation of it: no comment, no blank lines and a period after the return."

	self defineTestSubjectClass.
	self defineTestSubjectMethodIn: 'saludos'.

	self
		assert: (self createdClassInTest sourceCodeAt: #saludo) asString
		equals: self subjectMethodSource! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDefineMethodWithoutACategoryFilesTheMethodUnderTheDefaultCategory

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		assert: (self createdClassInTest organization categoryOfElement: #saludo)
		equals: ClassOrganizer defaultMethodCategory! !

!MCPModelStructureToolsTest methodsFor: 'tests - changing methods' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
testDeleteMethodRemovesTheMethodFromTheClass

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	client callTool: 'smalltalk_delete_method' with:
		(self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'saludo').

	self deny: (self createdClassInTest includesSelector: #saludo)! !

!MCPRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:08:37 pm (UTC)'!
applyRefactoring: aToolName with: anArguments

	^client callTool: aToolName with: anArguments
! !

!MCPRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
arguments: aKey being: aValue and: anotherKey being: anotherValue and: aThirdKey being: aThirdValue and: aFourthKey being: aFourthValue

	^Dictionary new
		at: aKey put: aValue;
		at: anotherKey put: anotherValue;
		at: aThirdKey put: aThirdValue;
		at: aFourthKey put: aFourthValue;
		yourself

! !

!MCPRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
defineTestSubjectSiblingImplementingProbe

	"A class of its own implementing the same selector, which is what a scope narrower than
	the system has to leave alone."

	self defineClassWith: (self definitionOf: 'MCPTestSibling' subclassOf: 'Object').
	self defineMethodIn: 'MCPTestSibling' source: 'mcpProbe

	^42'
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
testAddInstanceVariableRefactoringAddsItToTheClass

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_add_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'addedVariable').

	self assert: (self createdClassInTest instVarNames includes: 'addedVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
testAddInstanceVariableRefactoringAnswersTheDefinitionOfTheClass

	self defineTestSubjectClass.

	self
		assert: (self applyRefactoring: 'smalltalk_refactor_add_instance_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'addedVariable'))
		equals: 'Refactoring applied. 1 class changed:' , String newLineString , String newLineString ,
			self createdClassInTest definition
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
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
testRemoveInstanceVariableRefactoringRemovesItFromTheClass

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'doomedVariable' classVariableNames: '').

	self applyRefactoring: 'smalltalk_refactor_remove_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'doomedVariable').

	self deny: (self createdClassInTest instVarNames includes: 'doomedVariable')
! !

!MCPRefactoringToolsTest methodsFor: 'tests - instance variable' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
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
testInsertSuperclassRefactoringAnswersTheClassItCreated

	self defineTestSubjectClass.

	self
		assert: ((self applyRefactoring: 'smalltalk_refactor_insert_superclass'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'newClassName' being: 'MCPTestSubjectChild'))
				includesSubstring: 'Object subclass: #MCPTestSubjectChild' caseSensitive: true)
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:35 pm (UTC)'!
testInsertSuperclassRefactoringPutsTheNewClassBetween

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_insert_superclass'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'newClassName' being: 'MCPTestSubjectChild').

	self assert: self createdClassInTest superclass name equals: #MCPTestSubjectChild
! !

!MCPRefactoringToolsTest methodsFor: 'tests - class' stamp: 'HAW 27/Aug/2026, 6:08:36 pm (UTC)'!
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
testSafelyRemoveClassRefactoringRemovesAClassNothingUses

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_safely_remove_class'
		with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: self createdClassInTest isNil

! !

!MCPRefactoringToolsTest methodsFor: 'tests - selector' stamp: 'HAW 27/Aug/2026, 6:08:34 pm (UTC)'!
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

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
methodsFoundBy: aToolName with: anArguments

	^((self jsonAnswerOf: aToolName with: anArguments) at: 'methods') asSortedCollection asArray

! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:01 pm (UTC)'!
phraseNoOtherMethodCarries

	"Built out of pieces so that the source of this method does not carry the phrase itself,
	which would make the search that looks for it find this method too."

	^'una ', 'frase ', 'que ', 'nadie ', 'mas ', 'dice'
! !

!MCPSearchToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 6:09:54 pm (UTC)'!
sortedAnswerOf: aToolName with: anArguments

	^(self jsonAnswerOf: aToolName with: anArguments) asSortedCollection asArray
! !

!MCPSearchToolsTest methodsFor: 'tests - senders and implementors' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
testImplementorsOfAnswersEveryMethodThatImplementsTheSelector

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self
		assert: (self methodsFoundBy: 'smalltalk_implementors_of' with: (self arguments: 'selector' being: 'mcpProbe'))
		equals: #('MCPTestSubject mcpProbe')
! !

!MCPSearchToolsTest methodsFor: 'tests - senders and implementors' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
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
testReferencesToAClassAnswerEveryMethodThatNamesIt

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeNamingItsClass

	^MCPTestSubject'.

	self
		assert: (self methodsFoundBy: 'smalltalk_references_to_class' with: (self arguments: 'className' being: 'MCPTestSubject'))
		equals: #('MCPTestSubject mcpProbeNamingItsClass')
! !

!MCPSearchToolsTest methodsFor: 'tests - references' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
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
testSearchingSelectorsAnswersNoneWhenNoSelectorContainsTheText

	self
		assert: (self sortedAnswerOf: 'smalltalk_search_selectors' with: (self arguments: 'text' being: self phraseNoOtherMethodCarries))
		equals: #()

! !

!MCPSearchToolsTest methodsFor: 'tests - searching by text' stamp: 'HAW 27/Aug/2026, 6:09:00 pm (UTC)'!
testSearchingSelectorsAnswersTheOnesWhoseNameContainsTheText

	self
		assert: (self sortedAnswerOf: 'smalltalk_search_selectors' with: (self arguments: 'text' being: 'pluralize'))
		equals: #('pluralize:')
! !

!MCPSearchToolsTest methodsFor: 'tests - searching by text' stamp: 'HAW 27/Aug/2026, 7:44:11 pm (UTC)'!
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

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testCallingAnUnknownToolFails

	| invalidTool |
	
	invalidTool := 'no_such_tool'.
	
	self
		should: [ client callTool: invalidTool ]
		raise: Error
		withMessageText: (self serverErrorTextFor: 'Unknown tool: ', invalidTool)! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testEveryAdvertisedToolHasADescriptionAndAnInputSchema

	self assert: (
		client listTools allSatisfy: [ :eachToolDefinition |
			(eachToolDefinition includesKey: 'description') and: [ eachToolDefinition includesKey: 'inputSchema' ] ])! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testInitializeAnswersTheProtocolVersion

	self assert: (client initializeConnection at: 'protocolVersion') equals: '2024-11-05'! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testInitializeAnswersTheServerInformation

	self assert: (client initializeConnection includesKey: 'serverInfo')! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testInvalidJsonAnswersAParseError

	| response |

	response := client sendRaw: 'this is not json at all'.

	self assert: ((response at: 'error') at: 'message') equals: MCPServer parseErrorDescription! !

!MCPServerToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 6:09:02 pm (UTC)'!
testUnknownMethodAnswersAMethodNotFoundError

	| response |

	response := client sendMethod: 'no/such/method'.

	self assert: ((response at: 'error') at: 'message') equals: 'Unknown method: no/such/method'! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
testRunningATestClassCountsTheTestsThatPassedFailedAndSignalled

	self defineTestCaseProbe.

	self
		assert: (self countsOfRunning: 'smalltalk_run_test_class'
			with: (self arguments: 'className' being: 'MCPTestProbeCase'))
		equals: #(1 1 1)
! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
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
testRunningOneTestMethodRunsThatOneAlone

	self defineTestCaseProbe.

	self
		assert: (self countsOfRunning: 'smalltalk_run_test_method'
			with: (self arguments: 'className' being: 'MCPTestProbeCase' and: 'selector' being: 'testThatPasses'))
		equals: #(1 0 0)
! !

!MCPTestRunningToolsTest methodsFor: 'tests' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
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
testRunningTheTestsOfAClassCategoryRunsEveryOneOfThem

	self defineTestCaseProbe.

	self
		assert: (self countsOfRunning: 'smalltalk_run_tests_in_category'
			with: (self arguments: 'categoryName' being: self classCategoryOfTestData))
		equals: #(1 1 1)
! !

!MCPTestRunningToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
countsOfRunning: aToolName with: anArguments

	| answer |

	answer := self jsonAnswerOf: aToolName with: anArguments.

	^Array
		with: (answer at: 'passedCount')
		with: (answer at: 'failedCount')
		with: (answer at: 'errorCount')
! !

!MCPTestRunningToolsTest methodsFor: 'test support' stamp: 'HAW 28/Aug/2026, 12:36:18 am (UTC)'!
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
setUp

	headers := Dictionary new
! !

!MCPAuthenticationTest methodsFor: 'being the request' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
headerAt: aHeaderName

	"I am the request the authentication is asked about. A request that carries no such
	header carries an empty one."

	^headers at: aHeaderName ifAbsent: [ '' ]
! !

!MCPAuthenticationTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
carryingTheToken: aToken

	headers at: MCPBearerTokenAuthentication authorizationHeaderName put: MCPBearerTokenAuthentication bearerScheme , aToken
! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:59:05 pm (UTC)'!
testARequestCarryingNoTokenIsNotServedWhenTheEnvironmentCarriesOne

	| authentication |

	authentication := MCPServer httpAuthenticationFor: #() token: 'a-secret-token'.

	self deny: (authentication authorizes: self)! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:59:05 pm (UTC)'!
testARequestCarryingTheTokenOfTheEnvironmentIsServed

	| authentication |

	authentication := MCPServer httpAuthenticationFor: #() token: 'a-secret-token'.
	self carryingTheToken: 'a-secret-token'.

	self assert: (authentication authorizes: self)! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
testAWrongTokenIsNotServed

	| authentication |

	authentication := MCPServer httpAuthenticationFor: #() token: 'a-secret-token'.
	self carryingTheToken: 'another-token'.

	self deny: (authentication authorizes: self)

! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
testEveryClientIsServedWhenTheEnvironmentCarriesNoToken

	self assert: ((MCPServer httpAuthenticationFor: #() token: nil) authorizes: self)
! !

!MCPAuthenticationTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 10:35:00 pm (UTC)'!
testTheCommandLineCanTurnAuthenticationOffWhateverTheEnvironmentSays

	| authentication |

	authentication := MCPServer
		httpAuthenticationFor: (Array with: MCPServer noAuthenticationArgument)
		token: 'a-secret-token'.

	self assert: (authentication authorizes: self)
! !

!MCPMethodPropertyTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
argumentsForClassNamed: aClassName selector: aSelector

	^Dictionary new
		at: 'className' put: aClassName;
		at: 'selector' put: aSelector;
		yourself
! !

!MCPMethodPropertyTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
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
testAMethodPropertyAnswersTheCompiledMethodItNames

	self
		assert: (self toolTakingAMethod valueWithArguments:
			(self argumentsForClassNamed: 'Object' selector: 'printString'))
		equals: Object >> #printString
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
testAMethodPropertyDescribesEachOfItsPartsOnItsOwn

	| properties |

	properties := (self toolTakingAMethod inputSchema) at: 'properties'.

	self assert: ((properties at: 'className') at: 'description') equals: 'Name of the class that implements it'.
	self assert: ((properties at: 'selector') at: 'description') equals: 'Selector of the method'
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
testAMethodPropertyIsShownToAClientAsTheClassAndTheSelector

	| properties |

	properties := (self toolTakingAMethod inputSchema) at: 'properties'.

	self assert: properties keys asSortedCollection asArray equals: #('className' 'selector')
! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:57:50 am (UTC)'!
testAMethodPropertyRefusesASelectorTheClassDoesNotImplement

	self
		should: [ self toolTakingAMethod valueWithArguments:
			(self argumentsForClassNamed: 'Object' selector: 'mcpNoSuchSelector') ]
		raise: Error
		withMessageText: (MCPMethodProperty methodNotFoundErrorDescriptionFor: 'mcpNoSuchSelector' asSymbol in: Object)

! !

!MCPMethodPropertyTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:23:50 pm (UTC)'!
testBothOfThePartsOfAMethodPropertyAreRequired

	| required |

	required := (self toolTakingAMethod inputSchema) at: 'required'.

	self assert: required asSortedCollection asArray equals: #('className' 'selector')
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:22:42 pm (UTC)'!
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
errorOf: aJsonAnswer

	^(self parsed: aJsonAnswer) at: 'error'
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
evaluateRequestWithIdentifier: anIdentifier code: aCode

	^'{"jsonrpc":"2.0","id":', anIdentifier printString,
		',"method":"tools/call","params":{"name":"smalltalk_evaluate","arguments":{"code":"', aCode, '"}}}', self lineEnd
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
lineEnd

	^String with: Character lf
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
parsed: aJsonAnswer

	^Json readFrom: aJsonAnswer readStream
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
resultTextOf: aJsonAnswer

	"Answer the text a tool answered, out of the JSON-RPC answer it was wrapped in."

	^(((self parsed: aJsonAnswer) at: 'result') at: 'content') first at: 'text'
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
serverReading: aScript writingTo: aWriteStream

	^MCPServer servingOver: (self transportReading: aScript writingTo: aWriteStream)
! !

!MCPTransportTextTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
transportReading: aScript writingTo: aWriteStream

	^MCPTransportText readingFrom: (MCPTestInputStream on: aScript) writingTo: aWriteStream
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
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
testDoesNotAnswerANotification

	| answers |

	answers := self answersServing: '{"jsonrpc":"2.0","method":"notifications/initialized"}', self lineEnd.

	self assert: answers isEmpty
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:50:16 pm (UTC)'!
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
testReadMessageAnswersNilWhenTheInputIsExhausted

	| transport |

	transport := self transportReading: '' writingTo: (WriteStream on: String new).

	self assert: transport readMessage isNil
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
testReadsEachLineOfTheInputInTurn

	| transport |

	transport := self
		transportReading: 'first', self lineEnd, 'second', self lineEnd
		writingTo: (WriteStream on: String new).

	self assert: transport readMessage equals: 'first', self lineEnd.
	self assert: transport readMessage equals: 'second', self lineEnd
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
testStopsWhenTheInputIsExhausted

	| server |

	server := self serverReading: '' writingTo: (WriteStream on: String new).
	server run.

	self deny: server isRunning
! !

!MCPTransportTextTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 1:21:30 pm (UTC)'!
testWriteMessagePutsTheAnswerOnASingleLine

	| output transport |

	output := WriteStream on: String new.
	transport := self transportReading: '' writingTo: output.

	transport writeMessage: 'one', self lineEnd, 'two'.

	self assert: output contents equals: 'onetwo', self lineEnd

! !
