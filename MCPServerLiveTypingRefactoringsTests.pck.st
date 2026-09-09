'From Cuis7.9 [latest update: #8160] on 9 September 2026 at 3:28:29 pm'!
'Description Answer a refactoring warning and go on through the accepted ones'!
!provides: 'MCPServerLiveTypingRefactoringsTests' 1 16!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerLiveTypingRefactoringsTests!


!classDefinition: #MCPLiveTypingRefactoringToolsTest category: #MCPServerLiveTypingRefactoringsTests!
MCPToolsTest subclass: #MCPLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerLiveTypingRefactoringsTests'!
!classDefinition: 'MCPLiveTypingRefactoringToolsTest class' category: #MCPServerLiveTypingRefactoringsTests!
MCPLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 7/Sep/2026, 9:49:30 pm (UTC)'!
setUp

	super setUp.
	probeClass := Object subclass: #MCPLiveTypingRefactoringProbe
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData! !

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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:09:38 am (UTC)'!
testARefactoringToolSaysTheActualScopeIsOneOfTheValuesItTakes

	"A client reads the scopes it may send from what the scope says about itself, so the ones
	LiveTyping makes possible have to be said there and not only in these tests."

	| properties scopeDescription |

	properties := ((self toolNamed: MCPRefactoringTools renameSelectorRefactoringToolName) definition
		at: 'inputSchema') at: 'properties'.
	scopeDescription := (properties at: MCPRefactoringToolGroup scopePropertyName) at: 'description'.

	self assert: (scopeDescription includesSubstring: MCPActualScopeRefactoringDecorator actualScopeName caseSensitive: true).
	self assert: (scopeDescription includesSubstring: MCPActualScopeRefactoringDecorator actualAndPossibleScopeName caseSensitive: true).
	self deny: (properties includesKey: 'keepingPossibleSends')! !

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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 2:09:55 am (UTC)'!
testARefactoringToolWorksOverTheActualScopeWhenNoneIsNamed

	self compileTheProbeAndItsCaller.

	(self toolNamed: MCPRefactoringTools renameSelectorRefactoringToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpProbe';
			at: 'newSelector' put: 'mcpRenamed';
			yourself).

	self assert: (self sourceOfTheCaller includesSubstring: 'self mcpRenamed' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'anythingElse mcpProbe' caseSensitive: true)! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 6:20:01 pm (UTC)'!
testARefactoringWarningInTheActualScopeIsAnsweredInsteadOfApplying

	| childClass |

	childClass := probeClass subclass: #MCPLiveTypingRefactoringProbeChild
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData.
	probeClass compile: 'mcpRenamed

	^42' classified: 'probing'.
	childClass compile: 'mcpProbe

	^42' classified: 'probing'.

	self
		assert: (self apply: MCPRefactoringTools renameSelectorRefactoringToolName inActualScopeWith: (Dictionary new
			at: 'className' put: childClass name;
			at: 'selector' put: 'mcpProbe';
			at: 'newSelector' put: 'mcpRenamed';
			yourself))
		equals: (MCPRefactoringTool notAppliedDescriptionFor: (ChangeSelectorKeepingParameters
			warningMessageForImplementationOf: 'mcpRenamed' asSymbol
			in: childClass
			willOverrideImplementationIn: probeClass)).
	self assert: (childClass includesSelector: 'mcpProbe' asSymbol)! !

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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:23:46 pm (UTC)'!
testInliningANamedSendInlinesThatSendAloneWhenNoScopeIsNamed

	self compileTheProbeAndItsCaller.
	probeClass compile: 'mcpOtherCaller

	^self mcpProbe' classified: 'probing'.

	(self toolNamed: MCPRefactoringTools inlineMethodRefactoringToolName)
		valueWithArguments: (Dictionary new
			at: 'className' put: probeClass name;
			at: 'selector' put: 'mcpProbe';
			at: MCPRefactoringTools senderClassPropertyName put: probeClass name;
			at: MCPRefactoringTools senderSelectorPropertyName put: 'mcpOtherCaller';
			at: 'text' put: 'mcpProbe';
			yourself).

	self assert: ((probeClass sourceCodeAt: #mcpOtherCaller) includesSubstring: '^42' caseSensitive: true).
	self assert: (self sourceOfTheCaller includesSubstring: 'self mcpProbe' caseSensitive: true)! !

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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 9/Sep/2026, 1:23:43 pm (UTC)'!
testInliningTakesTheActualScopeThroughTheToolThatWorksOverAScope

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

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:49:59 pm (UTC)'!
toolDecoratorClasses

	^{
		MCPRenameSelectorInActualScopeDecorator.
		MCPChangeKeywordsOrderInActualScopeDecorator.
		MCPAddParameterInActualScopeDecorator.
		MCPRemoveParameterInActualScopeDecorator.
		MCPExtractAsParameterInActualScopeDecorator.
		MCPInlineMethodInActualScopeDecorator }! !

!MCPLiveTypingRefactoringToolsTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:49:57 pm (UTC)'!
toolGroupClasses

	^{ MCPRefactoringTools }! !

!MCPLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 24/Aug/2026, 11:45:21 pm (UTC)'!
classCategoryOfTestData

	^'__MCPLiveTypingRefactoringTestData__'
! !

!MCPLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 7/Sep/2026, 10:27:20 pm (UTC)'!
classNamePrefixOfTestData

	^'MCPLiveTypingRefactoring'! !
