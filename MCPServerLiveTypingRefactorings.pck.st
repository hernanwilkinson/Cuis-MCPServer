'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 10:44:14 am'!
'Description Let a class method say the name of each tool'!
!provides: 'MCPServerLiveTypingRefactorings' 1 9!
!requires: 'MCPServer' nil nil nil!
!requires: 'LiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingRefactorings!


!classDefinition: #MCPActualScopeRefactoringToolGroup category: #MCPServerLiveTypingRefactorings!
MCPRefactoringToolGroup subclass: #MCPActualScopeRefactoringToolGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPActualScopeRefactoringToolGroup class' category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringToolGroup class
	instanceVariableNames: ''!

!classDefinition: #MCPLiveTypingRefactoringTools category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringToolGroup subclass: #MCPLiveTypingRefactoringTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPLiveTypingRefactoringTools class' category: #MCPServerLiveTypingRefactorings!
MCPLiveTypingRefactoringTools class
	instanceVariableNames: ''!


!MCPActualScopeRefactoringToolGroup commentStamp: '<historical>' prior: 0!
I am a group of tools that apply refactorings over the scope LiveTyping saw.

I differ from the groups that work on a selector alone by what I take to be a send of it: only the sends to objects LiveTyping saw were of the class that implements it. A send of the same name to anything else is left as it was, which a refactoring over the whole system cannot tell apart.!

!MCPLiveTypingRefactoringTools commentStamp: '<historical>' prior: 0!
I am the tools that apply the refactorings LiveTyping makes possible.

They differ from the ones that work on a selector alone by what they take to be a send of it: only the sends to objects LiveTyping saw were of the class that implements it. A send of the same name to anything else is left as it was, which a refactoring over the whole system cannot tell apart.!

!MCPActualScopeRefactoringToolGroup methodsFor: 'scope' stamp: 'HAW 25/Aug/2026, 1:41:38 pm (UTC)'!
refactoringOn: aSelector in: aClass using: aRefactoringClass keepingPossibleSends: aBoolean builtWith: aBlock

	"Answer the refactoring the block builds over the scope LiveTyping saw, which is what tells
	a send of this selector to one of these objects from a send of the same name to anything
	else. A sender it could only guess at is left out unless a client asks for it.

	The senders are handed over as compiled methods, the way the applier converts them."

	| implementors senders |

	implementors := OrderedCollection new.
	senders := OrderedCollection new.
	aRefactoringClass
		addActualImplementorsOf: aSelector
		in: aClass
		to: implementors
		andActualSendersTo: senders
		inSystem: smalltalk.

	^aBlock
		value: implementors
		value: ((senders
			select: [ :aMethodReference |
				aMethodReference isValid
					and: [ aMethodReference isPossibleSender not or: [ aBoolean ] ] ]
			thenCollect: [ :aMethodReference | aMethodReference compiledMethod ]) asIdentitySet)

! !

!MCPLiveTypingRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self renameSelectorInActualScopeTool;
		addTool: self changeKeywordsOrderInActualScopeTool;
		addTool: self removeParameterInActualScopeTool;
		addTool: self addParameterInActualScopeTool! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
addParameterInActualScopeTool

	^MCPPluggableTool
		named: self class addParameterInActualScopeToolName
		describedBy: 'Add a parameter to a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran. A unary selector needs no keyword; a keyword one is told which keyword to add and where.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to add the parameter to'.
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to add'.
			MCPPlainToolProperty named: 'parameterValue' describedBy: 'Expression every sender will pass for it'.
			MCPPlainToolProperty named: 'keyword' describedBy: 'Keyword to add, needed only when the selector is a keyword one' defaultingTo: ''.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position for the new keyword, counting from one' defaultingTo: '1'.
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aParameterName :aParameterValue :aKeyword :aParameterIndex :aKeepingAnswer |
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				in: aMethod methodClass
				using: AddParameterWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				builtWith: [ :implementors :senders |
					aMethod selector isUnary
						ifTrue: [ AddParameterWithActualScope
							named: aParameterName
							initializedWith: aParameterValue
							toUnarySelector: aMethod selector
							implementors: implementors
							senders: senders
							withPossibleMessageSends: aKeepingAnswer = 'true' ]
						ifFalse: [ AddParameterWithActualScope
							named: aParameterName
							at: aParameterIndex asNumber
							initializedWith: aParameterValue
							using: aKeyword
							toKeywordSelector: aMethod selector
							implementors: implementors
							senders: senders
							withPossibleMessageSends: aKeepingAnswer = 'true' ] ]) ]
! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
changeKeywordsOrderInActualScopeTool

	^MCPPluggableTool
		named: self class changeKeywordsOrderInActualScopeToolName
		describedBy: 'Reorder the keywords of a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to reorder'.
			MCPPluggableToolProperty named: 'newSelector' describedBy: 'Selector with the same keywords in the order wanted' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aNewSelector :aKeepingAnswer |
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				in: aMethod methodClass
				using: ChangeKeywordsSelectorOrderWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				builtWith: [ :implementors :senders |
					ChangeKeywordsSelectorOrderWithActualScope
						from: aMethod selector
						to: aNewSelector
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ]) ]
! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
removeParameterInActualScopeTool

	^MCPPluggableTool
		named: self class removeParameterInActualScopeToolName
		describedBy: 'Remove a parameter from a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to remove the parameter from'.
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to remove'.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position of the parameter, counting from one' defaultingTo: '1'.
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aParameterName :aParameterIndex :aKeepingAnswer |
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				in: aMethod methodClass
				using: RemoveParameterWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				builtWith: [ :implementors :senders |
					RemoveParameterWithActualScope
						atIndex: aParameterIndex asNumber
						named: aParameterName
						from: aMethod selector
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ]) ]
! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
renameSelectorInActualScopeTool

	^MCPPluggableTool
		named: self class renameSelectorInActualScopeToolName
		describedBy: 'Rename a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran. A send of the same name to anything else is left alone, which renaming a selector in the whole system cannot tell apart.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to rename'.
			MCPPluggableToolProperty named: 'newSelector' describedBy: 'Selector to rename it to' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is renamed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aNewSelector :aKeepingAnswer |
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				in: aMethod methodClass
				using: RenameSelectorWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				builtWith: [ :implementors :senders |
					RenameSelectorWithActualScope
						from: aMethod selector
						to: aNewSelector
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ]) ]
! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:43 pm (UTC)'!
addParameterInActualScopeToolName

	^'smalltalk_refactor_add_parameter_in_actual_scope'! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
changeKeywordsOrderInActualScopeToolName

	^'smalltalk_refactor_change_keywords_order_in_actual_scope'! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
removeParameterInActualScopeToolName

	^'smalltalk_refactor_remove_parameter_in_actual_scope'! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
renameSelectorInActualScopeToolName

	^'smalltalk_refactor_rename_selector_in_actual_scope'! !
