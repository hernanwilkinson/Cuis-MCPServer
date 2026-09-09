'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 10:04:46 am'!
'Description Give the refactoring tools the options their appliers ask for'!
!provides: 'MCPServerLiveTypingRefactorings' 1 18!
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


!MCPActualScopeRefactoringDecorator commentStamp: '<historical>' prior: 0!
I let a refactoring tool that works over a scope work over the one LiveTyping saw.

A client that names the actual scope is asking for what only LiveTyping can tell: which sends of the selector really reached an object of the class that implements it. Every other scope is what the tool I decorate already knows, and it is the one that answers.

I am how a client gets both without knowing two tool names. The tool of my own is offered on its own too, so that what each of them changes can be told apart.!

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:21:27 pm (UTC)'!
definition

	"The scope now takes one more value, and a client reads the ones it may send from what the
	scope says about itself and nowhere else, so that is where it has to be said."

	| definition |

	definition := super definition.
	self sayWhatTheActualScopeIsIn: definition.

	^definition! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:06:56 am (UTC)'!
description

	^self decoratee description ,
		' It also takes actual and actualAndPossible as the scope, and actual is the default: only the sends LiveTyping saw really reaching an object of the class of the method, or of one of its subclasses, are changed, and a send of the same name to anything else is left alone. actualAndPossible changes as well the sends LiveTyping could only guess at.'! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:06:47 am (UTC)'!
isAskedForTheActualScopeIn: anArguments

	^self class actualScopeNames includes: (self scopeNamedIn: anArguments)! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 4:23:06 pm (UTC)'!
namesDeclaredBy: someProperties

	"Answer the names a client sends for these properties. Each one is asked to add itself
	rather than asked what it is called, because one property is not always one name: the one
	that answers a method is a class name and a selector."

	^(someProperties inject: OrderedDictionary new into: [ :aProperties :eachProperty |
		eachProperty addTo: aProperties ]) keys! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:06:54 am (UTC)'!
sayWhatTheActualScopeIsIn: aDefinition

	"A tool that already works over a scope gets two more values for it; one that works over none
	gets the scope itself. Either way the scope is where a client reads what it may send, so
	that is where it has to be said."

	| properties |

	properties := (aDefinition at: 'inputSchema') at: 'properties'.
	properties
		at: MCPRefactoringToolGroup scopePropertyName
		ifPresent: [ :aScopeDefinition |
			aScopeDefinition
				at: 'description'
				put: MCPRefactoringToolGroup scopeValuesDescription , '. ' , self class actualScopeDescription ]
		ifAbsent: [ self class scopeProperty addTo: properties ]! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:06:49 am (UTC)'!
valueWithArguments: anArguments

	"A client that names the actual scope is asking for the refactoring only LiveTyping makes
	possible, which is mine to apply; any other scope is one the tool I decorate already works
	over, and it is the one that answers."

	^(self isAskedForTheActualScopeIn: anArguments)
		ifTrue: [ self applyInActualScopeWith: anArguments ]
		ifFalse: [ self decoratee valueWithArguments: anArguments ]! !

!MCPActualScopeRefactoringDecorator methodsFor: 'tool' stamp: 'HAW 7/Sep/2026, 11:31:52 pm (UTC)'!
valuesFrom: anArguments

	^(self properties 
		inject: OrderedCollection new 
		into: [ :someValues :eachProperty |
			eachProperty addValueFrom: anArguments to: someValues ]) asArray! !

!MCPActualScopeRefactoringDecorator methodsFor: 'properties' stamp: 'HAW 2/Sep/2026, 8:52:31 pm (UTC)'!
addedProperties

	"What I take and the tool I decorate does not, so that a client naming the actual scope can
	send it and is shown nothing twice."

	| namesAlreadyThere |

	namesAlreadyThere := self namesDeclaredBy: self decoratee properties.

	^self properties reject: [ :eachProperty |
		(self namesDeclaredBy: (Array with: eachProperty))
			allSatisfy: [ :eachName | namesAlreadyThere includes: eachName ] ]! !

!MCPActualScopeRefactoringDecorator methodsFor: 'properties' stamp: 'HAW 2/Sep/2026, 8:52:31 pm (UTC)'!
properties

	"Everything a client sends me when it asks for the actual scope, the ones the tool I
	decorate already declares included, so that I read the arguments through the properties
	that describe them instead of reaching into the request myself."

	^self subclassResponsibility! !

