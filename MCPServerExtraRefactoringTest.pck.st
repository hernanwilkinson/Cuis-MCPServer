'From Cuis7.9 [latest update: #8184] on 25 September 2026 at 4:24:26 pm'!
'Description Name the tests after the tool boxes they test'!
!provides: 'MCPServerExtraRefactoringTest' 1 16!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraRefactoring' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraRefactoringTest!


!classDefinition: #MCPExtraRefactoringToolBoxTest category: #MCPServerExtraRefactoringTest!
MCPToolBoxTest subclass: #MCPExtraRefactoringToolBoxTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoringTest'!
!classDefinition: 'MCPExtraRefactoringToolBoxTest class' category: #MCPServerExtraRefactoringTest!
MCPExtraRefactoringToolBoxTest class
	instanceVariableNames: ''!


!MCPExtraRefactoringToolBoxTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
defineClassNamed: aClassName instanceVariableNames: someInstanceVariableNames

	^Object subclass: aClassName asSymbol
		instanceVariableNames: someInstanceVariableNames
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
sourceClass

	^Smalltalk classNamed: 'MCPExtraTestSource'
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
targetClass

	^Smalltalk classNamed: 'MCPExtraTestTarget'
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingAClassAnswersTheDefinitionOfTheOneItCreated

	self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable stayingVariable'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringToolBox extractClassToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'newClassName' put: 'MCPExtraTestTarget';
			at: 'instanceVariableName' put: 'reachingVariable';
			at: 'variableNames' put: 'movingVariable';
			yourself))
		equals: 'Refactoring applied. Class created:' , String newLineString , String newLineString ,
			self targetClass definition
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:48 pm (UTC)'!
testExtractingAClassTakesTheVariablesNamedIntoTheNewOne

	self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable stayingVariable'.

	(self toolNamed: MCPExtraRefactoringToolBox extractClassToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'instanceVariableName' put: 'reachingVariable';
		at: 'variableNames' put: 'movingVariable';
		yourself).

	self assert: (Smalltalk classNamed: 'MCPExtraTestTarget') notNil.
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') instVarNames includes: 'movingVariable').
	self assert: (self sourceClass instVarNames includes: 'stayingVariable')
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingAParameterObjectAnswersTheMethodsItChanged

	"The method that takes the parameter object is a new one, and the one it came from is gone,
	which the refactoring says apart from the methods that are still there."

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpFirst: aFirst second: aSecond third: aThird

	^aFirst' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringToolBox extractParameterObjectToolName) valueWithArguments: (Dictionary new
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

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingAParameterObjectGathersTheParametersNamed

	"The parameters keep their names without the article they were written with, so aFirst is
	held as first, and the method is left taking the ones that were not gathered."

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpFirst: aFirst second: aSecond third: aThird

	^aFirst' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox extractParameterObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpFirst:second:third:';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'parameterNames' put: 'aFirst, aThird';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self deny: (self sourceClass includesSelector: 'mcpFirst:second:third:' asSymbol).
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') instVarNames includesAllOf: #('first' 'third')).
	self assert: (self sourceClass includesSelector: 'second:mCPExtraTestTarget:' asSymbol)! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingToAMethodObjectAnswersTheDefinitionOfTheClassItCreated

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpProbe

	^42' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringToolBox extractToMethodObjectToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'selector' put: 'mcpProbe';
			at: 'newClassName' put: 'MCPExtraTestTarget';
			at: 'evaluationSelector' put: 'mcpEvaluate';
			at: 'category' put: self classCategoryOfTestData;
			yourself))
		equals: 'Refactoring applied. Class created:' , String newLineString , String newLineString ,
			self targetClass definition

! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:48 pm (UTC)'!
testExtractingToAMethodObjectCreatesItWithTheMessageGiven

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'held'.
	source compile: 'mcpProbe: aNumber

	^aNumber + held' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox extractToMethodObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe:';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'category' put: self classCategoryOfTestData;
		at: 'instanceCreationMessage' put: 'of=held, adding=aNumber';
		yourself).

	self assert: (self targetClass class includesSelector: 'of:adding:' asSymbol).
	self assert: ((self sourceClass sourceCodeAt: 'mcpProbe:' asSymbol)
		includesSubstring: 'MCPExtraTestTarget of: held adding: aNumber' caseSensitive: true)! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:48 pm (UTC)'!
