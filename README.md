# Cuis-MCPServer
MCP-Server for Cuis derived from the one developed by John McIntosh: https://github.com/CorporateSmalltalkConsultingLtd/ClaudeSmalltalk

Just load the package and setup your LLM to use it.

It uses stdin and stdout to communicate, it would be better to use TCP. To do in next versions

## Claude Code
I only tried it with Claude Code.

There are several ways to configure Claude to use it. The one I used is to create a file called `.mcp.json` in the Claude Code's project directory like this:

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "stdio",
      "command": "[PathToVM]", 
      "args": [
        "[PathToImage]",
        "--mcp",
        "--devMode"
      ]
    }
  }
}
```

For example:

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "stdio",
      "command": "/Users/hernan/Documents/Cuis/Cuis-Smalltalk-Dev/CuisVM.app/Contents/MacOS/Squeak",
      "args": [
        "/Users/hernan/Documents/Cuis/Cuis-Smalltalk-Dev/CuisImage/Cuis-MCP.image",
        "--mcp",
        "--devMode"
      ]
    }
  }
}
```
