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
        "--mcpStdIO"
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
        "--mcpStdIO"
      ]
    }
  }
}
```

### HTTP

You launch the image yourself:

```bash
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp
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
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp
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
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp --noAuthentication
```

The endpoint then serves every client that reaches it, so leave it off anywhere the port is not
yours alone.

If you write the token into `.mcp.json` instead of `${SMALLTALK_MCP_TOKEN}`, keep that file out
of version control.

## Tools

| Tool | |
| --- | --- |
| `smalltalk_evaluate` | Evaluate an expression and answer its result |
| `smalltalk_class_definition` | Superclass, variables, selectors and comment of a class |
| `smalltalk_class_organization` | Method categories of a class, each with its selectors |
| `smalltalk_methods_in_category` | Selectors filed under one method category |
| `smalltalk_method_source` | Source code of a method, in the source field of the answer |
| `smalltalk_list_classes` | Every class, optionally filtered by prefix |
| `smalltalk_hierarchy` | A class and all its superclasses |
| `smalltalk_subclasses` | Direct subclasses of a class |
| `smalltalk_list_categories` | Every system category |
| `smalltalk_classes_in_category` | Classes of one category |
| `smalltalk_define_class` | Create or change a class |
| `smalltalk_define_method` | Create or change a method, optionally in a category |
| `smalltalk_classify_methods` | File methods of a class under a method category |
| `smalltalk_delete_class` | Remove a class |
| `smalltalk_delete_method` | Remove a method |
| `smalltalk_screenshot` | Write what the image looks like to a JPEG file |
| `smalltalk_save_image` | Save the image |

`smalltalk_class_organization`, `smalltalk_methods_in_category`, `smalltalk_method_source` and
the rest that take a class name also take the class side, named the way it prints:
`MCPServer class`.

Always use `smalltalk_save_image` to save. Evaluating `Smalltalk saveImage` through
`smalltalk_evaluate` blocks the server.

### Decorating a tool

A package can add to what a tool of another package answers, without either naming the other. It
subclasses `MCPToolDecorator`, says which tool it decorates, and a server wraps that tool with it
once every tool is in place — the same way a package that has tools subclasses `MCPToolGroup`. A
decorator whose tool is not loaded decorates nothing.

A decorator does not have to add to what a tool answers: it can answer something else when the
request asks for it. That is how the actual scope of LiveTyping reaches the refactoring tools —
see [The actual scope](#the-actual-scope).

`MCPServerLiveTyping` uses it four times. With LiveTyping loaded, `smalltalk_method_source`
answers `returns` and `variables` next to `source`, holding the classes LiveTyping saw the method
answer and its variables hold — its parameters and temporaries along with the instance variables
of its class, which go together because a temporary cannot shadow an instance variable in Cuis.
`smalltalk_class_definition` answers `instanceVariableTypes`, the classes it saw each instance
variable of the class hold. `smalltalk_senders_of` answers `actual` next to `methods`: the ones it
saw really sending the selector to an object that implements it, which in a dynamically typed
image is a small part of everything that writes it — 165 methods write `classNamed:`, 4 send it to
`MCPRefactoringToolGroup`. `smalltalk_implementors_of` answers `actual` when a class is named: the
ones a send to that class could reach. Both add the `className` they need to the tool they
decorate, so without LiveTyping the parameter is not there either.

### Search

The last two answer what the image already has, which is worth asking before writing something
new: `smalltalk_find_messages_by_example` is `MethodFinder` and `smalltalk_search_selectors` is
`MessageNames`.

| Tool | |
| --- | --- |
| `smalltalk_senders_of` | Methods that send a selector |
| `smalltalk_implementors_of` | Methods that implement a selector |
| `smalltalk_references_to_class` | Methods that name a class |
| `smalltalk_references_to_instance_variable` | Methods that read or write an instance variable |
| `smalltalk_references_to_class_variable` | Methods that read or write a class variable |
| `smalltalk_search_source` | Methods whose source contains a text |
| `smalltalk_search_selectors` | Selectors whose name contains a text |
| `smalltalk_find_messages_by_example` | Messages that answer an expected result from a receiver |

`smalltalk_find_messages_by_example` takes the receiver, the arguments and the expected result as
Smalltalk expressions, and answers each message it found with the expression that produced the
result. Asking for `'method'` expecting `'methods'` answers `CharacterSequence>>#asPlural`. When
the receiver is a collection it also looks for an enumerating message taking a block, and the
expression is the only place the block shows: asking for `#(1 2 3 4)` expecting `#(1 3)` answers
`#(1 2 3 4) select: [:aSmallInteger | aSmallInteger odd]` and the `reject:` that sends `even`.

### Refactoring scope

A refactoring of a selector used to change every implementor and every sender in the image. The
six that work on a selector now take a `scope`, defaulting to `system` so nothing changes unless
it is asked for. Every scope but `system` also needs a `className` to look around.

