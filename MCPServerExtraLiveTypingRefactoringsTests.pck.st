'From Cuis7.9 [latest update: #8184] on 25 September 2026 at 1:48:17 pm'!
'Description Name the tool groups as tool boxes'!
!provides: 'MCPServerExtraLiveTypingRefactoringsTests' 1 15!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraLiveTypingRefactoringsTests!


!classDefinition: #MCPExtraLiveTypingRefactoringToolsTest category: #MCPServerExtraLiveTypingRefactoringsTests!
MCPToolsTest subclass: #MCPExtraLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactoringsTests'!
!classDefinition: 'MCPExtraLiveTypingRefactoringToolsTest class' category: #MCPServerExtraLiveTypingRefactoringsTests!
MCPExtraLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 7/Sep/2026, 9:49:32 pm (UTC)'!
setUp

	super setUp.
	probeClass := Object subclass: #MCPExtraLiveTypingRefactoringProbe
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:46:06 pm (UTC)'!
apply: aToolName inActualScopeWith: anArguments

	"Ask the tool that applies the refactoring over the scope it is told for the actual one,
	which is how a client reaches the refactoring LiveTyping makes possible now that it is
	not offered under a name of its own."

	anArguments
		at: MCPRefactoringToolBox scopePropertyName
		put: MCPActualScopeRefactoringDecorator actualScopeName.

	^(self toolNamed: aToolName) valueWithArguments: anArguments! !

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

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:48 pm (UTC)'!
gatherFirstParameterOf: aSelector

	^self apply: MCPExtraRefactoringToolBox extractParameterObjectToolName inActualScopeWith: (Dictionary new
		at: 'className' put: 'MCPExtraLiveTypingRefactoringProbe';
		at: 'selector' put: aSelector;
		at: 'newClassName' put: 'MCPExtraLiveTypingRefactoringParameters';
		at: 'parameterNames' put: 'aFirst';
		yourself)! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
parameterObjectClass

	^Smalltalk classNamed: 'MCPExtraLiveTypingRefactoringParameters'
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

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:46:06 pm (UTC)'!
testGatheringParametersTakesTheActualScopeThroughTheToolThatWorksOverAScope

	"The send inside the ifTrue: is to a variable LiveTyping never saw hold anything, so the
	actual scope leaves it as it was, which no other scope of that tool can tell apart."

	self compileProbeSending: 'mcpCaller

	| anythingElse |

	self mcpFirst: 1 second: 2.
	false ifTrue: [ anythingElse mcpFirst: 3 second: 4 ]'.

	(self toolNamed: MCPExtraRefactoringToolBox extractParameterObjectToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpFirst:second:';
			at: 'newClassName' put: 'MCPExtraLiveTypingRefactoringParameters';
			at: 'parameterNames' put: 'aFirst';
			at: MCPRefactoringToolBox scopePropertyName put: MCPActualScopeRefactoringDecorator actualScopeName;
			yourself).

	self assert: ((probeClass sourceCodeAt: #mcpCaller)
		includesSubstring: 'anythingElse mcpFirst: 3 second: 4' caseSensitive: true).
	self assert: (self parameterObjectClass instVarNames includes: 'first')! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testMovingAMethodInTheActualScopeTakesItToTheClassLiveTypingSaw

	| targetClass |

	targetClass := self compileProbeHoldingATarget.

	self apply: MCPExtraRefactoringToolBox moveMethodToolName inActualScopeWith: (Dictionary new
		at: 'className' put: probeClass name;
		at: 'selector' put: 'mcpAskTheHolder';
		at: 'receiver' put: 'holder';
		yourself).

	self assert: (targetClass includesSelector: #mcpAskTheHolder)! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testMovingAnInstanceVariableInTheActualScopeTakesItToTheClassLiveTypingSaw

	"The class it is moved to is not named: it is the one LiveTyping saw the instance variable
	it is reached through hold."

	| targetClass |

	targetClass := self compileProbeHoldingATarget.

	self apply: MCPExtraRefactoringToolBox moveInstanceVariableToolName inActualScopeWith: (Dictionary new
		at: 'className' put: probeClass name;
		at: 'variableName' put: 'moved';
		at: 'accessingThrough' put: 'holder';
		yourself).

	self assert: (targetClass instVarNames includes: 'moved').
	self deny: (probeClass instVarNames includes: 'moved')! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:46:06 pm (UTC)'!
testMovingAnInstanceVariableTakesTheActualScopeThroughTheToolThatIsToldTheClass

	"The tool that moves is told the class to move to and knows no scope of its own, so the
	actual scope is what the decorator adds to it, and it needs no targetClassName."

	| targetClass |

	targetClass := self compileProbeHoldingATarget.

	(self toolNamed: MCPExtraRefactoringToolBox moveInstanceVariableToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'variableName' put: 'moved';
			at: 'accessingThrough' put: 'holder';
			at: MCPRefactoringToolBox scopePropertyName put: MCPActualScopeRefactoringDecorator actualScopeName;
			yourself).

	self assert: (targetClass instVarNames includes: 'moved')! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tools under test' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
toolBoxClasses

	^{ MCPExtraRefactoringToolBox }! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:50:03 pm (UTC)'!
toolDecoratorClasses

	^{
		MCPExtractParameterObjectInActualScopeDecorator.
		MCPMoveInstanceVariableInActualScopeDecorator.
		MCPMoveMethodInActualScopeDecorator }! !

!MCPExtraLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
classCategoryOfTestData

	^'__MCPExtraLiveTypingRefactoringTestData__'
! !

!MCPExtraLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 7/Sep/2026, 10:27:21 pm (UTC)'!
classNamePrefixOfTestData

	^'MCPExtraLiveTypingRefactoring'! !
