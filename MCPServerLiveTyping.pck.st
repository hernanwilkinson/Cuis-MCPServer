'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 10:04:40 am'!
'Description Give the refactoring tools the options their appliers ask for'!
!provides: 'MCPServerLiveTyping' 1 24!
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

!classDefinition: #MCPInstanceVariableTypesDecorator category: #MCPServerLiveTyping!
MCPToolDecorator subclass: #MCPInstanceVariableTypesDecorator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPInstanceVariableTypesDecorator class' category: #MCPServerLiveTyping!
MCPInstanceVariableTypesDecorator class
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

!classDefinition: #MCPMessageSend category: #MCPServerLiveTyping!
Object subclass: #MCPMessageSend
	instanceVariableNames: 'node method smalltalk incompleteTypeInfoReasons'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPMessageSend class' category: #MCPServerLiveTyping!
MCPMessageSend class
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

!MCPActualImplementorsDecorator methodsFor: 'tool' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
addedProperties

	^{ MCPPlainProperty
		named: 'className'
		describedBy: 'Name of the class the selector is sent to. Without it there is nothing to narrow, because every implementor implements it'
		defaultingTo: '' }
! !

!MCPActualImplementorsDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:08:18 am (UTC)'!
description

	^self decoratee description ,
		' Naming a class adds, in actual, the implementors in the hierarchy of that class, which are the ones a send to an object of it could really reach: the ones implemented by it and by every subclass of the one highest up among its superclasses that implements it.'! !

!MCPActualImplementorsDecorator methodsFor: 'tool' stamp: 'HAW 7/Sep/2026, 11:15:20 pm (UTC)'!
valueWithArguments: anArguments

	| answer className |

	answer := self decorateeAnswerFor: anArguments.
	className := anArguments at: MCPClassProperty defaultName ifAbsent: [ '' ].
	className ifNotEmpty: [ :aName |
		answer at: 'actual' put: (self actualImplementorNamesOf: (anArguments at: 'selector') asSymbol in: aName) ].

	^Json render: answer! !

!MCPActualImplementorsDecorator methodsFor: 'implementors' stamp: 'HAW 27/Aug/2026, 7:45:00 pm (UTC)'!
actualImplementorNamesOf: aSelector in: aClassName

	^(((smalltalk actualImplementorsOf: aSelector in: (smalltalk classNamed: aClassName))
		reject: [ :eachImplementor | eachImplementor isKindOf: NotImplementedMethod ])
		collect: [ :eachImplementor | eachImplementor stringVersion ]) asArray sort

! !

!MCPActualImplementorsDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 1:47:01 pm (UTC)'!
decoratedToolName

	^MCPSearchTools implementorsOfToolName! !

!MCPActualSendersDecorator methodsFor: 'tool' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
addedProperties

	^{ MCPPlainProperty
		named: 'className'
		describedBy: 'Name of the class the sends to narrow to are sent to. Defaults to every class that implements the selector'
		defaultingTo: '' }
! !

!MCPActualSendersDecorator methodsFor: 'tool' stamp: 'HAW 9/Sep/2026, 2:08:16 am (UTC)'!
description

	^self decoratee description ,
		' The answer also carries, in actual, the ones LiveTyping saw really sending it to an object of the class named, or of one of its subclasses; without a class, to an object of any class that implements it. They are the senders a refactoring of the selector has to change. A method in methods and not in actual writes the selector for something else.'! !

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

!MCPActualSendersDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 1:47:18 pm (UTC)'!
decoratedToolName

	^MCPSearchTools sendersOfToolName! !

!MCPInstanceVariableTypesDecorator methodsFor: 'types' stamp: 'HAW 1/Sep/2026, 7:00:10 pm (UTC)'!
instanceVariableTypeNamesOf: aClass

	"Answer the classes each instance variable of aClass has held, as LiveTyping saw them while
	the image ran. A variable of code that has not run holds none."

	^aClass instanceVariablesTypes describedTypesNamesByVariable! !

!MCPInstanceVariableTypesDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 7:01:13 pm (UTC)'!
description

	^self decoratee description ,
		' The answer also carries, in instanceVariableTypes, the classes LiveTyping saw each instance variable hold while the image ran. A variable of code that has not run holds none.',
		MCPLiveTypingTools howTypesAreListedDescription! !

!MCPInstanceVariableTypesDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 5:49:36 pm (UTC)'!
valueWithArguments: anArguments

	| definedClass answer |

	definedClass := decoratee requestedClassFrom: anArguments.
	answer := self decorateeAnswerFor: anArguments.
	answer at: 'instanceVariableTypes' put: (self instanceVariableTypeNamesOf: definedClass).

	^Json render: answer! !

!MCPInstanceVariableTypesDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 1:47:25 pm (UTC)'!
decoratedToolName

	^MCPModelStructureTools classDefinitionToolName! !

!MCPMethodTypesDecorator methodsFor: 'tool' stamp: 'HAW 1/Sep/2026, 7:01:09 pm (UTC)'!
description

	^self decoratee description ,
		' The answer also carries what LiveTyping saw while the image ran: the classes the method answered, in returns, and in variables the ones held by each parameter and temporary of it and by each instance variable of its class. A method that has not run has none of either.',
		MCPLiveTypingTools howTypesAreListedDescription! !

!MCPMethodTypesDecorator methodsFor: 'tool' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
valueWithArguments: anArguments

	| method answer |

	method := MCPMethodProperty default valueFrom: anArguments.
	answer := self decorateeAnswerFor: anArguments.
	answer
		at: 'returns' put: (self returnTypeNamesOf: method);
		at: 'variables' put: (self variableTypeNamesOf: method).

	^Json render: answer
! !

!MCPMethodTypesDecorator methodsFor: 'types' stamp: 'HAW 1/Sep/2026, 6:59:55 pm (UTC)'!
returnTypeNamesOf: aMethod

	^aMethod returnTypeInfo describedTypesNames! !

!MCPMethodTypesDecorator methodsFor: 'types' stamp: 'HAW 1/Sep/2026, 6:59:51 pm (UTC)'!
variableTypeNamesOf: aMethod

	"Answer the classes each variable a method reads held, its parameters and temporaries along
	with the instance variables of the class that implements it. They go together because a
	temporary cannot shadow an instance variable in Cuis, so a name means one variable and
	reading the method is not enough to tell which kind it is."

	| typesByVariable |

	typesByVariable := OrderedDictionary new.
	aMethod methodClass instanceVariablesTypes addDescribedTypesNamesByVariableTo: typesByVariable.
	aMethod methodVariablesTypes addDescribedTypesNamesByVariableTo: typesByVariable.

	^typesByVariable! !

!MCPMethodTypesDecorator class methodsFor: 'decorating' stamp: 'HAW 1/Sep/2026, 1:47:31 pm (UTC)'!
decoratedToolName

	^MCPModelStructureTools methodSourceToolName! !

!MCPLiveTypingTools methodsFor: 'tools' stamp: 'HAW 8/Sep/2026, 11:14:48 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self typesOfInstanceVariableTool;
		addTool: self typesOfEveryInstanceVariableTool;
		addTool: self typesOfMethodVariableTool;
		addTool: self returnTypesOfMethodTool;
		addTool: self actualSendersOfTool;
		addTool: self actualImplementorsOfTool;
		addTool: self messageSendsOfMethodTool! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 8/Sep/2026, 11:14:46 pm (UTC)'!
messageSendsOf: aMethod named: aSentSelector

	| sends |

	sends := MCPMessageSend allIn: aMethod using: smalltalk.

	^aSentSelector
		ifEmpty: [ sends ]
		ifNotEmpty: [ sends select: [ :eachSend | eachSend selector = aSentSelector asSymbol ] ]! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 25/Aug/2026, 10:37:32 am (UTC)'!
