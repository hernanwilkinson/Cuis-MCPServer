# Refactorings — to do

Errors and shortcomings found in the refactorings while driving them through the MCP tools
(session of 2026-09-09). Each entry says what was observed, where, and what the fix should be.

## MoveToInstanceOrClassMethod

- [ ] **Senders on the side the method leaves are not rewritten.** `moveMethod` recompiles the
  same source on the other side and removes the original; a `self foo` sender left behind on
  the instance side breaks (`MessageNotUnderstood`). Seen moving
  `MCPRefactoringTool>>acceptedWarningsPropertyName` to the class side:
  `acceptedWarningsProperty` kept sending `self acceptedWarningsPropertyName`, and the live
  move tool — itself an `MCPRefactoringTool` — failed on the next call.
  Fix: rewrite `self foo` → `self class foo` in the instance side when moving up, and
  `self class foo` → `self foo` on the class side when moving down; the same for senders in
  other classes that name the class (`Foo new foo` / `Foo foo`) is harder and may stay a warning.
- [ ] **A moved method whose body sends `self class bar`** ends up on the class side sending
  `self class bar` to the metaclass. Not hit, but it is the mirror of the case above.

## InlineMethod

- [ ] **Leaves a period after the inlined statement.** Inside a block the result is
  `[ :aMethod | MCPRefactoringApplier applyReportingChanges: (...). ]`, and a returned
  statement ends with `^... .` at the end of the method. Seen in the 32 senders of the eight
  `applying` methods of `MCPRefactoringToolGroup` inlined in the `hierarchy` scope. Harmless
  to the compiler, but every inlined method has to be cleaned by hand.
  Fix: when the replaced send is the last statement of its block or method, do not add the
  period (or take the one the original statement had, and only that one).

- [ ] **Refuses a method with an early return.** `MCPServer>>handleRequest:` answered `^nil` from an
  `ifAbsent:` block and its value at the end; inlining it fails with *Method to inline has more
  than one possible return value*. It had to be rewritten as a single `at:ifPresent:ifAbsent:`
  expression by hand before the refactoring would take it. An early return that is the last
  statement of a block could be inlined as an `ifTrue:ifFalse:` / `ifPresent:ifAbsent:` around the
  rest, at least when there are two.
- [ ] **Loses the layout of the inlined body.** Inlining `handleRequest:` (with temporaries) into
  `responseTo:` produced `| id params |` followed by the statements with no empty line, and the
  return statement flush left (`^aRequest` at column 0). Fix: format the inlined statements as a
  method body — empty line after the temporaries, one tab of indentation.

## MoveMethod (ExtraRefactorings)

- [ ] **Moving through a global keeps the global in the moved body.** Moving
  `MCPRefactoringToolGroup>>applyReportingChanges:` with `MCPRefactoringApplier` as the
  receiver produced `MCPRefactoringApplier class>>applyReportingChanges:` whose body is still
  `^(MCPRefactoringApplier applying: aRefactoring) applyReportingChanges`; it should be
  `self applying: aRefactoring`, the way a send through an instance variable becomes a send to
  `self`.
- [ ] **The moved method loses its category.** It is filed under `as yet unclassified` in the
  target class (`MCPRefactoringApplier class`); the source method was in `applying`.
  Fix: classify it under the category it came from, creating it in the target when needed.
- [ ] **The delegation left behind is not formatted.** It is compiled as
  `applyReportingChanges: aRefactoring\n\t^MCPRefactoringApplier applyReportingChanges: aRefactoring.`
  — no empty line after the selector and a trailing period.
  Fix: `selector\n\n\t^receiver selector` like every other generated method.
- [ ] **Publish the base-image change that lets a global be the receiver.**
  `MoveMethod class>>methodNamed:from:to:accessingThrough:parameterNeeded:` now accepts a
  global (`is:aVariableOf:reachedIn:`, `isGlobalNamed:`; the no-assignment warning only for
  variables) and `MoveMethodTest>>test701CanMoveInstanceMethodToTheClassOfWhatAGlobalHolds`
  covers it. Both live only in the image: the ExtraRefactorings package is not in this repo.

## Refactorings that compile before they declare

- [ ] **`PushUpMethod`, `ExtractMethod` and `TemporaryToInstanceVariable` signal
  `UndeclaredVariableWarning` while applying.** They compile a method that names a variable
  before the variable is declared where it is compiled (the instance variable pushed up after
  the method, the temporary turned into an instance variable after the method that used it is
  recompiled, the extracted method with its parameters), and only work because
  `UndeclaredVariableWarning>>defaultAction` declares the name, logs `(x is Undeclared)` to the
  Transcript and answers `true`. A handler of `Warning` around them turns every one of them
  into a failure — that is how it was found: `handleMethod:with:identifiedAs:` catching
  `Warning` made six tests of `MCPRefactoringToolsTest` fail
  (`testARefactoringGoesOnThroughAnAcceptedWarning`, `…EveryAcceptedWarning`,
  `testExtractMethodFromSimilarCodeMakesWhatDiffersAParameter`,
  `testExtractMethodRefactoringNamesTheParameterOfTheNewMethodAsAsked`,
  `testTemporaryToInstanceVariableRefactoring…` ×2).
  Fix: declare first, compile after; or compile once, at the end, when everything is declared.

## Warnings and headless clients

- [ ] **`Warning>>defaultAction` opens a `Debugger` and waits.** Any `Warning` a tool does not
  handle (a `RefactoringWarning` before this session, and still any other `Warning`, e.g. from
  `smalltalk_evaluate`) blocks that MCP request until someone proceeds it in the image or the
  1800 s timeout ends it. `RefactoringWarning` is handled now by `MCPRefactoringTool`; the
  general case is open, and it cannot be a blanket `on: Warning` because of the entry above.
