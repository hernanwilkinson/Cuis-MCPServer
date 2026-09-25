'From Cuis7.9 [latest update: #8184] on 25 September 2026 at 4:24:33 pm'!
'Description Name the tests after the tool boxes they test'!
!provides: 'MCPServerLiveTypingTests' 1 21!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingTests!


!classDefinition: #MCPLiveTypingToolBoxTest category: #MCPServerLiveTypingTests!
MCPToolBoxTest subclass: #MCPLiveTypingToolBoxTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingTests'!
!classDefinition: 'MCPLiveTypingToolBoxTest class' category: #MCPServerLiveTypingTests!
MCPLiveTypingToolBoxTest class
	instanceVariableNames: ''!


!MCPLiveTypingToolBoxTest methodsFor: 'running' stamp: 'HAW 7/Sep/2026, 9:49:28 pm (UTC)'!
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

!MCPLiveTypingToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:37:32 am (UTC)'!
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

!MCPLiveTypingToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:51 pm (UTC)'!
definitionAnswerOfTheProbe

	^(self jsonAnswerOf: MCPModelStructureToolBox classDefinitionsToolName with: (Dictionary new
		at: 'classNames' put: 'MCPLiveTypingProbe';
		yourself)) at: 'MCPLiveTypingProbe'! !

!MCPLiveTypingToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:52 pm (UTC)'!
sendersAnswerOfTheProbeSelector

	^(self jsonAnswerOf: MCPSearchToolBox sendersOfToolName with: (Dictionary new
		at: 'selectors' put: 'mcpAnswered';
		at: 'className' put: 'MCPLiveTypingProbe';
		yourself)) at: 'mcpAnswered'! !

!MCPLiveTypingToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
sendsOfTheProbeCaller

	^self jsonAnswerOf: MCPLiveTypingToolBox messageSendsOfMethodToolName with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpCaller';
		yourself)! !

!MCPLiveTypingToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:51 pm (UTC)'!
sourceAnswerOfTheProbe

	^(self jsonAnswerOf: MCPModelStructureToolBox methodSourcesToolName with: (Dictionary new
		at: 'methods' put: 'MCPLiveTypingProbe>>mcpHold:';
		yourself)) at: 'MCPLiveTypingProbe>>#mcpHold:'! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testAClassThatAnswersTheSelectorNowhereIsLeftOutUnlessAskedFor

	self defineProbeHierarchy.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox actualImplementorsOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpNeverImplemented';
			yourself))
		equals: #().

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox actualImplementorsOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpNeverImplemented';
			at: 'includingPossible' put: 'true';
			yourself)) size
		equals: 1

! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testAMethodThatAnswersItsReceiverSaysSo

	probeClass new mcpAnswerSelf.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox returnTypesOfMethodToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswerSelf';
			yourself))
		equals: #('self')
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:31 pm (UTC)'!
testASendReachesTheMethodsItsReceiverClassesReallyImplement

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller first at: 'implementors')
		equals: #('MCPLiveTypingProbe mcpAnswered' 'MCPLiveTypingProbeChild mcpAnswered')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:33 pm (UTC)'!
testASendSaysTheClassesItAnswered

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller first at: 'returnTypes')
		equals: #('SmallInteger')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:29 pm (UTC)'!
testASendSaysTheClassesItsReceiverHeld

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller first at: 'receiverTypes')
		equals: #('MCPLiveTypingProbe')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:36 pm (UTC)'!
testASendToSomethingLiveTypingNeverSawReachesNoMethod

	| sendToAnythingElse |

	self defineProbeHierarchy.
	sendToAnythingElse := self sendsOfTheProbeCaller last.

	self assert: (sendToAnythingElse at: 'receiverTypes') isEmpty.
	self assert: (sendToAnythingElse at: 'implementors') isEmpty! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
testAServerAnswersTheToolUnwrappedWhenItIsGivenNoDecorator

	| aServer |

	aServer := MCPServer
		servingOver: MCPTransportMock new
		smalltalk: Smalltalk
		providing: MCPServer defaultToolBoxClasses
		decoratedBy: #().

	self deny: ((aServer toolNamed: MCPMethodTypesDecorator decoratedToolName) description
		includesSubString: MCPLiveTypingToolBox howTypesAreListedDescription)! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