renderMethodReferences: someMethodReferences

	^Json render: ((someMethodReferences collect: [ :eachReference | eachReference stringVersion ]) asArray sort)
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:08:12 am (UTC)'!
actualImplementorsOfTool

	"The class and the selector are two properties here and not a method property, because the
	class does not have to implement the selector: which classes do is what is being asked."

	^MCPPluggableTool
		named: self class actualImplementorsOfToolName
		describedBy: 'List the implementors of a selector in the hierarchy of a class, which are the methods a send of it to an object of that class could really reach: the ones implemented by the class and by every subclass of the one highest up among its superclasses that implements it. The class does not have to implement the selector itself. What a send written in a method reaches is asked with the message sends of the method instead, because its receiver may have held classes of different hierarchies.'
		properties: {
			MCPClassProperty named: 'className' describedBy: 'Name of the class the selector is sent to'.
			MCPPluggableProperty named: 'selector' describedBy: 'Selector that is sent' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainProperty named: 'includingPossible' describedBy: 'Whether a class that answers the selector nowhere is listed too, saying so, true or false' defaultingTo: 'false' }
		executingWith: [ :aClass :aSelector :aPossibleAnswer |
			| implementors |
			implementors := smalltalk actualImplementorsOf: aSelector in: aClass.
			self renderMethodReferences: (aPossibleAnswer isTrue
				ifTrue: [ implementors ]
				ifFalse: [ implementors reject: [ :eachImplementor | eachImplementor isKindOf: NotImplementedMethod ] ]) ]! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:08:09 am (UTC)'!
actualSendersOfTool

	^MCPPluggableTool
		named: self class actualSendersOfToolName
		describedBy: 'List the methods that really send a method: the ones LiveTyping saw sending its selector to an object of the class that implements it, or of one of its subclasses, which are the senders a refactoring of the method has to change. A method that writes the same selector but was seen sending it to anything else is not one of them, which is what tells this apart from listing the senders of a selector.'
		properties: {
			MCPMethodProperty default.
			MCPPlainProperty named: 'includingPossible' describedBy: 'Whether the sends LiveTyping could only guess at, whose receiver it never saw hold anything or saw incompletely, are listed too, true or false' defaultingTo: 'false' }
		executingWith: [ :aMethod :aPossibleAnswer |
			| sureAndPossibleSenders |
			sureAndPossibleSenders := smalltalk allActualSendersOn: aMethod.
			self renderMethodReferences: (aPossibleAnswer isTrue
				ifTrue: [ sureAndPossibleSenders first , sureAndPossibleSenders second ]
				ifFalse: [ sureAndPossibleSenders first ]) ]! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 9/Sep/2026, 2:08:14 am (UTC)'!
messageSendsOfMethodTool

	^MCPPluggableTool
		named: self class messageSendsOfMethodToolName
		describedBy: 'List every message send written in a method, in the order they are written, each with the classes LiveTyping saw its receiver hold, the methods the send really reaches, and the classes the send answered. The methods reached are the implementors of the selector in the hierarchy of each class the receiver was seen holding, classes that need not share a hierarchy, because a send in source code reaches whatever its receiver turned out to be. A send to something LiveTyping never saw hold anything reaches no method here, and a send the compiler inlines, such as ifTrue:, is not listed.',
			self class howTypesAreListedDescription
		properties: {
			MCPMethodProperty default.
			MCPPlainProperty
				named: 'sentSelector'
				describedBy: 'Selector of the sends to list. Without it every send of the method is listed'
				defaultingTo: '' }
		executingWith: [ :aMethod :aSentSelector |
			Json render: ((self messageSendsOf: aMethod named: aSentSelector) collect: [ :eachSend | eachSend description ]) ]! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 1/Sep/2026, 7:00:19 pm (UTC)'!
renderTypeNames: aTypeInfo

	^Json render: aTypeInfo describedTypesNames! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 3/Sep/2026, 9:30:12 pm (UTC)'!
