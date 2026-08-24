'From Cuis7.9 [latest update: #8134] on 24 August 2026 at 8:34:22 pm'!
'Description Offer the ExtraRefactorings refactorings from their own package'!
!provides: 'MCPServerExtraRefactoring' 1 1!
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

!MCPExtraRefactoringTools methodsFor: 'tools' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
tools

	^{
		self moveInstanceVariableTool.
		self moveMethodTool.
		self extractClassTool }
! !

!MCPExtraRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:32:16 pm (UTC)'!
!methodProperties: {}!
apply: aRefactoring

	aRefactoring apply.

	^'Refactoring applied'
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
MCPExtraRefactoringTools initialize!