| Scope | |
| --- | --- |
| `class` | The class and its metaclass |
| `hierarchy` | The class and all its subclasses |
| `category` | Every class of the root class category tree the class is in |
| `hierarchyAndCategories` | The hierarchy, and the category tree of every class in it |
| `system` | Every class in the image |

`category` is the whole tree under the root class category, which is usually the package the class
belongs to — though a class category tree does not always have a package of its own.

The scope matters most where the type does not say who the receiver is: two unrelated classes can
implement the same selector, and renaming it across the image renames both.

#### The actual scope

With LiveTyping loaded there is one more: `actual`, the scope it saw while the image ran. Only the
sends that really reached an object of the class that implements the selector are changed, and a
send of the same name to anything else is left alone — which no other scope can tell apart. It
needs `className`, and takes `keepingPossibleSends` for the sends LiveTyping could only guess at.

`MCPServerLiveTypingRefactorings` and `MCPServerExtraLiveTypingRefactorings` add it by decorating
the refactoring tools that already work over a scope, so `smalltalk_refactor_rename_selector`,
`smalltalk_refactor_change_keywords_order`, `smalltalk_refactor_remove_parameter`,
`smalltalk_refactor_add_parameter`, `smalltalk_refactor_extract_as_parameter` and
`smalltalk_refactor_extract_parameter_object` take `actual` like any other value. Two tools that
work over no scope of their own are given one: `smalltalk_refactor_inline_method` inlines every
send LiveTyping saw instead of the one it is told about, and
`smalltalk_refactor_move_instance_variable` and `smalltalk_refactor_move_method` move to the class
LiveTyping saw the variable they are reached through hold, so `targetClassName` is not needed.

Each of them is also offered on its own, so that what the two of them change can be compared:

| Tool | |
| --- | --- |
| `smalltalk_refactor_rename_selector_in_actual_scope` | Rename a selector |
| `smalltalk_refactor_change_keywords_order_in_actual_scope` | Reorder the keywords of a selector |
| `smalltalk_refactor_remove_parameter_in_actual_scope` | Remove a parameter |
| `smalltalk_refactor_add_parameter_in_actual_scope` | Add a parameter |
| `smalltalk_refactor_extract_as_parameter_in_actual_scope` | Turn a piece of a method into a parameter |
| `smalltalk_refactor_inline_method_in_actual_scope` | Replace every send by what the method does |
| `smalltalk_refactor_extract_parameter_object_in_actual_scope` | Gather parameters into an object of a new class |
| `smalltalk_refactor_move_instance_variable_in_actual_scope` | Move an instance variable to the class LiveTyping saw |
| `smalltalk_refactor_move_method_in_actual_scope` | Move a method to the class LiveTyping saw |

### Packages

A package is what the image writes to a `.pck.st` file. These read what each one holds and change
what it says about itself; `smalltalk_unsaved_packages` answers the ones a change left to write
out, which is what to ask after changing code.

| Tool | |
| --- | --- |
| `smalltalk_list_packages` | Every package with its description and whether it has changes to write out, optionally filtered by prefix |
| `smalltalk_package_definition` | What one package describes itself as, its file, what it requires and what it holds |
| `smalltalk_unsaved_packages` | The packages whose file does not have their changes yet |
| `smalltalk_package_of_class` | The package a class belongs to |
| `smalltalk_package_of_method` | The package a method belongs to |
| `smalltalk_save_package` | Write a package to its file |
| `smalltalk_change_package_description` | Change what a package describes itself as |
| `smalltalk_change_package_requirements` | Replace the packages a package requires |
| `smalltalk_change_package_file_name` | Name the file a package is written to |

A package is written only when it knows its file. One that was never saved, or whose image was
moved away from where it was saved, does not know one: asking it to save would open a dialog on
screen that no request can answer, so `smalltalk_save_package` reports it instead, and
`smalltalk_change_package_file_name` is how the file is named.

`smalltalk_package_of_method` is not `smalltalk_package_of_class` of its class. A method filed
under a category naming a package extends that package and belongs to it, which is how
`UISupervisor class>>waitToDone:` belongs to `MCPServer` while `UISupervisor` came with the image
and belongs to no package at all.

### Tests

Each of these answers how many tests passed, failed and signalled an error, and names the ones
that failed apart from the ones that signalled.

| Tool | |
| --- | --- |
| `smalltalk_run_test_method` | Run one test |
| `smalltalk_run_test_class` | Run every test of a test case class |
| `smalltalk_run_tests_in_category` | Run every test of a class category |
| `smalltalk_run_tests_for_classes` | Run the tests of several classes as one suite |

A class that is not a test case class contributes the tests that exercise it, so
`smalltalk_run_tests_for_classes` with `MCPServer` runs what covers it.

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
