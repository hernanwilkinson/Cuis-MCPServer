"Write tools.json next to the packages: every tool of every tool group, grouped by the package that
adds it, and what each decorator makes of the tool it decorates. Evaluate it in an image that has
every MCPServer package loaded; then run scripts/update-readme-tools.py."

| groups byPackage decorated fullServer packageOf |

packageOf := [ :aClass | (CodePackage packageOfClass: aClass ifNone: [ nil ])
	ifNil: [ 'none' ] ifNotNil: [ :aPackage | aPackage packageName ] ].
groups := MCPToolGroup allSubclasses reject: [ :each | each isAbstract ].
byPackage := OrderedDictionary new.
groups do: [ :eachGroup | | server |
	server := MCPServer servingOver: MCPTransportMock new smalltalk: Smalltalk providing: { eachGroup } decoratedBy: #().
	(byPackage at: (packageOf value: eachGroup) ifAbsentPut: [ OrderedDictionary new ])
		at: eachGroup name put: server toolDefinitions ].
fullServer := MCPServer servingOver: MCPTransportMock new.
decorated := OrderedDictionary new.
(MCPToolDecorator allSubclasses reject: [ :each | each isAbstract ]) do: [ :eachDecorator |
	(decorated at: (packageOf value: eachDecorator) ifAbsentPut: [ OrderedDictionary new ])
		at: eachDecorator name
		put: (OrderedDictionary new
			at: 'decorates' put: eachDecorator decoratedToolName;
			at: 'definition' put: (fullServer toolNamed: eachDecorator decoratedToolName) definition;
			yourself) ].
((CodePackage packageOfClass: MCPServer) fullFileName asFileEntry parentDirectory // 'tools.json')
	forceWriteStreamDo: [ :aStream |
		aStream nextPutAll: (Json render: (OrderedDictionary new
			at: 'groups' put: byPackage;
			at: 'decorators' put: decorated;
			yourself)) ]
