'From Cuis7.9 [latest update: #8134] on 24 August 2026 at 5:42:02 pm'!
'Description Add refactoring tools for methods and globals'!
!provides: 'MCPServerTests' 1 15!
!requires: 'BaseImageTests-DynamicallyCodeCreation' 1 1 nil!
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
DynamicallyCodeCreationTest subclass: #MCPToolsTest
	instanceVariableNames: 'client server'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPToolsTest class' category: 'MCPServerTests'!
MCPToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPDebuggingToolsTest category: 'MCPServerTests'!
TestCase subclass: #MCPDebuggingToolsTest
	instanceVariableNames: 'server'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPDebuggingToolsTest class' category: 'MCPServerTests'!
MCPDebuggingToolsTest class
	instanceVariableNames: ''!

!classDefinition: #MCPSaveImageToolTest category: 'MCPServerTests'!
TestCase subclass: #MCPSaveImageToolTest
	instanceVariableNames: 'savedImageCount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPSaveImageToolTest class' category: 'MCPServerTests'!
MCPSaveImageToolTest class
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

!MCPDebuggingToolsTest commentStamp: '<historical>' prior: 0!
I test the seven tools that drive a debugger.

Six of my tests ask each tool what it answers when no debugger is open, which is what a client sees when it drives one out of turn. The rest let a real failure leave a real debugger open and drive that, so what they exercise is the debugger the server really opens.

My tearDown always finishes the session, so a test that fails does not leave a debugger behind.!

!MCPSaveImageToolTest commentStamp: '<historical>' prior: 0!
I test that a server saves the image it was given rather than the one it is running in.

I am that image myself: I answer saveImage and imageName, and the server under test is created with me as its smalltalk, so no class is needed to stand in for one.!

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

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:51:27 am (UTC)'!
!methodProperties: {}!
setUp

	"Serve a server over a mock transport, so a mock client can send it requests the way a real
	one does without a socket in between."

	| transport |

	super setUp.
	self registerClassCategoryOfTestData.
	transport := MCPTransportMock new.
	server := self serverClass servingOver: transport.
	transport serveRequestsFor: server.
	client := MCPMockClient sendingThrough: transport
! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 20/Aug/2026, 9:31:36 pm (UTC)'!
!methodProperties: {}!
tearDown

	"My superclass empties the class category of the test data. The global is not a class, so
	it is removed here."

	Smalltalk removeKey: self class sideEffectGlobalName ifAbsent: [ nil ].
	super tearDown! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:53:47 pm (UTC)'!
!methodProperties: {}!
applyRefactoring: aToolName with: anArguments

	^client callTool: aToolName with: anArguments
! !

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

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 9:31:56 pm (UTC)'!
!methodProperties: {}!
definitionWithANonLiteralClassName

	^'Object subclass: someName
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''', self classCategoryOfTestData, ''''! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:14 pm (UTC)'!
!methodProperties: {}!
evaluate: aCodeString

	^client callTool: 'smalltalk_evaluate' with: (self arguments: 'code' being: aCodeString)! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:56:04 pm (UTC)'!
!methodProperties: {}!
jsonAnswerOf: aToolName

	^self jsonAnswerOf: aToolName with: Dictionary new! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:55:57 pm (UTC)'!
!methodProperties: {}!
jsonAnswerOf: aToolName with: anArguments

	"Answer the parsed value of a tool that answers JSON."

	^Json readFrom: (client callTool: aToolName with: anArguments) readStream! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:10:14 pm (UTC)'!
!methodProperties: {}!
phraseNoOtherMethodCarries

	"Built out of pieces so that the source of this method does not carry the phrase itself,
	which would make the search that looks for it find this method too."

	^'una ', 'frase ', 'que ', 'nadie ', 'mas ', 'dice'
! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:51:27 am (UTC)'!
!methodProperties: {}!
propertyNamed: aPropertyName of: aToolName

	"Answer the property the server really reads for aToolName, so a test asserting on the
	message a missing argument produces asks the object that produces it."

	^(server toolNamed: aToolName) properties
		detect: [ :eachProperty | eachProperty name = aPropertyName ]
! !

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

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
!methodProperties: {}!
sortedAnswerOf: aToolName with: anArguments

	^(self jsonAnswerOf: aToolName with: anArguments) asSortedCollection asArray
! !

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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:31 pm (UTC)'!
!methodProperties: {}!
testBrowseAnswersTheSuperclassOfTheClass

	self defineTestSubjectClass.

	self
		assert: ((self jsonAnswerOf: 'smalltalk_browse' with: (self arguments: 'className' being: 'MCPTestSubject')) at: 'superclass')
		equals: 'Object'! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:52:58 pm (UTC)'!
