'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 10:43:53 am'!
'Description Let a class method say the name of each tool'!
!provides: 'MCPServerExtraRefactoringTest' 1 9!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraRefactoring' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraRefactoringTest!


!classDefinition: #MCPExtraRefactoringToolsTest category: #MCPServerExtraRefactoringTest!
DynamicallyCodeCreatingTest subclass: #MCPExtraRefactoringToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoringTest'!
!classDefinition: 'MCPExtraRefactoringToolsTest class' category: #MCPServerExtraRefactoringTest!
MCPExtraRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
setUp

	super setUp.
	self registerClassCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
defineClassNamed: aClassName instanceVariableNames: someInstanceVariableNames

	^Object subclass: aClassName asSymbol
		instanceVariableNames: someInstanceVariableNames
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
registerClassCategoryOfTestData

	"The classes these tests make are made by the refactorings themselves and not by
	createClassNamed:, so the category has to be registered for tearDown to remove them."

	classCategories add: self classCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
sourceClass

	^Smalltalk classNamed: 'MCPExtraTestSource'
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
targetClass

	^Smalltalk classNamed: 'MCPExtraTestTarget'
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:54:06 am (UTC)'!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testExtractingAClassAnswersTheDefinitionOfTheOneItCreated

	self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable stayingVariable'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringTools extractClassToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'newClassName' put: 'MCPExtraTestTarget';
			at: 'instanceVariableName' put: 'reachingVariable';
			at: 'variableNames' put: 'movingVariable';
			yourself))
		equals: 'Refactoring applied. Class created:' , String newLineString , String newLineString ,
			self targetClass definition
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testExtractingAClassTakesTheVariablesNamedIntoTheNewOne

	self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable stayingVariable'.

	(self toolNamed: MCPExtraRefactoringTools extractClassToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'instanceVariableName' put: 'reachingVariable';
		at: 'variableNames' put: 'movingVariable';
		yourself).

	self assert: (Smalltalk classNamed: 'MCPExtraTestTarget') notNil.
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') instVarNames includes: 'movingVariable').
	self assert: (self sourceClass instVarNames includes: 'stayingVariable')
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testExtractingAParameterObjectAnswersTheMethodsItChanged

	"The method that takes the parameter object is a new one, and the one it came from is gone,
	which the refactoring says apart from the methods that are still there."

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpFirst: aFirst second: aSecond third: aThird

	^aFirst' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringTools extractParameterObjectToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'selector' put: 'mcpFirst:second:third:';
			at: 'newClassName' put: 'MCPExtraTestTarget';
			at: 'parameterNames' put: 'aFirst, aThird';
			at: 'category' put: self classCategoryOfTestData;
			yourself))
		equals: 'Refactoring applied. 1 method changed:
MCPExtraTestSource>>#second:mCPExtraTestTarget:
1 method removed:
MCPExtraTestSource>>#mcpFirst:second:third:'

! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testExtractingAParameterObjectGathersTheParametersNamed

	"The parameters keep their names without the article they were written with, so aFirst is
	held as first, and the method is left taking the ones that were not gathered."

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpFirst: aFirst second: aSecond third: aThird

	^aFirst' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringTools extractParameterObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpFirst:second:third:';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'parameterNames' put: 'aFirst, aThird';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self deny: (self sourceClass includesSelector: 'mcpFirst:second:third:' asSymbol).
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') instVarNames includesAllOf: #('first' 'third')).
	self assert: (self sourceClass includesSelector: 'second:mCPExtraTestTarget:' asSymbol)! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:27:48 pm (UTC)'!
testExtractingToAMethodObjectAnswersTheDefinitionOfTheClassItCreated

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpProbe

	^42' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringTools extractToMethodObjectToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'selector' put: 'mcpProbe';
			at: 'newClassName' put: 'MCPExtraTestTarget';
			at: 'evaluationSelector' put: 'mcpEvaluate';
			at: 'category' put: self classCategoryOfTestData;
			yourself))
		equals: 'Refactoring applied. Class created:' , String newLineString , String newLineString ,
			self targetClass definition

! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testExtractingToAMethodObjectMakesTheClassThatDoesWhatTheMethodDid

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpProbe

	^42' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringTools extractToMethodObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'evaluationSelector' put: 'mcpEvaluate';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self assert: (Smalltalk classNamed: 'MCPExtraTestTarget') notNil.
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') includesSelector: 'mcpEvaluate' asSymbol)

! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testMovingAMethodAnswersTheMethodsItChanged

	"The method is in the other class and the one it came from is left delegating to it, so
	both are methods that changed."

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringTools moveMethodToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'selector' put: 'mcpMoving';
			at: 'targetClassName' put: 'MCPExtraTestTarget';
			at: 'accessingThrough' put: 'reachingVariable';
			yourself))
		equals: 'Refactoring applied. 2 methods changed:
MCPExtraTestSource>>#mcpMoving
MCPExtraTestTarget>>#mcpMoving'
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testMovingAMethodTakesItToTheOtherClass

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringTools moveMethodToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpMoving';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		at: 'accessingThrough' put: 'reachingVariable';
		yourself).

	self assert: (self targetClass includesSelector: 'mcpMoving' asSymbol)
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testMovingAnInstanceVariableAnswersTheDefinitionsOfTheClassesItChanged

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringTools moveInstanceVariableToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'variableName' put: 'movingVariable';
			at: 'targetClassName' put: 'MCPExtraTestTarget';
			at: 'accessingThrough' put: 'reachingVariable';
			yourself))
		equals: 'Refactoring applied. 2 classes changed:' , String newLineString , String newLineString ,
			self sourceClass definition , String newLineString , String newLineString ,
			self targetClass definition
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testMovingAnInstanceVariableTakesItToTheOtherClass

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringTools moveInstanceVariableToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'variableName' put: 'movingVariable';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		at: 'accessingThrough' put: 'reachingVariable';
		yourself).

	self deny: (self sourceClass instVarNames includes: 'movingVariable').
	self assert: (self targetClass instVarNames includes: 'movingVariable')
! !

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:35:10 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPExtraRefactoringTools moveInstanceVariableToolName.
			MCPExtraRefactoringTools moveMethodToolName.
			MCPExtraRefactoringTools extractClassToolName })! !

!MCPExtraRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
classCategoryOfTestData

	^'__MCPExtraRefactoringTestData__'
! !
