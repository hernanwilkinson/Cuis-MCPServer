'From Cuis7.9 [latest update: #8134] on 25 August 2026 at 7:41:14 am'!
'Description Extract a parameter object and a method object'!
!provides: 'MCPServerExtraRefactoring' 1 2!
!requires: 'MCPServer' nil nil nil!
!requires: 'ExtraRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraRefactoring!


!classDefinition: #MCPExtraRefactoringTools category: #MCPServerExtraRefactoring!
Object subclass: #MCPExtraRefactoringTools
	instanceVariableNames: 'smalltalk'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoring'!
!classDefinition: 'MCPExtraRefactoringTools class' category: #MCPServerExtraRefactoring!
MCPExtraRefactoringTools class
	instanceVariableNames: ''!


!MCPExtraRefactoringTools methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
initializeFor: aSmalltalk

	smalltalk := aSmalltalk
! !

!MCPExtraRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
tools

	^{
		self moveInstanceVariableTool.
		self moveMethodTool.
		self extractClassTool.
		self extractParameterObjectTool.
		self extractToMethodObjectTool }
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
apply: aRefactoring

	aRefactoring apply.

	^'Refactoring applied'
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
categoryFor: aCategory of: aClass

	"Answer the category the new class is made in, which is the one of the class it came from
	unless a client named another."

	^aCategory isEmpty ifTrue: [ aClass category ] ifFalse: [ aCategory ]
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
classNamed: aClassName

	^(smalltalk classNamed: aClassName)
		ifNil: [ self error: (MCPExtraRefactoringTools classNotFoundErrorDescriptionFor: aClassName) ]
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
methodIn: aClass named: aSelector

	MCPTool assert: aSelector isImplementedBy: aClass.

	^aClass >> aSelector
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
namesFrom: aCommaSeparatedText

	"Answer the names a client sent as one text, which is how a list reaches a tool."

	^aCommaSeparatedText isEmpty
		ifTrue: [ OrderedCollection new ]
		ifFalse: [ ((aCommaSeparatedText subStrings: ',')
			collect: [ :eachName | eachName withBlanksTrimmed ]) asOrderedCollection ]
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
positionsIn: aCompiledMethod of: someParameterNames

	"Answer where each parameter stands in the message, counting from one. A client names the
	parameters it wants extracted and not where they are, which the method already says."

	^someParameterNames collect: [ :eachName |
		(aCompiledMethod methodNode argumentNames indexOf: eachName)
			ifNotNil: [ :anIndex | anIndex ] ]
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
scopeOf: aSelector applyingWith: aBlock

	| implementors senders |

	implementors := OrderedCollection new.
	senders := OrderedCollection new.
	ScopedRefactoring
		addImplementorsOf: aSelector
		to: implementors
		andSendersTo: senders
		inSystem: smalltalk.

	^self apply: (aBlock
		value: implementors
		value: (senders collect: [ :eachSender | eachSender compiledMethod ]))
! !

!MCPExtraRefactoringTools methodsFor: 'tool creation - refactoring' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
extractClassTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_class'
		describedBy: 'Extract instance variables and methods of a class into a new class of its own, which the class they came from reaches through a new instance variable.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class to extract from'.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class to create'.
			MCPPlainToolProperty named: 'instanceVariableName' describedBy: 'Name of the instance variable that will hold the new class'.
			MCPPlainToolProperty named: 'variableNames' describedBy: 'Names of the instance variables to extract, separated by commas' defaultingTo: ''.
			MCPPlainToolProperty named: 'selectors' describedBy: 'Selectors of the methods to extract, separated by commas' defaultingTo: '' }
		executingWith: [ :aClass :aNewClassName :anInstanceVariableName :someVariableNames :someSelectors |
			self apply: (ExtractClass
				from: aClass
				to: aNewClassName asSymbol
				instanceVariableNamed: anInstanceVariableName
				instVarToExtract: (self namesFrom: someVariableNames)
				methodToExtract: ((self namesFrom: someSelectors) collect: [ :eachSelector | eachSelector asSymbol ])) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation - refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
extractParameterObjectTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_parameter_object'
		describedBy: 'Gather some of the parameters of a method into an object of a new class, which the method then takes in their place. The parameters are named, not numbered: where each one stands is what the method already says.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that implements the method'.
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector of the method' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class the parameters are gathered into'.
			MCPPlainToolProperty named: 'parameterNames' describedBy: 'Names of the parameters to gather, separated by commas'.
			MCPPlainToolProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainToolProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: '' }
		executingWith: [ :aClass :aSelector :aNewClassName :someParameterNames :aSuperclassName :aCategory |
			| methodToRefactor parameterNames |
			methodToRefactor := self methodIn: aClass named: aSelector.
			parameterNames := (self namesFrom: someParameterNames) asArray.
			self scopeOf: aSelector applyingWith: [ :implementors :senders |
				ExtractParameterObject
					from: methodToRefactor
					toClassNamed: aNewClassName asSymbol
					subclassing: (self classNamed: aSuperclassName) name
					onCategory: (self categoryFor: aCategory of: aClass)
					withParameters: parameterNames
					placedAt: (self positionsIn: methodToRefactor of: parameterNames)
					implementors: implementors
					senders: senders ] ]