!methodProperties: {}!
testCallingAnUnknownToolFails

	| invalidTool |
	
	invalidTool := 'no_such_tool'.
	
	self
		should: [ client callTool: invalidTool ]
		raise: Error
		withMessageText: (self serverErrorTextFor: 'Unknown tool: ', invalidTool)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 9:41:07 pm (UTC)'!
!methodProperties: {}!
testClassesInCategoryAnswersTheClassesOfThatCategory

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_classes_in_category' 
			with: (self arguments: 'category' being: self classCategoryOfTestData)) asArray
		equals: #('MCPTestSubject')! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:45:05 pm (UTC)'!
!methodProperties: {}!
testDefineClassCreatesTheClass

	self defineTestSubjectClass.

	self assert: self createdClassInTest notNil! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 21/Aug/2026, 6:17:49 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 21/Aug/2026, 6:17:49 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheClassNameIsNotALiteral

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self definitionWithANonLiteralClassName) ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool classNameIsNotALiteralErrorDescription)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 21/Aug/2026, 6:17:48 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionDoesNotSendAClassCreationMessage

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: (MCPDefineClassTool isNotAClassCreationMessageErrorDescriptionFor: #+))! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 21/Aug/2026, 6:17:49 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionHasMoreThanOneStatement

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self subjectClassDefinition , '. 3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool isNotASingleMessageSendErrorDescription)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 21/Aug/2026, 6:17:48 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionIsNotAMessageSend

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPDefineClassTool isNotASingleMessageSendErrorDescription)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:51:27 am (UTC)'!
!methodProperties: {}!
testDefineClassWithoutADefinitionFails

	self
		should: [ client callTool: 'smalltalk_define_class' ]
		raise: Error
		withMessageText: (self serverErrorTextFor:
			(self propertyNamed: 'definition' of: 'smalltalk_define_class') notProvidedErrorDescription)

! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:44:24 pm (UTC)'!
!methodProperties: {}!
testDefineMethodAddsTheMethodToTheClass

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self assert: (self createdClassInTest includesSelector: #saludo)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:44:33 pm (UTC)'!
!methodProperties: {}!
testDefineMethodFilesTheMethodUnderTheGivenCategory

	self defineTestSubjectClass.

	client callTool: 'smalltalk_define_method' with:
		(self
			arguments: 'className' being: 'MCPTestSubject'
			and: 'source' being: self subjectMethodSource
			and: 'category' being: 'saludos').

	self assert: (self createdClassInTest organization categoryOfElement: #saludo) equals: 'saludos'! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:44:35 pm (UTC)'!
!methodProperties: {}!
testDefineMethodWithoutACategoryFilesTheMethodUnderTheDefaultCategory

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		assert: (self createdClassInTest organization categoryOfElement: #saludo)
		equals: ClassOrganizer defaultMethodCategory! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:45:07 pm (UTC)'!
!methodProperties: {}!
testDeleteClassRemovesTheClassFromTheSystem

	self defineTestSubjectClass.

	client callTool: 'smalltalk_delete_class' with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: self createdClassInTest isNil! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:44:26 pm (UTC)'!
!methodProperties: {}!
testDeleteMethodRemovesTheMethodFromTheClass

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	client callTool: 'smalltalk_delete_method' with:
		(self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'saludo').

	self deny: (self createdClassInTest includesSelector: #saludo)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:15 pm (UTC)'!
!methodProperties: {}!
testEvaluateAnswersThePrintStringOfTheResult

	self assert: (self evaluate: '3 + 4') equals: '7'! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:16 pm (UTC)'!
!methodProperties: {}!
testEvaluateDecodesNonAsciiCharacters

	"An accented character travels as the two bytes of its utf8 encoding. Unless the
	transport decodes them, the compiler reads a two character string instead of one."

	self assert: (self evaluate: '''é'' size') equals: '1'! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:03:43 pm (UTC)'!
!methodProperties: {}!
testEveryAdvertisedToolHasADescriptionAndAnInputSchema

	self assert: (
		client listTools allSatisfy: [ :eachToolDefinition |
			(eachToolDefinition includesKey: 'description') and: [ eachToolDefinition includesKey: 'inputSchema' ] ])! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:05:08 pm (UTC)'!
!methodProperties: {}!
testHierarchyAnswersTheClassAndAllItsSuperclasses

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_hierarchy' 
			with: (self arguments: 'className' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubject' 'Object' 'ProtoObject')! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
!methodProperties: {}!
testImplementorsOfAnswersEveryMethodThatImplementsTheSelector

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.

	self
		assert: (self sortedAnswerOf: 'smalltalk_implementors_of' with: (self arguments: 'selector' being: 'mcpProbe'))
		equals: #('MCPTestSubject mcpProbe')
! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:00 pm (UTC)'!
!methodProperties: {}!
testInitializeAnswersTheProtocolVersion

	self assert: (client initializeConnection at: 'protocolVersion') equals: '2024-11-05'! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 5:54:41 pm (UTC)'!
!methodProperties: {}!
testInitializeAnswersTheServerInformation

	self assert: (client initializeConnection includesKey: 'serverInfo')! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:07 pm (UTC)'!
!methodProperties: {}!
testInvalidJsonAnswersAParseError

	| response |

	response := client sendRaw: 'this is not json at all'.

	self assert: ((response at: 'error') at: 'message') equals: MCPServer parseErrorDescription! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:05:43 pm (UTC)'!
!methodProperties: {}!
testListCategoriesIncludesTheCategoryOfTheServer

	self assert: ((self jsonAnswerOf: 'smalltalk_list_categories') includes: MCPServer category)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:05:59 pm (UTC)'!
!methodProperties: {}!
testListClassesAnswersOnlyTheClassesWithTheGivenPrefix

	self defineTestSubjectClass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_list_classes' 
			with: (self arguments: 'prefix' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubject')! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:06:17 pm (UTC)'!
!methodProperties: {}!
testMethodSourceAnswersTheSourceOfTheMethodWithItsNonAsciiCharacters

	self defineTestSubjectClass.
	self defineTestSubjectMethod.

	self
		assert: (client 
			callTool: 'smalltalk_method_source' 
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'selector' being: 'saludo'))
		equals: self subjectMethodSource! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:06:37 pm (UTC)'!
!methodProperties: {}!
testMethodSourceOfAnUnknownClassFails

	self
		should: [ client 
			callTool: 'smalltalk_method_source' 
			with: (self arguments: 'className' being: 'NoSuchClassAtAll' and: 'selector' being: 'anything') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: 'Class not found: NoSuchClassAtAll')! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
!methodProperties: {}!
testReferencesToAClassAnswerEveryMethodThatNamesIt

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeNamingItsClass

	^MCPTestSubject'.

	self
		assert: (self sortedAnswerOf: 'smalltalk_references_to_class' with: (self arguments: 'className' being: 'MCPTestSubject'))
		equals: #('MCPTestSubject mcpProbeNamingItsClass')
! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
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
		assert: (self sortedAnswerOf: 'smalltalk_references_to_class_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'ProbeVariable'))
		equals: #('MCPTestSubject mcpProbeWriting' 'MCPTestSubjectChild mcpProbeReading')

! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:09:26 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
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
		assert: (self sortedAnswerOf: 'smalltalk_references_to_instance_variable'
			with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'probeVariable'))
		equals: #('[read] - MCPTestSubjectChild mcpProbeReading' '[write] - MCPTestSubject mcpProbeWriting')
! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:09:26 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:10:14 pm (UTC)'!
!methodProperties: {}!
testSearchingTheSourceAnswersEveryMethodWhoseTextContainsIt

	| phrase |

	phrase := self phraseNoOtherMethodCarries.
	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCarryingAPhrase

	"', phrase, '"

	^42'.

	self
		assert: (self sortedAnswerOf: 'smalltalk_search_source' with: (self arguments: 'text' being: phrase))
		equals: #('MCPTestSubject mcpProbeCarryingAPhrase')

! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 4:07:45 pm (UTC)'!
!methodProperties: {}!
testSendersOfAnswersEveryMethodThatSendsTheSelector

	self defineTestSubjectClass.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbe

	^42'.
	self defineMethodIn: 'MCPTestSubject' source: 'mcpProbeCaller

	^self mcpProbe'.

	self
		assert: (self sortedAnswerOf: 'smalltalk_senders_of' with: (self arguments: 'selector' being: 'mcpProbe'))
		equals: #('MCPTestSubject mcpProbeCaller')
! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:06:55 pm (UTC)'!
!methodProperties: {}!
testSubclassesAnswersTheDirectSubclassesOfTheClass

	self defineTestSubjectClass.
	self defineTestSubjectSubclass.

	self
		assert: (self 
			jsonAnswerOf: 'smalltalk_subclasses' 
			with: (self arguments: 'className' being: 'MCPTestSubject')) asArray
		equals: #('MCPTestSubjectChild')! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:05 pm (UTC)'!
!methodProperties: {}!
testUnknownMethodAnswersAMethodNotFoundError

	| response |

	response := client sendMethod: 'no/such/method'.

	self assert: ((response at: 'error') at: 'message') equals: 'Unknown method: no/such/method'! !

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:39:41 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 4:53:59 pm (UTC)'!
!methodProperties: {}!
testAddInstanceVariableRefactoringAddsItToTheClass

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_add_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'addedVariable').

	self assert: (self createdClassInTest instVarNames includes: 'addedVariable')
! !

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:29:59 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:30:44 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 6:31:57 pm (UTC)'!
!methodProperties: {}!
testInsertSuperclassRefactoringPutsTheNewClassBetween

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_insert_superclass'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'newClassName' being: 'MCPTestSubjectChild').

	self assert: self createdClassInTest superclass name equals: #MCPTestSubjectChild
! !

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:39:41 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 6:31:57 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:39:41 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:39:41 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 4:53:59 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:39:41 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 4:53:59 pm (UTC)'!
!methodProperties: {}!
testRemoveInstanceVariableRefactoringRemovesItFromTheClass

	self defineClassWith: (self
		definitionOf: 'MCPTestSubject' subclassOf: 'Object'
		instanceVariableNames: 'doomedVariable' classVariableNames: '').

	self applyRefactoring: 'smalltalk_refactor_remove_instance_variable'
		with: (self arguments: 'className' being: 'MCPTestSubject' and: 'variableName' being: 'doomedVariable').

	self deny: (self createdClassInTest instVarNames includes: 'doomedVariable')
! !

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:29:59 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 4:53:59 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 6:33:22 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 8:39:41 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 4:53:59 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 6:36:43 pm (UTC)'!
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

!MCPToolsTest methodsFor: 'tests refactorings' stamp: 'HAW 24/Aug/2026, 4:53:59 pm (UTC)'!
!methodProperties: {}!
testSafelyRemoveClassRefactoringRemovesAClassNothingUses

	self defineTestSubjectClass.

	self applyRefactoring: 'smalltalk_refactor_safely_remove_class'
		with: (self arguments: 'className' being: 'MCPTestSubject').

	self assert: self createdClassInTest isNil

! !

!MCPToolsTest class methodsFor: 'test constants' stamp: 'HAW 20/Aug/2026, 5:54:03 pm (UTC)'!
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

!MCPDebuggingToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
setUp

	server := MCPServer servingOver: MCPTransportMock new
! !

!MCPDebuggingToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 3:31:43 pm (UTC)'!
!methodProperties: {}!
tearDown

	"Leave no debugger open behind me, whatever the test did with one."

	MCPDebuggingSession finishCurrent
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
answerOf: aToolName

	^(server toolNamed: aToolName) valueWithArguments: Dictionary new
! !

!MCPDebuggingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:15:08 pm (UTC)'!
!methodProperties: {}!
answerOfEvaluatingToDebug: aCodeString

	^(server toolNamed: 'smalltalk_evaluate_to_debug_on_error')
		valueWithArguments: (Dictionary new at: 'code' put: aCodeString; yourself)
! !

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

!MCPSaveImageToolTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
!methodProperties: {}!
setUp

	savedImageCount := 0
! !

!MCPSaveImageToolTest methodsFor: 'smalltalk protocol' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
!methodProperties: {}!
imageName

	^'/somewhere/Cuis-UnderTest.image'
! !

!MCPSaveImageToolTest methodsFor: 'smalltalk protocol' stamp: 'HAW 24/Aug/2026, 1:55:35 pm (UTC)'!
!methodProperties: {}!
saveImage

	savedImageCount := savedImageCount + 1
! !

!MCPSaveImageToolTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:00:29 pm (UTC)'!
!methodProperties: {}!
executeSaveImageTool

	^(self server toolNamed: 'smalltalk_save_image') valueWithArguments: Dictionary new
! !

!MCPSaveImageToolTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 2:00:01 pm (UTC)'!
!methodProperties: {}!
server

	^MCPServer servingOver: MCPTransportMock new smalltalk: self
! !

!MCPSaveImageToolTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 2:00:29 pm (UTC)'!
!methodProperties: {}!
testAnswersTheNameOfTheImageItSaved

	self assert: self executeSaveImageTool equals: 'Image saved: ', self imageName

! !

!MCPSaveImageToolTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 2:00:29 pm (UTC)'!
!methodProperties: {}!
testSavesTheImageOnce

	self executeSaveImageTool.

	self assert: savedImageCount equals: 1
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
