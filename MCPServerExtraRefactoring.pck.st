'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 11:54:00 am'!
'Description Let a method object hold what its method uses under the names asked'!
!provides: 'MCPServerExtraRefactoring' 1 16!
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

!classDefinition: #MCPMethodObjectDefinition category: #MCPServerExtraRefactoring!
Object subclass: #MCPMethodObjectDefinition
	instanceVariableNames: 'method instanceVariableNamesText instanceCreationMessageText'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraRefactoring'!
!classDefinition: 'MCPMethodObjectDefinition class' category: #MCPServerExtraRefactoring!
MCPMethodObjectDefinition class
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

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:42:35 pm (UTC)'!
extractToMethodObjectTool

	^MCPPluggableTool
		named: self class extractToMethodObjectToolName
		describedBy: 'Turn a method into an object of a new class of its own, which answers what the method did when it is sent the selector it is evaluated with. Everything the method uses is held by the new object: each parameter of the method, each instance variable of its class it reads, each global it names that is not in the system yet, and its receiver when it sends to itself; and the object is created with a message that takes all of them.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to turn into an object'.
			MCPPlainProperty named: 'newClassName' describedBy: 'Name of the class the method becomes'.
			MCPPlainProperty named: 'evaluationSelector' describedBy: 'Selector the new object is sent to do what the method did' defaultingTo: 'value'.
			MCPPlainProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: ''.
			MCPPlainProperty
				named: 'instanceVariableNames'
				describedBy: 'The instance variable the new object holds each thing the method uses in, as pairs of the form variable=instanceVariable separated by commas, self among the variables when the method sends to itself. One left out is held under its own name, and self as receiver'
				defaultingTo: ''.
			MCPPlainProperty
				named: 'instanceCreationMessage'
				describedBy: 'The message the new object is created with, as pairs of the form keyword=variable separated by commas, in the order the keywords are sent, one for each thing the method uses. A third part, keyword=variable=parameter, names the parameter of that keyword; without it the parameter is named after the instance variable with an article. Left out to take each in turn under the name of its instance variable: self first, then the parameters of the method, then the instance variables of its class'
				defaultingTo: '' }
		executingWith: [ :aMethod :aNewClassName :anEvaluationSelector :aSuperclassName :aCategory :anInstanceVariableNamesText :anInstanceCreationMessageText |
			| definition |
			definition := MCPMethodObjectDefinition
				of: aMethod
				holdingIn: anInstanceVariableNamesText
				createdWith: anInstanceCreationMessageText.
			self applyReportingNewClass: (ExtractToMethodObject
				from: aMethod
				toMethodObjectClassNamed: aNewClassName asSymbol
				subclassing: (self classNamed: aSuperclassName)
				onCategory: (self categoryFor: aCategory of: aMethod methodClass)
				withExtractedVariablesToInstanceVariables: definition instanceVariableNames
				withInstanceCreationMessageFrom: definition keywordsDefinitions
				evaluatedWith: anEvaluationSelector asSymbol) ]! !

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

!MCPExtraRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:14:27 pm (UTC)'!
moveMethodTool

	^MCPPluggableTool
		named: self class moveMethodToolName
		describedBy: 'Move a method to the class of the object it will be sent to, which the class it is moved from reaches through the receiver named: a variable of its own or of the method, or a global. A class is a global, so a method moved to a class becomes a class method of it. When the moved method still needs what it was moved from, it is given as a parameter named here.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to move'.
			MCPPlainProperty
				named: self class receiverPropertyName
				describedBy: 'What the moved method is sent to from the class it is moved from: an instance variable, a class variable or a parameter of the method, holding an object of the class named in targetClassName, or a global, to the class of whose object the method goes. A class is a global, and a method moved to one becomes a class method of it'.
			MCPPlainProperty
				named: 'targetClassName'
				describedBy: 'Name of the class the method is moved to, which is the class of the object the receiver holds. Needed when the receiver is a variable; left out when it is a global, whose class is where the method goes'
				defaultingTo: ''.
			MCPPlainProperty named: 'extraParameterName' describedBy: 'Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none' defaultingTo: ''.
			MCPPlainProperty named: 'extraParameterKeyword' describedBy: 'Keyword the moved method takes that parameter with, when it is a keyword selector that needs a new keyword for it. Left out otherwise' defaultingTo: '' }
		executingWith: [ :aMethod :aReceiverName :aTargetClassName :anExtraParameterName :anExtraParameterKeyword |
			self applyReportingChanges: (self
				moveMethodRefactoringFor: aMethod
				to: aTargetClassName
				through: aReceiverName
				parameterNamed: anExtraParameterName
				keyword: anExtraParameterKeyword) ]! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 9/Sep/2026, 2:14:18 pm (UTC)'!
isAGlobalNamed: aName

	^smalltalk includesKey: aName asSymbol! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 9/Sep/2026, 2:14:22 pm (UTC)'!
moveMethodRefactoringFor: aMethod to: aTargetClassName through: aReceiverName parameterNamed: anExtraParameterName keyword: anExtraParameterKeyword

	^MoveMethod
		methodNamed: aMethod selector
		from: aMethod methodClass
		to: ((self isAGlobalNamed: aReceiverName)
			ifTrue: [ (smalltalk at: aReceiverName asSymbol) class ]
			ifFalse: [ self classNamed: aTargetClassName ])
		accessingThrough: aReceiverName
		parameterNeeded: (self class extraParameterNamed: anExtraParameterName keyword: anExtraParameterKeyword)! !

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

!MCPExtraRefactoringTools class methodsFor: 'property names' stamp: 'HAW 9/Sep/2026, 2:14:14 pm (UTC)'!
receiverPropertyName

	^'receiver'! !