testAServerAnswersTheToolWrappedByTheDecoratorItIsGiven

	| aServer |

	aServer := MCPServer
		servingOver: MCPTransportMock new
		smalltalk: Smalltalk
		providing: MCPServer defaultToolBoxClasses
		decoratedBy: (Array with: MCPMethodTypesDecorator).

	self assert: ((aServer toolNamed: MCPMethodTypesDecorator decoratedToolName) description
		includesSubString: MCPLiveTypingToolBox howTypesAreListedDescription)! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testAVariableThatHeldNilSaysSoAtTheEndOfItsTypes

	probeClass new mcpHold: 42.
	probeClass new mcpHold: nil.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: (Array with: 'SmallInteger' with: VariableTypeInfo canBeNilMark)! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testAnInstanceVariableThatHeldNothingHasNoTypes

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #()
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testAskingForThePossibleSendersListsTheOnesOnlyGuessedAt

	| withPossible |

	self defineProbeHierarchy.

	withPossible := self jsonAnswerOf: MCPLiveTypingToolBox actualSendersOfToolName with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpAnswered';
		at: 'includingPossible' put: 'true';
		yourself).

	self assert: withPossible size equals: 2
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testEveryInstanceVariableOfAClassIsAnsweredWithTheClassesItHeld

	probeClass new mcpHold: 42.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox typesOfEveryInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself))
		equals: (Dictionary new at: 'held' put: #('SmallInteger'); yourself)
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
testStepNamingDecoratedToolWithClientPrefixRunsDecorator

	| aServer step answer |

	aServer := MCPServer
		servingOver: MCPTransportMock new
		smalltalk: Smalltalk
		providing: MCPServer defaultToolBoxClasses
		decoratedBy: (Array with: MCPMethodTypesDecorator).
	step := Dictionary new
		at: 'tool' put: 'mcp__Cuis__' , MCPMethodTypesDecorator decoratedToolName;
		at: 'arguments' put: (self arguments: 'methods' being: 'Object>>yourself');
		yourself.

	answer := aServer
		executeTool: MCPImageToolBox batchToolName
		arguments: (self arguments: 'steps' being: { step }).

	self assert: (answer includesSubString: '"returns"')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheActualImplementorsAreTheOnesTheSelectorCouldReallyReach

	self defineProbeHierarchy.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox actualImplementorsOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswered';
			yourself))
		equals: #('MCPLiveTypingProbe mcpAnswered' 'MCPLiveTypingProbeChild mcpAnswered')
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheActualSendersAreTheOnesSeenSendingItToThisClass

	self defineProbeHierarchy.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox actualSendersOfToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpAnswered';
			yourself))
		equals: #('MCPLiveTypingProbe mcpCaller')
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 12:16:37 pm (UTC)'!
testTheDefinitionOfAClassCarriesTheClassesItsInstanceVariablesHeld

	probeClass new mcpHold: 42.

	self
		assert: ((self definitionAnswerOfTheProbe at: 'instanceVariableTypes') at: 'held')
		equals: #('SmallInteger')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 12:16:44 pm (UTC)'!
testTheDefinitionOfAClassIsStillAnsweredWhenTheTypesAreAddedToIt

	probeClass new mcpHold: 42.

	self assert: (self definitionAnswerOfTheProbe at: 'superclass') equals: 'Object'! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:52 pm (UTC)'!
testTheImplementorsOfASelectorAreNotNarrowedWhenNoClassIsNamed

	self defineProbeHierarchy.

	self
		deny: (((self jsonAnswerOf: MCPSearchToolBox implementorsOfToolName with: (Dictionary new
			at: 'selectors' put: 'mcpAnswered';
			yourself)) at: 'mcpAnswered') includesKey: 'actual')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:52 pm (UTC)'!
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
		deny: ((((self jsonAnswerOf: MCPSearchToolBox implementorsOfToolName with: (Dictionary new
			at: 'selectors' put: 'mcpAnswered';
			at: 'className' put: 'MCPLiveTypingProbe';
			yourself)) at: 'mcpAnswered') at: 'actual') includes: 'MCPLiveTypingStranger mcpAnswered')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheReturnTypesOfAMethodAreTheClassesItAnswered

	probeClass new mcpHold: 42.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox returnTypesOfMethodToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			yourself))
		equals: #('SmallInteger')
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
testTheSendersOfASelectorAreStillAnsweredWhenTheActualOnesAreAddedToThem

	self defineProbeHierarchy.

	self assert: ((self sendersAnswerOfTheProbeSelector at: 'methods') includes: 'MCPLiveTypingProbe mcpCaller')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 11/Sep/2026, 2:17:04 pm (UTC)'!
testTheSendersOfASelectorCarryTheOnesReallySendingIt

	"The caller writes the selector twice, and only one of them is a send to an object that
	implements it, so listing the senders finds it once and the actual ones tell which."

	self defineProbeHierarchy.

	self assert: (self sendersAnswerOfTheProbeSelector at: 'actual') equals: #('MCPLiveTypingProbe mcpCaller')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 8/Sep/2026, 11:15:27 pm (UTC)'!
