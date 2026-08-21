'From Cuis7.9 [latest update: #8134] on 21 August 2026 at 3:09:16 pm'!
'Description Add an MCPTool hierarchy and serve it from MCPToolBasedServer'!
!provides: 'MCPServerTests' 1 6!
!requires: 'BaseImageTests-DynamicallyCodeCreation' 1 1 nil!
SystemOrganization addCategory: 'MCPServerTests'!


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
	instanceVariableNames: 'client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPToolsTest class' category: 'MCPServerTests'!
MCPToolsTest class
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

!classDefinition: #MCPToolBasedServerToolsTest category: 'MCPServerTests'!
MCPToolsTest subclass: #MCPToolBasedServerToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerTests'!
!classDefinition: 'MCPToolBasedServerToolsTest class' category: 'MCPServerTests'!
MCPToolBasedServerToolsTest class
	instanceVariableNames: ''!


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

!MCPMockClient methodsFor: 'mcp protocol' stamp: 'HAW 20/Aug/2026, 5:52:40 pm (UTC)'!
!methodProperties: {}!
toolNames

	"Answer the name of every tool the server advertises."

	^self listTools collect: [ :eachToolDefinition | eachToolDefinition at: 'name' ]! !

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

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 21/Aug/2026, 11:07:54 am (UTC)'!
!methodProperties: {}!
setUp

	"Serve a server over a mock transport, so a mock client can send it requests the way a real
	one does without a socket in between."

	| transport server |

	super setUp.
	self registerClassCategoryOfTestData.
	transport := MCPTransportMock new.
	server := self serverClass servingOver: transport.
	transport serveRequestsFor: server.
	client := MCPMockClient sendingThrough: transport! !

!MCPToolsTest methodsFor: 'running' stamp: 'HAW 20/Aug/2026, 9:31:36 pm (UTC)'!
!methodProperties: {}!
tearDown

	"My superclass empties the class category of the test data. The global is not a class, so
	it is removed here."

	Smalltalk removeKey: self class sideEffectGlobalName ifAbsent: [ nil ].
	super tearDown! !

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

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 8:44:20 pm (UTC)'!
!methodProperties: {}!
createdClassInTest

	"Answer the class the tests create through the server, or nil when it is not in the system."

	^Smalltalk classNamed: #MCPTestSubject! !

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

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 21/Aug/2026, 11:12:25 am (UTC)'!
!methodProperties: {}!
serverClass

	"Answer the server my tests exercise. Every server that offers the same tools has a
	concrete subclass of mine, so that the same tests verify all of them."

	^self subclassResponsibility! !

!MCPToolsTest methodsFor: 'test support' stamp: 'HAW 20/Aug/2026, 5:54:18 pm (UTC)'!
!methodProperties: {}!
serverErrorTextFor: anErrorDescription

	"Answer the text the server puts on the wire when a tool fails: it sends the description
	of the exception, which starts with the name of its class."

	^'Error: ', anErrorDescription! !

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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 5:58:53 pm (UTC)'!
!methodProperties: {}!
testDebuggingToolsAreAdvertised

	"Driving one of them needs a suspended process, so the tests only check that a client
	is offered them."

	| advertisedToolNames |

	advertisedToolNames := client toolNames.

	self assert: (self class debuggingToolNames allSatisfy: [ :eachToolName | advertisedToolNames includes: eachToolName ])! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 8:45:05 pm (UTC)'!
!methodProperties: {}!
testDefineClassCreatesTheClass

	self defineTestSubjectClass.

	self assert: self createdClassInTest notNil! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:00:37 pm (UTC)'!
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
				equals: (self serverErrorTextFor: (MCPServer isNotAClassCreationMessageErrorDescriptionFor: #at:put:)).
			self deny: (Smalltalk includesKey: self class sideEffectGlobalName) ]! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:58:37 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheClassNameIsNotALiteral

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self definitionWithANonLiteralClassName) ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPServer classNameIsNotALiteralErrorDescription)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:58:53 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionDoesNotSendAClassCreationMessage

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: (MCPServer isNotAClassCreationMessageErrorDescriptionFor: #+))! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:01:44 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionHasMoreThanOneStatement

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: self subjectClassDefinition , '. 3 + 4') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPServer isNotASingleMessageSendErrorDescription)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 7:01:57 pm (UTC)'!
!methodProperties: {}!
testDefineClassFailsWhenTheDefinitionIsNotAMessageSend

	self
		should: [ client 
			callTool: 'smalltalk_define_class' 
			with: (self arguments: 'definition' being: '3') ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPServer isNotASingleMessageSendErrorDescription)! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:53:25 pm (UTC)'!
