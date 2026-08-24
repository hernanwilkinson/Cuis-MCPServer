'From Cuis7.9 [latest update: #8134] on 24 August 2026 at 8:40:26 pm'!
'Description Read the types LiveTyping saw while the image ran'!
!provides: 'MCPServerLiveTyping' 1 1!
!requires: 'MCPServer' nil nil nil!
!requires: 'LiveTyping' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTyping!


!classDefinition: #MCPLiveTypingTools category: #MCPServerLiveTyping!
Object subclass: #MCPLiveTypingTools
	instanceVariableNames: 'smalltalk'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTyping'!
!classDefinition: 'MCPLiveTypingTools class' category: #MCPServerLiveTyping!
MCPLiveTypingTools class
	instanceVariableNames: ''!


!MCPLiveTypingTools commentStamp: '<historical>' prior: 0!
I am the tools that read the type information LiveTyping gathers.

Types here are what was seen and not what was declared: they are the classes a variable held, a parameter was sent or a method answered while the image ran, so code that has not run yet has none.!

!MCPLiveTypingTools methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
initializeFor: aSmalltalk

	smalltalk := aSmalltalk
! !

!MCPLiveTypingTools methodsFor: 'tools' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
tools

	^{
		self typesOfInstanceVariableTool.
		self typesOfEveryInstanceVariableTool.
		self typesOfMethodVariableTool.
		self returnTypesOfMethodTool }
! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
methodIn: aClass named: aSelector

	MCPTool assert: aSelector isImplementedBy: aClass.

	^aClass >> aSelector
! !

!MCPLiveTypingTools methodsFor: 'reading types' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
renderTypeNames: aTypeInfo

	"Answer the names of the types a variable has held. They are what LiveTyping saw while the
	image ran, so a variable of a method that has not run yet has none."

	^Json render: ((aTypeInfo typesNames collect: [ :eachTypeName | eachTypeName asString ]) asArray sort)
! !

!MCPLiveTypingTools methodsFor: 'tool creation - live typing' stamp: 'HAW 24/Aug/2026, 11:40:01 pm (UTC)'!
!methodProperties: {}!
returnTypesOfMethodTool

	^MCPPluggableTool
		named: 'smalltalk_return_types_of_method'
		describedBy: 'List the classes a method has answered while the image ran. The name self means it answered its receiver.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that implements the method'.
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector of the method' valuedWith: [ :aSelector | aSelector asSymbol ] }
		executingWith: [ :aClass :aSelector |
			Json render: (((self methodIn: aClass named: aSelector) returnTypes
				collect: [ :eachType | eachType typeName asString ]) asArray sort) ]

! !

!MCPLiveTypingTools methodsFor: 'tool creation - live typing' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
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

!MCPLiveTypingTools methodsFor: 'tool creation - live typing' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
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

!MCPLiveTypingTools methodsFor: 'tool creation - live typing' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
typesOfMethodVariableTool

	^MCPPluggableTool
		named: 'smalltalk_types_of_method_variable'
		describedBy: 'List the classes a parameter or a temporary of a method has held while the image ran.'
		properties: {
			MCPClassToolProperty named: 'className' describedBy: 'Name of the class that implements the method'.
			MCPPluggableToolProperty named: 'selector' describedBy: 'Selector of the method' valuedWith: [ :aSelector | aSelector asSymbol ].
			MCPPlainToolProperty named: 'variableName' describedBy: 'Name of the parameter or temporary' }
		executingWith: [ :aClass :aSelector :aVariableName |
			| aMethod |
			aMethod := self methodIn: aClass named: aSelector.
			self renderTypeNames: (aMethod
				typeInfoOfVariableNamed: aVariableName
				ifAbsent: [ self error: (MCPLiveTypingTools variableNotFoundErrorDescriptionFor: aVariableName in: aMethod) ]) ]
! !

!MCPLiveTypingTools class methodsFor: 'instance creation' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
for: aSmalltalk

	^self new initializeFor: aSmalltalk
! !

!MCPLiveTypingTools class methodsFor: 'initialization' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
initialize

	MCPServer addToolProvider: self
! !

!MCPLiveTypingTools class methodsFor: 'error descriptions' stamp: 'HAW 24/Aug/2026, 11:39:00 pm (UTC)'!
!methodProperties: {}!
variableNotFoundErrorDescriptionFor: aVariableName in: aCompiledMethod

	^'Variable not found: ', aVariableName, ' in ',
		aCompiledMethod methodClass name, '>>', aCompiledMethod selector
! !
MCPLiveTypingTools initialize!
