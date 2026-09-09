'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 10:04:36 am'!
'Description Give the refactoring tools the options their appliers ask for'!
!provides: 'MCPServerExtraRefactoring' 1 14!
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
addToolsTo: anMCPServer

	anMCPServer
		addTool: self moveInstanceVariableTool;
		addTool: self moveMethodTool;
		addTool: self extractClassTool;
		addTool: self extractParameterObjectTool;
		addTool: self extractToMethodObjectTool! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
extractClassTool

	^MCPPluggableTool
		named: self class extractClassToolName
		describedBy: 'Extract instance variables and methods of a class into a new class of its own, which the class they came from reaches through a new instance variable.'
		properties: {
			MCPClassProperty named: 'className' describedBy: 'Name of the class to extract from'.
			MCPPlainProperty named: 'newClassName' describedBy: 'Name of the class to create'.
			MCPPlainProperty named: 'instanceVariableName' describedBy: 'Name of the instance variable that will hold the new class'.
			MCPPlainProperty named: 'variableNames' describedBy: 'Names of the instance variables to extract, separated by commas' defaultingTo: ''.
			MCPPlainProperty named: 'selectors' describedBy: 'Selectors of the methods to extract, separated by commas' defaultingTo: '' }
		executingWith: [ :aClass :aNewClassName :anInstanceVariableName :someVariableNames :someSelectors |
			self applyReportingNewClass: (ExtractClass
				from: aClass
				to: aNewClassName asSymbol
				instanceVariableNamed: anInstanceVariableName
				instVarToExtract: (self namesFrom: someVariableNames)
				methodToExtract: ((self namesFrom: someSelectors) collect: [ :eachSelector | eachSelector asSymbol ])) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:05:01 am (UTC)'!
extractParameterObjectTool

	^MCPPluggableTool
		named: self class extractParameterObjectToolName
		describedBy: 'Gather some of the parameters of a method into an object of a new class, which the method then takes in their place, in the senders the scope takes in. The parameters are named, not numbered: where each one stands is what the method already says.'
		properties: {
			MCPMethodProperty default.
			MCPPlainProperty named: 'newClassName' describedBy: 'Name of the class the parameters are gathered into'.
			MCPPlainProperty named: 'parameterNames' describedBy: 'Names of the parameters to gather, separated by commas'.
			MCPPlainProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: ''.
			self scopeProperty }
		executingWith: [ :aMethod :aNewClassName :someParameterNames :aSuperclassName :aCategory :aScopeName |
			| parameterNames |
			parameterNames := (self namesFrom: someParameterNames) asArray.
			self applyReportingChanges: (self
				refactoringOn: aMethod
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
						senders: senders ]) ]! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
extractToMethodObjectTool

	^MCPPluggableTool
		named: self class extractToMethodObjectToolName
		describedBy: 'Turn a method into an object of a new class of its own, which answers what the method did when it is sent the selector it is evaluated with.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to turn into an object'.
			MCPPlainProperty named: 'newClassName' describedBy: 'Name of the class the method becomes'.
			MCPPlainProperty named: 'evaluationSelector' describedBy: 'Selector the new object is sent to do what the method did' defaultingTo: 'value'.
			MCPPlainProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: '' }
		executingWith: [ :aMethod :aNewClassName :anEvaluationSelector :aSuperclassName :aCategory |
			self applyReportingNewClass: (ExtractToMethodObject
				from: aMethod
				toMethodObjectClassNamed: aNewClassName asSymbol
				subclassing: (self classNamed: aSuperclassName)
				onCategory: (self categoryFor: aCategory of: aMethod methodClass)
				evaluatedWith: anEvaluationSelector asSymbol) ]

! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
moveInstanceVariableTool

	^MCPPluggableTool
		named: self class moveInstanceVariableToolName
		describedBy: 'Move an instance variable to another class, which the class it is moved from reaches through an instance variable of its own.'
		properties: {
			MCPInstanceVariableProperty variableNameDescribedBy: 'Name of the instance variable to move'.
			MCPClassProperty named: 'targetClassName' describedBy: 'Name of the class to move it to'.
			MCPPlainProperty named: 'accessingThrough' describedBy: 'Name of the instance variable that holds the class it is moved to' }
		executingWith: [ :aClass :aVariableName :aTargetClass :anAccessingVariableName |
			self applyReportingChangedClasses: (MoveInstanceVariable
				named: aVariableName
				from: aClass
				to: aTargetClass
				accessingThrough: anAccessingVariableName) ]! !

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:05:30 am (UTC)'!
moveMethodTool

	^MCPPluggableTool
		named: self class moveMethodToolName
		describedBy: 'Move a method to another class, which the class it is moved from reaches through a variable of its own, or to the class side of that class when it is reached as a global. When the moved method still needs what it was moved from, it is given as a parameter named here.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to move'.
			MCPClassProperty named: 'targetClassName' describedBy: 'Name of the class to move it to'.
			MCPPlainProperty
				named: 'accessingThrough'
				describedBy: 'Name of the instance variable, class variable or parameter that holds the class it is moved to. Left out to move it to the class side of that class, reached as a global'
				defaultingTo: ''.
			MCPPlainProperty named: 'extraParameterName' describedBy: 'Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none' defaultingTo: ''.
			MCPPlainProperty named: 'extraParameterKeyword' describedBy: 'Keyword the moved method takes that parameter with, when it is a keyword selector that needs a new keyword for it. Left out otherwise' defaultingTo: '' }
		executingWith: [ :aMethod :aTargetClass :anAccessingVariableName :anExtraParameterName :anExtraParameterKeyword |
			self applyReportingChanges: (self
				moveMethodRefactoringFor: aMethod
				to: aTargetClass
				accessingThrough: anAccessingVariableName
				parameterNamed: anExtraParameterName
				keyword: anExtraParameterKeyword) ]! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 9/Sep/2026, 2:05:28 am (UTC)'!
moveMethodRefactoringFor: aMethod to: aTargetClass accessingThrough: anAccessingVariableName parameterNamed: anExtraParameterName keyword: anExtraParameterKeyword

	| parameterNeeded |

	parameterNeeded := self class extraParameterNamed: anExtraParameterName keyword: anExtraParameterKeyword.

	^anAccessingVariableName
		ifEmpty: [ MoveMethod
			methodNamed: aMethod selector
			from: aMethod methodClass
			toClass: aTargetClass
			parameterNeeded: parameterNeeded ]
		ifNotEmpty: [ :aVariableName | MoveMethod
			methodNamed: aMethod selector
			from: aMethod methodClass
			to: aTargetClass
			accessingThrough: aVariableName
			parameterNeeded: parameterNeeded ]! !

!MCPExtraRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:43 pm (UTC)'!
extractClassToolName

	^'smalltalk_refactor_extract_class'! !

!MCPExtraRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
extractParameterObjectToolName

	^'smalltalk_refactor_extract_parameter_object'! !

!MCPExtraRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:43 pm (UTC)'!
extractToMethodObjectToolName

	^'smalltalk_refactor_extract_to_method_object'! !

!MCPExtraRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:43 pm (UTC)'!
moveInstanceVariableToolName

	^'smalltalk_refactor_move_instance_variable'! !

!MCPExtraRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:43 pm (UTC)'!
moveMethodToolName

	^'smalltalk_refactor_move_method'! !

!MCPExtraRefactoringTools class methodsFor: 'arguments' stamp: 'HAW 9/Sep/2026, 2:05:26 am (UTC)'!
extraParameterNamed: aParameterName keyword: aKeyword

	aParameterName ifEmpty: [ ^NonExtraParameterNameNeeded new ].

	^aKeyword
		ifEmpty: [ ExtraParameterNameNeeded parameterName: aParameterName ]
		ifNotEmpty: [ :anExtraKeyword |
			ExtraParameterNameNeededAndExtraKeyword parameterName: aParameterName extraKeyword: anExtraKeyword ]! !