!MCPMethodObjectDefinition methodsFor: 'initialization' stamp: 'HAW 9/Sep/2026, 2:41:56 pm (UTC)'!
initializeOf: aMethod holdingIn: anInstanceVariableNamesText createdWith: anInstanceCreationMessageText

	method := aMethod.
	instanceVariableNamesText := anInstanceVariableNamesText.
	instanceCreationMessageText := anInstanceCreationMessageText! !

!MCPMethodObjectDefinition methodsFor: 'variables' stamp: 'HAW 9/Sep/2026, 2:42:08 pm (UTC)'!
defaultInstanceVariableNameOf: aVariableName

	^aVariableName = self class receiverVariableName
		ifTrue: [ self class receiverInstanceVariableName ]
		ifFalse: [ aVariableName ]! !

!MCPMethodObjectDefinition methodsFor: 'variables' stamp: 'HAW 9/Sep/2026, 2:42:04 pm (UTC)'!
variablesInOrder

	| variables knownFirst |

	variables := self variablesToParametrize.
	knownFirst := ((Array with: self class receiverVariableName) , method methodNode argumentNames asArray , method methodClass allInstVarNames)
		select: [ :eachName | variables includes: eachName ].

	^knownFirst , (variables reject: [ :eachName | knownFirst includes: eachName ]) asSortedCollection asArray! !

!MCPMethodObjectDefinition methodsFor: 'variables' stamp: 'HAW 9/Sep/2026, 2:42:01 pm (UTC)'!
variablesToParametrize

	^VariablesToExtractFinder valueIn: method notOptimizedMethodNode! !

!MCPMethodObjectDefinition methodsFor: 'definition' stamp: 'HAW 9/Sep/2026, 2:42:13 pm (UTC)'!
instanceVariableNames

	| names |

	names := Dictionary new.
	self variablesInOrder do: [ :eachVariable |
		names at: eachVariable put: (self defaultInstanceVariableNameOf: eachVariable) ].
	(self pairsIn: instanceVariableNamesText) do: [ :eachPair | names at: eachPair first put: eachPair second ].

	^names! !

!MCPMethodObjectDefinition methodsFor: 'definition' stamp: 'HAW 9/Sep/2026, 2:42:17 pm (UTC)'!
keywordsDefinitions

	| instanceVariableNames |

	instanceVariableNames := self instanceVariableNames.

	^instanceCreationMessageText
		ifEmpty: [ self variablesInOrder collect: [ :eachVariable |
			self keywordDefinitionFor: eachVariable heldIn: (instanceVariableNames at: eachVariable) ] ]
		ifNotEmpty: [ (self pairsIn: instanceCreationMessageText) collect: [ :eachPair |
			self keywordDefinitionFrom: eachPair holdingIn: instanceVariableNames ] ]! !

!MCPMethodObjectDefinition methodsFor: 'definition - private' stamp: 'HAW 9/Sep/2026, 2:42:26 pm (UTC)'!
keyword: aKeyword variable: aVariableName parameter: aParameterName

	^{
		#keyword -> aKeyword.
		#variableName -> aVariableName.
		#parameterName -> aParameterName } asDictionary! !

!MCPMethodObjectDefinition methodsFor: 'definition - private' stamp: 'HAW 9/Sep/2026, 2:42:20 pm (UTC)'!
keywordDefinitionFor: aVariableName heldIn: anInstanceVariableName

	^self
		keyword: anInstanceVariableName
		variable: aVariableName
		parameter: (self parameterNameFor: anInstanceVariableName)! !

!MCPMethodObjectDefinition methodsFor: 'definition - private' stamp: 'HAW 9/Sep/2026, 2:42:23 pm (UTC)'!
keywordDefinitionFrom: aPair holdingIn: someInstanceVariableNames

	| variableName |

	variableName := aPair second.

	^self
		keyword: aPair first
		variable: variableName
		parameter: (aPair size > 2
			ifTrue: [ aPair third ]
			ifFalse: [ self parameterNameFor: (someInstanceVariableNames at: variableName ifAbsent: [ variableName ]) ])! !

!MCPMethodObjectDefinition methodsFor: 'definition - private' stamp: 'HAW 9/Sep/2026, 2:42:32 pm (UTC)'!
pairsIn: aText

	^(MCPToolGroup namesFrom: aText) collect: [ :eachPair |
		(eachPair subStrings: '=') collect: [ :eachPart | eachPart withBlanksTrimmed ] ]! !

!MCPMethodObjectDefinition methodsFor: 'definition - private' stamp: 'HAW 9/Sep/2026, 2:42:29 pm (UTC)'!
parameterNameFor: anInstanceVariableName

	^anInstanceVariableName article , anInstanceVariableName capitalized! !

!MCPMethodObjectDefinition class methodsFor: 'instance creation' stamp: 'HAW 9/Sep/2026, 2:41:45 pm (UTC)'!
of: aMethod holdingIn: anInstanceVariableNamesText createdWith: anInstanceCreationMessageText

	^self new initializeOf: aMethod holdingIn: anInstanceVariableNamesText createdWith: anInstanceCreationMessageText! !

!MCPMethodObjectDefinition class methodsFor: 'defaults' stamp: 'HAW 9/Sep/2026, 2:41:49 pm (UTC)'!
receiverInstanceVariableName

	^'receiver'! !

!MCPMethodObjectDefinition class methodsFor: 'defaults' stamp: 'HAW 9/Sep/2026, 2:41:52 pm (UTC)'!
receiverVariableName

	^'self'! !
