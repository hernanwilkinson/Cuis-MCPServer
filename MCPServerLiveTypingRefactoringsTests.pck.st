'From Cuis7.9 [latest update: #8134] on 26 August 2026 at 12:46:46 pm'!
'Description Answer the changes a refactoring made'!
!provides: 'MCPServerLiveTypingRefactoringsTests' 1 3!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingRefactoringsTests!


!classDefinition: #MCPLiveTypingRefactoringToolsTest category: #MCPServerLiveTypingRefactoringsTests!
DynamicallyCodeCreationTest subclass: #MCPLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactoringsTests'!
!classDefinition: 'MCPLiveTypingRefactoringToolsTest class' category: #MCPServerLiveTypingRefactoringsTests!
MCPLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
setUp

	super setUp.
	classCategories add: self classCategoryOfTestData.
	probeClass := Object subclass: #MCPLiveTypingRefactoringProbe
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
probeClass

	^probeClass
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:54:23 am (UTC)'!
!methodProperties: {}!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
testAddingAParameterInTheActualScopeGivesTheSendsItSawTheValue

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	^self mcpProbe' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	(self toolNamed: 'smalltalk_refactor_add_parameter_in_actual_scope') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbe';
		at: 'parameterName' put: 'anArgument';
		at: 'parameterValue' put: '7';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpProbe:' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpProbe: 7' caseSensitive: true)
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
testRemovingAParameterInTheActualScopeChangesTheSendsItSaw

	probeClass compile: 'mcpProbeWith: anArgument

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	^self mcpProbeWith: 7' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	(self toolNamed: 'smalltalk_refactor_remove_parameter_in_actual_scope') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbeWith:';
		at: 'parameterName' put: 'anArgument';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpProbeWith' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpProbeWith' caseSensitive: true)
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 5:02:55 pm (UTC)'!
!methodProperties: {}!
testRenamingInTheActualScopeAnswersTheMethodsItChanged

	"The old implementor, the new one and the method that really sends it are the changes it
	made. The send it left alone is in a method it changed, so the method is named once."

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	| anythingElse |

	self mcpProbe.
	false ifTrue: [ anythingElse mcpProbe ]' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	self
		assert: ((self toolNamed: 'smalltalk_refactor_rename_selector_in_actual_scope') valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPLiveTypingRefactoringProbe';
			at: 'selector' put: 'mcpProbe';
			at: 'newSelector' put: 'mcpRenamed';
			yourself))
		equals: 'Refactoring applied. 3 methods changed:
MCPLiveTypingRefactoringProbe>>mcpCaller
MCPLiveTypingRefactoringProbe>>mcpProbe
MCPLiveTypingRefactoringProbe>>mcpRenamed'
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
testRenamingInTheActualScopeLeavesASendToAnythingElseAlone

	"The send inside the ifTrue: is to a variable LiveTyping never saw hold anything, so it is
	a send of the same name that is not a send to this class, and it is left as it was."

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	| anythingElse |

	self mcpProbe.
	false ifTrue: [ anythingElse mcpProbe ]' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	(self toolNamed: 'smalltalk_refactor_rename_selector_in_actual_scope') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbe';
		at: 'newSelector' put: 'mcpRenamed';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpRenamed' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpRenamed' caseSensitive: true).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'anythingElse mcpProbe' caseSensitive: true)
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: #('smalltalk_refactor_rename_selector_in_actual_scope'
			'smalltalk_refactor_change_keywords_order_in_actual_scope'
			'smalltalk_refactor_remove_parameter_in_actual_scope'
			'smalltalk_refactor_add_parameter_in_actual_scope'))

! !

!MCPLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	^'__MCPLiveTypingRefactoringTestData__'
! !
