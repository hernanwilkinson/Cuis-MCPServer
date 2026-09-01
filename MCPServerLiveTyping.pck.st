'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 7:55:23 am'!
'Description File the rest of the packages out in the new format'!
!provides: 'MCPServerLiveTyping' 1 12!
!requires: 'MCPServer' nil nil nil!
!requires: 'LiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTyping!


!classDefinition: #MCPActualImplementorsDecorator category: #MCPServerLiveTyping!
MCPToolDecorator subclass: #MCPActualImplementorsDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPActualImplementorsDecorator class' category: #MCPServerLiveTyping!
MCPActualImplementorsDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPActualSendersDecorator category: #MCPServerLiveTyping!
MCPToolDecorator subclass: #MCPActualSendersDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPActualSendersDecorator class' category: #MCPServerLiveTyping!
MCPActualSendersDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPMethodTypesDecorator category: #MCPServerLiveTyping!
MCPToolDecorator subclass: #MCPMethodTypesDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPMethodTypesDecorator class' category: #MCPServerLiveTyping!
MCPMethodTypesDecorator class
	instanceVariableNames: ''!

!classDefinition: #MCPLiveTypingTools category: #MCPServerLiveTyping!
MCPToolGroup subclass: #MCPLiveTypingTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPLiveTypingTools class' category: #MCPServerLiveTyping!
MCPLiveTypingTools class
	instanceVariableNames: ''!


!MCPActualImplementorsDecorator commentStamp: '<historical>' prior: 0!
I add to the methods that implement a selector the ones a send to an object of a named class could really reach.!

!MCPActualSendersDecorator commentStamp: '<historical>' prior: 0!
I add to the methods that write a selector the ones LiveTyping saw really sending it to an object that implements it, which are the ones a refactoring of the selector has to change.!

!MCPMethodTypesDecorator commentStamp: '<historical>' prior: 0!
I add to the source of a method the classes LiveTyping saw it answer and saw its parameters and temporaries hold while the image ran.!

!MCPLiveTypingTools commentStamp: '<historical>' prior: 0!
I am the tools that read the type information LiveTyping gathers.

Types here are what was seen and not what was declared: they are the classes a variable held, a parameter was sent or a method answered while the image ran, so code that has not run yet has none.!

!MCPActualImplementorsDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:45:00 pm (UTC)'!
addedProperties

	^{ MCPPlainToolProperty
		named: 'className'
		describedBy: 'Name of the class the selector is sent to. Without it there is nothing to narrow, because every implementor implements it'
		defaultingTo: '' }
! !

!MCPActualImplementorsDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 10:15:31 pm (UTC)'!
description

	^self decoratee description ,
		' Naming a class adds, in actual, the ones a send to an object of that class could really reach, which are the ones implemented by it and by every subclass of the one highest up that implements it.'
! !

!MCPActualImplementorsDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 9:26:20 pm (UTC)'!
valueWithArguments: anArguments

	| answer className |

	answer := self decorateeAnswerFor: anArguments.
	className := anArguments at: 'className' ifAbsent: [ '' ].
	className ifNotEmpty: [ :aName |
		answer at: 'actual' put: (self actualImplementorNamesOf: (anArguments at: 'selector') asSymbol in: aName) ].

	^Json render: answer
! !

!MCPActualImplementorsDecorator methodsFor: 'implementors' stamp: 'HAW 27/Aug/2026, 7:45:00 pm (UTC)'!
actualImplementorNamesOf: aSelector in: aClassName

	^(((smalltalk actualImplementorsOf: aSelector in: (smalltalk classNamed: aClassName))
		reject: [ :eachImplementor | eachImplementor isKindOf: NotImplementedMethod ])
		collect: [ :eachImplementor | eachImplementor stringVersion ]) asArray sort

! !

!MCPActualImplementorsDecorator class methodsFor: 'decorating' stamp: 'HAW 27/Aug/2026, 7:45:00 pm (UTC)'!
decoratedToolName

	^'smalltalk_implementors_of'
! !

!MCPActualSendersDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 7:44:59 pm (UTC)'!
addedProperties

	^{ MCPPlainToolProperty
		named: 'className'
		describedBy: 'Name of the class the sends to narrow to are sent to. Defaults to every class that implements the selector'
		defaultingTo: '' }
! !

!MCPActualSendersDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 10:15:31 pm (UTC)'!
description

	^self decoratee description ,
		' The answer also carries, in actual, the ones LiveTyping saw really sending it to an object that implements it, which are the ones a refactoring of the selector has to change. A method in methods and not in actual writes the selector for something else.'
! !

!MCPActualSendersDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 9:27:15 pm (UTC)'!
valueWithArguments: anArguments

	| answer |

	answer := self decorateeAnswerFor: anArguments.
	answer at: 'actual' put: (self actualSenderNamesFrom: anArguments).

	^Json render: answer
! !

!MCPActualSendersDecorator methodsFor: 'senders' stamp: 'HAW 27/Aug/2026, 7:45:00 pm (UTC)'!
actualSenderNamesFrom: anArguments

	"Every implementor of the selector is asked who LiveTyping saw sending to it, unless a
	client named the class it cares about."

	| selector |

	selector := (anArguments at: 'selector') asSymbol.

	^((self implementorsOf: selector in: (anArguments at: 'className' ifAbsent: [ '' ]))
		inject: Set new
		into: [ :someNames :eachImplementor |
			someNames
				addAll: ((smalltalk allActualSendersOn: eachImplementor) first
					collect: [ :eachSender | eachSender stringVersion ]);
				yourself ]) asArray sort
! !

!MCPActualSendersDecorator methodsFor: 'senders' stamp: 'HAW 27/Aug/2026, 7:45:00 pm (UTC)'!
implementorsOf: aSelector in: aClassName

	^aClassName
		ifEmpty: [ (smalltalk allImplementorsOf: aSelector) collect: [ :eachReference | eachReference compiledMethod ] ]
		ifNotEmpty: [ :aName |
			(smalltalk actualImplementorsOf: aSelector in: (smalltalk classNamed: aName))
				reject: [ :eachImplementor | eachImplementor isKindOf: NotImplementedMethod ] ]
! !

!MCPActualSendersDecorator class methodsFor: 'decorating' stamp: 'HAW 27/Aug/2026, 7:44:59 pm (UTC)'!
decoratedToolName

	^'smalltalk_senders_of'
! !

!MCPMethodTypesDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 10:15:30 pm (UTC)'!
description

	^self decoratee description ,
		' The answer also carries what LiveTyping saw while the image ran: the classes the method answered, in returns, and the ones each parameter and temporary held, in variables. A method that has not run has none of either.'
! !

!MCPMethodTypesDecorator methodsFor: 'tool' stamp: 'HAW 27/Aug/2026, 9:27:34 pm (UTC)'!
valueWithArguments: anArguments

	| method answer |

	method := MCPMethodProperty newDefault valueFrom: anArguments.
	answer := self decorateeAnswerFor: anArguments.
	answer
		at: 'returns' put: (self returnTypeNamesOf: method);
		at: 'variables' put: (self variableTypeNamesOf: method).

	^Json render: answer
! !

!MCPMethodTypesDecorator methodsFor: 'types' stamp: 'HAW 27/Aug/2026, 7:07:13 pm (UTC)'!
returnTypeNamesOf: aMethod

	^(aMethod returnTypes collect: [ :eachType | eachType typeName asString ]) asArray sort
! !

!MCPMethodTypesDecorator methodsFor: 'types' stamp: 'HAW 27/Aug/2026, 7:07:13 pm (UTC)'!
variableTypeNamesOf: aMethod

	| typesByVariable |

	typesByVariable := OrderedDictionary new.
	aMethod methodVariablesTypes typesInfoDo: [ :eachTypeInfo |
		typesByVariable
			at: eachTypeInfo variableName asString
			put: ((eachTypeInfo typesNames collect: [ :eachTypeName | eachTypeName asString ]) asArray sort) ].

	^typesByVariable

! !

!MCPMethodTypesDecorator class methodsFor: 'decorating' stamp: 'HAW 27/Aug/2026, 7:07:13 pm (UTC)'!
decoratedToolName

	^'smalltalk_method_source'
! !

!MCPLiveTypingTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self typesOfInstanceVariableTool;
		addTool: self typesOfEveryInstanceVariableTool;
		addTool: self typesOfMethodVariableTool;
		addTool: self returnTypesOfMethodTool;
		addTool: self actualSendersOfTool;
		addTool: self actualImplementorsOfTool! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 25/Aug/2026, 10:37:32 am (UTC)'!
renderMethodReferences: someMethodReferences

	^Json render: ((someMethodReferences collect: [ :eachReference | eachReference stringVersion ]) asArray sort)
! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
renderTypeNames: aTypeInfo

	"Answer the names of the types a variable has held. They are what LiveTyping saw while the
	image ran, so a variable of a method that has not run yet has none."

	^Json render: ((aTypeInfo typesNames collect: [ :eachTypeName | eachTypeName asString ]) asArray sort)
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 11:06:10 am (UTC)'!
actualImplementorsOfTool

	"The class and the selector are two properties here and not a method property, because the
	class does not have to implement the selector: which classes do is what is being asked."

	^MCPPluggableTool
		named: 'smalltalk_actual_implementors_of'
		describedBy: 'List the methods that really answer a selector sent to an object of a class, which are the ones implemented by that class and by every subclass of the one highest up that implements it. The class does not have to implement the selector itself.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class the selector is sent to'.
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector that is sent' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'includingPossible' describedBy: 'Whether a class that answers the selector nowhere is listed too, saying so, true or false' defaultingTo: 'false' }
		executingWith: [ :aClass :aSelector :aPossibleAnswer |
			| implementors |
			implementors := smalltalk actualImplementorsOf: aSelector in: aClass.
			self renderMethodReferences: (aPossibleAnswer = 'true'
				ifTrue: [ implementors ]
				ifFalse: [ implementors reject: [ :eachImplementor | eachImplementor isKindOf: NotImplementedMethod ] ]) ]

! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 3:50:01 pm (UTC)'!
actualSendersOfTool

	^MCPPluggableTool
		named: 'smalltalk_actual_senders_of'
		describedBy: 'List the methods that really send a method, which are the ones LiveTyping saw sending it to an object of the class that implements it. A method that merely writes the same selector, sent to something else, is not one of them, which is what tells this apart from listing the senders of a selector.'
		properties: {
			MCPMethodProperty newDefault.
			MCPPlainToolProperty named: 'includingPossible' describedBy: 'Whether the sends LiveTyping could only guess at are listed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aPossibleAnswer |
			| sureAndPossibleSenders |
			sureAndPossibleSenders := smalltalk allActualSendersOn: aMethod.
			self renderMethodReferences: (aPossibleAnswer = 'true'
				ifTrue: [ sureAndPossibleSenders first , sureAndPossibleSenders second ]
				ifFalse: [ sureAndPossibleSenders first ]) ]
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 3:50:03 pm (UTC)'!
returnTypesOfMethodTool

	^MCPPluggableTool
		named: 'smalltalk_return_types_of_method'
		describedBy: 'List the classes a method has answered while the image ran. The name self means it answered its receiver.'
		properties: { MCPMethodProperty newDefault }
		executingWith: [ :aMethod |
			Json render: ((aMethod returnTypes collect: [ :eachType | eachType typeName asString ]) asArray sort) ]
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
typesOfEveryInstanceVariableTool

	^MCPPluggableTool
		named: 'smalltalk_types_of_instance_variables'
		describedBy: 'List, for every instance variable of a class, the classes it has held while the image ran.'
		properties: { MCPClassToolProperty named: 'className' describedBy: 'Name of the class' }
		executingWith: [ :aClass |
			| typesByVariable |
			typesByVariable := OrderedDictionary new.
			aClass instanceVariablesTypes typesInfoDo: [ :eachTypeInfo |
				typesByVariable
					at: eachTypeInfo variableName asString
					put: ((eachTypeInfo typesNames collect: [ :eachTypeName | eachTypeName asString ]) asArray sort) ].
			Json render: typesByVariable ]
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
typesOfInstanceVariableTool

	^MCPPluggableTool
		named: 'smalltalk_types_of_instance_variable'
		describedBy: 'List the classes an instance variable has held, as LiveTyping saw them while the image ran. A variable of code that has not run yet holds none.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that has the instance variable'.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the instance variable' }
		executingWith: [ :aClass :aVariableName |
			self renderTypeNames: (aClass instanceVariablesTypes
				typeInfoOf: aVariableName
				ifAbsent: [ self error: (MCPServer instanceVariableNotFoundErrorDescriptionFor: aVariableName in: aClass) ]) ]
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 26/Aug/2026, 3:50:03 pm (UTC)'!
typesOfMethodVariableTool

	^MCPPluggableTool
		named: 'smalltalk_types_of_method_variable'
		describedBy: 'List the classes a parameter or a temporary of a method has held while the image ran.'
		properties: {
			MCPMethodProperty newDefault.
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the parameter or temporary' }
		executingWith: [ :aMethod :aVariableName |
			self renderTypeNames: (aMethod
				typeInfoOfVariableNamed: aVariableName
				ifAbsent: [ self error: (self class variableNotFoundErrorDescriptionFor: aVariableName in: aMethod) ]) ]
! !

!MCPLiveTypingTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
variableNotFoundErrorDescriptionFor: aVariableName in: aCompiledMethod

	^'Variable not found: ', aVariableName, ' in ',
		aCompiledMethod methodClass name, '>>', aCompiledMethod selector
! !
