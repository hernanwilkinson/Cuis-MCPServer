'From Cuis7.9 [latest update: #8134] on 31 August 2026 at 7:19:44 pm'!
'Description Say what each package needs and need MethodFinder apart'!
!provides: 'MCPServerMethodFinderTests' 1 1!
!requires: 'MCPServerTests' nil nil nil!
!requires: 'MCPServerMethodFinder' nil nil nil!
SystemOrganization addCategory: #MCPServerMethodFinderTests!


!classDefinition: #MCPMethodFinderToolsTest category: #MCPServerMethodFinderTests!
MCPToolsTest subclass: #MCPMethodFinderToolsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerMethodFinderTests'!
!classDefinition: 'MCPMethodFinderToolsTest class' category: #MCPServerMethodFinderTests!
MCPMethodFinderToolsTest class
	instanceVariableNames: ''!


!MCPMethodFinderToolsTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:27 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersNoneWhenNoMessageAnswersTheExpectedResult

	self
		assert: (self messagesFoundWith: (self
			arguments: 'receiver' being: '''method'''
			and: 'expected' being: '''zzz not the plural of anything'''))
		equals: #()
! !

!MCPMethodFinderToolsTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:30 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheBlockTheEnumeratingMessageNeeds

	"The block is built out of a message the elements of the collection understand, and it is
	only the expression that says which one, because the message found is just select:."

	self assert: ((self expressionsFoundWith: (self
		arguments: 'receiver' being: '#(1 2 3 4)'
		and: 'expected' being: '#(1 3)'))
			anySatisfy: [ :anExpression |
				anExpression includesSubstring: '[:aSmallInteger | aSmallInteger odd]' caseSensitive: true ])

! !

!MCPMethodFinderToolsTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheEnumeratingMessageACollectionAnswersTheResultWith

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '#(1 2 3 4)'
		and: 'expected' being: '#(1 3)')) includes: 'SequenceableCollection>>#select:')
! !

!MCPMethodFinderToolsTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheExpressionThatAnswersTheExpectedResult

	self assert: ((self expressionsFoundWith: (self
		arguments: 'receiver' being: '''method'''
		and: 'expected' being: '''methods''')) includes: '''method'' asPlural')
! !

!MCPMethodFinderToolsTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleAnswersTheMessageThatAnswersTheExpectedResult

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '''method'''
		and: 'expected' being: '''methods''')) includes: 'CharacterSequence>>#asPlural')
! !

!MCPMethodFinderToolsTest methodsFor: 'tests' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
!methodProperties: {}!
testFindingMessagesByExampleSendsTheArgumentsItIsGiven

	self assert: ((self messagesFoundWith: (self
		arguments: 'receiver' being: '3'
		and: 'expected' being: '7'
		and: 'arguments' being: '#(4)')) includes: 'SmallInteger>>#+')
! !

!MCPMethodFinderToolsTest methodsFor: 'test support' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
!methodProperties: {}!
expressionsFoundWith: anArguments

	^(self jsonAnswerOf: 'smalltalk_find_messages_by_example' with: anArguments)
		collect: [ :eachMessageFound | eachMessageFound at: 'expression' ]
! !

!MCPMethodFinderToolsTest methodsFor: 'test support' stamp: 'HAW 31/Aug/2026, 10:11:31 pm (UTC)'!
!methodProperties: {}!
messagesFoundWith: anArguments

	"Answer the name of each message the finder found, which is what names it in the image."

	^(self jsonAnswerOf: 'smalltalk_find_messages_by_example' with: anArguments)
		collect: [ :eachMessageFound | eachMessageFound at: 'message' ]
! !