testTheSendsOfAMethodAreListedWithTheirReceiverInTheOrderTheyAreWritten

	self defineProbeHierarchy.

	self
		assert: (self sendsOfTheProbeCaller collect: [ :eachSend | eachSend at: 'receiver' ])
		equals: #('self' 'anythingElse')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheSendsOfAMethodCanBeNarrowedToOneSelector

	| narrowedSends |

	probeClass compile: 'mcpTwoSends

	^self mcpAnswerSelf printString' classified: 'probing'.

	narrowedSends := self jsonAnswerOf: MCPLiveTypingToolBox messageSendsOfMethodToolName with: (Dictionary new
		at: 'className' put: 'MCPLiveTypingProbe';
		at: 'selector' put: 'mcpTwoSends';
		at: 'sentSelector' put: 'printString';
		yourself).

	self assert: (narrowedSends collect: [ :eachSend | eachSend at: 'selector' ]) equals: #('printString')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodCarriesTheClassesItAnswered

	probeClass new mcpHold: 42.

	self assert: (self sourceAnswerOfTheProbe at: 'returns') equals: #('SmallInteger')
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodCarriesTheClassesItsParametersHeld

	probeClass new mcpHold: 42.

	self assert: ((self sourceAnswerOfTheProbe at: 'variables') at: 'anObject') equals: #('SmallInteger')

! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 12:18:00 pm (UTC)'!
testTheSourceOfAMethodCarriesTheClassesTheInstanceVariablesHeld

	"The variables of a method and the instance variables of its class go in the same field
	because a temporary cannot shadow an instance variable in Cuis."

	probeClass new mcpHold: 42.

	self
		assert: ((self sourceAnswerOfTheProbe at: 'variables') at: 'held')
		equals: #('SmallInteger')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 27/Aug/2026, 7:07:59 pm (UTC)'!
testTheSourceOfAMethodIsStillAnsweredWhenTheTypesAreAddedToIt

	probeClass new mcpHold: 42.

	self
		assert: (self sourceAnswerOfTheProbe at: 'source')
		equals: (probeClass sourceCodeAt: #mcpHold:) asString
! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| serverWithEveryTool |

	serverWithEveryTool := MCPServer servingOver: MCPTransportMock new.

	self assert: ((serverWithEveryTool toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPLiveTypingToolBox typesOfInstanceVariableToolName.
			MCPLiveTypingToolBox typesOfEveryInstanceVariableToolName.
			MCPLiveTypingToolBox typesOfMethodVariableToolName.
			MCPLiveTypingToolBox returnTypesOfMethodToolName.
			MCPLiveTypingToolBox messageSendsOfMethodToolName })! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheTypesOfAParameterAreTheClassesItWasSent

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 'a string'.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox typesOfMethodVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'selector' put: 'mcpHold:';
			at: 'variableName' put: 'anObject';
			yourself))
		equals: (Array with: VariableTypeInfo anyTypeMark with: 'SmallInteger' with: 'String')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheTypesOfAVariableAreLedByTheClassTheyAllInheritFrom

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 1000000000000000000000.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: #('Integer' 'LargePositiveInteger' 'SmallInteger')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
testTheTypesOfAnInstanceVariableAreTheClassesItHeld

	probeClass new mcpHold: 42.
	probeClass new mcpHold: 'a string'.

	self
		assert: (self jsonAnswerOf: MCPLiveTypingToolBox typesOfInstanceVariableToolName with: (Dictionary new
			at: 'className' put: 'MCPLiveTypingProbe';
			at: 'variableName' put: 'held';
			yourself))
		equals: (Array with: VariableTypeInfo anyTypeMark with: 'SmallInteger' with: 'String')! !

!MCPLiveTypingToolBoxTest methodsFor: 'tools under test' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
toolBoxClasses

	^{ MCPModelStructureToolBox. MCPSearchToolBox. MCPLiveTypingToolBox }! !

!MCPLiveTypingToolBoxTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:49:51 pm (UTC)'!
toolDecoratorClasses

	^{
		MCPMethodTypesDecorator.
		MCPInstanceVariableTypesDecorator.
		MCPActualSendersDecorator.
		MCPActualImplementorsDecorator }! !

!MCPLiveTypingToolBoxTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
classCategoryOfTestData

	^'__MCPLiveTypingTestData__'
! !

!MCPLiveTypingToolBoxTest class methodsFor: 'test data' stamp: 'HAW 7/Sep/2026, 10:27:18 pm (UTC)'!
classNamePrefixOfTestData

	^'MCPLiveTyping'! !