returnTypesOfMethodTool

	^MCPPluggableTool
		named: self class returnTypesOfMethodToolName
		describedBy: 'List the classes a method has answered while the image ran. The name self means it answered its receiver.',
			self class howTypesAreListedDescription
		properties: { MCPMethodProperty default }
		executingWith: [ :aMethod | self renderTypeNames: aMethod returnTypeInfo ]! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:15:20 pm (UTC)'!
typesOfEveryInstanceVariableTool

	^MCPPluggableTool
		named: self class typesOfEveryInstanceVariableToolName
		describedBy: 'List, for every instance variable of a class, the classes it has held while the image ran.',
			self class howTypesAreListedDescription
		properties: { MCPClassProperty default }
		executingWith: [ :aClass |
			Json render: aClass instanceVariablesTypes describedTypesNamesByVariable ]! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:19:16 pm (UTC)'!
typesOfInstanceVariableTool

	^MCPPluggableTool
		named: self class typesOfInstanceVariableToolName
		describedBy: 'List the classes an instance variable has held, as LiveTyping saw them while the image ran. A variable of code that has not run yet holds none.',
			self class howTypesAreListedDescription
		properties: { MCPInstanceVariableProperty default }
		executingWith: [ :aClass :aVariableName |
			self renderTypeNames: (aClass instanceVariablesTypes
				typeInfoOf: aVariableName
				ifAbsent: [ self error: (MCPServer instanceVariableNotFoundErrorDescriptionFor: aVariableName in: aClass) ]) ]! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
typesOfMethodVariableTool

	^MCPPluggableTool
		named: self class typesOfMethodVariableToolName
		describedBy: 'List the classes a parameter or a temporary of a method has held while the image ran.',
			self class howTypesAreListedDescription
		properties: {
			MCPMethodProperty default.
			MCPPlainProperty named: 'variableName' describedBy: 'Name of the parameter or temporary' }
		executingWith: [ :aMethod :aVariableName |
			self renderTypeNames: (aMethod
				typeInfoOfVariableNamed: aVariableName
				ifAbsent: [ self error: (self class variableNotFoundErrorDescriptionFor: aVariableName in: aMethod) ]) ]! !

!MCPLiveTypingTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
variableNotFoundErrorDescriptionFor: aVariableName in: aCompiledMethod

	^'Variable not found: ', aVariableName, ' in ',
		aCompiledMethod methodClass name, '>>', aCompiledMethod selector
! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
actualImplementorsOfToolName

	^'smalltalk_actual_implementors_of'! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
actualSendersOfToolName

	^'smalltalk_actual_senders_of'! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 8/Sep/2026, 11:14:42 pm (UTC)'!
messageSendsOfMethodToolName

	^'smalltalk_message_sends_of_method'! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:18 pm (UTC)'!
returnTypesOfMethodToolName

	^'smalltalk_return_types_of_method'! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
typesOfEveryInstanceVariableToolName

	^'smalltalk_types_of_instance_variables'! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
typesOfInstanceVariableToolName

	^'smalltalk_types_of_instance_variable'! !

!MCPLiveTypingTools class methodsFor: 'tool names' stamp: 'HAW 1/Sep/2026, 1:26:30 pm (UTC)'!
typesOfMethodVariableToolName

	^'smalltalk_types_of_method_variable'! !

!MCPLiveTypingTools class methodsFor: 'descriptions' stamp: 'HAW 1/Sep/2026, 7:00:38 pm (UTC)'!
howTypesAreListedDescription

	"Answer how a client reads a list of types, which every tool and decorator that answers one
	says, so that the marks in it are not read as classes."

	^' A list of types is led by the class they all inherit from, or by ', VariableTypeInfo anyTypeMark,
		' when the only one they share is Object, and ends with ', VariableTypeInfo canBeNilMark,
		' when nil was assigned too. A capitalized name is a class and a lowercase one is a mark. A variable that held a single class is listed as that class alone.'! !

