'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 10:45:03 am'!
'Description Let a class method say the name of each tool'!
!provides: 'MCPServerExtraLiveTypingRefactorings' 1 5!
!requires: 'ExtraRefactoringsLiveTyping' nil nil nil!
!requires: 'MCPServer' nil nil nil!
!requires: 'MCPServerLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraLiveTypingRefactorings!


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

!MCPExtraLiveTypingRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer addTool: self extractParameterObjectInActualScopeTool
! !

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

!MCPExtraLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
extractParameterObjectInActualScopeToolName

	^'smalltalk_refactor_extract_parameter_object_in_actual_scope'! !
