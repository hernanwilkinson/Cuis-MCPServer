'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 1:36:49 pm'!
'Description Let a refactoring work over the scope LiveTyping saw'!
!provides: 'MCPServerLiveTypingRefactorings' 1 10!
!requires: 'MCPServer' nil nil nil!
!requires: 'LiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingRefactorings!


!classDefinition: #MCPActualScopeRefactoringDecorator category: #MCPServerLiveTypingRefactorings!
MCPToolDecorator subclass: #MCPActualScopeRefactoringDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPActualScopeRefactoringDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPAddParameterInActualScopeDecorator category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPAddParameterInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPAddParameterInActualScopeDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPAddParameterInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPChangeKeywordsOrderInActualScopeDecorator category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPChangeKeywordsOrderInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPChangeKeywordsOrderInActualScopeDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPChangeKeywordsOrderInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPExtractAsParameterInActualScopeDecorator category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPExtractAsParameterInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPExtractAsParameterInActualScopeDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPExtractAsParameterInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPInlineMethodInActualScopeDecorator category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPInlineMethodInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPInlineMethodInActualScopeDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPInlineMethodInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPRemoveParameterInActualScopeDecorator category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPRemoveParameterInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPRemoveParameterInActualScopeDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPRemoveParameterInActualScopeDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPRenameSelectorInActualScopeDecorator category: #MCPServerLiveTypingRefactorings!
MCPActualScopeRefactoringDecorator subclass: #MCPRenameSelectorInActualScopeDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactorings'!
!classDefinition: 'MCPRenameSelectorInActualScopeDecorator class' category: #MCPServerLiveTypingRefactorings!
MCPRenameSelectorInActualScopeDecorator class
	instanceVariableNames: ''!

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


!MCPActualScopeRefactoringDecorator commentStamp: '<historical>' prior: 0!
I let a refactoring tool that works over a scope work over the one LiveTyping saw.

A client that names the actual scope is asking for what only LiveTyping can tell: which sends of the selector really reached an object of the class that implements it. Every other scope is what the tool I decorate already knows, and it is the one that answers.

I am how a client gets both without knowing two tool names. The tool of my own is offered on its own too, so that what each of them changes can be told apart.!

!MCPActualScopeRefactoringToolGroup commentStamp: '<historical>' prior: 0!
I am a group of tools that apply refactorings over the scope LiveTyping saw.

I differ from the groups that work on a selector alone by what I take to be a send of it: only the sends to objects LiveTyping saw were of the class that implements it. A send of the same name to anything else is left as it was, which a refactoring over the whole system cannot tell apart.!

!MCPLiveTypingRefactoringTools commentStamp: '<historical>' prior: 0!
I am the tools that apply the refactorings LiveTyping makes possible.

They differ from the ones that work on a selector alone by what they take to be a send of it: only the sends to objects LiveTyping saw were of the class that implements it. A send of the same name to anything else is left as it was, which a refactoring over the whole system cannot tell apart.!

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:37:46 pm (UTC)'!
actualScopeTool

	"Answer the tool that applies my refactoring over the scope LiveTyping saw, which is the
	one offered on its own too, so that both go through the same code and can be compared."

	^self subclassResponsibility! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:22:59 pm (UTC)'!
addedProperties

	"What the tool of my own takes and the one I decorate does not, so that a client naming the
	actual scope can send it. The tool is asked instead of the properties being written down a
	second time, which is what would go stale when it takes one more."

	| namesAlreadyThere |

	namesAlreadyThere := self namesDeclaredBy: self decoratee properties.

	^self actualScopeTool properties reject: [ :eachProperty |
		(self namesDeclaredBy: (Array with: eachProperty))
			allSatisfy: [ :eachName | namesAlreadyThere includes: eachName ] ]! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:21:27 pm (UTC)'!
definition

	"The scope now takes one more value, and a client reads the ones it may send from what the
	scope says about itself and nowhere else, so that is where it has to be said."

	| definition |

	definition := super definition.
	self sayWhatTheActualScopeIsIn: definition.

	^definition! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:37:13 pm (UTC)'!
description

	^self decoratee description ,
		' It also takes actual as the scope, which is the one LiveTyping saw: only the sends that really reached an object of the class that implements the selector are changed, and a send of the same name to anything else is left alone.'! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:37:41 pm (UTC)'!
isAskedForTheActualScopeIn: anArguments

	^(anArguments at: MCPRefactoringToolGroup scopePropertyName ifAbsent: [ '' ])
		= MCPActualScopeRefactoringToolGroup actualScopeName! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:37:51 pm (UTC)'!
liveTypingRefactoringTools

	^MCPLiveTypingRefactoringTools for: smalltalk! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:23:06 pm (UTC)'!