!MCPMessageSend methodsFor: 'initialization' stamp: 'HAW 8/Sep/2026, 11:14:22 pm (UTC)'!
initializeOf: aMessageNode in: aCompiledMethod using: aSmalltalk

	node := aMessageNode.
	method := aCompiledMethod.
	smalltalk := aSmalltalk.
	incompleteTypeInfoReasons := Set new! !

!MCPMessageSend methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:14:26 pm (UTC)'!
receiverSource

	^String streamContents: [ :aStream | node receiverOrCascadeReceiver printOn: aStream indent: 0 ]! !

!MCPMessageSend methodsFor: 'accessing' stamp: 'HAW 8/Sep/2026, 11:14:24 pm (UTC)'!
selector

	^node selector key! !

!MCPMessageSend methodsFor: 'types' stamp: 'HAW 8/Sep/2026, 11:14:32 pm (UTC)'!
implementorsFor: someReceiverTypes

	^(someReceiverTypes inject: Set new into: [ :someImplementors :eachType |
		someImplementors
			addAll: (smalltalk actualImplementorsOf: self selector in: eachType);
			yourself ])
		reject: [ :eachImplementor | eachImplementor isKindOf: NotImplementedMethod ]! !

!MCPMessageSend methodsFor: 'types' stamp: 'HAW 8/Sep/2026, 11:14:28 pm (UTC)'!
receiverTypes

	^node receiverTypesIn: method addingIncompleteTypeInfoTo: incompleteTypeInfoReasons! !

!MCPMessageSend methodsFor: 'types' stamp: 'HAW 8/Sep/2026, 11:14:30 pm (UTC)'!
returnTypes

	^node typesIn: method addingIncompleteTypeInfoTo: incompleteTypeInfoReasons! !

!MCPMessageSend methodsFor: 'describing' stamp: 'HAW 8/Sep/2026, 11:14:34 pm (UTC)'!
description

	| receiverTypes |

	receiverTypes := self receiverTypes.

	^OrderedDictionary new
		at: 'selector' put: self selector asString;
		at: 'receiver' put: self receiverSource;
		at: 'receiverTypes' put: (VariableTypeInfo describedTypesNamesOf: receiverTypes);
		at: 'implementors' put: (self namesOf: (self implementorsFor: receiverTypes));
		at: 'returnTypes' put: (VariableTypeInfo describedTypesNamesOf: self returnTypes);
		at: 'incompleteTypeInfo' put: self incompleteTypeInfoDescriptions;
		yourself! !

!MCPMessageSend methodsFor: 'describing' stamp: 'HAW 8/Sep/2026, 11:14:39 pm (UTC)'!
incompleteTypeInfoDescriptions

	^(incompleteTypeInfoReasons collect: [ :eachReason | eachReason reasonDescription ]) asArray sort! !

!MCPMessageSend methodsFor: 'describing' stamp: 'HAW 8/Sep/2026, 11:14:36 pm (UTC)'!
namesOf: someMethodReferences

	^(someMethodReferences collect: [ :eachReference | eachReference stringVersion ]) asArray sort! !

!MCPMessageSend class methodsFor: 'instance creation' stamp: 'HAW 8/Sep/2026, 11:14:13 pm (UTC)'!
allIn: aCompiledMethod using: aSmalltalk

	| methodNode |

	methodNode := aCompiledMethod methodNode.

	^(self sendNodesOf: methodNode inSourceOrder: methodNode)
		collect: [ :eachNode | self of: eachNode in: aCompiledMethod using: aSmalltalk ]! !

!MCPMessageSend class methodsFor: 'instance creation' stamp: 'HAW 8/Sep/2026, 11:14:11 pm (UTC)'!
of: aMessageNode in: aCompiledMethod using: aSmalltalk

	^self new initializeOf: aMessageNode in: aCompiledMethod using: aSmalltalk! !

