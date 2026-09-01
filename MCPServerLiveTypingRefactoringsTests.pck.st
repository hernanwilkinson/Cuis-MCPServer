'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 10:44:35 am'!
'Description Let a class method say the name of each tool'!
!provides: 'MCPServerLiveTypingRefactoringsTests' 1 8!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingRefactoringsTests!


!classDefinition: #MCPLiveTypingRefactoringToolsTest category: #MCPServerLiveTypingRefactoringsTests!
DynamicallyCodeCreatingTest subclass: #MCPLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactoringsTests'!
!classDefinition: 'MCPLiveTypingRefactoringToolsTest class' category: #MCPServerLiveTypingRefactoringsTests!
MCPLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
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
probeClass

	^probeClass
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:54:23 am (UTC)'!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:13 pm (UTC)'!
testAddingAParameterInTheActualScopeGivesTheSendsItSawTheValue

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	^self mcpProbe' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	(self toolNamed: MCPLiveTypingRefactoringTools addParameterInActualScopeToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbe';
		at: 'parameterName' put: 'anArgument';
		at: 'parameterValue' put: '7';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpProbe:' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpProbe: 7' caseSensitive: true)
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:13 pm (UTC)'!
testRemovingAParameterInTheActualScopeChangesTheSendsItSaw

	probeClass compile: 'mcpProbeWith: anArgument

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	^self mcpProbeWith: 7' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	(self toolNamed: MCPLiveTypingRefactoringTools removeParameterInActualScopeToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbeWith:';
		at: 'parameterName' put: 'anArgument';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpProbeWith' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpProbeWith' caseSensitive: true)
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:01 pm (UTC)'!
testRenamingInTheActualScopeAnswersTheMethodsItChanged

	"The new implementor and the method that really sends it are the ones that are still there,
	and the one the rename left behind is named as removed. The send it left alone is in a
	method it changed, so the method is named once."

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	| anythingElse |

	self mcpProbe.
	false ifTrue: [ anythingElse mcpProbe ]' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	self
		assert: ((self toolNamed: MCPLiveTypingRefactoringTools renameSelectorInActualScopeToolName) valueWithArguments: (Dictionary new
			at: 'className' put: 'MCPLiveTypingRefactoringProbe';
			at: 'selector' put: 'mcpProbe';
			at: 'newSelector' put: 'mcpRenamed';
			yourself))
		equals: 'Refactoring applied. 2 methods changed:
MCPLiveTypingRefactoringProbe>>#mcpCaller
MCPLiveTypingRefactoringProbe>>#mcpRenamed
1 method removed:
MCPLiveTypingRefactoringProbe>>#mcpProbe'
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:28:13 pm (UTC)'!
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

	(self toolNamed: MCPLiveTypingRefactoringTools renameSelectorInActualScopeToolName) valueWithArguments: (Dictionary new
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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:35:26 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includesAllOf: {
			MCPLiveTypingRefactoringTools renameSelectorInActualScopeToolName.
			MCPLiveTypingRefactoringTools changeKeywordsOrderInActualScopeToolName.
			MCPLiveTypingRefactoringTools removeParameterInActualScopeToolName.
			MCPLiveTypingRefactoringTools addParameterInActualScopeToolName })! !

!MCPLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
classCategoryOfTestData

	^'__MCPLiveTypingRefactoringTestData__'
! !