testExtractingToAMethodObjectHoldsTheReceiverAsReceiverWhenItIsNotNamed

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpProbe

	^self printString' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox extractToMethodObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self assert: (self targetClass instVarNames includes: 'receiver').
	self assert: (self targetClass class includesSelector: 'receiver:' asSymbol)! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingToAMethodObjectHoldsWhatTheMethodUsesUnderTheNamesGiven

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'held'.
	source compile: 'mcpProbe: aNumber

	^aNumber + held' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox extractToMethodObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe:';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'category' put: self classCategoryOfTestData;
		at: 'instanceVariableNames' put: 'aNumber=number, held=amount';
		yourself).

	self assert: (self targetClass instVarNames includesAllOf: #('number' 'amount'))! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingToAMethodObjectHoldsWhatTheMethodUsesUnderTheirOwnNamesWhenNoneAreGiven

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'held'.
	source compile: 'mcpProbe: aNumber

	^aNumber + held' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox extractToMethodObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe:';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self assert: (self targetClass instVarNames includesAllOf: #('aNumber' 'held')).
	self assert: (self targetClass class includesSelector: 'aNumber:held:' asSymbol)! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testExtractingToAMethodObjectMakesTheClassThatDoesWhatTheMethodDid

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	source compile: 'mcpProbe

	^42' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox extractToMethodObjectToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpProbe';
		at: 'newClassName' put: 'MCPExtraTestTarget';
		at: 'evaluationSelector' put: 'mcpEvaluate';
		at: 'category' put: self classCategoryOfTestData;
		yourself).

	self assert: (Smalltalk classNamed: 'MCPExtraTestTarget') notNil.
	self assert: ((Smalltalk classNamed: 'MCPExtraTestTarget') includesSelector: 'mcpEvaluate' asSymbol)

! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:46 pm (UTC)'!
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
		assert: ((self toolNamed: MCPExtraRefactoringToolBox moveMethodToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'selector' put: 'mcpMoving';
			at: 'targetClassName' put: 'MCPExtraTestTarget';
			at: 'receiver' put: 'reachingVariable';
			yourself))
		equals: 'Refactoring applied. 2 methods changed:
MCPExtraTestSource>>#mcpMoving
MCPExtraTestTarget>>#mcpMoving'! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testMovingAMethodTakesItToTheOtherClass

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox moveMethodToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpMoving';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		at: 'receiver' put: 'reachingVariable';
		yourself).

	self assert: (self targetClass includesSelector: 'mcpMoving' asSymbol)! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testMovingAMethodToAClassMakesItAClassMethodOfIt

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox moveMethodToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpMoving';
		at: 'receiver' put: 'MCPExtraTestTarget';
		yourself).

	self assert: (self targetClass class includesSelector: 'mcpMoving' asSymbol).
	self assert: ((self sourceClass sourceCodeAt: 'mcpMoving' asSymbol) includesSubstring: '^MCPExtraTestTarget mcpMoving' caseSensitive: true)! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testMovingAMethodToAGlobalTakesItToTheClassOfWhatItHolds

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: ''.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpMoving

	^42' classified: 'probing'.

	[ Smalltalk at: 'MCPExtraTestGlobal' asSymbol put: self targetClass new.

	(self toolNamed: MCPExtraRefactoringToolBox moveMethodToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'selector' put: 'mcpMoving';
		at: 'receiver' put: 'MCPExtraTestGlobal';
		yourself).

	self assert: (self targetClass includesSelector: 'mcpMoving' asSymbol).
	self assert: ((self sourceClass sourceCodeAt: 'mcpMoving' asSymbol) includesSubstring: '^MCPExtraTestGlobal mcpMoving' caseSensitive: true) ]
		ensure: [ Smalltalk removeKey: 'MCPExtraTestGlobal' asSymbol ifAbsent: [ nil ] ]! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:49 pm (UTC)'!
testMovingAnInstanceVariableAnswersTheDefinitionsOfTheClassesItChanged

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.

	self
		assert: ((self toolNamed: MCPExtraRefactoringToolBox moveInstanceVariableToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPExtraTestSource';
			at: 'variableName' put: 'movingVariable';
			at: 'targetClassName' put: 'MCPExtraTestTarget';
			at: 'accessingThrough' put: 'reachingVariable';
			yourself))
		equals: 'Refactoring applied. 2 classes changed:' , String newLineString , String newLineString ,
			self sourceClass definition , String newLineString , String newLineString ,
			self targetClass definition
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:48 pm (UTC)'!
testMovingAnInstanceVariableTakesItToTheOtherClass

	| source |

	source := self defineClassNamed: 'MCPExtraTestSource' instanceVariableNames: 'movingVariable reachingVariable'.
	self defineClassNamed: 'MCPExtraTestTarget' instanceVariableNames: ''.
	source compile: 'mcpInitialize

	reachingVariable := MCPExtraTestTarget new' classified: 'probing'.

	(self toolNamed: MCPExtraRefactoringToolBox moveInstanceVariableToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraTestSource';
		at: 'variableName' put: 'movingVariable';
		at: 'targetClassName' put: 'MCPExtraTestTarget';
		at: 'accessingThrough' put: 'reachingVariable';
		yourself).

	self deny: (self sourceClass instVarNames includes: 'movingVariable').
	self assert: (self targetClass instVarNames includes: 'movingVariable')
! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tests' stamp: 'HAW 25/Sep/2026, 3:08:48 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| serverWithEveryTool |

	serverWithEveryTool := MCPServer servingOver: MCPTransportMock new.

	self assert: ((serverWithEveryTool toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPExtraRefactoringToolBox moveInstanceVariableToolName.
			MCPExtraRefactoringToolBox moveMethodToolName.
			MCPExtraRefactoringToolBox extractClassToolName })! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tools under test' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
toolBoxClasses

	^{ MCPExtraRefactoringToolBox }! !

!MCPExtraRefactoringToolBoxTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:50:09 pm (UTC)'!
toolDecoratorClasses

	^#()! !

!MCPExtraRefactoringToolBoxTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
classCategoryOfTestData

	^'__MCPExtraRefactoringTestData__'
! !

!MCPExtraRefactoringToolBoxTest class methodsFor: 'test data' stamp: 'HAW 7/Sep/2026, 10:27:23 pm (UTC)'!
classNamePrefixOfTestData

	^'MCPExtraTest'! !
