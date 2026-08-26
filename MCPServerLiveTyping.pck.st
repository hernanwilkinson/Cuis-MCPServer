'From Cuis7.9 [latest update: #8134] on 26 August 2026 at 12:51:04 pm'!
'Description Report the source a refactoring really saved'!
!provides: 'MCPServerLiveTyping' 1 6!
!requires: 'MCPServer' nil nil nil!
!requires: 'LiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTyping!


!classDefinition: #MCPLiveTypingTools category: #MCPServerLiveTyping!
MCPToolGroup subclass: #MCPLiveTypingTools
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPLiveTypingTools class' category: #MCPServerLiveTyping!
MCPLiveTypingTools class
	instanceVariableNames: ''!


!MCPLiveTypingTools commentStamp: '<historical>' prior: 0!
I am the tools that read the type information LiveTyping gathers.

Types here are what was seen and not what was declared: they are the classes a variable held, a parameter was sent or a method answered while the image ran, so code that has not run yet has none.!

!MCPLiveTypingTools methodsFor: 'tools' stamp: 'HAW 25/Aug/2026, 12:14:39 pm (UTC)'!
!methodProperties: {}!
addToolsTo: anMCPServer

	anMCPServer
		addTool: self typesOfInstanceVariableTool;
		addTool: self typesOfEveryInstanceVariableTool;
		addTool: self typesOfMethodVariableTool;
		addTool: self returnTypesOfMethodTool;
		addTool: self actualSendersOfTool;
		addTool: self actualImplementorsOfTool! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 25/Aug/2026, 10:37:32 am (UTC)'!
!methodProperties: {}!
renderMethodReferences: someMethodReferences

	^Json render: ((someMethodReferences collect: [ :eachReference | eachReference stringVersion ]) asArray sort)
! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
renderTypeNames: aTypeInfo

	"Answer the names of the types a variable has held. They are what LiveTyping saw while the
	image ran, so a variable of a method that has not run yet has none."

	^Json render: ((aTypeInfo typesNames collect: [ :eachTypeName | eachTypeName asString ]) asArray sort)
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 25/Aug/2026, 11:06:10 am (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
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
!methodProperties: {}!
returnTypesOfMethodTool

	^MCPPluggableTool
		named: 'smalltalk_return_types_of_method'
		describedBy: 'List the classes a method has answered while the image ran. The name self means it answered its receiver.'
		properties: { MCPMethodProperty newDefault }
		executingWith: [ :aMethod |
			Json render: ((aMethod returnTypes collect: [ :eachType | eachType typeName asString ]) asArray sort) ]
! !

!MCPLiveTypingTools methodsFor: 'tool creation' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
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
!methodProperties: {}!
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
!methodProperties: {}!
variableNotFoundErrorDescriptionFor: aVariableName in: aCompiledMethod

	^'Variable not found: ', aVariableName, ' in ',
		aCompiledMethod methodClass name, '>>', aCompiledMethod selector
! !
