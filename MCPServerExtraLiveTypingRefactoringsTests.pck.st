'From Cuis7.9 [latest update: #8134] on 26 August 2026 at 12:46:38 pm'!
'Description Answer the changes a refactoring made'!
!provides: 'MCPServerExtraLiveTypingRefactoringsTests' 1 1!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerExtraLiveTypingRefactorings' nil nil nil!
SystemOrganization addCategory: #MCPServerExtraLiveTypingRefactoringsTests!


!classDefinition: #MCPExtraLiveTypingRefactoringToolsTest category: #MCPServerExtraLiveTypingRefactoringsTests!
DynamicallyCodeCreationTest subclass: #MCPExtraLiveTypingRefactoringToolsTest
	instanceVariableNames: 'probeClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerExtraLiveTypingRefactoringsTests'!
!classDefinition: 'MCPExtraLiveTypingRefactoringToolsTest class' category: #MCPServerExtraLiveTypingRefactoringsTests!
MCPExtraLiveTypingRefactoringToolsTest class
	instanceVariableNames: ''!


!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'running' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
compileProbeSending: aCallerSource

	probeClass compile: 'mcpFirst: aFirst second: aSecond

	^aFirst' classified: 'probing'.
	probeClass compile: aCallerSource classified: 'probing'.
	(probeClass >> #mcpCaller) initializeTypeInformation.
	probeClass new mcpCaller
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 5:02:57 pm (UTC)'!
!methodProperties: {}!
gatherFirstParameterOf: aSelector

	^(self toolNamed: 'smalltalk_refactor_extract_parameter_object_in_actual_scope') valueWithArguments: (Dictionary new
		at: 'className' put: 'MCPExtraLiveTypingRefactoringProbe';
		at: 'selector' put: aSelector;
		at: 'newClassName' put: 'MCPExtraLiveTypingRefactoringParameters';
		at: 'parameterNames' put: 'aFirst';
		yourself)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
parameterObjectClass

	^Smalltalk classNamed: 'MCPExtraLiveTypingRefactoringParameters'
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
probeClass

	^probeClass
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'test support' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
toolNamed: aToolName

	"Ask a server for the tool, which is how a client reaches it."

	^(MCPServer servingOver: MCPTransportMock new) toolNamed: aToolName
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 5:02:57 pm (UTC)'!
!methodProperties: {}!
testGatheringParametersInTheActualScopeAnswersTheMethodsItChanged

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self
		assert: (self gatherFirstParameterOf: 'mcpFirst:second:')
		equals: 'Refactoring applied. 3 methods changed:
MCPExtraLiveTypingRefactoringProbe>>mcpCaller
MCPExtraLiveTypingRefactoringProbe>>mcpFirst:second:
MCPExtraLiveTypingRefactoringProbe>>second:mCPExtraLiveTypingRefactoringParameters:'

! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
testGatheringParametersInTheActualScopeChangesTheSendsItSaw

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: ((self probeClass sourceCodeAt: 'mcpCaller' asSymbol)
		includesSubstring: 'MCPExtraLiveTypingRefactoringParameters' caseSensitive: true)
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
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
!methodProperties: {}!
testGatheringParametersInTheActualScopeTakesThemToTheNewClass

	"The parameters keep their names without the article they were written with, so aFirst is
	held as first."

	self compileProbeSending: 'mcpCaller

	^self mcpFirst: 1 second: 2'.

	self gatherFirstParameterOf: 'mcpFirst:second:'.

	self assert: (self parameterObjectClass instVarNames includes: 'first')
! !

!MCPExtraLiveTypingRefactoringToolsTest methodsFor: 'tests' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
testTheToolsAreOfferedByEveryServer

	| server |

	server := MCPServer servingOver: MCPTransportMock new.

	self assert: ((server toolDefinitions collect: [ :eachDefinition | eachDefinition at: 'name' ])
		includes: 'smalltalk_refactor_extract_parameter_object_in_actual_scope')

! !

!MCPExtraLiveTypingRefactoringToolsTest class methodsFor: 'test data' stamp: 'HAW 25/Aug/2026, 12:28:39 pm (UTC)'!
!methodProperties: {}!
classCategoryOfTestData

	^'__MCPExtraLiveTypingRefactoringTestData__'
! !
