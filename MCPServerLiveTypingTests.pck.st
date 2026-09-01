'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 9:17:12 am'!
'Description Carry the types of the instance variables with the definition'!
!provides: 'MCPServerLiveTypingTests' 1 9!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingTests!


!classDefinition: #MCPLiveTypingToolsTest category: #MCPServerLiveTypingTests!
DynamicallyCodeCreatingTest subclass: #MCPLiveTypingToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingTests'!
!classDefinition: 'MCPLiveTypingToolsTest class' category: #MCPServerLiveTypingTests!
MCPLiveTypingToolsTest class
	instanceVariableNames: ''!


!MCPLiveTypingToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
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
answerOf: aToolName with: anArguments

	^Json readFrom: ((self toolNamed: aToolName) valueWithArguments: anArguments) readStream
! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:37:32 am (UTC)'!
defineProbeHierarchy

	"A root that implements the selector, a subclass that overrides it, and a caller that sends
	it to itself and to something LiveTyping never saw hold anything."

	| childClass |

	probeClass compile: 'mcpAnswered

	^1' classified: 'probing'.
	probeClass compile: 'mcpCaller

	| anythingElse |

	self mcpAnswered.
	false ifTrue: [ anythingElse mcpAnswered ]' classified: 'probing'.
	childClass := probeClass subclass: #MCPLiveTypingProbeChild
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData.
	childClass compile: 'mcpAnswered

	^2' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	^childClass
! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 12:16:29 pm (UTC)'!
definitionAnswerOfTheProbe

	^self answerOf: 'smalltalk_class_definition' with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		yourself)! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
sourceAnswerOfTheProbe

	^Json readFrom: ((self toolNamed: 'smalltalk_method_source') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpHold:';
		yourself)) readStream
! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:54:14 am (UTC)'!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:37:34 am (UTC)'!
testAClassThatAnswersTheSelectorNowhereIsLeftOutUnlessAskedFor

	self defineProbeHierarchy.

	self
		assert: (self answerOf: 'smalltalk_actual_implementors_of' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpNeverImplemented';
			yourself))
		equals: #().

	self
		assert: (self answerOf: 'smalltalk_actual_implementors_of' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpNeverImplemented';
			at: 'includingPossible' put: 'true';
			yourself)) size
		equals: 1

! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:40:01 pm (UTC)'!
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
testAnInstanceVariableThatHeldNothingHasNoTypes

	self
		assert: (self answerOf: 'smalltalk_types_of_instance_variable' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #()
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:37:34 am (UTC)'!
testAskingForThePossibleSendersListsTheOnesOnlyGuessedAt

	| withPossible |

	self defineProbeHierarchy.

	withPossible := self answerOf: 'smalltalk_actual_senders_of' with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpAnswered';
		at: 'includingPossible' put: 'true';
		yourself).

	self assert: withPossible size equals: 2
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
testEveryInstanceVariableOfAClassIsAnsweredWithTheClassesItHeld

	probeClass new mcpHold: 42.

	self
		assert: (self answerOf: 'smalltalk_types_of_instance_variables' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself))
		equals: (Dictionary new at: 'held' put: #('SmallInteger'); yourself)
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:37:34 am (UTC)'!
testTheActualImplementorsAreTheOnesTheSelectorCouldReallyReach

	self defineProbeHierarchy.

	self
		assert: (self answerOf: 'smalltalk_actual_implementors_of' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswered';
			yourself))
		equals: #('MCPLiveTypingProbe mcpAnswered' 'MCPLiveTypingProbeChild mcpAnswered')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:37:34 am (UTC)'!
testTheActualSendersAreTheOnesSeenSendingItToThisClass

	self defineProbeHierarchy.

	self
		assert: (self answerOf: 'smalltalk_actual_senders_of' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswered';
			yourself))
		equals: #('MCPLiveTypingProbe mcpCaller')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 12:16:37 pm (UTC)'!
testTheDefinitionOfAClassCarriesTheClassesItsInstanceVariablesHeld

	probeClass new mcpHold: 42.

	self
		assert: ((self definitionAnswerOfTheProbe at: 'instanceVariableTypes') at: 'held')
		equals: #('SmallInteger')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 12:16:44 pm (UTC)'!
testTheDefinitionOfAClassIsStillAnsweredWhenTheTypesAreAddedToIt

	probeClass new mcpHold: 42.

	self assert: (self definitionAnswerOfTheProbe at: 'superclass') equals: 'Object'! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:46:54 pm (UTC)'!
testTheImplementorsOfASelectorAreNotNarrowedWhenNoClassIsNamed

	self defineProbeHierarchy.

	self
		deny: ((self answerOf: 'smalltalk_implementors_of' with: (Dictionary new
			at: 'selector' put: 'mcpAnswered';
			yourself)) includesKey: 'actual')

! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:46:54 pm (UTC)'!
testTheImplementorsOfASelectorCarryTheOnesASendToAClassCanReach

	"The stranger writes the same selector and is in no hierarchy with the probe, so a send to
	a probe cannot reach it however much the name matches."

	| strangerClass |

	self defineProbeHierarchy.
	strangerClass := Object subclass: #MCPLiveTypingStranger
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData.
	strangerClass compile: 'mcpAnswered

	^3' classified: 'probing'.

	self
		deny: (((self answerOf: 'smalltalk_implementors_of' with: (Dictionary new
			at: 'selector' put: 'mcpAnswered';
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself)) at: 'actual') includes: 'MCPLiveTypingStranger mcpAnswered')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
testTheReturnTypesOfAMethodAreTheClassesItAnswered

	probeClass new mcpHold: 42.

	self
		assert: (self answerOf: 'smalltalk_return_types_of_method' with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			yourself))
		equals: #('SmallInteger')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:46:54 pm (UTC)'!
testTheSendersOfASelectorAreStillAnsweredWhenTheActualOnesAreAddedToThem

	self defineProbeHierarchy.

	self
		assert: (((self answerOf: 'smalltalk_senders_of' with: (Dictionary new
			at: 'selector' put: 'mcpAnswered';
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself)) at: 'methods') includes: 'MCPLiveTypingProbe mcpCaller')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:46:54 pm (UTC)'!
testTheSendersOfASelectorCarryTheOnesReallySendingIt

	"The caller writes the selector twice, and only one of them is a send to an object that
	implements it, so listing the senders finds it once and the actual ones tell which."

	self defineProbeHierarchy.

	self
		assert: ((self answerOf: 'smalltalk_senders_of' with: (Dictionary new
			at: 'selector' put: 'mcpAnswered';
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself)) at: 'actual')
		equals: #('MCPLiveTypingProbe mcpCaller')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodCarriesTheClassesItAnswered

	probeClass new mcpHold: 42.

	self assert: (self sourceAnswerOfTheProbe at: 'returns') equals: #('SmallInteger')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodCarriesTheClassesItsParametersHeld

	probeClass new mcpHold: 42.

	self assert: ((self sourceAnswerOfTheProbe at: 'variables') at: 'anObject') equals: #('SmallInteger')

! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodIsStillAnsweredWhenTheTypesAreAddedToIt

	probeClass new mcpHold: 42.

	self
		assert: (self sourceAnswerOfTheProbe at: 'source')
		equals: (probeClass sourceCodeAt: #mcpHold:) asString
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: #('smalltalk_types_of_instance_variable' 'smalltalk_types_of_instance_variables'
			'smalltalk_types_of_method_variable' 'smalltalk_return_types_of_method'))

! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:39:01 pm (UTC)'!
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
classCategoryOfTestData

	^'__MCPLiveTypingTestData__'
! !
