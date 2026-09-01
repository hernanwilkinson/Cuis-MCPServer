'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 1:37:52 pm'!
'Description Let a refactoring work over the scope LiveTyping saw'!
!provides: 'MCPServerExtraLiveTypingRefactoringsTests' 1 7!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraLiveTypingRefactoringsTests!


!classDefinition: #MCPExtraLiveTypingRefactoringToolsTest category: #MCPServerExtraLiveTypingRefactoringsTests!
DynamicallyCodeCreatingTest subclass: #MCPExtraLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactoringsTests'!
!classDefinition: 'MCPExtraLiveTypingRefactoringToolsTest class' category: #MCPServerExtraLiveTypingRefactoringsTests!
MCPExtraLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
setUp

	super setUp.
	classCategories add: self classCategoryOfTestData.
	probeClass := Object subclass: #MCPExtraLiveTypingRefactoringProbe
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 4:31:15 pm (UTC)'!
compileProbeHoldingATarget

	"Give the probe an instance variable that LiveTyping sees hold a target while the code runs,
	which is the class a refactoring in the actual scope moves to without being told, and
	answer the target."

	| targetClass |

	targetClass := Object subclass: #MCPExtraLiveTypingRefactoringTarget
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData.
	probeClass := Object subclass: #MCPExtraLiveTypingRefactoringProbe
		instanceVariableNames: 'moved holder'
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData.
	probeClass compile: 'mcpInitialize

	holder := MCPExtraLiveTypingRefactoringTarget new.
	moved := 42' classified: 'probing'.
	probeClass compile: 'mcpAskTheHolder

	^holder printString' classified: 'probing'.
	(probeClass >> #mcpInitialize) initializeTypeInformation.
	probeClass new mcpInitialize.

	^targetClass! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
compileProbeSending: aCallerSource

	probeClass compile: 'mcpFirst: aFirst second: aSecond

	^aFirst' classified: 'probing'.
	probeClass compile: aCallerSource classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 1:27:48 pm (UTC)'!
gatherFirstParameterOf: aSelector

	^(self toolNamed: MCPExtraLiveTypingRefactoringTools extractParameterObjectInActualScopeToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraLiveTypingRefactoringProbe';
		at: 'selector' put: aSelector;
		at: 'newClassName' put: 'MCPExtraLiveTypingRefactoringParameters';
		at: 'parameterNames' put: 'aFirst';
		yourself)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
parameterObjectClass

	^Smalltalk classNamed: 'MCPExtraLiveTypingRefactoringParameters'
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
probeClass

	^probeClass
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 26/Aug/2026, 7:37:02 pm (UTC)'!
testGatheringParametersInTheActualScopeAnswersTheMethodsItChanged

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self
		assert: (self gatherFirstParameterOf: 'mcpFirst:second:')
		equals: 'Refactoring applied. 2 methods changed:
MCPExtraLiveTypingRefactoringProbe>>#mcpCaller
MCPExtraLiveTypingRefactoringProbe>>#second:mCPExtraLiveTypingRefactoringParameters:
1 method removed:
MCPExtraLiveTypingRefactoringProbe>>#mcpFirst:second:'

! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
testGatheringParametersInTheActualScopeChangesTheSendsItSaw

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'MCPExtraLiveTypingRefactoringParameters' caseSensitive: true)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
testGatheringParametersInTheActualScopeLeavesASendToAnythingElseAlone

	"The send inside the ifTrue: is to a variable LiveTyping never saw hold anything, so it is
	a send of the same name that is not a send to this class, and it is left as it was."

	self compileProbeSending: 'mcpCaller

	| anythingElse |

	self mcpFirst: 1 second: 2.
	false ifTrue: [ anythingElse mcpFirst: 3 second: 4 ]'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'anythingElse mcpFirst: 3 second: 4' caseSensitive: true)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
testGatheringParametersInTheActualScopeTakesThemToTheNewClass

	"The parameters keep their names without the article they were written with, so aFirst is
	held as first."

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: (self parameterObjectClass instVarNames includes: 'first')
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 4:31:58 pm (UTC)'!
testGatheringParametersTakesTheActualScopeThroughTheToolThatWorksOverAScope

	"The send inside the ifTrue: is to a variable LiveTyping never saw hold anything, so the
	actual scope leaves it as it was, which no other scope of that tool can tell apart."

	self compileProbeSending: 'mcpCaller

	| anythingElse |

	self mcpFirst: 1 second: 2.
	false ifTrue: [ anythingElse mcpFirst: 3 second: 4 ]'.

	(self toolNamed: MCPExtraRefactoringTools extractParameterObjectToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpFirst:second:';
			at: 'newClassName' put: 'MCPExtraLiveTypingRefactoringParameters';
			at: 'parameterNames' put: 'aFirst';
			at: MCPRefactoringToolGroup scopePropertyName put: MCPActualScopeRefactoringToolGroup actualScopeName;
			yourself).

	self assert: ((probeClass sourceCodeAt: #mcpCaller)
		includesSubstring: 'anythingElse mcpFirst: 3 second: 4' caseSensitive: true).
	self assert: (self parameterObjectClass instVarNames includes: 'first')! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 4:31:30 pm (UTC)'!
testMovingAMethodInTheActualScopeTakesItToTheClassLiveTypingSaw

	| targetClass |

	targetClass := self compileProbeHoldingATarget.

	(self toolNamed: MCPExtraLiveTypingRefactoringTools moveMethodInActualScopeToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpAskTheHolder';
			at: 'accessingThrough' put: 'holder';
			yourself).

	self assert: (targetClass includesSelector: #mcpAskTheHolder)! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 4:31:23 pm (UTC)'!
testMovingAnInstanceVariableInTheActualScopeTakesItToTheClassLiveTypingSaw

	"The class it is moved to is not named: it is the one LiveTyping saw the instance variable
	it is reached through hold."

	| targetClass |

	targetClass := self compileProbeHoldingATarget.

	(self toolNamed: MCPExtraLiveTypingRefactoringTools moveInstanceVariableInActualScopeToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'variableName' put: 'moved';
			at: 'accessingThrough' put: 'holder';
			yourself).

	self assert: (targetClass instVarNames includes: 'moved').
	self deny: (probeClass instVarNames includes: 'moved')! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 4:31:36 pm (UTC)'!
testMovingAnInstanceVariableTakesTheActualScopeThroughTheToolThatIsToldTheClass

	"The tool that moves is told the class to move to and knows no scope of its own, so the
	actual scope is what the decorator adds to it, and it needs no targetClassName."

	| targetClass |

	targetClass := self compileProbeHoldingATarget.

	(self toolNamed: MCPExtraRefactoringTools moveInstanceVariableToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'variableName' put: 'moved';
			at: 'accessingThrough' put: 'holder';
			at: MCPRefactoringToolGroup scopePropertyName put: MCPActualScopeRefactoringToolGroup actualScopeName;
			yourself).

	self assert: (targetClass instVarNames includes: 'moved')! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 4:31:43 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPExtraLiveTypingRefactoringTools extractParameterObjectInActualScopeToolName.
			MCPExtraLiveTypingRefactoringTools moveInstanceVariableInActualScopeToolName.
			MCPExtraLiveTypingRefactoringTools moveMethodInActualScopeToolName })! !

!MCPExtraLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
classCategoryOfTestData

	^'__MCPExtraLiveTypingRefactoringTestData__'
! !
