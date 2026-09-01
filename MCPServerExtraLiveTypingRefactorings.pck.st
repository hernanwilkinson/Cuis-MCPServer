'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 1:37:31 pm'!
'Description Let a refactoring work over the scope LiveTyping saw'!
!provides: 'MCPServerExtraLiveTypingRefactorings' 1 6!
!requires: 'ExtraRefactoringsLiveTyping' nil nil nil!
!requires: 'MCPServer' nil nil nil!
!requires: 'MCPServerExtraRefactoring' nil nil nil!
!requires: 'MCPServerLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraLiveTypingRefactorings!


!classDefinition: #MCPExtractParameterObjectInActualScopeDecorator category: #MCPServerExtraLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPExtractParameterObjectInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactorings'!
!classDefinition: 'MCPExtractParameterObjectInActualScopeDecorator class' category: #MCPServerExtraLiveTypingRefactorings!
MCPExtractParameterObjectInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPMoveInstanceVariableInActualScopeDecorator category: #MCPServerExtraLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPMoveInstanceVariableInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactorings'!
!classDefinition: 'MCPMoveInstanceVariableInActualScopeDecorator class' category: #MCPServerExtraLiveTypingRefactorings!
MCPMoveInstanceVariableInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPMoveMethodInActualScopeDecorator category: #MCPServerExtraLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPMoveMethodInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactorings'!
!classDefinition: 'MCPMoveMethodInActualScopeDecorator class' category: #MCPServerExtraLiveTypingRefactorings!
MCPMoveMethodInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPExtraLiveTypingRefactoringTools category: #MCPServerExtraLiveTypingRefactorings!
MCPActualScopeRefactoringToolGroup subclass: #MCPExtraLiveTypingRefactoringTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactorings'!
!classDefinition: 'MCPExtraLiveTypingRefactoringTools class' category: #MCPServerExtraLiveTypingRefactorings!
MCPExtraLiveTypingRefactoringTools class
	instanceVariableNames: ''!


!MCPExtraLiveTypingRefactoringTools commentStamp: '<historical>' prior: 0!
I am the tools that apply the refactorings the ExtraRefactoringsLiveTyping package makes possible.

There is one of them: gathering some of the parameters of a method into an object of a new class, changing only the sends LiveTyping saw were to objects of the class that implements it. A send of the same name to anything else is left as it was.!

!MCPExtractParameterObjectInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:41:56 pm (UTC)'!
actualScopeTool

	^(MCPExtraLiveTypingRefactoringTools for: smalltalk) extractParameterObjectInActualScopeTool! !

!MCPExtractParameterObjectInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:42:01 pm (UTC)'!
decoratedToolName

	^MCPExtraRefactoringTools extractParameterObjectToolName! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:26:04 pm (UTC)'!
actualScopeTool

	^(MCPExtraLiveTypingRefactoringTools for: smalltalk) moveInstanceVariableInActualScopeTool! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:26:19 pm (UTC)'!
description

	^self decoratee description ,
		' It also takes actual as the scope, which moves it to the class LiveTyping saw the instance variable it is reached through hold, so the class it is moved to is found instead of named.'! !

!MCPMoveInstanceVariableInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 4:26:08 pm (UTC)'!
decoratedToolName

	^MCPExtraRefactoringTools moveInstanceVariableToolName! !

!MCPMoveInstanceVariableInActualScopeDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:26:14 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to move the instance variable to the class LiveTyping saw accessingThrough hold, which needs no targetClassName. Send nothing to move it to the class named there'! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:26:24 pm (UTC)'!
actualScopeTool

	^(MCPExtraLiveTypingRefactoringTools for: smalltalk) moveMethodInActualScopeTool! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:26:38 pm (UTC)'!
description

	^self decoratee description ,
		' It also takes actual as the scope, which moves it to the class LiveTyping saw the variable it is reached through hold, so the class it is moved to is found instead of named.'! !

!MCPMoveMethodInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 4:26:28 pm (UTC)'!
decoratedToolName

	^MCPExtraRefactoringTools moveMethodToolName! !

!MCPMoveMethodInActualScopeDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:26:33 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to move the method to the class LiveTyping saw accessingThrough hold, which needs no targetClassName. Send nothing to move it to the class named there'! !

!MCPExtraLiveTypingRefactoringTools methodsFor: 'tools' stamp: 'HAW 1/Sep/2026, 4:25:54 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self extractParameterObjectInActualScopeTool;
		addTool: self moveInstanceVariableInActualScopeTool;
		addTool: self moveMethodInActualScopeTool! !

!MCPExtraLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:27:36 pm (UTC)'!
extractParameterObjectInActualScopeTool

	^MCPPluggableTool
		named: self class extractParameterObjectInActualScopeToolName
		describedBy: 'Gather some of the parameters of a method into an object of a new class, changing only the sends LiveTyping saw were to objects of the class that implements it. A send of the same name to anything else is left as it was.'
		properties: {
			MCPMethodProperty newDefault.
			MCPPlainToolProperty named: 'newClassName' describedBy: 'Name of the class the parameters are gathered into'.
			MCPPlainToolProperty named: 'parameterNames' describedBy: 'Names of the parameters to gather, separated by commas'.
			MCPPlainToolProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
			MCPPlainToolProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: ''.
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aNewClassName :someParameterNames :aSuperclassName :aCategory :aKeepingAnswer |
			| parameterNames keepingPossibleSends |
			parameterNames := (self namesFrom: someParameterNames) asArray.
			keepingPossibleSends := aKeepingAnswer = 'true'.
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				in: aMethod methodClass
				using: AddParameterWithActualScope
				keepingPossibleSends: keepingPossibleSends
				builtWith: [ :implementors :senders |
					ExtractParameterObjectWithActualScope
						from: aMethod
						toClassNamed: aNewClassName asSymbol
						subclassing: (self classNamed: aSuperclassName) name
						onCategory: (self categoryFor: aCategory of: aMethod methodClass)
						withParameters: parameterNames
						placedAt: (self positionsIn: aMethod of: parameterNames)
						implementors: implementors
						senders: senders
						withPossibleMessageSends: keepingPossibleSends ]) ]

! !

!MCPExtraLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 4:25:40 pm (UTC)'!
moveInstanceVariableInActualScopeTool

	^MCPPluggableTool
		named: self class moveInstanceVariableInActualScopeToolName
		describedBy: 'Move an instance variable to the class LiveTyping saw the instance variable it is reached through hold, so the class it is moved to is found instead of named.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that has the instance variable'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable to move'.
			MCPPlainToolProperty named: 'accessingThrough' describedBy: 'Name of the instance variable that holds the class it is moved to' }
		executingWith: [ :aClass :aVariableName :anAccessingVariableName |
			self applyReportingChangedClasses: (MoveInstanceVariable
				named: aVariableName
				from: aClass
				to: (self classHeldBy: anAccessingVariableName of: aClass)
				accessingThrough: anAccessingVariableName) ]! !

!MCPExtraLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 4:25:49 pm (UTC)'!
moveMethodInActualScopeTool

	^MCPPluggableTool
		named: self class moveMethodInActualScopeToolName
		describedBy: 'Move a method to the class LiveTyping saw the variable it is reached through hold, so the class it is moved to is found instead of named. The variable is a parameter of the method or an instance variable of the class it is in. When the moved method still needs what it was moved from, it is given as a parameter named here.'
		properties: {
			MCPMethodProperty selectorDescribedBy: 'Selector of the method to move'.
			MCPPlainToolProperty named: 'accessingThrough' describedBy: 'Name of the variable that holds the class it is moved to'.
			MCPPlainToolProperty named: 'extraParameterName' describedBy: 'Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none' defaultingTo: '' }
		executingWith: [ :aMethod :anAccessingVariableName :anExtraParameterName |
			self applyReportingChanges: (MoveMethod
				methodNamed: aMethod selector
				from: aMethod methodClass
				to: (self classHeldBy: anAccessingVariableName in: aMethod)
				accessingThrough: anAccessingVariableName
				parameterNeeded: (anExtraParameterName isEmpty
					ifTrue: [ NonExtraParameterNameNeeded new ]
					ifFalse: [ ExtraParameterNameNeeded parameterName: anExtraParameterName ])) ]! !

!MCPExtraLiveTypingRefactoringTools methodsFor: 'actual types' stamp: 'HAW 1/Sep/2026, 4:25:33 pm (UTC)'!
classHeldBy: aVariableName in: aMethod

	"Answer the one class LiveTyping saw a variable of a method hold. A parameter of the method
	is asked of the method, which is where it lives; anything else is an instance variable of
	the class the method is in."

	(aMethod methodNode argumentNames includes: aVariableName)
		ifFalse: [ ^self classHeldBy: aVariableName of: aMethod methodClass ].

	^(aMethod
		typeInfoOfVariableNamed: aVariableName
		ifAbsent: [ self error: (self class noClassSeenErrorDescriptionFor: aVariableName) ])
			commonSupertypeIfNoTypes: [ self error: (self class noClassSeenErrorDescriptionFor: aVariableName) ]! !

!MCPExtraLiveTypingRefactoringTools methodsFor: 'actual types' stamp: 'HAW 1/Sep/2026, 4:25:26 pm (UTC)'!
classHeldBy: anInstanceVariableName of: aClass

	"Answer the one class LiveTyping saw an instance variable hold, which is the class a
	refactoring moves to when a client does not name it. A variable of code that has not run
	held none, and then there is nothing to move to."

	^aClass
		commonSupertypeOfInstanceVariableNamed: anInstanceVariableName
		ifNoTypes: [ self error: (self class noClassSeenErrorDescriptionFor: anInstanceVariableName) ]! !

!MCPExtraLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
extractParameterObjectInActualScopeToolName

	^'smalltalk_refactor_extract_parameter_object_in_actual_scope'! !

!MCPExtraLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 4:25:10 pm (UTC)'!
moveInstanceVariableInActualScopeToolName

	^'smalltalk_refactor_move_instance_variable_in_actual_scope'! !

!MCPExtraLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 4:25:15 pm (UTC)'!
moveMethodInActualScopeToolName

	^'smalltalk_refactor_move_method_in_actual_scope'! !

!MCPExtraLiveTypingRefactoringTools class methodsFor: 'error descriptions' stamp: 'HAW 1/Sep/2026, 4:25:20 pm (UTC)'!
noClassSeenErrorDescriptionFor: aVariableName

	^'LiveTyping saw no class held by ', aVariableName, ', so there is none to move to'! !