namesDeclaredBy: someProperties

	"Answer the names a client sends for these properties. Each one is asked to add itself
	rather than asked what it is called, because one property is not always one name: the one
	that answers a method is a class name and a selector."

	^(someProperties inject: OrderedDictionary new into: [ :aProperties :eachProperty |
		eachProperty addTo: aProperties ]) keys! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:23:52 pm (UTC)'!
sayWhatTheActualScopeIsIn: aDefinition

	"A tool that already works over a scope gets one more value for it; one that works over none
	gets the scope itself. Either way the scope is where a client reads what it may send, so
	that is where it has to be said."

	| properties |

	properties := (aDefinition at: 'inputSchema') at: 'properties'.
	properties
		at: MCPRefactoringToolGroup scopePropertyName
		ifPresent: [ :aScopeDefinition |
			aScopeDefinition
				at: 'description'
				put: (aScopeDefinition at: 'description') , '. ' , self class actualScopeDescription ]
		ifAbsent: [ self class scopeProperty addTo: properties ]! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:37:35 pm (UTC)'!
valueWithArguments: anArguments

	"A client that names the actual scope is asking for the refactoring only LiveTyping makes
	possible, which is the tool of my own; any other scope is one the tool I decorate already
	works over, and it is the one that answers."

	^(self isAskedForTheActualScopeIn: anArguments)
		ifTrue: [ self actualScopeTool valueWithArguments: anArguments ]
		ifFalse: [ self decoratee valueWithArguments: anArguments ]! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 3:37:29 pm (UTC)'!
actualScopeDescription

	^'actual is the scope LiveTyping saw, which needs className too: only the sends that really reached an object of that class are changed'! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:24:03 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to work over what LiveTyping saw instead of over what this tool is told. Send nothing to leave it working over what it is told'! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:23:58 pm (UTC)'!
scopeProperty

	"The scope a tool that works over none is given, so that a client has one place to say it
	wants the sends LiveTyping saw and one place to read that it may."

	^MCPPlainToolProperty
		named: MCPRefactoringToolGroup scopePropertyName
		describedBy: self actualScopeOnlyDescription
		defaultingTo: ''! !

!MCPAddParameterInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:38:27 pm (UTC)'!
actualScopeTool

	^self liveTypingRefactoringTools addParameterInActualScopeTool! !

!MCPAddParameterInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:31 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools addParameterRefactoringToolName! !

!MCPChangeKeywordsOrderInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:38:09 pm (UTC)'!
actualScopeTool

	^self liveTypingRefactoringTools changeKeywordsOrderInActualScopeTool! !

!MCPChangeKeywordsOrderInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:14 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools changeKeywordsOrderRefactoringToolName! !

!MCPExtractAsParameterInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:44:58 pm (UTC)'!
actualScopeTool

	^self liveTypingRefactoringTools extractAsParameterInActualScopeTool! !

!MCPExtractAsParameterInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:45:04 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools extractAsParameterRefactoringToolName! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:21:54 pm (UTC)'!
actualScopeTool

	^self liveTypingRefactoringTools inlineMethodInActualScopeTool! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:22:03 pm (UTC)'!
description

	^self decoratee description ,
		' It also takes actual as the scope, which inlines every send LiveTyping saw really reaching an object of the class that implements the selector, instead of the one send named here.'! !

!MCPInlineMethodInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 4:21:58 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools inlineMethodRefactoringToolName! !

!MCPInlineMethodInActualScopeDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:24:09 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to inline every send LiveTyping saw really reaching an object of the class that implements the selector, which needs neither senderClassName nor senderSelector nor the text of the send. Send nothing to inline the one send named by those'! !

!MCPRemoveParameterInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:38:18 pm (UTC)'!
actualScopeTool

	^self liveTypingRefactoringTools removeParameterInActualScopeTool! !

!MCPRemoveParameterInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:23 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools removeParameterRefactoringToolName! !

!MCPRenameSelectorInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 3:37:55 pm (UTC)'!
actualScopeTool

	^self liveTypingRefactoringTools renameSelectorInActualScopeTool! !

!MCPRenameSelectorInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:00 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools renameSelectorRefactoringToolName! !

