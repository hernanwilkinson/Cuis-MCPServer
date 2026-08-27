'From Cuis7.9 [latest update: #8134] on 27 August 2026 at 10:45:02 am'!
'Description Let a client say how far a refactoring reaches'!
!provides: 'MCPServerExtraRefactoring' 1 8!
!requires: 'MCPServer' nil nil nil!
!requires: 'ExtraRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraRefactoring!


!classDefinition: #MCPExtraRefactoringTools category: #MCPServerExtraRefactoring!
MCPRefactoringToolGroup subclass: #MCPExtraRefactoringTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoring'!
!classDefinition: 'MCPExtraRefactoringTools class' category: #MCPServerExtraRefactoring!
MCPExtraRefactoringTools class
	instanceVariableNames: ''!


!MCPExtraRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
!methodProperties: {}!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self moveInstanceVariableTool;
		addTool: self moveMethodTool;
		addTool: self extractClassTool;
		addTool: self extractParameterObjectTool;
		addTool: self extractToMethodObjectTool! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 4:47:24 pm (UTC)'!
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
			self applyReportingNewClass: (ExtractClass
				from: aClass
				to: aNewClassName asSymbol
				instanceVariableNamed: anInstanceVariableName
				instVarToExtract: (self namesFrom: someVariableNames)
				methodToExtract: ((self namesFrom: someSelectors) collect: [ :eachSelector | eachSelector asSymbol ])) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 27/Aug/2026, 11:46:05 am (UTC)'!
!methodProperties: {}!
extractParameterObjectTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_parameter_object'
		describedBy: 'Gather some of the parameters of a method into an object of a new class, which the method then takes in their place, in the senders the scope takes in. The parameters are named, not numbered: where each one stands is what the method already says.'
		properties: {
			MCPMethodProperty newDefault.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class the parameters are gathered into'.
			MCPPlainToolProperty named: 'parameterNames' describedBy: 'Names of the parameters to gather, separated by commas'.
			MCPPlainToolProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainToolProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: ''.
			self scopeProperty }
		executingWith: [ :aMethod :aNewClassName :someParameterNames :aSuperclassName :aCategory :aScopeName |
			| parameterNames |
			parameterNames := (self namesFrom: someParameterNames) asArray.
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				around: aMethod methodClass name
				within: aScopeName
				builtWith: [ :implementors :senders |
					ExtractParameterObject
						from: aMethod
						toClassNamed: aNewClassName asSymbol
						subclassing: (self classNamed: aSuperclassName) name
						onCategory: (self categoryFor: aCategory of: aMethod methodClass)
						withParameters: parameterNames
						placedAt: (self positionsIn: aMethod of: parameterNames)
						implementors: implementors
						senders: senders ]) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 4:47:24 pm (UTC)'!
!methodProperties: {}!
extractToMethodObjectTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_extract_to_method_object'
		describedBy: 'Turn a method into an object of a new class of its own, which answers what the method did when it is sent the selector it is evaluated with.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to turn into an object'.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class the method becomes'.
			MCPPlainToolProperty named: 'evaluationSelector' describedBy: 'Selector the new object is sent to do what the method did' defaultingTo: 'value'.
			MCPPlainToolProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainToolProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: '' }
		executingWith: [ :aMethod :aNewClassName :anEvaluationSelector :aSuperclassName :aCategory |
			self applyReportingNewClass: (ExtractToMethodObject
				from: aMethod
				toMethodObjectClassNamed: aNewClassName asSymbol
				subclassing: (self classNamed: aSuperclassName)
				onCategory: (self categoryFor: aCategory of: aMethod methodClass)
				evaluatedWith: anEvaluationSelector asSymbol) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 4:47:24 pm (UTC)'!
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
			self applyReportingChangedClasses: (MoveInstanceVariable
				named: aVariableName
				from: aClass
				to: aTargetClass
				accessingThrough: anAccessingVariableName) ]
! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 4:47:24 pm (UTC)'!
!methodProperties: {}!
moveMethodTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_move_method'
		describedBy: 'Move a method to another class, which the class it is moved from reaches through an instance variable of its own. When the moved method still needs what it was moved from, it is given as a parameter named here.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to move'.
			MCPClassToolProperty named: 'targetClassName' describedBy: 'Name of the class to move it to'.
			MCPPlainToolProperty named: 'accessingThrough' describedBy: 'Name of the instance variable that holds the class it is moved to'.
			MCPPlainToolProperty named: 'extraParameterName' describedBy: 'Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none' defaultingTo: '' }
		executingWith: [ :aMethod :aTargetClass :anAccessingVariableName :anExtraParameterName |
			self applyReportingChanges: (MoveMethod
				methodNamed: aMethod selector
				from: aMethod methodClass
				to: aTargetClass
				accessingThrough: anAccessingVariableName
				parameterNeeded: (anExtraParameterName isEmpty
					ifTrue: [ NonExtraParameterNameNeeded new ]
					ifFalse: [ ExtraParameterNameNeeded parameterName: anExtraParameterName ])) ]
! !
