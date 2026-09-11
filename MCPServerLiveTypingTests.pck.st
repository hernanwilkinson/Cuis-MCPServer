'From Cuis7.9 [latest update: #8163] on 11 September 2026 at 12:18:34 pm'!
'Description File out the LiveTyping tests of the multi-item tools'!
!provides: 'MCPServerLiveTypingTests' 1 17!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingTests!


!classDefinition: #MCPLiveTypingToolsTest category: #MCPServerLiveTypingTests!
MCPToolsTest subclass: #MCPLiveTypingToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingTests'!
!classDefinition: 'MCPLiveTypingToolsTest class' category: #MCPServerLiveTypingTests!
MCPLiveTypingToolsTest class
	instanceVariableNames: ''!


!MCPLiveTypingToolsTest methodsFor: 'running' stamp: 'HAW 7/Sep/2026, 9:49:28 pm (UTC)'!
setUp

	super setUp.
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
	(probeClass >> #mcpAnswerSelf) initializeTypeInformation! !

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

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
definitionAnswerOfTheProbe

	^(self jsonAnswerOf: MCPModelStructureTools classDefinitionToolName with: (Dictionary new
		at: 'classNames' put: 'MCPLiveTypingProbe';
		yourself)) at: 'MCPLiveTypingProbe'! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
sendersAnswerOfTheProbeSelector

	^(self jsonAnswerOf: MCPSearchTools sendersOfToolName with: (Dictionary new
		at: 'selectors' put: 'mcpAnswered';
		at: 'className' put: 'MCPLiveTypingProbe';
		yourself)) at: 'mcpAnswered'! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 8/Sep/2026, 11:17:12 pm (UTC)'!
sendsOfTheProbeCaller

	^self jsonAnswerOf: MCPLiveTypingTools messageSendsOfMethodToolName with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpCaller';
		yourself)! !

!MCPLiveTypingToolsTest methodsFor: 'test support' stamp: 'HAW 11/Sep/2026, 2:16:50 pm (UTC)'!
sourceAnswerOfTheProbe

	^(self jsonAnswerOf: MCPModelStructureTools methodSourceToolName with: (Dictionary new
		at: 'methods' put: 'MCPLiveTypingProbe>>mcpHold:';
		yourself)) at: 'MCPLiveTypingProbe>>#mcpHold:'! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testAClassThatAnswersTheSelectorNowhereIsLeftOutUnlessAskedFor

	self defineProbeHierarchy.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools actualImplementorsOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpNeverImplemented';
			yourself))
		equals: #().

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools actualImplementorsOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpNeverImplemented';
			at: 'includingPossible' put: 'true';
			yourself)) size
		equals: 1

! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testAMethodThatAnswersItsReceiverSaysSo

	probeClass new mcpAnswerSelf.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools returnTypesOfMethodToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswerSelf';
			yourself))
		equals: #('self')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:31 pm (UTC)'!
testASendReachesTheMethodsItsReceiverClassesReallyImplement

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller first at: 'implementors')
		equals: #('MCPLiveTypingProbe mcpAnswered' 'MCPLiveTypingProbeChild mcpAnswered')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:33 pm (UTC)'!
testASendSaysTheClassesItAnswered

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller first at: 'returnTypes')
		equals: #('SmallInteger')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:29 pm (UTC)'!
testASendSaysTheClassesItsReceiverHeld

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller first at: 'receiverTypes')
		equals: #('MCPLiveTypingProbe')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:36 pm (UTC)'!
testASendToSomethingLiveTypingNeverSawReachesNoMethod

	| sendToAnythingElse |

	self defineProbeHierarchy.
	sendToAnythingElse := self sendsOfTheProbeCaller last.

	self assert: (sendToAnythingElse at: 'receiverTypes') isEmpty.
	self assert: (sendToAnythingElse at: 'implementors') isEmpty! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 8:05:41 pm (UTC)'!
testAServerAnswersTheToolUnwrappedWhenItIsGivenNoDecorator

	| aServer |

	aServer := MCPServer
		servingOver: MCPTransportMock new
		smalltalk: Smalltalk
		providing: MCPServer defaultToolGroupClasses
		decoratedBy: #().

	self deny: ((aServer toolNamed: MCPMethodTypesDecorator decoratedToolName) description
		includesSubString: MCPLiveTypingTools howTypesAreListedDescription)! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 8:05:39 pm (UTC)'!
