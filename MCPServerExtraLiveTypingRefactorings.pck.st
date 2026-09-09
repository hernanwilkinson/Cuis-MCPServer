'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 10:04:51 am'!
'Description Give the refactoring tools the options their appliers ask for'!
!provides: 'MCPServerExtraLiveTypingRefactorings' 1 14!
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


!MCPExtractParameterObjectInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:49 am (UTC)'!
properties

	^{
		MCPMethodProperty default.
		MCPPlainProperty named: 'newClassName' describedBy: 'Name of the class the parameters are gathered into'.
		MCPPlainProperty named: 'parameterNames' describedBy: 'Names of the parameters to gather, separated by commas'.
		MCPPlainProperty named: 'superclassName' describedBy: 'Name of the superclass of the new class. It has to exist already' defaultingTo: 'Object'.
		MCPPlainProperty named: 'category' describedBy: 'Class category to make the new class in. Defaults to the one of the class it came from' defaultingTo: '' }! !

!MCPExtractParameterObjectInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:51 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aNewClassName :someParameterNames :aSuperclassName :aCategory |
		(MCPRefactoringApplier applying: (self
			refactoringGatheringIn: aMethod
			the: (MCPToolGroup namesFrom: someParameterNames) asArray
			into: aNewClassName
			subclassing: aSuperclassName
			onCategory: aCategory
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPExtractParameterObjectInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 4/Sep/2026, 12:17:40 pm (UTC)'!
refactoringGatheringIn: aMethod the: parameterNames into: aNewClassName subclassing: aSuperclassName onCategory: aCategory keepingPossibleSends: isKeepingPossibleSends

	^self
		refactoringOn: aMethod selector
		in: aMethod methodClass
		using: AddParameterWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :senders |
			ExtractParameterObjectWithActualScope
				from: aMethod
				toClassNamed: aNewClassName asSymbol
				subclassing: (self classNamed: aSuperclassName) name
				onCategory: (MCPRefactoringToolGroup categoryFor: aCategory of: aMethod methodClass)
				withParameters: parameterNames
				placedAt: (MCPRefactoringToolGroup positionsIn: aMethod of: parameterNames)
				implementors: implementors
				senders: senders
				withPossibleMessageSends: isKeepingPossibleSends ]! !

!MCPExtractParameterObjectInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:42:01 pm (UTC)'!
decoratedToolName

	^MCPExtraRefactoringTools extractParameterObjectToolName! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:26:19 pm (UTC)'!
description

	^self decoratee description ,
		' It also takes actual as the scope, which moves it to the class LiveTyping saw the instance variable it is reached through hold, so the class it is moved to is found instead of named.'! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'actual types' stamp: 'HAW 2/Sep/2026, 8:54:16 pm (UTC)'!
classHeldBy: anInstanceVariableName of: aClass

	"Answer the one class LiveTyping saw an instance variable hold, which is the class a
	refactoring moves to when a client does not name it. A variable of code that has not run
	held none, and then there is nothing to move to."

	^aClass
		commonSupertypeOfInstanceVariableNamed: anInstanceVariableName
		ifNoTypes: [ self error: (self class noClassSeenErrorDescriptionFor: anInstanceVariableName) ]! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
properties

	^{
		MCPInstanceVariableProperty variableNameDescribedBy: 'Name of the instance variable to move'.
		MCPPlainProperty named: 'accessingThrough' describedBy: 'Name of the instance variable that holds the class it is moved to' }! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 4/Sep/2026, 12:18:04 pm (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aClass :aVariableName :anAccessingVariableName |
		(MCPRefactoringApplier applying: (self
			refactoringMoving: aVariableName
			from: aClass
			accessingThrough: anAccessingVariableName)) applyReportingChangedClasses ]! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 4/Sep/2026, 12:17:40 pm (UTC)'!
refactoringMoving: aVariableName from: aClass accessingThrough: anAccessingVariableName

	^MoveInstanceVariable
		named: aVariableName
		from: aClass
		to: (self classHeldBy: anAccessingVariableName of: aClass)
		accessingThrough: anAccessingVariableName! !

!MCPMoveInstanceVariableInActualScopeDecorator methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:07:00 am (UTC)'!
defaultScopeName

	^''! !

!MCPMoveInstanceVariableInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 4:26:08 pm (UTC)'!
decoratedToolName

	^MCPExtraRefactoringTools moveInstanceVariableToolName! !

!MCPMoveInstanceVariableInActualScopeDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:26:14 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to move the instance variable to the class LiveTyping saw accessingThrough hold, which needs no targetClassName. Send nothing to move it to the class named there'! !

!MCPMoveInstanceVariableInActualScopeDecorator class methodsFor: 'error descriptions' stamp: 'HAW 2/Sep/2026, 8:54:16 pm (UTC)'!
noClassSeenErrorDescriptionFor: aVariableName

	^'LiveTyping saw no class held by ', aVariableName, ', so there is none to move to'! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:26:38 pm (UTC)'!
description

	^self decoratee description ,
		' It also takes actual as the scope, which moves it to the class LiveTyping saw the variable it is reached through hold, so the class it is moved to is found instead of named.'! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'actual types' stamp: 'HAW 2/Sep/2026, 8:54:08 pm (UTC)'!
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

!MCPMoveMethodInActualScopeDecorator methodsFor: 'actual types' stamp: 'HAW 2/Sep/2026, 8:54:08 pm (UTC)'!
classHeldBy: anInstanceVariableName of: aClass

	"Answer the one class LiveTyping saw an instance variable hold, which is the class a
	refactoring moves to when a client does not name it. A variable of code that has not run
	held none, and then there is nothing to move to."

	^aClass
		commonSupertypeOfInstanceVariableNamed: anInstanceVariableName
		ifNoTypes: [ self error: (self class noClassSeenErrorDescriptionFor: anInstanceVariableName) ]! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:08:01 am (UTC)'!
properties

	^{
		MCPMethodProperty selectorDescribedBy: 'Selector of the method to move'.
		MCPPlainProperty named: 'accessingThrough' describedBy: 'Name of the variable that holds the class it is moved to'.
		MCPPlainProperty named: 'extraParameterName' describedBy: 'Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none' defaultingTo: ''.
		MCPPlainProperty named: 'extraParameterKeyword' describedBy: 'Keyword the moved method takes that parameter with, when it is a keyword selector that needs a new keyword for it. Left out otherwise' defaultingTo: '' }! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:08:03 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :anAccessingVariableName :anExtraParameterName :anExtraParameterKeyword |
		(MCPRefactoringApplier applying: (self
			refactoringMoving: aMethod
			accessingThrough: anAccessingVariableName
			parameterNamed: anExtraParameterName
			keyword: anExtraParameterKeyword)) applyReportingChanges ]! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:08:05 am (UTC)'!
