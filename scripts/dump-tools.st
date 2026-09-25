"Write tools.json into the repository: every tool of every tool box, grouped by the package that
adds it, and what each decorator makes of the tool it decorates. Set repositoryDirectory, evaluate it
in an image that has every MCPServer package loaded, then run scripts/update-readme-tools.py."

| repositoryDirectory toolBoxClasses byPackage decorated fullServer packageOf |

repositoryDirectory := '/path/to/Cuis-MCPServer'.

packageOf := [ :aClass | (CodePackage packageOfClass: aClass ifNone: [ nil ])
	ifNil: [ 'none' ] ifNotNil: [ :aPackage | aPackage packageName ] ].
toolBoxClasses := MCPToolBox allSubclasses reject: [ :each | each isAbstract ].
byPackage := OrderedDictionary new.
toolBoxClasses do: [ :aToolBoxClass | | server |
	server := MCPServer servingOver: MCPTransportMock new smalltalk: Smalltalk providing: { aToolBoxClass } decoratedBy: #().
	(byPackage at: (packageOf value: aToolBoxClass) ifAbsentPut: [ OrderedDictionary new ])
		at: aToolBoxClass name put: server toolDefinitions ].
fullServer := MCPServer servingOver: MCPTransportMock new.
decorated := OrderedDictionary new.
(MCPToolDecorator allSubclasses reject: [ :each | each isAbstract ]) do: [ :eachDecorator |
	(decorated at: (packageOf value: eachDecorator) ifAbsentPut: [ OrderedDictionary new ])
		at: eachDecorator name
		put: (OrderedDictionary new
			at: 'decorates' put: eachDecorator decoratedToolName;
			at: 'definition' put: (fullServer toolNamed: eachDecorator decoratedToolName) definition;
			yourself) ].
(repositoryDirectory asDirectoryEntry // 'tools.json')
	forceWriteStreamDo: [ :aStream |
		aStream nextPutAll: (Json render: (OrderedDictionary new
			at: 'toolBoxes' put: byPackage;
			at: 'decorators' put: decorated;
			yourself)) ]