testAServerAnswersTheToolWrappedByTheDecoratorItIsGiven

	| aServer |

	aServer := MCPServer
		servingOver: MCPTransportMock new
		smalltalk: Smalltalk
		providing: MCPServer defaultToolGroupClasses
		decoratedBy: (Array with: MCPMethodTypesDecorator).

	self assert: ((aServer toolNamed: MCPMethodTypesDecorator decoratedToolName) description
		includesSubString: MCPLiveTypingTools howTypesAreListedDescription)! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testAVariableThatHeldNilSaysSoAtTheEndOfItsTypes

	probeClass new mcpHold: 42.
	probeClass new mcpHold: nil.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: (Array with: 'SmallInteger' with: VariableTypeInfo canBeNilMark)! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testAnInstanceVariableThatHeldNothingHasNoTypes

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #()
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testAskingForThePossibleSendersListsTheOnesOnlyGuessedAt

	| withPossible |

	self defineProbeHierarchy.

	withPossible := self jsonAnswerOf: MCPLiveTypingTools actualSendersOfToolName with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpAnswered';
		at: 'includingPossible' put: 'true';
		yourself).

	self assert: withPossible size equals: 2
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testEveryInstanceVariableOfAClassIsAnsweredWithTheClassesItHeld

	probeClass new mcpHold: 42.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools typesOfEveryInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself))
		equals: (Dictionary new at: 'held' put: #('SmallInteger'); yourself)
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testTheActualImplementorsAreTheOnesTheSelectorCouldReallyReach

	self defineProbeHierarchy.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools actualImplementorsOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswered';
			yourself))
		equals: #('MCPLiveTypingProbe mcpAnswered' 'MCPLiveTypingProbeChild mcpAnswered')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testTheActualSendersAreTheOnesSeenSendingItToThisClass

	self defineProbeHierarchy.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools actualSendersOfToolName with: (Dictionary new
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

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
testTheImplementorsOfASelectorAreNotNarrowedWhenNoClassIsNamed

	self defineProbeHierarchy.

	self
		deny: (((self jsonAnswerOf: MCPSearchTools implementorsOfToolName with: (Dictionary new
			at: 'selectors' put: 'mcpAnswered';
			yourself)) at: 'mcpAnswered') includesKey: 'actual')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
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
		deny: ((((self jsonAnswerOf: MCPSearchTools implementorsOfToolName with: (Dictionary new
			at: 'selectors' put: 'mcpAnswered';
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself)) at: 'mcpAnswered') at: 'actual') includes: 'MCPLiveTypingStranger mcpAnswered')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testTheReturnTypesOfAMethodAreTheClassesItAnswered

	probeClass new mcpHold: 42.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools returnTypesOfMethodToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			yourself))
		equals: #('SmallInteger')
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
testTheSendersOfASelectorAreStillAnsweredWhenTheActualOnesAreAddedToThem

	self defineProbeHierarchy.

	self assert: ((self sendersAnswerOfTheProbeSelector at: 'methods') includes: 'MCPLiveTypingProbe mcpCaller')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
testTheSendersOfASelectorCarryTheOnesReallySendingIt

	"The caller writes the selector twice, and only one of them is a send to an object that
	implements it, so listing the senders finds it once and the actual ones tell which."

	self defineProbeHierarchy.

	self assert: (self sendersAnswerOfTheProbeSelector at: 'actual') equals: #('MCPLiveTypingProbe mcpCaller')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:27 pm (UTC)'!
testTheSendsOfAMethodAreListedWithTheirReceiverInTheOrderTheyAreWritten

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller collect: [ :eachSend | eachSend at: 'receiver' ])
		equals: #('self' 'anythingElse')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:17:16 pm (UTC)'!
testTheSendsOfAMethodCanBeNarrowedToOneSelector

	| narrowedSends |

	probeClass compile: 'mcpTwoSends

	^self mcpAnswerSelf printString' classified: 'probing'.

	narrowedSends := self jsonAnswerOf: MCPLiveTypingTools messageSendsOfMethodToolName with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpTwoSends';
		at: 'sentSelector' put: 'printString';
		yourself).

	self assert: (narrowedSends collect: [ :eachSend | eachSend at: 'selector' ]) equals: #('printString')! !

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

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 12:18:00 pm (UTC)'!
testTheSourceOfAMethodCarriesTheClassesTheInstanceVariablesHeld

	"The variables of a method and the instance variables of its class go in the same field
	because a temporary cannot shadow an instance variable in Cuis."

	probeClass new mcpHold: 42.

	self
		assert: ((self sourceAnswerOfTheProbe at: 'variables') at: 'held')
		equals: #('SmallInteger')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodIsStillAnsweredWhenTheTypesAreAddedToIt

	probeClass new mcpHold: 42.

	self
		assert: (self sourceAnswerOfTheProbe at: 'source')
		equals: (probeClass sourceCodeAt: #mcpHold:) asString
! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:40 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| serverWithEveryTool |

	serverWithEveryTool := MCPServer servingOver: MCPTransportMock new.

	self assert: ((serverWithEveryTool toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPLiveTypingTools typesOfInstanceVariableToolName.
			MCPLiveTypingTools typesOfEveryInstanceVariableToolName.
			MCPLiveTypingTools typesOfMethodVariableToolName.
			MCPLiveTypingTools returnTypesOfMethodToolName.
			MCPLiveTypingTools messageSendsOfMethodToolName })! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testTheTypesOfAParameterAreTheClassesItWasSent

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 'a string'.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools typesOfMethodVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			at: 'variableName' put: 'anObject';
			yourself))
		equals: (Array with: VariableTypeInfo anyTypeMark with: 'SmallInteger' with: 'String')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testTheTypesOfAVariableAreLedByTheClassTheyAllInheritFrom

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 1000000000000000000000.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #('Integer' 'LargePositiveInteger' 'SmallInteger')! !

!MCPLiveTypingToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 10:00:35 pm (UTC)'!
testTheTypesOfAnInstanceVariableAreTheClassesItHeld

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 'a string'.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingTools typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: (Array with: VariableTypeInfo anyTypeMark with: 'SmallInteger' with: 'String')! !

!MCPLiveTypingToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:49:51 pm (UTC)'!
toolDecoratorClasses

	^{
		MCPMethodTypesDecorator.
		MCPInstanceVariableTypesDecorator.
		MCPActualSendersDecorator.
		MCPActualImplementorsDecorator }! !

!MCPLiveTypingToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:49:49 pm (UTC)'!
toolGroupClasses

	^{ MCPModelStructureTools. MCPSearchTools. MCPLiveTypingTools }! !

!MCPLiveTypingToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
classCategoryOfTestData

	^'__MCPLiveTypingTestData__'
! !

!MCPLiveTypingToolsTest class methodsFor: 'test data' stamp: 'HAW 7/Sep/2026, 10:27:18 pm (UTC)'!
classNamePrefixOfTestData

	^'MCPLiveTyping'! !
