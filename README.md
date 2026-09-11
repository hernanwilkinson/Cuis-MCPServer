# Cuis-MCPServer

An [MCP](https://modelcontextprotocol.io) server that lets an LLM read and change the code of a
running Cuis image: browse and search code, evaluate expressions, define classes and methods,
apply refactorings, run tests, debug an error step by step, and — with LiveTyping — ask what
every variable held and what every method answered while the image ran.

Derived from the one developed by John McIntosh:
https://github.com/CorporateSmalltalkConsultingLtd/ClaudeSmalltalk

It talks MCP over **HTTP** or over **standard input/output**. With HTTP the image keeps running
and serving between client sessions, which is usually what you want.

## Installation

Requires **Cuis 7.9** or later. `WebClient` and `JSON` come with Cuis-Smalltalk-Dev.

Clone the repositories next to your `Cuis-Smalltalk-Dev` directory, so that `Feature require:`
finds the packages:

```bash
git clone https://github.com/Cuis-Smalltalk/OSProcess.git
git clone https://github.com/hernanwilkinson/Cuis-MCPServer.git
```

The packages that add LiveTyping, the extra refactorings and the method finder need their own
repositories as well. They are optional: load only what you cloned.

```bash
git clone https://github.com/hernanwilkinson/LiveTyping.git
git clone https://github.com/hernanwilkinson/Cuis-Smalltalk-Refactoring.git
git clone https://github.com/hernanwilkinson/MethodFinder.git
```

### Loading the server

Evaluate one of these in a workspace, then save the image.

The server alone — code browsing, search, evaluation, packages, tests, debugging and the
refactorings that come with Cuis:

```smalltalk
Feature require: 'MCPServer'
```

Everything — the server plus LiveTyping, the extra refactorings and the method finder:

```smalltalk
Feature require: 'MCPServer'.
Feature require: 'MCPServerMethodFinder'.
Feature require: 'MCPServerLiveTyping'.
Feature require: 'MCPServerLiveTypingRefactorings'.
Feature require: 'MCPServerExtraRefactoring'.
Feature require: 'MCPServerExtraLiveTypingRefactorings'
```

Everything with its tests:

```smalltalk
Feature require: 'MCPServer'.
Feature require: 'MCPServerMethodFinder'.
Feature require: 'MCPServerLiveTyping'.
Feature require: 'MCPServerLiveTypingRefactorings'.
Feature require: 'MCPServerExtraRefactoring'.
Feature require: 'MCPServerExtraLiveTypingRefactorings'.
Feature require: 'MCPServerTests'.
Feature require: 'MCPServerMethodFinderTests'.
Feature require: 'MCPServerLiveTypingTests'.
Feature require: 'MCPServerLiveTypingRefactoringsTests'.
Feature require: 'MCPServerExtraRefactoringTest'.
Feature require: 'MCPServerExtraLiveTypingRefactoringsTests'
```

Each package requires what it needs, so `OSProcess`, `LiveTyping`, `ExtraRefactorings` and
`MethodFinder` are loaded on the way. What each package provides and requires is in
[Tools by package](#tools-by-package).

Save the image once loaded: the server starts by itself when the image is launched with one of
the options below.

## Starting the server

### Command line options

| Option | What it does |
| --- | --- |
| `--mcpHttp` | Serve MCP over HTTP on port 2358 |
| `--mcpHttpPort=<port>` | Serve MCP over HTTP on `<port>` |
| `--mcpStdIO` | Serve MCP over standard input/output |
| `--noAuthentication` | Serve every client, whatever `SMALLTALK_MCP_TOKEN` says |
| `--mcpLogCalls` | Log every tool call to a file next to the image, named after it |
| `--mcpLogCalls=<file>` | Log every tool call to `<file>` |

`--mcpStdIO` and `--mcpHttp` are mutually exclusive: the image serves one transport.

### HTTP

Launch the image yourself:

```bash
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp
```

and give the client the address. These examples are for Claude Code, which reads a `.mcp.json`
file in the project directory; other clients take the same two shapes.

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

On another port, launch with `--mcpHttpPort=9000` and point the client at
`http://127.0.0.1:9000/mcp`. Clients that speak the older Server-Sent Events transport are served
as well, on `GET /mcp`.

A refactoring or a test run can take a while; give the client a long timeout (Claude Code takes
`"timeout": 600000` next to `"url"`, in milliseconds).

### Standard input/output

The client launches the image itself and talks to it over pipes. Nothing else has to be running.

```json
{
  "mcpServers": {
    "Cuis": {
      "type": "stdio",
      "command": "/path/to/Squeak",
      "args": [
        "/path/to/Cuis-MCP.image",
        "--mcpStdIO"
      ]
    }
  }
}
```

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
from the command line so that `ps` does not show it. `--noAuthentication` turns the token off
without unsetting it, which is useful while working locally — leave it off anywhere the port is
not yours alone. If you write the token into `.mcp.json` instead of `${SMALLTALK_MCP_TOKEN}`,
keep that file out of version control.

### By hand

Useful when the image is already open:

```smalltalk
server := (MCPServer servingOverHttpAtPort: 2358) run.
"..."
server stop
```

A tool added or changed while a client is connected is seen by the client only when it connects
again: MCP clients read the list of tools once.

## Logging the calls

A server records nothing unless told where to. Told, it appends one line of JSON per tool call
to a file, which is what to measure how a client uses the server from. From the command line:

```bash
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp --mcpLogCalls
/path/to/Squeak /path/to/Cuis-MCP.image --mcpHttp --mcpLogCalls=/path/to/mcp-calls.jsonl
```

or on a running server:

```smalltalk
server logCalls.                            "next to the image, named after it"
server logCallsTo: '/path/to/mcp-calls.jsonl'.
server stopLoggingCalls
```

`logCalls` writes to `<image name>-mcp-calls.jsonl`, the `.image` suffix replaced. A running
server is reached with `MCPServer allInstances`, or kept from `run` as above.

Each line stands alone:

```json
{"session":"da6f7c2e-…","sequence":12,"at":"2026-09-09T16:02:11-03:00","tool":"smalltalk_method_source","arguments":{"className":"MCPServer","selector":"responseTo:"},"milliseconds":3,"isError":false,"answer":"{\"source\": …}"}
```

| Field | |
| --- | --- |
| `session` | A UUID made when logging starts, so runs of different client sessions can be told apart |
| `sequence` | The number of the call within the session, so the order is explicit even when times collide |
| `at` | When the call was received |
| `tool` | The tool called |
| `arguments` | Everything the client sent, as it sent it |
| `milliseconds` | How long the call took |
| `isError` | Whether the tool failed |
| `answer` | The full text the tool answered, when it did not fail |
| `error` | The description of the error, when it did |

A refactoring that stops at a warning is one call, and the one that accepts the warning is
another, so a conversation over a warning shows as what it is. The file is read a line at a time
with any JSON reader — with `jq`, calls per tool and their mean time:

```bash
jq -r '.tool' mcp-calls.jsonl | sort | uniq -c | sort -rn
jq -s 'group_by(.tool) | map({tool: .[0].tool, calls: length, ms: (map(.milliseconds) | add / length)})' mcp-calls.jsonl
```

## Tools by package

Every tool that takes a `className` also takes the class side, named the way it prints:
`MCPServer class`. Always save with `smalltalk_save_image`: evaluating `Smalltalk saveImage`
through `smalltalk_evaluate` blocks the server. A tool that fails answers an error whose text
starts with the class of the exception, as in `Error: Class not found: Foo`.

A package that adds tools subclasses `MCPToolGroup`; one that adds to the tools of another package
subclasses `MCPToolDecorator`, names the tool it decorates, and a server wraps that tool with it
once every tool is in place — neither package names the other, and a decorator whose tool is not
loaded decorates nothing. A server is built with every group and decorator loaded, or with the
ones it is given: `MCPServer servingOver: aTransport smalltalk: Smalltalk providing: someGroupClasses decoratedBy: someDecoratorClasses`, which is how the tests give each server only the tools under test.

The tool tables below are generated from what the image advertises: set the repository directory
in `scripts/dump-tools.st` and evaluate it in an image with every package loaded, which writes
`tools.json` there, then run `scripts/update-readme-tools.py`, which rewrites only the tables. The
prose around them is written by hand.

### MCPServer

Requires `WebClient`, `JSON` and `OSProcess`. The server, the transports and the tools below.


#### Reading and writing code

`smalltalk_method_sources_of_class` and `smalltalk_method_sources_in_category` read a whole class or category in one call, which is much cheaper than a call per method.
`smalltalk_define_methods` defines several methods in one call, on any classes and under any categories, and answers what happened to each one; a method that does not compile does not stop the ones after it.

<!-- tools MCPServer MCPModelStructureTools -->
##### `smalltalk_class_definition`

Read the definition of a class: its superclass, its instance and class variables, its selectors and its comment.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_class_organization`

List the method categories of a class, each with the selectors filed under it, in the order the class holds them. Name the class side the way it prints, as in MCPServer class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_classes_in_category`

List all classes in a specific category.

| Parameter | | |
| --- | --- | --- |
| `category` | required | Name of the category |

##### `smalltalk_classify_methods`

File methods of a class under a method category, making the category when the class does not have it yet and taking away the ones they left behind when nothing else is filed under them. Answers where each method was filed before, which is what nothing says once it has moved.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |
| `selectors` | required | Selectors of the methods to file, separated by commas |
| `category` | required | Name of the method category to file them under |

##### `smalltalk_define_class`

Define a new class or modify an existing class definition.

| Parameter | | |
| --- | --- | --- |
| `definition` | required | Full class definition expression |

##### `smalltalk_define_methods`

Define or modify several methods in one call, each on its class and under its category. Every method is compiled whatever happens to the others, and the answer says for each one, in the order sent, whether it was defined and its selector, or why it was not.

| Parameter | | |
| --- | --- | --- |
| `methods` | required | The methods to define, each with the class, the source and optionally the category |
| `methods[].className` | required | Name of the class, or of its class side as in MCPServer class |
| `methods[].source` | required | Full method source including selector |
| `methods[].category` | optional | Optional method category. Defaults to as yet unclassified |

##### `smalltalk_delete_class`

Remove a class from the system.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class to remove |

##### `smalltalk_delete_method`

Remove a method from a class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method to remove |

##### `smalltalk_hierarchy`

Get the inheritance hierarchy for a class (from Object down to the class).

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_list_categories`

List all system categories.

##### `smalltalk_list_classes`

List all classes in the system, optionally filtered by prefix.

| Parameter | | |
| --- | --- | --- |
| `prefix` | optional | Optional prefix to filter class names |

##### `smalltalk_method_source`

Get the source code of a specific method, as the source field of the answer.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |

##### `smalltalk_method_sources_in_category`

Read the source of every method a class files under one of its method categories, each under its selector, so that what a category says is read at once instead of a method at a time. Name the class side the way it prints, as in MCPServer class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |
| `category` | required | Name of the method category |

##### `smalltalk_method_sources_of_class`

Read the source of every method of a class, each under its selector and grouped by the method category it is filed under, in the order the class holds its categories, so that a whole class is read at once. A category holding no method is left out. Name the class side the way it prints, as in MCPServer class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_methods_in_category`

List the selectors a class files under one of its method categories. Name the class side the way it prints, as in MCPServer class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |
| `category` | required | Name of the method category |

##### `smalltalk_subclasses`

Get the direct subclasses of a class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

<!-- /tools -->

#### Search

`smalltalk_search_selectors` is `MessageNames`: it tells whether a message doing what is about to be written already has a name, which is worth asking before writing it.

<!-- tools MCPServer MCPSearchTools -->
##### `smalltalk_implementors_of`

List the methods that implement a selector, in the methods field of the answer.

| Parameter | | |
| --- | --- | --- |
| `selector` | required | Selector the methods implement |

##### `smalltalk_references_to_class`

List the methods that refer to a class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_references_to_class_variable`

List the methods that refer to a class variable. A subclass sees the class variables of its superclass, so the methods of every subclass are listed too.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |
| `variableName` | required | Name of the class variable |

##### `smalltalk_references_to_instance_variable`

List the methods that read or write an instance variable. A subclass sees the instance variables of its superclass, so the methods of every subclass are listed too.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable |

##### `smalltalk_search_selectors`

List the selectors that contain a text, which tells whether a message doing what is about to be written already has a name. A * in the text matches any text and a # any character, and several texts can be sent separated by semicolons.

| Parameter | | |
| --- | --- | --- |
| `text` | required | Text the selector contains |

##### `smalltalk_search_source`

List the methods whose source code contains a text, case sensitively. Class comments are searched too, and answered as the selector Comment.

| Parameter | | |
| --- | --- | --- |
| `text` | required | Text the source code contains |

##### `smalltalk_senders_of`

List the methods that send a selector, in the methods field of the answer. A method that writes the selector but sends it to something else is one of them, because the text is all this looks at.

| Parameter | | |
| --- | --- | --- |
| `selector` | required | Selector the methods send |

<!-- /tools -->

#### Image

<!-- tools MCPServer MCPImageTools -->
##### `smalltalk_evaluate`

Evaluate arbitrary Smalltalk code and return the result.

| Parameter | | |
| --- | --- | --- |
| `code` | required | Smalltalk code to evaluate |

##### `smalltalk_save_image`

Save the Smalltalk image to disk.

##### `smalltalk_screenshot`

Write what the image looks like right now to a JPEG file and answer the name of the file, so that a change to something on screen can be looked at instead of guessed at.

| Parameter | | |
| --- | --- | --- |
| `fileName` | required | Absolute path of the JPEG file to write |

<!-- /tools -->

#### Packages

A package is what the image writes to a `.pck.st` file. `smalltalk_unsaved_packages` answers the
ones a change left to write out, which is what to ask after changing code. A package is written
only when it knows its file: one that was never saved, or whose image was moved away from where it
was saved, does not know one, so `smalltalk_save_package` reports it instead of opening a dialog
that no request can answer, and `smalltalk_change_package_file_name` is how the file is named.

`smalltalk_package_of_method` is not `smalltalk_package_of_class` of its class: a method filed
under a category naming a package extends that package and belongs to it.

<!-- tools MCPServer MCPPackageTools -->
##### `smalltalk_change_package_description`

Change what a package describes itself as, which is the line its file carries as its header. Changing it leaves the package with changes to write out.

| Parameter | | |
| --- | --- | --- |
| `packageName` | required | Name of the package |
| `description` | required | What the package describes itself as |

##### `smalltalk_change_package_file_name`

Name the file a package is written to, and answer it. A package that was never written, or whose image was moved away from where it was written, does not know one and cannot be saved until it is told.

| Parameter | | |
| --- | --- | --- |
| `packageName` | required | Name of the package |
| `fileName` | required | Absolute path of the .pck.st file the package is written to |

##### `smalltalk_change_package_requirements`

Change the packages a package requires, replacing the ones it required with the ones named, and answer what it requires now. Each requirement asks for any version.

| Parameter | | |
| --- | --- | --- |
| `packageName` | required | Name of the package |
| `requiredPackageNames` | required | Names of the packages it requires, separated by commas. An empty text leaves it requiring nothing |

##### `smalltalk_list_packages`

List the code packages installed in the image, each with what it describes itself as and whether it holds changes its file does not have yet, optionally filtered by prefix.

| Parameter | | |
| --- | --- | --- |
| `prefix` | optional | Optional prefix to filter package names |

##### `smalltalk_package_definition`

Read the definition of a code package: what it describes itself as, the file it is written to, whether the image holds changes that file does not, what it requires, and the system categories and classes it holds.

| Parameter | | |
| --- | --- | --- |
| `packageName` | required | Name of the package |

##### `smalltalk_package_of_class`

Answer the package a class belongs to, which is the one a change to the class leaves with changes to write out.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_package_of_method`

Answer the package a method belongs to, which is the package of its class unless it is filed under a method category naming another one, as an extension of a package is.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |

##### `smalltalk_save_package`

Write a package to its file and answer the name of the file it was written to.

| Parameter | | |
| --- | --- | --- |
| `packageName` | required | Name of the package |

##### `smalltalk_unsaved_packages`

List the packages that hold changes their file does not have yet, which are the ones a change to the image left to be written out.

<!-- /tools -->

#### Tests

Each of these answers how many tests passed, failed and signalled an error, and names the ones that failed apart from the ones that signalled. A class that is not a test case class contributes the tests that exercise it, so `smalltalk_run_tests_for_classes` with `MCPServer` runs what covers it.

<!-- tools MCPServer MCPTestRunningTools -->
##### `smalltalk_run_test_class`

Run every test of a test case class and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the test case class |

##### `smalltalk_run_test_method`

Run one test and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |

##### `smalltalk_run_tests_for_classes`

Run the tests of several classes as one suite and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled. A class that is not a test case class contributes the tests that exercise it.

| Parameter | | |
| --- | --- | --- |
| `classNames` | required | Names of the classes, separated by commas |

##### `smalltalk_run_tests_in_category`

Run every test of the test case classes of a class category and answer how many tests passed, failed and signalled an error, along with the name of each one that failed and each one that signalled. A category holding no test case class contributes the tests that exercise the classes it does hold.

| Parameter | | |
| --- | --- | --- |
| `categoryName` | required | Name of the class category |

<!-- /tools -->

#### Debugging

`smalltalk_evaluate_to_debug_on_error` leaves a debugger open when the expression fails, and the rest of these drive it; the stepping ones answer the print string of the top of the stack. Always send `smalltalk_finish_debugging` when no more debugging is needed.

<!-- tools MCPServer MCPDebugTools -->
##### `smalltalk_debugger_proceed`

It does a proceed on the debugger, that means running the debugging procees to the end

##### `smalltalk_debugger_restart`

It does a restart on the debugger, that means restarting the current execution context, that is thisContext

##### `smalltalk_debugger_stepinto`

It does a step into on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack

##### `smalltalk_debugger_stepover`

It does a step over on the debugger created by smalltalk_evaluate_to_debug_on_error. Returns the print string of the top of the stack

##### `smalltalk_debugger_through`

It does a thought on the debugger created by smalltalk_evaluate_to_debug_on_error. Doing a through means going inside of the next block closure. If the next instruction is not a block closure it is the same as doind a step over. Returns the print string of the top of the stack

##### `smalltalk_evaluate_to_debug_on_error`

Evaluate arbitrary Smalltalk code, return the result if no error, return the string 'Error: ' with the exception description and install a debugger to debug the error using the tools smalltalk_debugger_stepinto, smalltalk_debugger_stepover, smalltalk_debugger_through, smalltalk_debugger_proceed, smalltalk_debugger_restart, smalltalk_finish_debugging.

| Parameter | | |
| --- | --- | --- |
| `code` | required | Smalltalk code to evaluate |

##### `smalltalk_finish_debugging`

It clean ups all the debugging session. It should always be sent when no more debugging is needed

<!-- /tools -->

#### Refactorings

The refactorings that come with Cuis. Each one answers what it changed: the methods it wrote and
removed, the definition of the classes it changed, or the new source of the method.

##### Refactoring warnings

A refactoring that may not preserve behaviour warns before changing anything — pushing up a
method that reads an instance variable of its class, renaming a selector to one the superclass
implements, removing a class whose name is still written somewhere. In a browser the programmer
is asked whether to go on; here the client is. Every refactoring tool takes `acceptedWarnings`,
not listed in the tables below:

| Parameter | | |
| --- | --- | --- |
| `acceptedWarnings` | optional | Warnings of this refactoring already reviewed, as they were answered. The refactoring goes on through a warning whose description is included here and stops at the first one that is not, answering it instead of applying |

Called without it, the tool stops at the first warning and answers
`Refactoring not applied. Warning: <description>. To apply it anyway, call the tool again with the
same arguments and this warning added to acceptedWarnings` — nothing has changed at that point. The
client reads the warning, and if it agrees calls again with the same arguments and the description
in `acceptedWarnings`; a refactoring that warns twice is accepted with both descriptions in the
one text, in any order, since a warning is accepted when its description is *included* in it. A
warning about references names the methods that hold them, as in
`There are references to the name of Foo in Bar>>#baz`.

##### Refactoring scope

The refactorings of a selector take a `scope`: where the implementors and the senders to change
are looked for, around the class of the method named. It defaults to `system`, so nothing is left
out unless asked.

| Scope | |
| --- | --- |
| `class` | The class and its metaclass |
| `hierarchy` | The class and all its subclasses |
| `category` | Every class of the root class category tree the class is in — usually the package, though a class category tree does not always have a package of its own |
| `hierarchyAndCategories` | The hierarchy, and the category tree of every class in it |
| `system` | Every class in the image |

The scope matters most where the type does not say who the receiver is: two unrelated classes can
implement the same selector, and renaming it across the image renames both. LiveTyping adds the
`actual` scope, which tells them apart — see [MCPServerLiveTypingRefactorings](#mcpserverlivetypingrefactorings).

<!-- tools MCPServer MCPRefactoringTools -->
##### `smalltalk_refactor_add_as_subclass_responsibility`

Declare a method of a class as the responsibility of its subclasses, adding it to the superclass as a subclassResponsibility.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements it |
| `selector` | required | Selector of the method |

##### `smalltalk_refactor_add_instance_variable`

Add an instance variable to a class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class to add the instance variable to |
| `variableName` | required | Name of the instance variable to add |

##### `smalltalk_refactor_add_parameter`

Add a parameter to a selector, giving every sender the scope takes in the value to pass. A unary selector needs no keyword; a keyword one is told which keyword to add and where.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the selector |
| `selector` | required | Selector to add the parameter to |
| `parameterName` | required | Name of the parameter to add |
| `parameterValue` | required | Expression every sender will pass for it |
| `keyword` | optional | Keyword to add, needed only when the selector is a keyword one |
| `parameterIndex` | optional | Position for the new keyword, counting from one. Defaults to the first |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |

##### `smalltalk_refactor_change_keywords_order`

Reorder the keywords of a selector, moving the arguments of every sender the scope takes in with them.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the selector |
| `selector` | required | Selector to reorder |
| `newSelector` | required | Selector with the same keywords in the order wanted |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |

##### `smalltalk_refactor_extract_as_parameter`

Turn a piece of a method into a parameter of it, giving every sender the scope takes in the piece to pass. The piece is named by the text it is written with, or by the interval it occupies.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `parameterName` | required | Name of the parameter to introduce |
| `text` | optional | Text of the piece to extract, looked for in the source of the method |
| `start` | optional | First character of the piece, counting from one. Sent instead of the text |
| `stop` | optional | Last character of the piece |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |

##### `smalltalk_refactor_extract_method`

Extract a piece of a method into a method of its own and send it instead. The piece is named by the text it is written with, or by the interval it occupies. Only code that is the same as the piece is replaced, and how far it is looked for is what replacing says.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method to extract from |
| `newSelector` | required | Selector of the method to create, with its keywords, as in totalFor:at: |
| `argumentNames` | optional | Names of the parameters of the new method, separated by commas, in the order of its keywords |
| `text` | optional | Text of the piece to extract, looked for in the source of the method |
| `start` | optional | First character of the piece, counting from one. Sent instead of the text |
| `stop` | optional | Last character of the piece |
| `replacing` | optional | Which pieces the new message replaces: selection for the one named, method for every piece of that method that is the same code, class for every piece of that class, hierarchy for every piece of that class and of all its subclasses. Defaults to selection |

##### `smalltalk_refactor_extract_method_from_similar_code`

Extract a piece of a method into a method of its own and send it wherever code like it is written, whatever differs between them becoming a parameter of it. Unlike extracting a method, the code it replaces is not the same as the piece named, so the new selector takes one keyword for each part that varies.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method to extract from |
| `newSelector` | required | Selector of the method to create, with one keyword for each part that varies between the pieces |
| `argumentNames` | optional | Names of the parameters of the new method, separated by commas, in the order of its keywords |
| `text` | optional | Text of the piece to extract, looked for in the source of the method |
| `start` | optional | First character of the piece, counting from one. Sent instead of the text |
| `stop` | optional | Last character of the piece |

##### `smalltalk_refactor_extract_to_temporary`

Extract a piece of a method into a temporary of it. The piece is named by the text it is written with, or by the interval it occupies. Replacing all of them replaces every piece that is the same expression, which is found in the parse tree and so does not include a comment or a string saying the same.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `variableName` | required | Name of the temporary to extract into |
| `text` | optional | Text of the piece to extract, looked for in the source of the method |
| `start` | optional | First character of the piece, counting from one. Sent instead of the text |
| `stop` | optional | Last character of the piece |
| `replaceAll` | optional | Whether every piece that is the same expression is replaced, true or false. Defaults to replacing only the one named |

##### `smalltalk_refactor_inline_method`

Replace the sends of a method by what the method does: every send the scope takes in, or one send alone when it is named by the method it is written in and by the text of its selector there, or the interval that selector occupies. The text has to fall on the selector of the send and not on its receiver. A send inside the method being inlined is left alone.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method to inline |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |
| `senderClassName` | optional | Name of the class whose method has the one send to inline. Left out to inline every send the scope takes in |
| `senderSelector` | optional | Selector of the method that has the one send to inline |
| `text` | optional | Text of the selector of the one send, looked for in the source of the sending method |
| `start` | optional | First character of the selector of the one send, counting from one. Sent instead of the text |
| `stop` | optional | Last character of it |
| `removeMethod` | optional | Whether the method is taken away once its sends are inlined, true or false |

##### `smalltalk_refactor_inline_temporary_variable`

Replace a use of a temporary by the value assigned to it. The use is named by the text it is written with, or by the interval it occupies when the text is written more than once.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `variableName` | required | Name of the temporary to inline |
| `text` | optional | Text of the use to replace, looked for in the source of the method |
| `start` | optional | First character of the use, counting from one. Sent instead of the text |
| `stop` | optional | Last character of the use |

##### `smalltalk_refactor_insert_superclass`

Insert a new class between a class and its superclass.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class to insert the new one above |
| `newClassName` | required | Name of the class to insert above it |

##### `smalltalk_refactor_move_to_instance_or_class_method`

Move a method from the instance side of a class to its class side, or back.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements it |
| `selector` | required | Selector of the method to move |

##### `smalltalk_refactor_push_down_instance_variable`

Move an instance variable of a class down to its subclasses.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable to push down |

##### `smalltalk_refactor_push_down_method_to_one_subclass`

Move a method down into one subclass of the class that implements it.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements it |
| `selector` | required | Selector of the method to push down |
| `subclassName` | required | Name of the subclass to push it down to |

##### `smalltalk_refactor_push_down_method_to_subclasses`

Copy a method down into every subclass of the class that implements it.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements it |
| `selector` | required | Selector of the method to push down |

##### `smalltalk_refactor_push_up_instance_variable`

Move an instance variable of a class up to its superclass.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable to push up |

##### `smalltalk_refactor_push_up_method`

Move a method up to the superclass of the class that implements it. The methods of that class it sends to itself, which the superclass does not implement, can go up with it, and a sibling class implementing the same method the same way can lose its copy.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements it |
| `selector` | required | Selector of the method to push up |
| `pushingUpDependantMethods` | optional | Whether the methods of the class this one sends to itself, directly or through them, and the superclass does not implement, are pushed up with it, true or false |
| `removingEquivalentMethodsFromSiblings` | optional | Whether a sibling class that implements a pushed up method the same way loses its copy, true or false |

##### `smalltalk_refactor_remove_instance_variable`

Remove an instance variable from a class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable to remove |

##### `smalltalk_refactor_remove_parameter`

Remove a parameter from a selector, in the implementors and the senders the scope takes in. It is refused when an implementor still uses the parameter.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the selector |
| `selector` | required | Selector to remove the parameter from |
| `parameterName` | required | Name of the parameter to remove |
| `parameterIndex` | optional | Position of the parameter, counting from one. Defaults to the first |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |

##### `smalltalk_refactor_remove_unreferenced_instance_variables`

Remove every instance variable of a class that no method reads or writes.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_refactor_rename_class`

Rename a class, in every method that names it.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class to rename |
| `newClassName` | required | Name to rename it to |

##### `smalltalk_refactor_rename_global`

Rename a global, in every method that names it.

| Parameter | | |
| --- | --- | --- |
| `globalName` | required | Name of the global to rename |
| `newGlobalName` | required | Name to rename it to |

##### `smalltalk_refactor_rename_instance_variable`

Rename an instance variable of a class, in every method that uses it.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable to rename |
| `newVariableName` | required | Name to rename it to |

##### `smalltalk_refactor_rename_selector`

Rename a selector, in the implementors and the senders the scope takes in around the class of the method named.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the selector |
| `selector` | required | Selector to rename |
| `newSelector` | required | Selector to rename it to |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |

##### `smalltalk_refactor_rename_temporary`

Rename a temporary or an argument of a method, in every use it has inside it.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `variableName` | required | Name of the temporary to rename |
| `newVariableName` | required | Name to rename it to |

##### `smalltalk_refactor_safely_remove_class`

Remove a class, refusing when something still refers to it.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class to remove |

##### `smalltalk_refactor_temporary_to_instance_variable`

Turn a temporary of a method into an instance variable of its class.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `variableName` | required | Name of the temporary to turn into an instance variable |

<!-- /tools -->

### MCPServerMethodFinder

Requires `MCPServer` and `MethodFinder`. One tool, `MethodFinder` itself: it answers what the
image already implements, which is worth asking before writing something new. Asking for
`'method'` expecting `'methods'` answers `CharacterSequence>>#asPlural`; asking for `#(1 2 3 4)`
expecting `#(1 3)` answers `#(1 2 3 4) select: [:aSmallInteger | aSmallInteger odd]` and the
`reject:` that sends `even`.

<!-- tools MCPServerMethodFinder MCPMethodFinderTools -->
##### `smalltalk_find_messages_by_example`

List the messages that answer an expected result when sent to a receiver, which tells whether the image already implements something before it is written. The receiver, the arguments and the expected result are sent as Smalltalk expressions. When the receiver is a collection that is not empty, the enumerating messages taking a block are looked for as well, the block being built from a message its elements understand, so a receiver of #(1 2 3 4) expecting #(1 3) answers select: along with the block it needs.

| Parameter | | |
| --- | --- | --- |
| `receiver` | required | Smalltalk expression for the object the message is sent to, such as 'method' |
| `expected` | required | Smalltalk expression for the result the message has to answer, such as 'methods' |
| `arguments` | optional | Smalltalk expression answering an Array with the arguments to send, such as #(4). Defaults to sending none |

<!-- /tools -->

### MCPServerLiveTyping

Requires `MCPServer` and `LiveTyping`. LiveTyping records, while the image runs, the classes every
variable held and every method answered; these tools read that. A list of types is led by the
class they all inherit from, or by `any` when the only one they share is `Object`, and ends with
`can be nil` when nil was assigned too. Code that has not run yet has no types.

What LiveTyping saw tells a send of a selector to an object of a class from a send of the same
name to anything else, which is what *actual* means here: `smalltalk_actual_senders_of` answers
the methods that really send a method — the ones a refactoring of it has to change — and
`smalltalk_actual_implementors_of` the methods a send to an object of a class could really reach.

<!-- tools MCPServerLiveTyping MCPLiveTypingTools -->
##### `smalltalk_actual_implementors_of`

List the implementors of a selector in the hierarchy of a class, which are the methods a send of it to an object of that class could really reach: the ones implemented by the class and by every subclass of the one highest up among its superclasses that implements it. The class does not have to implement the selector itself. What a send written in a method reaches is asked with the message sends of the method instead, because its receiver may have held classes of different hierarchies.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class the selector is sent to |
| `selector` | required | Selector that is sent |
| `includingPossible` | optional | Whether a class that answers the selector nowhere is listed too, saying so, true or false |

##### `smalltalk_actual_senders_of`

List the methods that really send a method: the ones LiveTyping saw sending its selector to an object of the class that implements it, or of one of its subclasses, which are the senders a refactoring of the method has to change. A method that writes the same selector but was seen sending it to anything else is not one of them, which is what tells this apart from listing the senders of a selector.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `includingPossible` | optional | Whether the sends LiveTyping could only guess at, whose receiver it never saw hold anything or saw incompletely, are listed too, true or false |

##### `smalltalk_message_sends_of_method`

List every message send written in a method, in the order they are written, each with the classes LiveTyping saw its receiver hold, the methods the send really reaches, and the classes the send answered. The methods reached are the implementors of the selector in the hierarchy of each class the receiver was seen holding, classes that need not share a hierarchy, because a send in source code reaches whatever its receiver turned out to be. A send to something LiveTyping never saw hold anything reaches no method here, and a send the compiler inlines, such as ifTrue:, is not listed. A list of types is led by the class they all inherit from, or by any when the only one they share is Object, and ends with can be nil when nil was assigned too. A capitalized name is a class and a lowercase one is a mark. A variable that held a single class is listed as that class alone.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `sentSelector` | optional | Selector of the sends to list. Without it every send of the method is listed |

##### `smalltalk_return_types_of_method`

List the classes a method has answered while the image ran. The name self means it answered its receiver. A list of types is led by the class they all inherit from, or by any when the only one they share is Object, and ends with can be nil when nil was assigned too. A capitalized name is a class and a lowercase one is a mark. A variable that held a single class is listed as that class alone.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |

##### `smalltalk_types_of_instance_variable`

List the classes an instance variable has held, as LiveTyping saw them while the image ran. A variable of code that has not run yet holds none. A list of types is led by the class they all inherit from, or by any when the only one they share is Object, and ends with can be nil when nil was assigned too. A capitalized name is a class and a lowercase one is a mark. A variable that held a single class is listed as that class alone.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable |

##### `smalltalk_types_of_instance_variables`

List, for every instance variable of a class, the classes it has held while the image ran. A list of types is led by the class they all inherit from, or by any when the only one they share is Object, and ends with can be nil when nil was assigned too. A capitalized name is a class and a lowercase one is a mark. A variable that held a single class is listed as that class alone.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class, or of its class side as in MCPServer class |

##### `smalltalk_types_of_method_variable`

List the classes a parameter or a temporary of a method has held while the image ran. A list of types is led by the class they all inherit from, or by any when the only one they share is Object, and ends with can be nil when nil was assigned too. A capitalized name is a class and a lowercase one is a mark. A variable that held a single class is listed as that class alone.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `variableName` | required | Name of the parameter or temporary |

<!-- /tools -->

#### What it adds to the tools of MCPServer

| Tool | With LiveTyping |
| --- | --- |
| `smalltalk_method_source` | Answers `returns` and `variables` next to `source`: the classes the method answered, and the ones each parameter, temporary and instance variable of its class held |
| `smalltalk_class_definition` | Answers `instanceVariableTypes`: the classes each instance variable held |
| `smalltalk_senders_of` | Answers `actual` next to `methods`: the ones LiveTyping saw really sending the selector to an object of the class named in the new optional `className`, or of one of its subclasses; without a class, to an object of any class that implements it. A method in `methods` and not in `actual` writes the selector for something else |
| `smalltalk_implementors_of` | Takes an optional `className` and answers, in `actual`, the implementors in the hierarchy of that class — the ones a send to an object of it could really reach |

### MCPServerLiveTypingRefactorings

Requires `MCPServer` and `LiveTyping`. No tool of its own: it decorates the six refactorings of
`MCPServer` that work over a scope, so that they take two more values for it, and one of them is
the default when the package is loaded:

| Scope | |
| --- | --- |
| `actual` | Only the sends LiveTyping saw really reaching an object of the class of the method, or of one of its subclasses, are changed; a send of the same name to anything else is left alone. **The default with this package loaded** |
| `actualAndPossible` | `actual`, and as well the sends LiveTyping could only guess at, whose receiver it never saw hold anything or saw incompletely |

| Tool | Under `actual` |
| --- | --- |
| `smalltalk_refactor_rename_selector` | Renames the implementors and the senders LiveTyping saw |
| `smalltalk_refactor_change_keywords_order` | Reorders them |
| `smalltalk_refactor_remove_parameter` | Removes it from them |
| `smalltalk_refactor_add_parameter` | Gives the value to the senders it saw |
| `smalltalk_refactor_extract_as_parameter` | Gives the piece to the senders it saw |
| `smalltalk_refactor_inline_method` | Inlines every send it saw really reaching an object of the class that implements the method. A send named by `senderClassName` and `senderSelector` is inlined alone whatever the scope |

Any other scope is answered by the tool as it is without LiveTyping, so `scope: system` still
renames everything.

### MCPServerExtraRefactoring

Requires `MCPServer` and `ExtraRefactorings` (from Cuis-Smalltalk-Refactoring): the refactorings
that make new classes and move code between classes.

<!-- tools MCPServerExtraRefactoring MCPExtraRefactoringTools -->
##### `smalltalk_refactor_extract_class`

Extract instance variables and methods of a class into a new class of its own, which the class they came from reaches through a new instance variable.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class to extract from |
| `newClassName` | required | Name of the class to create |
| `instanceVariableName` | required | Name of the instance variable that will hold the new class |
| `variableNames` | optional | Names of the instance variables to extract, separated by commas |
| `selectors` | optional | Selectors of the methods to extract, separated by commas |

##### `smalltalk_refactor_extract_parameter_object`

Gather some of the parameters of a method into an object of a new class, which the method then takes in their place, in the senders the scope takes in. The parameters are named, not numbered: where each one stands is what the method already says.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method |
| `newClassName` | required | Name of the class the parameters are gathered into |
| `parameterNames` | required | Names of the parameters to gather, separated by commas |
| `superclassName` | optional | Name of the superclass of the new class. It has to exist already |
| `category` | optional | Class category to make the new class in. Defaults to the one of the class it came from |
| `scope` | optional | Where the sends to change are looked for: `class`, `hierarchy`, `category`, `hierarchyAndCategories` or `system` — see [Refactoring scope](#refactoring-scope). Defaults to `system` |

##### `smalltalk_refactor_extract_to_method_object`

Turn a method into an object of a new class of its own, which answers what the method did when it is sent the selector it is evaluated with. Everything the method uses is held by the new object: each parameter of the method, each instance variable of its class it reads, each global it names that is not in the system yet, and its receiver when it sends to itself; and the object is created with a message that takes all of them.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method to turn into an object |
| `newClassName` | required | Name of the class the method becomes |
| `evaluationSelector` | optional | Selector the new object is sent to do what the method did |
| `superclassName` | optional | Name of the superclass of the new class. It has to exist already |
| `category` | optional | Class category to make the new class in. Defaults to the one of the class it came from |
| `instanceVariableNames` | optional | The instance variable the new object holds each thing the method uses in, as pairs of the form variable=instanceVariable separated by commas, self among the variables when the method sends to itself. One left out is held under its own name, and self as receiver |
| `instanceCreationMessage` | optional | The message the new object is created with, as pairs of the form keyword=variable separated by commas, in the order the keywords are sent, one for each thing the method uses. A third part, keyword=variable=parameter, names the parameter of that keyword; without it the parameter is named after the instance variable with an article. Left out to take each in turn under the name of its instance variable: self first, then the parameters of the method, then the instance variables of its class |

##### `smalltalk_refactor_move_instance_variable`

Move an instance variable to another class, which the class it is moved from reaches through an instance variable of its own.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that has the instance variable |
| `variableName` | required | Name of the instance variable to move |
| `targetClassName` | required | Name of the class to move it to |
| `accessingThrough` | required | Name of the instance variable that holds the class it is moved to |

##### `smalltalk_refactor_move_method`

Move a method to the class of the object it will be sent to, which the class it is moved from reaches through the receiver named: a variable of its own or of the method, or a global. A class is a global, so a method moved to a class becomes a class method of it. When the moved method still needs what it was moved from, it is given as a parameter named here.

| Parameter | | |
| --- | --- | --- |
| `className` | required | Name of the class that implements the method |
| `selector` | required | Selector of the method to move |
| `receiver` | required | What the moved method is sent to from the class it is moved from: an instance variable, a class variable or a parameter of the method, holding an object of the class named in targetClassName, or a global, to the class of whose object the method goes. A class is a global, and a method moved to one becomes a class method of it |
| `targetClassName` | optional | Name of the class the method is moved to, which is the class of the object the receiver holds. Needed when the receiver is a variable; left out when it is a global, whose class is where the method goes |
| `extraParameterName` | optional | Name of the parameter the moved method takes to reach what it was moved from. Left out when it needs none |
| `extraParameterKeyword` | optional | Keyword the moved method takes that parameter with, when it is a keyword selector that needs a new keyword for it. Left out otherwise |

<!-- /tools -->

### MCPServerExtraLiveTypingRefactorings

Requires `MCPServer`, `MCPServerExtraRefactoring`, `MCPServerLiveTypingRefactorings` and
`ExtraRefactoringsLiveTyping`. No tool of its own: it decorates three tools of
`MCPServerExtraRefactoring`.

| Tool | With LiveTyping |
| --- | --- |
| `smalltalk_refactor_extract_parameter_object` | Takes `actual` and `actualAndPossible` as the scope, `actual` being the default, like the six above |
| `smalltalk_refactor_move_method` | Takes a `scope`: send `actual` to move the method to the class LiveTyping saw the variable named as `receiver` hold, which needs no `targetClassName`; send nothing to move it to the class named there, or to the class of the global named as receiver |
| `smalltalk_refactor_move_instance_variable` | Takes a `scope`: send `actual` to move the variable to the class LiveTyping saw `accessingThrough` hold, which needs no `targetClassName` |

## Tests

Each package has a test package next to it, listed in [Loading the server](#loading-the-server).
They run a server over a mock transport and a mock client that speaks real JSON-RPC to it, so
every tool is exercised the way a real client would, and each test class builds its server with
only the tool groups and decorators it tests. Run them from the image, or through the server:
`smalltalk_run_tests_in_category` with `MCPServerTests`, `MCPServerLiveTypingTests`,
`MCPServerLiveTypingRefactoringsTests`, `MCPServerExtraRefactoringTest`,
`MCPServerExtraLiveTypingRefactoringsTests` or `MCPServerMethodFinderTests`.

## Known shortcomings of the refactorings

Driving the refactorings through these tools shows where they fall short — a moved method that
loses its category, an inline that leaves a period behind, senders that are not rewritten. They are
kept in [TODO-refactorings.md](TODO-refactorings.md).
