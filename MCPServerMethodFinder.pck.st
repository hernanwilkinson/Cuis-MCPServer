'From Cuis7.9 [latest update: #8184] on 25 September 2026 at 1:48:21 pm'!
'Description Name the tool groups as tool boxes'!
!provides: 'MCPServerMethodFinder' 1 6!
!requires: 'MCPServer' nil nil nil!
!requires: 'MethodFinder' nil nil nil!
SystemOrganization addCategory: #MCPServerMethodFinder!


!classDefinition: #MCPMethodFinderToolBox category: #MCPServerMethodFinder!
MCPToolBox subclass: #MCPMethodFinderToolBox
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MCPServerMethodFinder'!
!classDefinition: 'MCPMethodFinderToolBox class' category: #MCPServerMethodFinder!
MCPMethodFinderToolBox class
	instanceVariableNames: ''!


!MCPMethodFinderToolBox commentStamp: '<historical>' prior: 0!
I am the tool that finds a message by an example of what it answers, which is what MethodFinder does. I live in a package of my own so that the ones that search the image by name do not need it.!

!MCPMethodFinderToolBox methodsFor: 'tool creation' stamp: 'HAW 7/Sep/2026, 11:44:16 pm (UTC)'!
findMessagesByExampleTool

	^MCPPluggableTool
		named: self class findMessagesByExampleToolName
		describedBy: 'List the messages that answer an expected result when sent to a receiver, which tells whether the image already implements something before it is written. The receiver, the arguments and the expected result are sent as Smalltalk expressions. When the receiver is a collection that is not empty, the enumerating messages taking a block are looked for as well, the block being built from a message its elements understand, so a receiver of #(1 2 3 4) expecting #(1 3) answers select: along with the block it needs.'
		properties: {
			MCPPlainProperty named: 'receiver' describedBy: 'Smalltalk expression for the object the message is sent to, such as ''method'''.
			MCPPlainProperty named: 'expected' describedBy: 'Smalltalk expression for the result the message has to answer, such as ''methods'''.
			MCPPlainProperty named: 'arguments' describedBy: 'Smalltalk expression answering an Array with the arguments to send, such as #(4). Defaults to sending none' defaultingTo: '' }
		executingWith: [ :aReceiverSource :anExpectedSource :anArgumentsSource |
			self renderMessagesFound: (self
				messagesFrom: aReceiverSource
				withArguments: anArgumentsSource
				expecting: anExpectedSource) ]
! !

!MCPMethodFinderToolBox methodsFor: 'tool creation' stamp: 'HAW 31/Aug/2026, 10:11:27 pm (UTC)'!
messagesFrom: aReceiverSource withArguments: anArgumentsSource expecting: anExpectedSource

	| arguments |

	arguments := anArgumentsSource
		ifEmpty: [ Array new ]
		ifNotEmpty: [ :aSource | Compiler evaluate: aSource ].

	^(MethodFinder new
		findMethodsOf: (Compiler evaluate: aReceiverSource)
		withArguments: arguments
		expecting: (Compiler evaluate: anExpectedSource)
		withReceiverSource: aReceiverSource
		andArgumentSources: (arguments collect: [ :eachArgument | eachArgument printString ]);
		yourself) messageList
! !

!MCPMethodFinderToolBox methodsFor: 'tool creation' stamp: 'HAW 31/Aug/2026, 10:11:27 pm (UTC)'!
renderMessagesFound: someMethodEvaluationReferences

	"Answer each message along with the expression that answers the expected result, which is
	the only record of the block an enumerating message was found with."

	^Json render: (someMethodEvaluationReferences collect: [ :eachReference |
		OrderedDictionary new
			at: 'message' put: eachReference classAndSelector;
			at: 'expression' put: eachReference evaluationSourceCode;
			yourself ]) asArray
! !

!MCPMethodFinderToolBox methodsFor: 'tools' stamp: 'HAW 31/Aug/2026, 10:11:36 pm (UTC)'!
addToolsTo: anMCPServer

	anMCPServer addTool: self findMessagesByExampleTool! !

!MCPMethodFinderToolBox class methodsFor: 'tool names' stamp: 'HAW 16/Sep/2026, 2:43:50 pm (UTC)'!
findMessagesByExampleToolName

	^'find_messages_by_example'! !
