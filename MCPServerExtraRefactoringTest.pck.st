'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 10:05:20 am'!
'Description Give the refactoring tools the options their appliers ask for'!
!provides: 'MCPServerExtraRefactoringTest' 1 12!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraRefactoring' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraRefactoringTest!


!classDefinition: #MCPExtraRefactoringToolsTest category: #MCPServerExtraRefactoringTest!
MCPToolsTest subclass: #MCPExtraRefactoringToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoringTest'!
!classDefinition: 'MCPExtraRefactoringToolsTest class' category: #MCPServerExtraRefactoringTest!
MCPExtraRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
defineClassNamed: aClassName instanceVariableNames: someInstanceVariableNames

	^Object subclass: aClassName asSymbol
		instanceVariableNames: someInstanceVariableNames
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
sourceClass

	^Smalltalk classNamed: 'MCPExtraTestSource'
! !

!MCPExtraRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
targetClass

	^Smalltalk classNamed: 'MCPExtraTestTarget'
! !

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

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:09:23 am (UTC)'!
testMovingAMethodWithoutAVariableToReachThroughTakesItToTheClassSide

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringTools moveMethodToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpMoving';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		yourself).

	self assert: (self targetClass class includesSelector: 'mcpMoving' asSymbol)! !

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

!MCPExtraRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 7/Sep/2026, 9:48:50 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| serverWithEveryTool |

	serverWithEveryTool := MCPServer servingOver: MCPTransportMock new.

	self assert: ((serverWithEveryTool toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPExtraRefactoringTools moveInstanceVariableToolName.
			MCPExtraRefactoringTools moveMethodToolName.
			MCPExtraRefactoringTools extractClassToolName })! !

!MCPExtraRefactoringToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:50:09 pm (UTC)'!
toolDecoratorClasses

	^#()! !

!MCPExtraRefactoringToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:50:08 pm (UTC)'!
toolGroupClasses

	^{ MCPExtraRefactoringTools }! !

!MCPExtraRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
classCategoryOfTestData

	^'__MCPExtraRefactoringTestData__'
! !

!MCPExtraRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 7/Sep/2026, 10:27:23 pm (UTC)'!
classNamePrefixOfTestData

	^'MCPExtraTest'! !
