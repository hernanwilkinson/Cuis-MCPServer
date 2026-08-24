# Cuis-MCPServer

An [MCP](https://modelcontextprotocol.io) server that lets an LLM read and change the code of a
running Cuis image: browse classes, evaluate expressions, define and remove classes and methods,
and debug an error step by step.

Derived from the one developed by John McIntosh:
https://github.com/CorporateSmalltalkConsultingLtd/ClaudeSmalltalk

It talks MCP over **standard input/output** or over **HTTP**. With HTTP the image keeps running
and serving between client sessions, which is usually what you want.

## Installation

Requires **Cuis 7.9** or later.

### Prerequisites

`WebClient` and `JSON` come with Cuis-Smalltalk-Dev, so no need to clone them or load them by hand.

`OSProcess` lives in its own repository. Clone it next to your Cuis-Smalltalk-Dev directory:

```bash
git clone https://github.com/Cuis-Smalltalk/OSProcess.git
```

It will be loaded automatically when loading the `MCPServer` package but you can also loaded yourself doing:

```smalltalk
Feature require: 'OSProcess'
```

### The server

Clone this repository next to the others:

```bash
git clone https://github.com/hernanwilkinson/Cuis-MCPServer.git
```

and load the package:

```smalltalk
Feature require: 'MCPServer'
```

Save the image. The server starts by itself when the image is launched with one of the command
line options below.

## Command line options

| Option | What it does |
| --- | --- |
| `--mcpStdIO` | Serve MCP over standard input/output |
| `--mcpHttp` | Serve MCP over HTTP on port 2358 |
| `--mcpHttpPort=<port>` | Serve MCP over HTTP on `<port>` |
| `--noAuthentication` | Serve every client, whatever `SMALLTALK_MCP_TOKEN` says |
| `--devMode` | Compile through the normal tools, so changes show up in open browsers |

`--mcpStdIO` and `--mcpHttp` are mutually exclusive: the image serves one transport.

## Configuring your MCP client

These examples are for Claude Code, which reads a `.mcp.json` file in the project directory.
Other clients use the same two shapes.

### Standard input/output

The client launches the image itself and talks to it over pipes. Nothing else has to be running.

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "stdio",
      "command": "[PathToVM]",
      "args": [
        "[PathToImage]",
        "--mcpStdIO",
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
        "--mcpStdIO",
        "--devMode"
      ]
    }
  }
}
```

### HTTP

You launch the image yourself:

```bash
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp --devMode
```

and the client only needs the address:

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "http",
      "url": "http://127.0.0.1:2358/mcp"
    }
  }
}
```

On another port, launch with `--mcpHttpPort=9000` and point the client at it:

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "http",
      "url": "http://127.0.0.1:9000/mcp"
    }
  }
}
```

Clients that speak the older Server-Sent Events transport are served as well, on `GET /mcp`.

### Authentication

The HTTP endpoint evaluates whatever code it is sent, so it only listens on `127.0.0.1` and it
can ask for a token. Set `SMALLTALK_MCP_TOKEN` in the environment the image is launched from:

```bash
export SMALLTALK_MCP_TOKEN='a-long-random-string'
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp --devMode
```

Every request then has to carry it:

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "http",
      "url": "http://127.0.0.1:2358/mcp",
      "headers": {
        "Authorization": "Bearer ${SMALLTALK_MCP_TOKEN}"
      }
    }
  }
}
```

Requests without the right token are answered with `401`. Leaving the variable unset or empty
serves every client that reaches the port. The token is read from the environment rather than
from the command line so that `ps` does not show it.

`--noAuthentication` turns the token off without unsetting it, which is useful while working
locally:

```bash
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp --devMode --noAuthentication
```

The endpoint then serves every client that reaches it, so leave it off anywhere the port is not
yours alone.

If you write the token into `.mcp.json` instead of `${SMALLTALK_MCP_TOKEN}`, keep that file out
of version control.

## Tools

| Tool | |
| --- | --- |
| `smalltalk_evaluate` | Evaluate an expression and answer its result |
| `smalltalk_browse` | Superclass, variables and selectors of a class |
| `smalltalk_method_source` | Source code of a method |
| `smalltalk_list_classes` | Every class, optionally filtered by prefix |
| `smalltalk_hierarchy` | A class and all its superclasses |
| `smalltalk_subclasses` | Direct subclasses of a class |
| `smalltalk_list_categories` | Every system category |
| `smalltalk_classes_in_category` | Classes of one category |
| `smalltalk_define_class` | Create or change a class |
| `smalltalk_define_method` | Create or change a method, optionally in a category |
| `smalltalk_delete_class` | Remove a class |
| `smalltalk_delete_method` | Remove a method |
| `smalltalk_save_image` | Save the image |

Always use `smalltalk_save_image` to save. Evaluating `Smalltalk saveImage` through
`smalltalk_evaluate` blocks the server.

### Debugging

`smalltalk_evaluate_to_debug_on_error` leaves a debugger open when the expression fails, and the
rest of these drive it. The stepping ones answer the print string of the top of the stack.

| Tool | |
| --- | --- |
| `smalltalk_evaluate_to_debug_on_error` | Evaluate an expression, opening a debugger if it fails |
| `smalltalk_debugger_stepinto` | Step into the next message |
| `smalltalk_debugger_stepover` | Step over the next message |
| `smalltalk_debugger_through` | Step into the next block closure, or step over when there is none |
| `smalltalk_debugger_proceed` | Run the debugged process to the end |
| `smalltalk_debugger_restart` | Restart the current context |
| `smalltalk_finish_debugging` | Close the debugger and clean the session up |

Always send `smalltalk_finish_debugging` when no more debugging is needed.

## Starting the server by hand

Useful when the image is already open:

```smalltalk
(MCPServer servingOverHttpAtPort: 2358) run
```

`run` answers the server, so keep it if you want to stop it later:

```smalltalk
server := (MCPServer servingOverHttpAtPort: 2358) run.
"..."
server stop
```

## Tests

`MCPServerTests.pck.st` holds the test package. It runs a server over a mock transport and a mock
client that speaks real JSON-RPC to it, so every tool is exercised the way a real client would.

```smalltalk
Feature require: 'MCPServerTests'
```
