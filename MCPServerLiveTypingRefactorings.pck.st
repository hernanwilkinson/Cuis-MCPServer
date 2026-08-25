'From Cuis7.9 [latest update: #8134] on 25 August 2026 at 8:08:15 am'!
'Description Hand a tool the method instead of the two names it is found by'!
!provides: 'MCPServerLiveTypingRefactorings' 1 3!
!requires: 'MCPServer' nil nil nil!
!requires: 'LiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingRefactorings!


!classDefinition: #MCPLiveTypingRefactoringTools category: #MCPServerLiveTypingRefactorings!
MCPToolProvider subclass: #MCPLiveTypingRefactoringTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPLiveTypingRefactoringTools class' category: #MCPServerLiveTypingRefactorings!
MCPLiveTypingRefactoringTools class
	instanceVariableNames: ''!


!MCPLiveTypingRefactoringTools commentStamp: '<historical>' prior: 0!
I am the tools that apply the refactorings LiveTyping makes possible.

They differ from the ones that work on a selector alone by what they take to be a send of it: only the sends to objects LiveTyping saw were of the class that implements it. A send of the same name to anything else is left as it was, which a refactoring over the whole system cannot tell apart.!

!MCPLiveTypingRefactoringTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 10:50:48 am (UTC)'!
!methodProperties: {}!
addToolsTo: anMCPServer

	anMCPServer addTool: self renameSelectorInActualScopeTool.
	anMCPServer addTool: self changeKeywordsOrderInActualScopeTool.
	anMCPServer addTool: self removeParameterInActualScopeTool.
	anMCPServer addTool: self addParameterInActualScopeTool! !

!MCPLiveTypingRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
actualScopeOf: aSelector in: aClass using: aRefactoringClass keepingPossibleSends: aBoolean applyingWith: aBlock

	"Gather the implementors and the senders LiveTyping saw, which is what tells a send of this
	selector to one of these objects from a send of the same name to anything else. A sender it
	could only guess at is left out unless a client asks for it.

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

	^self apply: (aBlock
		value: implementors
		value: ((senders
			select: [ :aMethodReference |
				aMethodReference isValid
					and: [ aMethodReference isPossibleSender not or: [ aBoolean ] ] ]
			thenCollect: [ :aMethodReference | aMethodReference compiledMethod ]) asIdentitySet))
! !

!MCPLiveTypingRefactoringTools methodsFor: 'refactoring' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
apply: aRefactoring

	aRefactoring apply.

	^'Refactoring applied'
! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation - live typing refactoring' stamp: 'HAW 25/Aug/2026, 11:01:01 am (UTC)'!
!methodProperties: {}!
addParameterInActualScopeTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_add_parameter_in_actual_scope'
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
			self
				actualScopeOf: aMethod selector
				in: aMethod methodClass
				using: AddParameterWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				applyingWith: [ :implementors :senders |
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
							withPossibleMessageSends: aKeepingAnswer = 'true' ] ] ]

! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation - live typing refactoring' stamp: 'HAW 25/Aug/2026, 11:01:01 am (UTC)'!
!methodProperties: {}!
changeKeywordsOrderInActualScopeTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_change_keywords_order_in_actual_scope'
		describedBy: 'Reorder the keywords of a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to reorder'.
			MCPPluggableToolProperty named: 'newSelector' describedBy: 'Selector with the same keywords in the order wanted' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aNewSelector :aKeepingAnswer |
			self
				actualScopeOf: aMethod selector
				in: aMethod methodClass
				using: ChangeKeywordsSelectorOrderWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				applyingWith: [ :implementors :senders |
					ChangeKeywordsSelectorOrderWithActualScope
						from: aMethod selector
						to: aNewSelector
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ] ]
! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation - live typing refactoring' stamp: 'HAW 25/Aug/2026, 11:01:01 am (UTC)'!
!methodProperties: {}!
removeParameterInActualScopeTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_remove_parameter_in_actual_scope'
		describedBy: 'Remove a parameter from a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to remove the parameter from'.
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to remove'.
			MCPPlainToolProperty named: 'parameterIndex' describedBy: 'Position of the parameter, counting from one' defaultingTo: '1'.
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aParameterName :aParameterIndex :aKeepingAnswer |
			self
				actualScopeOf: aMethod selector
				in: aMethod methodClass
				using: RemoveParameterWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				applyingWith: [ :implementors :senders |
					RemoveParameterWithActualScope
						atIndex: aParameterIndex asNumber
						named: aParameterName
						from: aMethod selector
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ] ]
! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation - live typing refactoring' stamp: 'HAW 25/Aug/2026, 11:00:49 am (UTC)'!
!methodProperties: {}!
renameSelectorInActualScopeTool

	^MCPPluggableTool
		named: 'smalltalk_refactor_rename_selector_in_actual_scope'
		describedBy: 'Rename a selector only where it is really sent to objects of the class that implements it, as LiveTyping saw while the image ran. A send of the same name to anything else is left alone, which renaming a selector in the whole system cannot tell apart.'
		properties: {
			MCPMethodProperty
				classDescribedBy: 'Name of the class that implements the selector'
				selectorDescribedBy: 'Selector to rename'.
			MCPPluggableToolProperty named: 'newSelector' describedBy: 'Selector to rename it to' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is renamed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aNewSelector :aKeepingAnswer |
			self
				actualScopeOf: aMethod selector
				in: aMethod methodClass
				using: RenameSelectorWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				applyingWith: [ :implementors :senders |
					RenameSelectorWithActualScope
						from: aMethod selector
						to: aNewSelector
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ] ]
! !
