'From Cuis7.9 [latest update: #8149] on 1 September 2026 at 10:45:24 am'!
'Description Let a class method say the name of each tool'!
!provides: 'MCPServerExtraLiveTypingRefactoringsTests' 1 6!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraLiveTypingRefactoringsTests!


!classDefinition: #MCPExtraLiveTypingRefactoringToolsTest category: #MCPServerExtraLiveTypingRefactoringsTests!
DynamicallyCodeCreatingTest subclass: #MCPExtraLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactoringsTests'!
!classDefinition: 'MCPExtraLiveTypingRefactoringToolsTest class' category: #MCPServerExtraLiveTypingRefactoringsTests!
MCPExtraLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
setUp

	super setUp.
	classCategories add: self classCategoryOfTestData.
	probeClass := Object subclass: #MCPExtraLiveTypingRefactoringProbe
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self classCategoryOfTestData
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
compileProbeSending: aCallerSource

	probeClass compile: 'mcpFirst: aFirst second: aSecond

	^aFirst' classified: 'probing'.
	probeClass compile: aCallerSource classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 1/Sep/2026, 1:27:48 pm (UTC)'!
gatherFirstParameterOf: aSelector

	^(self toolNamed: MCPExtraLiveTypingRefactoringTools extractParameterObjectInActualScopeToolName) valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraLiveTypingRefactoringProbe';
		at: 'selector' put: aSelector;
		at: 'newClassName' put: 'MCPExtraLiveTypingRefactoringParameters';
		at: 'parameterNames' put: 'aFirst';
		yourself)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
parameterObjectClass

	^Smalltalk classNamed: 'MCPExtraLiveTypingRefactoringParameters'
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
probeClass

	^probeClass
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 26/Aug/2026, 7:37:02 pm (UTC)'!
testGatheringParametersInTheActualScopeAnswersTheMethodsItChanged

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self
		assert: (self gatherFirstParameterOf: 'mcpFirst:second:')
		equals: 'Refactoring applied. 2 methods changed:
MCPExtraLiveTypingRefactoringProbe>>#mcpCaller
MCPExtraLiveTypingRefactoringProbe>>#second:mCPExtraLiveTypingRefactoringParameters:
1 method removed:
MCPExtraLiveTypingRefactoringProbe>>#mcpFirst:second:'

! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
testGatheringParametersInTheActualScopeChangesTheSendsItSaw

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'MCPExtraLiveTypingRefactoringParameters' caseSensitive: true)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
testGatheringParametersInTheActualScopeLeavesASendToAnythingElseAlone

	"The send inside the ifTrue: is to a variable LiveTyping never saw hold anything, so it is
	a send of the same name that is not a send to this class, and it is left as it was."

	self compileProbeSending: 'mcpCaller

	| anythingElse |

	self mcpFirst: 1 second: 2.
	false ifTrue: [ anythingElse mcpFirst: 3 second: 4 ]'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'anythingElse mcpFirst: 3 second: 4' caseSensitive: true)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
testGatheringParametersInTheActualScopeTakesThemToTheNewClass

	"The parameters keep their names without the article they were written with, so aFirst is
	held as first."

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: (self parameterObjectClass instVarNames includes: 'first')
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 1/Sep/2026, 1:27:36 pm (UTC)'!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includes: MCPExtraLiveTypingRefactoringTools extractParameterObjectInActualScopeToolName)

! !

!MCPExtraLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
classCategoryOfTestData

	^'__MCPExtraLiveTypingRefactoringTestData__'
! !