refactoringMoving: aMethod accessingThrough: anAccessingVariableName parameterNamed: anExtraParameterName keyword: anExtraParameterKeyword

	^MoveMethod
		methodNamed: aMethod selector
		from: aMethod methodClass
		to: (self classHeldBy: anAccessingVariableName in: aMethod)
		accessingThrough: anAccessingVariableName
		parameterNeeded: (MCPExtraRefactoringTools extraParameterNamed: anExtraParameterName keyword: anExtraParameterKeyword)! !

!MCPMoveMethodInActualScopeDecorator methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:07:15 am (UTC)'!
defaultScopeName

	^''! !

!MCPMoveMethodInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 4:26:28 pm (UTC)'!
decoratedToolName

	^MCPExtraRefactoringTools moveMethodToolName! !

!MCPMoveMethodInActualScopeDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:26:33 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to move the method to the class LiveTyping saw accessingThrough hold, which needs no targetClassName. Send nothing to move it to the class named there'! !

!MCPMoveMethodInActualScopeDecorator class methodsFor: 'error descriptions' stamp: 'HAW 2/Sep/2026, 8:54:08 pm (UTC)'!
noClassSeenErrorDescriptionFor: aVariableName

	^'LiveTyping saw no class held by ', aVariableName, ', so there is none to move to'! !