!MCPMessageSend class methodsFor: 'instance creation - private' stamp: 'HAW 8/Sep/2026, 11:14:18 pm (UTC)'!
isASend: aParseNode

	^aParseNode isMessageNode and: [ aParseNode isOptimized not ]! !

!MCPMessageSend class methodsFor: 'instance creation - private' stamp: 'HAW 8/Sep/2026, 11:14:15 pm (UTC)'!
sendNodesOf: aMethodNode inSourceOrder: aMethodNodeWithRanges

	| sendNodes |

	sendNodes := OrderedCollection new.
	aMethodNode nodesDo: [ :eachNode | (self isASend: eachNode) ifTrue: [ sendNodes add: eachNode ] ].

	^sendNodes asArray sort: [ :aSendNode :anotherSendNode |
		(self startOf: aSendNode in: aMethodNodeWithRanges) <= (self startOf: anotherSendNode in: aMethodNodeWithRanges) ]! !

!MCPMessageSend class methodsFor: 'instance creation - private' stamp: 'HAW 8/Sep/2026, 11:14:20 pm (UTC)'!
startOf: aSendNode in: aMethodNode

	^(aMethodNode rangeForNode: aSendNode ifAbsent: [ 0 to: 0 ]) first! !

!VariableTypeInfo methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:58:50 pm (UTC)'!
commonSupertypeName

	^self
		withCommonSupertypeDo: [ :aCommonSupertype | aCommonSupertype typeName asString ]
		ifGeneric: [ :aGenericSupertype | self class anyTypeMark ]! !

!VariableTypeInfo methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:58:40 pm (UTC)'!
describedTypesNames

	"Answer my types the way they are printed, as a list: led by the name of the one they all
	inherit from, or by any when they share none, and closed by can be nil when nil was one of
	them. A class name is capitalized and a mark is not, so one is told from the other."

	| describedNames typesNames |

	typesNames := self typesNamesWithoutNil.
	describedNames := OrderedCollection new.
	typesNames size > 1 ifTrue: [ describedNames add: self commonSupertypeName ].
	describedNames addAll: typesNames.
	self includesNil ifTrue: [ describedNames add: self class canBeNilMark ].

	^describedNames asArray! !

!VariableTypeInfo methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:58:46 pm (UTC)'!
typesNamesWithoutNil

	"Answer the names of my types leaving nil out, because that nil was assigned is said by a
	mark of its own and not by naming the class of nil among the classes a variable held."

	^((self types reject: [ :eachType | eachType = UndefinedObject ])
		collect: [ :eachType | eachType typeName asString ]) asArray sort! !

!VariableTypeInfo class methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:58:55 pm (UTC)'!
anyTypeMark

	"Answer what leads a list of types that share no supertype other than Object."

	^'any'! !

!VariableTypeInfo class methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:58:59 pm (UTC)'!
canBeNilMark

	"Answer what closes a list of types when nil was assigned too."

	^'can be nil'! !

!VariableTypeInfo class methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 8/Sep/2026, 11:14:40 pm (UTC)'!
describedTypesNamesOf: someTypes

	^(self new initializeRawTypes: someTypes asArray) describedTypesNames! !

!VariablesTypes methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:59:05 pm (UTC)'!
addDescribedTypesNamesByVariableTo: aDictionaryOfTypesNamesByVariable

	self typesInfoDo: [ :eachTypeInfo |
		aDictionaryOfTypesNamesByVariable
			at: eachTypeInfo variableName asString
			put: eachTypeInfo describedTypesNames ].

	^aDictionaryOfTypesNamesByVariable! !

!VariablesTypes methodsFor: '*MCPServerLiveTyping' stamp: 'HAW 1/Sep/2026, 6:59:10 pm (UTC)'!
describedTypesNamesByVariable

	^self addDescribedTypesNamesByVariableTo: OrderedDictionary new! !
