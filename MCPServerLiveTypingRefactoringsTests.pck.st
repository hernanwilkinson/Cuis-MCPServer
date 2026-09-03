'From Cuis7.9 [latest update: #8149] on 3 September 2026 at 7:21:23 pm'!
'Description Let a tool property answer its own default'!
!provides: 'MCPServerLiveTypingRefactoringsTests' 1 11!
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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 2/Sep/2026, 8:54:38 pm (UTC)'!
apply: aToolName inActualScopeWith: anArguments

	"Ask the tool that applies the refactoring over the scope it is told for the actual one,
	which is how a client reaches the refactoring LiveTyping makes possible now that it is
	not offered under a name of its own."

	anArguments
		at: MCPRefactoringToolGroup scopePropertyName
		put: MCPActualScopeRefactoringDecorator actualScopeName.

	^(self toolNamed: aToolName) valueWithArguments: anArguments! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 3:39:58 pm (UTC)'!
compileTheProbeAndItsCaller

	"The caller sends the probe to itself, which LiveTyping sees while it runs, and to a
	variable that never holds anything, which it never sees being a send to this class."

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	| anythingElse |

	self mcpProbe.
	false ifTrue: [ anythingElse mcpProbe ]' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
probeClass

	^probeClass
! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 3:40:21 pm (UTC)'!
renameTheProbeWithin: aScopeName

	"Rename through the tool that works over a scope, which is the one the decorator wraps."

	^(self toolNamed: MCPRefactoringTools renameSelectorRefactoringToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpProbe';
			at: 'newSelector' put: 'mcpRenamed';
			at: MCPRefactoringToolGroup scopePropertyName put: aScopeName;
			yourself)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 3:40:15 pm (UTC)'!
sourceOfTheCaller

	^probeClass sourceCodeAt: #mcpCaller! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 10:54:23 am (UTC)'!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 8:54:38 pm (UTC)'!
testARefactoringToolSaysTheActualScopeIsOneOfTheValuesItTakes

	"A client reads the scopes it may send from what the scope says about itself, so the one
	LiveTyping makes possible has to be said there and not only in these tests."

	| properties |

	properties := ((self toolNamed: MCPRefactoringTools renameSelectorRefactoringToolName) definition
		at: 'inputSchema') at: 'properties'.

	self assert: (((properties at: MCPRefactoringToolGroup scopePropertyName) at: 'description')
		includesSubstring: MCPActualScopeRefactoringDecorator actualScopeName caseSensitive: true).
	self assert: (properties includesKey: 'keepingPossibleSends')! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 8:54:38 pm (UTC)'!