!MCPActualScopeRefactoringDecorator methodsFor: 'properties' stamp: 'HAW 2/Sep/2026, 8:52:55 pm (UTC)'!
withValuesFrom: anArguments do: aBlock

	"Evaluate the block with the value of each property I declare, in the order I declare them,
	which is how a tool hands a request to the code that answers it."

	^aBlock valueWithArguments: (self valuesFrom: anArguments)! !

!MCPActualScopeRefactoringDecorator methodsFor: 'applying' stamp: 'HAW 2/Sep/2026, 8:52:31 pm (UTC)'!
applyInActualScopeWith: anArguments

	"Apply my refactoring over the scope LiveTyping saw and answer what it changed."

	^self subclassResponsibility! !

!MCPActualScopeRefactoringDecorator methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:06:42 am (UTC)'!
defaultScopeName

	^self class actualScopeName! !

!MCPActualScopeRefactoringDecorator methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:06:44 am (UTC)'!
keepsPossibleSendsIn: anArguments

	^(self scopeNamedIn: anArguments) = self class actualAndPossibleScopeName! !

!MCPActualScopeRefactoringDecorator methodsFor: 'scope' stamp: 'HAW 2/Sep/2026, 8:52:31 pm (UTC)'!
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

!MCPActualScopeRefactoringDecorator methodsFor: 'scope' stamp: 'HAW 2/Sep/2026, 8:52:31 pm (UTC)'!
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

!MCPActualScopeRefactoringDecorator methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:06:40 am (UTC)'!
scopeNamedIn: anArguments

	^anArguments at: MCPRefactoringToolGroup scopePropertyName ifAbsent: [ self defaultScopeName ]! !

!MCPActualScopeRefactoringDecorator methodsFor: 'arguments' stamp: 'HAW 2/Sep/2026, 8:53:58 pm (UTC)'!
classNamed: aClassName

	^aClassName
		ifEmpty: [ self error: MCPRefactoringToolGroup classNameNeededErrorDescription ]
		ifNotEmpty: [ :aName |
			(smalltalk classNamed: aName)
				ifNil: [ self error: (MCPRefactoringToolGroup classNotFoundErrorDescriptionFor: aName) ] ]! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'descriptions' stamp: 'HAW 9/Sep/2026, 2:06:33 am (UTC)'!
actualScopeDescription

	^'actual is the scope LiveTyping saw, which only it can tell: the sends of the selector that really reached an object of the class of the method, or of one of its subclasses. actualAndPossible takes in as well the sends it could only guess at, whose receiver it never saw hold anything or saw incompletely. Defaults to actual'! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'descriptions' stamp: 'HAW 9/Sep/2026, 2:06:35 am (UTC)'!
actualScopeOnlyDescription

	^'Send actual to work over what LiveTyping saw: the sends of the selector that really reached an object of the class of the method, or of one of its subclasses. Send actualAndPossible to take in as well the sends it could only guess at. Send nothing to leave the tool working over what it is told'! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'tool' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
scopeProperty

	"The scope a tool that works over none is given, so that a client has one place to say it
	wants the sends LiveTyping saw and one place to read that it may."

	^MCPPlainProperty
		named: MCPRefactoringToolGroup scopePropertyName
		describedBy: self actualScopeOnlyDescription
		defaultingTo: ''! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:06:16 am (UTC)'!
actualAndPossibleScopeName

	^'actualAndPossible'! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'scope' stamp: 'HAW 2/Sep/2026, 8:54:38 pm (UTC)'!
actualScopeName

	"The scope a client names to ask for the sends LiveTyping saw, next to the ones a
	refactoring already knows: class, hierarchy, category, hierarchyAndCategories and system."

	^'actual'! !

!MCPActualScopeRefactoringDecorator class methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:06:31 am (UTC)'!
actualScopeNames

	^{ self actualScopeName. self actualAndPossibleScopeName }! !

!MCPAddParameterInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:36 am (UTC)'!
properties

	^{
		MCPMethodProperty
			classDescribedBy: 'Name of the class that implements the selector'
			selectorDescribedBy: 'Selector to add the parameter to'.
		MCPPlainProperty named: 'parameterName' describedBy: 'Name of the parameter to add'.
		MCPPlainProperty named: 'parameterValue' describedBy: 'Expression every sender will pass for it'.
		MCPPlainProperty named: 'keyword' describedBy: 'Keyword to add, needed only when the selector is a keyword one' defaultingTo: ''.
		MCPPlainProperty named: 'parameterIndex' describedBy: 'Position for the new keyword, counting from one' defaultingTo: '1' }! !

!MCPAddParameterInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:38 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aParameterName :aParameterValue :aKeyword :aParameterIndex |
		(MCPRefactoringApplier applying: (self
			refactoringAddingTo: aMethod
			named: aParameterName
			initializedWith: aParameterValue
			using: aKeyword
			at: aParameterIndex
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPAddParameterInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:40 am (UTC)'!
refactoringAddingTo: aMethod named: aParameterName initializedWith: aParameterValue using: aKeyword at: aParameterIndex keepingPossibleSends: isKeepingPossibleSends

	^self
		refactoringOn: aMethod selector
		in: aMethod methodClass
		using: AddParameterWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :senders |
			aMethod selector isUnary
				ifTrue: [ AddParameterWithActualScope
					named: aParameterName
					initializedWith: aParameterValue
					toUnarySelector: aMethod selector
					implementors: implementors
					senders: senders
					withPossibleMessageSends: isKeepingPossibleSends ]
				ifFalse: [ AddParameterWithActualScope
					named: aParameterName
					at: aParameterIndex asNumber
					initializedWith: aParameterValue
					using: aKeyword
					toKeywordSelector: aMethod selector
					implementors: implementors
					senders: senders
					withPossibleMessageSends: isKeepingPossibleSends ] ]! !

!MCPAddParameterInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:31 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools addParameterRefactoringToolName! !

!MCPChangeKeywordsOrderInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:23 am (UTC)'!
properties

	^{
		MCPMethodProperty
			classDescribedBy: 'Name of the class that implements the selector'
			selectorDescribedBy: 'Selector to reorder'.
		MCPPluggableProperty named: 'newSelector' describedBy: 'Selector with the same keywords in the order wanted' valuedWith: [ :aSelector | aSelector asSymbol ] }! !

!MCPChangeKeywordsOrderInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:26 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aNewSelector |
		(MCPRefactoringApplier applying: (self
			refactoringReordering: aMethod
			to: aNewSelector
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPChangeKeywordsOrderInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:28 am (UTC)'!
refactoringReordering: aMethod to: aNewSelector keepingPossibleSends: isKeepingPossibleSends

	^self
		refactoringOn: aMethod selector
		in: aMethod methodClass
		using: ChangeKeywordsSelectorOrderWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :senders |
			ChangeKeywordsSelectorOrderWithActualScope
				from: aMethod selector
				to: aNewSelector
				implementors: implementors
				senders: senders
				withPossibleMessageSends: isKeepingPossibleSends ]! !

!MCPChangeKeywordsOrderInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:14 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools changeKeywordsOrderRefactoringToolName! !

!MCPExtractAsParameterInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:43 am (UTC)'!
properties

	^{
		MCPMethodProperty default.
		MCPPlainProperty named: 'parameterName' describedBy: 'Name of the parameter to introduce'.
		MCPPlainProperty named: 'text' describedBy: 'Text of the piece to extract, looked for in the source of the method' defaultingTo: ''.
		MCPPlainProperty named: 'start' describedBy: 'First character of the piece, counting from one. Sent instead of the text' defaultingTo: ''.
		MCPPlainProperty named: 'stop' describedBy: 'Last character of the piece' defaultingTo: '' }! !

!MCPExtractAsParameterInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:44 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aParameterName :aText :aStart :aStop |
		(MCPRefactoringApplier applying: (self
			refactoringExtractingIn: aMethod
			as: aParameterName
			matching: aText
			from: aStart
			to: aStop
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPExtractAsParameterInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:46 am (UTC)'!
refactoringExtractingIn: aMethod as: aParameterName matching: aText from: aStart to: aStop keepingPossibleSends: isKeepingPossibleSends

	^self
		refactoringOn: aMethod selector
		in: aMethod methodClass
		using: ExtractAsParameterWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :senders |
			ExtractAsParameterWithActualScope
				named: aParameterName
				extractedFromAll: (Array with: (MCPRefactoringToolGroup intervalIn: aMethod matching: aText from: aStart to: aStop))
				at: aMethod
				implementors: implementors
				senders: senders
				withPossibleMessageSends: isKeepingPossibleSends ]! !

!MCPExtractAsParameterInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:45:04 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools extractAsParameterRefactoringToolName! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:07:59 am (UTC)'!
description

	^self decoratee description ,
		' It also takes actual and actualAndPossible as the scope, which inline every send LiveTyping saw really reaching an object of the class that implements the method, instead of the one send named here; actualAndPossible inlines as well the sends it could only guess at. Without a scope the one send named is inlined.'! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:53 am (UTC)'!
properties

	^{
		MCPMethodProperty default.
		MCPPlainProperty named: 'removeMethod' describedBy: 'Whether the method is taken away once its sends are inlined, true or false' defaultingTo: 'false' }! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:55 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aRemoveAnswer |
		(MCPRefactoringApplier applying: (self
			refactoringInlining: aMethod
			removingIt: aRemoveAnswer
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:57 am (UTC)'!
refactoringInlining: aMethod removingIt: aRemoveAnswer keepingPossibleSends: isKeepingPossibleSends

	^self
		messageSendsRefactoringOn: aMethod
		using: InlineMethodWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :messageSends |
			InlineMethodWithActualScope
				from: aMethod
				intoSendersAndUsages: messageSends
				removeMethod: aRemoveAnswer isTrue ]! !

!MCPInlineMethodInActualScopeDecorator methodsFor: 'scope' stamp: 'HAW 9/Sep/2026, 2:06:58 am (UTC)'!
defaultScopeName

	^''! !

!MCPInlineMethodInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 4:21:58 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools inlineMethodRefactoringToolName! !

!MCPInlineMethodInActualScopeDecorator class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 4:24:09 pm (UTC)'!
actualScopeOnlyDescription

	^'Send actual to inline every send LiveTyping saw really reaching an object of the class that implements the selector, which needs neither senderClassName nor senderSelector nor the text of the send. Send nothing to inline the one send named by those'! !

!MCPRemoveParameterInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:30 am (UTC)'!
properties

	^{
		MCPMethodProperty
			classDescribedBy: 'Name of the class that implements the selector'
			selectorDescribedBy: 'Selector to remove the parameter from'.
		MCPPlainProperty named: 'parameterName' describedBy: 'Name of the parameter to remove'.
		MCPPlainProperty named: 'parameterIndex' describedBy: 'Position of the parameter, counting from one' defaultingTo: '1' }! !

!MCPRemoveParameterInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:32 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aParameterName :aParameterIndex |
		(MCPRefactoringApplier applying: (self
			refactoringRemoving: aParameterName
			at: aParameterIndex
			from: aMethod
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPRemoveParameterInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:34 am (UTC)'!
refactoringRemoving: aParameterName at: aParameterIndex from: aMethod keepingPossibleSends: isKeepingPossibleSends

	^self
		refactoringOn: aMethod selector
		in: aMethod methodClass
		using: RemoveParameterWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :senders |
			RemoveParameterWithActualScope
				atIndex: aParameterIndex asNumber
				named: aParameterName
				from: aMethod selector
				implementors: implementors
				senders: senders
				withPossibleMessageSends: isKeepingPossibleSends ]! !

!MCPRemoveParameterInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:23 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools removeParameterRefactoringToolName! !

!MCPRenameSelectorInActualScopeDecorator methodsFor: 'properties' stamp: 'HAW 9/Sep/2026, 2:07:17 am (UTC)'!
properties

	^{
		MCPMethodProperty
			classDescribedBy: 'Name of the class that implements the selector'
			selectorDescribedBy: 'Selector to rename'.
		MCPPluggableProperty named: 'newSelector' describedBy: 'Selector to rename it to' valuedWith: [ :aSelector | aSelector asSymbol ] }! !

!MCPRenameSelectorInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:19 am (UTC)'!
applyInActualScopeWith: anArguments

	^self withValuesFrom: anArguments do: [ :aMethod :aNewSelector |
		(MCPRefactoringApplier applying: (self
			refactoringRenaming: aMethod
			to: aNewSelector
			keepingPossibleSends: (self keepsPossibleSendsIn: anArguments))) applyReportingChanges ]! !

!MCPRenameSelectorInActualScopeDecorator methodsFor: 'applying' stamp: 'HAW 9/Sep/2026, 2:07:21 am (UTC)'!
refactoringRenaming: aMethod to: aNewSelector keepingPossibleSends: isKeepingPossibleSends

	^self
		refactoringOn: aMethod selector
		in: aMethod methodClass
		using: RenameSelectorWithActualScope
		keepingPossibleSends: isKeepingPossibleSends
		builtWith: [ :implementors :senders |
			RenameSelectorWithActualScope
				from: aMethod selector
				to: aNewSelector
				implementors: implementors
				senders: senders
				withPossibleMessageSends: isKeepingPossibleSends ]! !

!MCPRenameSelectorInActualScopeDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 3:38:00 pm (UTC)'!
decoratedToolName

	^MCPRefactoringTools renameSelectorRefactoringToolName! !
