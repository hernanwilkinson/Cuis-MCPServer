'From Cuis7.9 [latest update: #8134] on 25 August 2026 at 7:41:22 am'!
'Description Extract a parameter object and a method object'!
!provides: 'MCPServerExtraRefactoringTest' 1 2!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraRefactoring' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraRefactoringTest!


!classDefinition: #MCPExtraRefactoringToolsTest category: #MCPServerExtraRefactoringTest!
DynamicallyCodeCreationTest subclass: #MCPExtraRefactoringToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoringTest'!
!classDefinition: 'MCPExtraRefactoringToolsTest class' category: #MCPServerExtraRefactoringTest!
MCPExtraRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
setUp

	super setUp.
	self registerClassCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
defineClassNamed: aClassName instanceVariableNames: someInstanceVariableNames

	^Object subclass: aClassName asSymbol
		instanceVariableNames: someInstanceVariableNames
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
registerClassCategoryOfTestData

	"The classes these tests make are made by the refactorings themselves and not by
	createClassNamed:, so the category has to be registered for tearDown to remove them."

	classCategories add: self classCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
sourceClass

	^Smalltalk classNamed: 'MCPExtraTestSource'
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
targetClass

	^Smalltalk classNamed: 'MCPExtraTestTarget'
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
toolNamed: aToolName

	^(MCPExtraRefactoringTools for: Smalltalk) tools
		detect: [ :eachTool | eachTool name = aToolName ]
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:32:17 pm (UTC)'!
!methodProperties: {}!
testExtractingAClassTakesTheVariablesNamedIntoTheNewOne

	self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable stayingVariable'.

	(self toolNamed: 'smalltalk_refactor_extract_class') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'instanceVariableName' put: 'reachingVariable';
		at: 'variableNames' put: 'movingVariable';
		yourself).

	self assert: (Smalltalk classNamed: 'MCPExtraTestTarget') notNil.
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') instVarNames includes: 'movingVariable').
	self assert: (self sourceClass instVarNames includes: 'stayingVariable')
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:41:07 am (UTC)'!
!methodProperties: {}!
testExtractingAParameterObjectGathersTheParametersNamed

	"The parameters keep their names without the article they were written with, so aFirst is
	held as first, and the method is left taking the ones that were not gathered."

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpFirst: aFirst second: aSecond third: aThird

	^aFirst' classified: 'probing'.

	(self toolNamed: 'smalltalk_refactor_extract_parameter_object') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpFirst:second:third:';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'parameterNames' put: 'aFirst, aThird';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self deny: (self sourceClass includesSelector: 'mcpFirst:second:third:' asSymbol).
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') instVarNames includesAllOf: #('first' 'third')).
	self assert: (self sourceClass includesSelector: 'second:mCPExtraTestTarget:' asSymbol)! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 10:40:32 am (UTC)'!
!methodProperties: {}!
testExtractingToAMethodObjectMakesTheClassThatDoesWhatTheMethodDid

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpProbe

	^42' classified: 'probing'.

	(self toolNamed: 'smalltalk_refactor_extract_to_method_object') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'evaluationSelector' put: 'mcpEvaluate';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self assert: (Smalltalk classNamed: 'MCPExtraTestTarget') notNil.
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') includesSelector: 'mcpEvaluate' asSymbol)

! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:32:17 pm (UTC)'!
!methodProperties: {}!
testMovingAMethodTakesItToTheOtherClass

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	(self toolNamed: 'smalltalk_refactor_move_method') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpMoving';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		at: 'accessingThrough' put: 'reachingVariable';
		yourself).

	self assert: (self targetClass includesSelector: 'mcpMoving' asSymbol)
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
testMovingAnInstanceVariableTakesItToTheOtherClass

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.

	(self toolNamed: 'smalltalk_refactor_move_instance_variable') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'variableName' put: 'movingVariable';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		at: 'accessingThrough' put: 'reachingVariable';
		yourself).

	self deny: (self sourceClass instVarNames includes: 'movingVariable').
	self assert: (self targetClass instVarNames includes: 'movingVariable')
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:32:17 pm (UTC)'!
!methodProperties: {}!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: #('smalltalk_refactor_move_instance_variable' 'smalltalk_refactor_move_method' 'smalltalk_refactor_extract_class'))

! !

!MCPExtraRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	^'__MCPExtraRefactoringTestData__'
! !
