'From Cuis7.9 [latest update: #8184] on 25 September 2026 at 4:24:36 pm'!
'Description Name the tests after the tool boxes they test'!
!provides: 'MCPServerMethodFinderTests' 1 6!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerMethodFinder' nil nil nil!
SystemOrganization addCategory: #MCPServerMethodFinderTests!


!classDefinition: #MCPMethodFinderToolBoxTest category: #MCPServerMethodFinderTests!
MCPToolBoxTest subclass: #MCPMethodFinderToolBoxTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerMethodFinderTests'!
!classDefinition: 'MCPMethodFinderToolBoxTest class' category: #MCPServerMethodFinderTests!
MCPMethodFinderToolBoxTest class
	instanceVariableNames: ''!


!MCPMethodFinderToolBoxTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:27 pm (UTC)'!
testFindingMessagesByExampleAnswersNoneWhenNoMessageAnswersTheExpectedResult

	self
		assert: (self messagesFoundWith: (self
			arguments: 'receiver' being: '''method'''
			and: 'expected' being: '''zzz not the plural of anything'''))
		equals: #()
! !

!MCPMethodFinderToolBoxTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:30 pm (UTC)'!
testFindingMessagesByExampleAnswersTheBlockTheEnumeratingMessageNeeds

	"The block is built out of a message the elements of the collection understand, and it is
	only the expression that says which one, because the message found is just select:."

	self assert: ((self expressionsFoundWith: (self
		arguments: 'receiver' being: '#(1 2 3 4)'
		and: 'expected' being: '#(1 3)'))
			anySatisfy: [ :anExpression |
				anExpression includesSubstring: '[:aSmallInteger | aSmallInteger odd]' caseSensitive: true ])

! !

!MCPMethodFinderToolBoxTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
testFindingMessagesByExampleAnswersTheEnumeratingMessageACollectionAnswersTheResultWith

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '#(1 2 3 4)'
		and: 'expected' being: '#(1 3)')) includes: 'SequenceableCollection>>#select:')
! !

!MCPMethodFinderToolBoxTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
testFindingMessagesByExampleAnswersTheExpressionThatAnswersTheExpectedResult

	self assert: ((self expressionsFoundWith: (self
		arguments: 'receiver' being: '''method'''
		and: 'expected' being: '''methods''')) includes: '''method'' asPlural')
! !

!MCPMethodFinderToolBoxTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
testFindingMessagesByExampleAnswersTheMessageThatAnswersTheExpectedResult

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '''method'''
		and: 'expected' being: '''methods''')) includes: 'CharacterSequence>>#asPlural')
! !

!MCPMethodFinderToolBoxTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
testFindingMessagesByExampleSendsTheArgumentsItIsGiven

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '3'
		and: 'expected' being: '7'
		and: 'arguments' being: '#(4)')) includes: 'SmallInteger>>#+')
! !

!MCPMethodFinderToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:54 pm (UTC)'!
expressionsFoundWith: anArguments

	^(self jsonAnswerOf: MCPMethodFinderToolBox findMessagesByExampleToolName with: anArguments)
		collect: [ :eachMessageFound | eachMessageFound at: 'expression' ]
! !

!MCPMethodFinderToolBoxTest methodsFor: 'test support' stamp: 'HAW 25/Sep/2026, 3:08:56 pm (UTC)'!
messagesFoundWith: anArguments

	"Answer the name of each message the finder found, which is what names it in the image."

	^(self jsonAnswerOf: MCPMethodFinderToolBox findMessagesByExampleToolName with: anArguments)
		collect: [ :eachMessageFound | eachMessageFound at: 'message' ]
! !

!MCPMethodFinderToolBoxTest methodsFor: 'tools under test' stamp: 'HAW 25/Sep/2026, 3:09:17 pm (UTC)'!
toolBoxClasses

	^{ MCPMethodFinderToolBox }! !

!MCPMethodFinderToolBoxTest methodsFor: 'tools under test' stamp: 'HAW 7/Sep/2026, 8:49:22 pm (UTC)'!
toolDecoratorClasses

	^#()! !