testARefactoringToolTakesTheActualScope

	"The send inside the ifTrue: is to a variable LiveTyping never saw hold anything, so it is
	not a send to this class and the actual scope leaves it as it was."

	self compileTheProbeAndItsCaller.

	self renameTheProbeWithin: MCPActualScopeRefactoringDecorator actualScopeName.

	self assert: (self sourceOfTheCaller includesSubstring: 'self mcpRenamed' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'anythingElse mcpProbe' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 3:40:34 pm (UTC)'!
testARefactoringToolWithAnyOtherScopeIsStillTheOneItDecorates

	"Renaming over the class changes every send written in it, the one LiveTyping never saw
	included, which is the difference the actual scope makes."

	self compileTheProbeAndItsCaller.

	self renameTheProbeWithin: 'class'.

	self assert: (self sourceOfTheCaller includesSubstring: 'self mcpRenamed' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'anythingElse mcpRenamed' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 6:44:02 pm (UTC)'!
testAddingAParameterInTheActualScopeGivesTheSendsItSawTheValue

	probeClass compile: 'mcpProbe

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	^self mcpProbe' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	self apply: MCPRefactoringTools addParameterRefactoringToolName inActualScopeWith: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbe';
		at: 'parameterName' put: 'anArgument';
		at: 'parameterValue' put: '7';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpProbe:' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpProbe: 7' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 3/Sep/2026, 8:26:38 pm (UTC)'!
testAskingForTheActualScopeWithoutNamingAClassSaysWhichScopeNeedsIt

	"The tool works over scopes that need no class, so the one a client leaves out is not a
	class that was not found: it is the one the actual scope asked for."

	| renameTool arguments |

	renameTool := self toolNamed: MCPRefactoringTools renameSelectorRefactoringToolName.
	arguments := Dictionary new
		at: 'selector' put: 'mcpProbe';
		at: 'newSelector' put: 'mcpRenamed';
		at: MCPRefactoringToolGroup scopePropertyName put: MCPActualScopeRefactoringDecorator actualScopeName;
		yourself.

	self
		should: [ renameTool valueWithArguments: arguments ]
		raise: Error
		withMessageText: MCPActualScopeRefactoringDecorator classNameNeededForTheActualScopeErrorDescription! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 6:44:27 pm (UTC)'!
testExtractingAsAParameterInTheActualScopeLeavesASendToAnythingElseAlone

	"Every sender the actual scope takes in is given the value to pass; the send to a variable
	LiveTyping never saw hold anything is not one of them and is left as it was."

	self compileTheProbeAndItsCaller.

	self apply: MCPRefactoringTools extractAsParameterRefactoringToolName inActualScopeWith: (Dictionary new
		at: 'className' put: probeClass name;
		at: 'selector' put: 'mcpProbe';
		at: 'parameterName' put: 'aNumber';
		at: 'text' put: '42';
		yourself).

	self assert: (probeClass includesSelector: #mcpProbe:).
	self assert: (self sourceOfTheCaller includesSubstring: 'self mcpProbe: 42' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'anythingElse mcpProbe' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 6:44:34 pm (UTC)'!
testInliningInTheActualScopeReplacesEverySendItSawAndNoOther

	"Inlining without LiveTyping is told the one send to replace; the actual scope replaces
	every send it saw really reaching an object of the class, and leaves the send to a variable
	it never saw hold anything as it was."

	self compileTheProbeAndItsCaller.

	self apply: MCPRefactoringTools inlineMethodRefactoringToolName inActualScopeWith: (Dictionary new
		at: 'className' put: probeClass name;
		at: 'selector' put: 'mcpProbe';
		at: 'removeMethod' put: 'true';
		yourself).

	self deny: (probeClass includesSelector: #mcpProbe:).
	self deny: (self sourceOfTheCaller includesSubstring: 'self mcpProbe' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'anythingElse mcpProbe' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 8:54:38 pm (UTC)'!
testInliningTakesTheActualScopeThroughTheToolThatWorksOverOneSend

	"The tool that inlines is told which send to replace and knows no scope of its own, so the
	actual scope is what the decorator adds to it, and it needs none of the sender arguments."

	self compileTheProbeAndItsCaller.

	(self toolNamed: MCPRefactoringTools inlineMethodRefactoringToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpProbe';
			at: MCPRefactoringToolGroup scopePropertyName put: MCPActualScopeRefactoringDecorator actualScopeName;
			yourself).

	self deny: (self sourceOfTheCaller includesSubstring: 'self mcpProbe' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'anythingElse mcpProbe' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 6:44:42 pm (UTC)'!
testRemovingAParameterInTheActualScopeChangesTheSendsItSaw

	probeClass compile: 'mcpProbeWith: anArgument

	^42' classified: 'probing'.
	probeClass compile: 'mcpCaller

	^self mcpProbeWith: 7' classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller.

	self apply: MCPRefactoringTools removeParameterRefactoringToolName inActualScopeWith: (Dictionary new
		at: 'className' put: 'MCPLiveTypingRefactoringProbe';
		at: 'selector' put: 'mcpProbeWith:';
		at: 'parameterName' put: 'anArgument';
		yourself).

	self assert: (self probeClass includesSelector: 'mcpProbeWith' asSymbol).
	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'self mcpProbeWith' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 2/Sep/2026, 6:44:09 pm (UTC)'!
testRenamingInTheActualScopeAnswersTheMethodsItChanged

	"The new implementor and the method that really sends it are the ones that are still there,
	and the one the rename left behind is named as removed. The send it left alone is in a
	method it changed, so the method is named once."

	self compileTheProbeAndItsCaller.

	self
		assert: (self apply: MCPRefactoringTools renameSelectorRefactoringToolName inActualScopeWith: (Dictionary new
			at: 'className' put: 'MCPLiveTypingRefactoringProbe';
			at: 'selector' put: 'mcpProbe';
			at: 'newSelector' put: 'mcpRenamed';
			yourself))
		equals: 'Refactoring applied. 2 methods changed:
MCPLiveTypingRefactoringProbe>>#mcpCaller
MCPLiveTypingRefactoringProbe>>#mcpRenamed
1 method removed:
MCPLiveTypingRefactoringProbe>>#mcpProbe'! !

!MCPLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
classCategoryOfTestData

	^'__MCPLiveTypingRefactoringTestData__'
! !