! !

!MCPExtraRefactoringTools methodsFor: 'tool creation - refactoring' stamp: 'HAW 25/Aug/2026, 10:40:30 am (UTC)'!
!methodProperties: {}!
extractToMethodObjectTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_to_method_object'
		describedBy: 'Turn a method into an object of a new class of its own, which answers what the method did when it is sent the selector it is evaluated with.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that implements the method'.
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector of the method to turn into an object' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class the method becomes'.
			MCPPlainToolProperty named: 'evaluationSelector' describedBy: 'Selector the new object is sent to do what the method did' defaultingTo: 'value'.
			MCPPlainToolProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainToolProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: '' }
		executingWith: [ :aClass :aSelector :aNewClassName :anEvaluationSelector :aSuperclassName :aCategory |
			self apply: (ExtractToMethodObject
				from: (self methodIn: aClass named: aSelector)
				toMethodObjectClassNamed: aNewClassName asSymbol
				subclassing: (self classNamed: aSuperclassName)
				onCategory: (self categoryFor: aCategory of: aClass)
				evaluatedWith: anEvaluationSelector asSymbol) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation - refactoring' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
moveInstanceVariableTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_move_instance_variable'
		describedBy: 'Move an instance variable to another class, which the class it is moved from reaches through an instance variable of its own.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that has the instance variable'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to move'.
			MCPClassToolProperty named: 'targetClassName' describedBy: 'Name of the class to move it to'.
			MCPPlainToolProperty named: 'accessingThrough' describedBy: 'Name of the instance variable that holds the class it is moved to' }
		executingWith: [ :aClass :aVariableName :aTargetClass :anAccessingVariableName |
			self apply: (MoveInstanceVariable
				named: aVariableName
				from: aClass
				to: aTargetClass
				accessingThrough: anAccessingVariableName) ]
! !

!MCPExtraRefactoringTools methodsFor: 'tool creation - refactoring' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
moveMethodTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_move_method'
		describedBy: 'Move a method to another class, which the class it is moved from reaches through an instance variable of its own. When the moved method still needs what it was moved from, it is given as a parameter named here.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that implements the method'.
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector of the method to move' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPClassToolProperty named: 'targetClassName' describedBy: 'Name of the class to move it to'.
			MCPPlainToolProperty named: 'accessingThrough' describedBy: 'Name of the instance variable that holds the class it is moved to'.
			MCPPlainToolProperty named: 'extraParameterName' describedBy: 'Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none' defaultingTo: '' }
		executingWith: [ :aClass :aSelector :aTargetClass :anAccessingVariableName :anExtraParameterName |
			self apply: (MoveMethod
				methodNamed: aSelector
				from: aClass
				to: aTargetClass
				accessingThrough: anAccessingVariableName
				parameterNeeded: (anExtraParameterName isEmpty
					ifTrue: [ NonExtraParameterNameNeeded new ]
					ifFalse: [ ExtraParameterNameNeeded parameterName: anExtraParameterName ])) ]
! !

!MCPExtraRefactoringTools class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
for: aSmalltalk

	^self new initializeFor: aSmalltalk
! !

!MCPExtraRefactoringTools class methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
initialize

	"Offer my tools to every server, now that the package that has them is loaded."

	MCPServer addToolProvider: self
! !

!MCPExtraRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 25/Aug/2026, 10:40:28 am (UTC)'!
!methodProperties: {}!
classNotFoundErrorDescriptionFor: aClassName

	^'Class not found: ', aClassName
! !
MCPExtraRefactoringTools initialize!