!MCPActualScopeRefactoringToolGroup methodsFor: 'scope' stamp: 'HAW 1/Sep/2026, 4:30:06 pm (UTC)'!
messageSendsRefactoringOn: aMethodToInline using: aRefactoringClass keepingPossibleSends: aBoolean builtWith: aBlock

	"Answer the refactoring the block builds over the sends LiveTyping saw of the method, which
	is what tells a send of this selector to one of these objects from a send of the same name
	to anything else. A send it could only guess at is left out unless a client asks for it.

	A refactoring that inlines is given the sends themselves and not the methods that hold them,
	because each send is replaced where it is written. A send in a method that is no longer
	there, as an expression that was evaluated once is, names nothing to change; and a send
	written inside the method being inlined is left out, since inlining it there would be
	inlining the method into itself."

	| implementors messageSends |

	implementors := OrderedCollection new.
	messageSends := OrderedCollection new.
	aRefactoringClass
		addActualImplementorsOf: aMethodToInline selector
		in: aMethodToInline methodClass
		to: implementors
		andActualMessageSendsTo: messageSends
		inSystem: smalltalk.

	^aBlock
		value: implementors
		value: (messageSends select: [ :eachMessageSend |
			eachMessageSend methodReference isValid
				and: [ (eachMessageSend compiledMethod equivalentTo: aMethodToInline) not
					and: [ eachMessageSend isPossibleMessageSend not or: [ aBoolean ] ] ] ])! !

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

!MCPActualScopeRefactoringToolGroup class methodsFor: 'scope' stamp: 'HAW 1/Sep/2026, 3:36:54 pm (UTC)'!
actualScopeName

	"The scope a client names to ask for the sends LiveTyping saw, next to the ones a
	refactoring already knows: class, hierarchy, category, hierarchyAndCategories and system."

	^'actual'! !

!MCPLiveTypingRefactoringTools methodsFor: 'tools' stamp: 'HAW 1/Sep/2026, 4:21:19 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self renameSelectorInActualScopeTool;
		addTool: self changeKeywordsOrderInActualScopeTool;
		addTool: self removeParameterInActualScopeTool;
		addTool: self addParameterInActualScopeTool;
		addTool: self extractAsParameterInActualScopeTool;
		addTool: self inlineMethodInActualScopeTool! !

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

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 3:44:44 pm (UTC)'!
extractAsParameterInActualScopeTool

	^MCPPluggableTool
		named: self class extractAsParameterInActualScopeToolName
		describedBy: 'Turn a piece of a method into a parameter of it, giving the piece to pass only to the senders that really reach an object of the class that implements the selector, as LiveTyping saw while the image ran. The piece is named by the text it is written with, or by the interval it occupies.'
		properties: {
			MCPMethodProperty newDefault.
			MCPPlainToolProperty named: 'parameterName' describedBy: 'Name of the parameter to introduce'.
			MCPPlainToolProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
			MCPPlainToolProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
			MCPPlainToolProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: ''.
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is changed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aParameterName :aText :aStart :aStop :aKeepingAnswer |
			self applyReportingChanges: (self
				refactoringOn: aMethod selector
				in: aMethod methodClass
				using: ExtractAsParameterWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				builtWith: [ :implementors :senders |
					ExtractAsParameterWithActualScope
						named: aParameterName
						extractedFromAll: (Array with: (self intervalIn: aMethod matching: aText from: aStart to: aStop))
						at: aMethod
						implementors: implementors
						senders: senders
						withPossibleMessageSends: aKeepingAnswer = 'true' ]) ]! !

!MCPLiveTypingRefactoringTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 4:21:13 pm (UTC)'!
inlineMethodInActualScopeTool

	^MCPPluggableTool
		named: self class inlineMethodInActualScopeToolName
		describedBy: 'Replace every send of a method by what the method does, in the sends that really reached an object of the class that implements it, as LiveTyping saw while the image ran. A send of the same name to anything else is left alone, and so is a send written inside the method itself. Naming one send at a time is what inlining without LiveTyping asks for.'
		properties: {
			MCPMethodProperty newDefault.
			MCPPlainToolProperty named: 'removeMethod' describedBy: 'Whether the method is taken away once its sends are inlined, true or false' defaultingTo: 'false'.
			MCPPlainToolProperty named: 'keepingPossibleSends' describedBy: 'Whether a send LiveTyping could only guess at is inlined too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aRemoveAnswer :aKeepingAnswer |
			self applyReportingChanges: (self
				messageSendsRefactoringOn: aMethod
				using: InlineMethodWithActualScope
				keepingPossibleSends: aKeepingAnswer = 'true'
				builtWith: [ :implementors :messageSends |
					InlineMethodWithActualScope
						from: aMethod
						intoSendersAndUsages: messageSends
						removeMethod: aRemoveAnswer = 'true' ]) ]! !

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

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 3:44:33 pm (UTC)'!
extractAsParameterInActualScopeToolName

	^'smalltalk_refactor_extract_as_parameter_in_actual_scope'! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 4:21:03 pm (UTC)'!
inlineMethodInActualScopeToolName

	^'smalltalk_refactor_inline_method_in_actual_scope'! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
removeParameterInActualScopeToolName

	^'smalltalk_refactor_remove_parameter_in_actual_scope'! !

!MCPLiveTypingRefactoringTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:55 pm (UTC)'!
renameSelectorInActualScopeToolName

	^'smalltalk_refactor_rename_selector_in_actual_scope'! !
