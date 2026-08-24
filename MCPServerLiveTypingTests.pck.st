'From Cuis7.9 [latest update: #8134] on 24 August 2026 at 8:40:53 pm'!
'Description Read the types LiveTyping saw while the image ran'!
!provides: 'MCPServerLiveTypingTests' 1 1!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingTests!


!classDefinition: #MCPLiveTypingToolsTest category: #MCPServerLiveTypingTests!
DynamicallyCodeCreationTest subclass: #MCPLiveTypingToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingTests'!
!classDefinition: 'MCPLiveTypingToolsTest class' category: #MCPServerLiveTypingTests!
MCPLiveTypingToolsTest class
	instanceVariableNames: ''!


!MCPLiveTypingToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
setUp

	super setUp.
	classCategories add: self classCategoryOfTestData.
	probeClass := Object subclass: #MCPLiveTypingProbe
		instanceVariableNames: 'held'
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData.
	probeClass compile: 'mcpHold: anObject

	held := anObject.
	^held' classified: 'probing'.
	probeClass compile: 'mcpAnswerSelf

	^self' classified: 'probing'.
	(probeClass >> #mcpHold:) initializeTypeInformation.
	(probeClass >> #mcpAnswerSelf) initializeTypeInformation
! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
answerOf: aToolName with: anArguments

	^Json readFrom: ((self toolNamed: aToolName) valueWithArguments: anArguments) readStream
! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
toolNamed: aToolName

	^(MCPLiveTypingTools for: Smalltalk) tools detect: [ :eachTool | eachTool name = aToolName ]
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:40:01 pm (UTC)'!
!methodProperties: {}!
testAMethodThatAnswersItsReceiverSaysSo

	probeClass new mcpAnswerSelf.

	self
		assert: (self answerOf: 'smalltalk_return_types_of_method' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswerSelf';
			yourself))
		equals: #('self')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
!methodProperties: {}!
testAnInstanceVariableThatHeldNothingHasNoTypes

	self
		assert: (self answerOf: 'smalltalk_types_of_instance_variable' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #()
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
!methodProperties: {}!
testEveryInstanceVariableOfAClassIsAnsweredWithTheClassesItHeld

	probeClass new mcpHold: 42.

	self
		assert: (self answerOf: 'smalltalk_types_of_instance_variables' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself))
		equals: (Dictionary new at: 'held' put: #('SmallInteger'); yourself)
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
!methodProperties: {}!
testTheReturnTypesOfAMethodAreTheClassesItAnswered

	probeClass new mcpHold: 42.

	self
		assert: (self answerOf: 'smalltalk_return_types_of_method' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			yourself))
		equals: #('SmallInteger')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
!methodProperties: {}!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: #('smalltalk_types_of_instance_variable' 'smalltalk_types_of_instance_variables'
			'smalltalk_types_of_method_variable' 'smalltalk_return_types_of_method'))

! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
!methodProperties: {}!
testTheTypesOfAParameterAreTheClassesItWasSent

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 'a string'.

	self
		assert: (self answerOf: 'smalltalk_types_of_method_variable' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			at: 'variableName' put: 'anObject';
			yourself))
		equals: #('SmallInteger' 'String')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
!methodProperties: {}!
testTheTypesOfAnInstanceVariableAreTheClassesItHeld

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 'a string'.

	self
		assert: (self answerOf: 'smalltalk_types_of_instance_variable' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #('SmallInteger' 'String')
! !

!MCPLiveTypingToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	^'__MCPLiveTypingTestData__'
! !