!methodProperties: {}!
testDefineClassWithoutADefinitionFails

	self
		should: [ client callTool: 'smalltalk_define_class' ]
		raise: Error
		withMessageText: (self serverErrorTextFor: MCPServer noDefinitionProvidedErrorDescription)! !

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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 5:54:52 pm (UTC)'!
!methodProperties: {}!
testSaveImageIsAdvertised

	"The tool itself is not called: it would snapshot the image in the middle of a test run."

	self assert: (client toolNames includes: 'smalltalk_save_image')! !

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

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:03 pm (UTC)'!
!methodProperties: {}!
testToolsListAdvertisesTheExpectedTools

	self assert: client toolNames asArray sorted equals: self class expectedToolNames! !

!MCPToolsTest methodsFor: 'tests' stamp: 'HAW 20/Aug/2026, 6:13:05 pm (UTC)'!
!methodProperties: {}!
testUnknownMethodAnswersAMethodNotFoundError

	| response |

	response := client sendMethod: 'no/such/method'.

	self assert: ((response at: 'error') at: 'message') equals: 'Unknown method: no/such/method'! !

!MCPToolsTest class methodsFor: 'test constants' stamp: 'HAW 20/Aug/2026, 5:54:38 pm (UTC)'!
!methodProperties: {}!
debuggingToolNames

	"Answer the tools that drive the debugger. They are advertised and dispatched like any
	other, but driving one needs a suspended process, so the tests only check that they are
	offered to a client."

	^#('smalltalk_debugger_proceed' 'smalltalk_debugger_restart' 'smalltalk_debugger_stepinto'
		'smalltalk_debugger_stepover' 'smalltalk_debugger_through'
		'smalltalk_evaluate_to_debug_on_error' 'smalltalk_finish_debugging')! !

!MCPToolsTest class methodsFor: 'test constants' stamp: 'HAW 20/Aug/2026, 5:54:35 pm (UTC)'!
!methodProperties: {}!
expectedToolNames

	"Answer the tools the server has to advertise, so that a tool added to the dispatch
	without a definition, or a definition without a dispatch, fails a test."

	^#('smalltalk_browse' 'smalltalk_classes_in_category' 'smalltalk_debugger_proceed'
		'smalltalk_debugger_restart' 'smalltalk_debugger_stepinto' 'smalltalk_debugger_stepover'
		'smalltalk_debugger_through' 'smalltalk_define_class' 'smalltalk_define_method'
		'smalltalk_delete_class' 'smalltalk_delete_method' 'smalltalk_evaluate'
		'smalltalk_evaluate_to_debug_on_error' 'smalltalk_finish_debugging' 'smalltalk_hierarchy'
		'smalltalk_list_categories' 'smalltalk_list_classes' 'smalltalk_method_source'
		'smalltalk_save_image' 'smalltalk_subclasses')! !

!MCPToolsTest class methodsFor: 'test constants' stamp: 'HAW 20/Aug/2026, 5:54:03 pm (UTC)'!
!methodProperties: {}!
sideEffectGlobalName

	"Answer the name a rejected definition would bind if the server evaluated it anyway."

	^#MCPTestSideEffect! !

!MCPToolsTest class methodsFor: 'test data' stamp: 'HAW 21/Aug/2026, 11:12:25 am (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	"Answer the class category the classes created through the server go to. Each of my
	subclasses answers one of its own, so that they never empty each other's test data."

	^self subclassResponsibility! !

!MCPServerToolsTest methodsFor: 'test support' stamp: 'HAW 21/Aug/2026, 11:12:25 am (UTC)'!
!methodProperties: {}!
serverClass

	^MCPServer! !

!MCPServerToolsTest class methodsFor: 'test data' stamp: 'HAW 21/Aug/2026, 11:12:25 am (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	"The leading and trailing underscores keep it out of every package, and it carries no
	hyphen so that Cuis does not register a package for a root category named after part of it."

	^'__MCPServerTestData__'! !

!MCPToolBasedServerToolsTest methodsFor: 'test support' stamp: 'HAW 21/Aug/2026, 11:08:02 am (UTC)'!
!methodProperties: {}!
serverClass

	^MCPToolBasedServer! !

!MCPToolBasedServerToolsTest class methodsFor: 'test data' stamp: 'HAW 21/Aug/2026, 11:08:02 am (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	^'__MCPToolBasedServerTestData__'! !
