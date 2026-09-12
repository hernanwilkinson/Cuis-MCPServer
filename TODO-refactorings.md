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

## PushUpMethod

- [x] **Pushing up the dependant methods misses a keyword one.** Done in the image: not the keyword, the nesting — `MessageNode>>sendsMessageToSelf:` only saw a send that was a whole statement (`^ self foo`), so one nested as a receiver (`self foo + 1`), an argument, a cascade, an assignment or a brace was missed, and `receiver referencesSelf` matched a receiver merely containing `self`. Now the receiver has to be `self` and the search recurses through receivers, arguments, cascades, assignments and braces (`PushUpMethodTest` 25–28). The self-recursion warning of the parser, which shares the message, sees a nested recursive send too. Pushing up
  `MCPModelStructureToolsTest>>methodIn:source:category:`, whose body is
  `^(self methodIn: aClassName source: aSource) at: ... ; yourself`, with *push up the dependant
  methods* moved only itself; `methodIn:source:` — sent to self, not implemented by the superclass —
  stayed behind and had to be pushed up in a second call. Either the dependants are looked for
  among unary sends only, or a send that is the receiver of a cascade is not seen.

## MCP tool findings (fixed on the way)

- [x] **`smalltalk_refactor_extract_method` refused a piece using a variable unless `argumentNames`
  was sent**, although the property is optional: the asked names were counted against the
  parameters even when none were asked. Fixed in `MCPRefactoringTools>>namesRenaming:asAskedIn:`.
- [x] **`smalltalk_refactor_add_parameter` failed with `String>>isKeyword` on a keyword selector**:
  the keyword reached `AddParameter` as a string, and the only test added to a unary selector.
  Fixed: the keyword property answers a symbol; test added for a keyword selector.

## InlineMethod

- [x] **Leaves a period after the inlined statement.** Done in the image (`InlineMethod>>replaceRange:withNewSourceCode:inMethod:` drops the copied period when a `]`, a period or the end of the source follows and the sender had none; `InlineMethodTest` 34 and 35, seven expectations corrected). Inside a block the result is
  `[ :aMethod | MCPRefactoringApplier applyReportingChanges: (...). ]`, and a returned
  statement ends with `^... .` at the end of the method. Seen in the 32 senders of the eight
  `applying` methods of `MCPRefactoringToolGroup` inlined in the `hierarchy` scope. Harmless
  to the compiler, but every inlined method has to be cleaned by hand.
  Fix: when the replaced send is the last statement of its block or method, do not add the
  period (or take the one the original statement had, and only that one).

- [x] **Drops the parentheses around an inlined cascade.** Done in the image (`InlineMethod>>statementWithMessageSend:usedIn:lastStatement:replacement:` now adds parentheses when the inlined expression is a cascade, as it already did for a message send; `InlineMethodTest` 37 and 38). Inlining `keyword ^OrderedCollection new add: 1; yourself` into `at: 1 put: (self keyword); yourself` produced `at: 1 put: OrderedCollection new add: 1; yourself; yourself`, which parses as one cascade on `Dictionary new`.

- [x] **Keeps the implementor's indentation on the lines of a multi-line statement.** Done in the image: the lines after the first of each inlined statement are re-based from the implementor's indentation to that of the sender line (`MessageNodeReference>>lineIndentation`, `InlineMethodTest>>test39`). Inlining a cascade written at one tab into a sender line at two tabs left `add: 1;` at two tabs instead of three.

- [ ] **Refuses a method with an early return.** `MCPServer>>handleRequest:` answered `^nil` from an
  `ifAbsent:` block and its value at the end; inlining it fails with *Method to inline has more
  than one possible return value*. It had to be rewritten as a single `at:ifPresent:ifAbsent:`
  expression by hand before the refactoring would take it. An early return that is the last
  statement of a block could be inlined as an `ifTrue:ifFalse:` / `ifPresent:ifAbsent:` around the
  rest, at least when there are two.
- [x] **Loses the layout of the inlined body.** Done in the image: the last inlined statement is indented like the others, and a temporaries declaration inserted at method level is followed by an empty line (`InlineMethodTest>>test36`). Inlining `handleRequest:` (with temporaries) into
  `responseTo:` produced `| id params |` followed by the statements with no empty line, and the
  return statement flush left (`^aRequest` at column 0). Fix: format the inlined statements as a
  method body — empty line after the temporaries, one tab of indentation.

## ExtractMethod

- [x] **The extracted method is written one indentation level too many.** Done in the image:
  `ExtractMethodNewMethodSourceCode>>sourceCodeToExtractIndentedAsAMethodBody` re-bases the
  piece on the indentation of the line it starts on and gives it the body's one tab, through
  `CharacterSequence>>indentationOfLineAt:` and `withIndentation:replacedBy:`; a piece starting
  on the selector line is left as written (`ExtractMethodTest` 161 added, 152 corrected).
  **The space after the return stays**: `^ ` is the convention of the whole suite (the sender
  gets `^ self m2` too) and of ~100 expectations — a decision, not a defect fix.
- [ ] **The extracted method is written with a space after the return.** Extracting the class-side dictionary out of `MCPModelStructureTools>>classSourceOf:`
  produced `^ OrderedDictionary new` and the cascade lines with three tabs instead of two — the
  indentation of the piece where it stood, kept as it was, plus a tab. Fix: `^` without a space,
  and re-indent the piece so its first line starts at one tab.

- [x] **Extracting a cascade written inside parentheses from the browser fails with a parse
  error.** The tool's tests passed because they build the replacement from the interval given;
  the browser goes through `ExtractMethodReplacementsFinder`, which takes the cascade's
  *complete source range* — and `Parser>>createCascadeNodeWith:and:` ended a cascade's range at
  `hereMark + 1`, one past the start of the token *after* the cascade, so a cascade in
  parentheses ranged over its `)` and whatever followed (`);`). The replacement then swallowed
  those characters and `m1` no longer parsed; the same bad range made the finder report a second,
  garbage replacement. Done in the image: the range ends at the last message's own range end
  (`ParserTest>>testACascadeInParenthesesRangesOverItselfAndItsParentheses`), and
  `SourceCodeOfMethodToBeExtractedPrecondition>>intervalCoversCompleteAstNodes` accepts the
  initial node's start with or without its parentheses, since a cascade's complete range now
  includes them the way a message's does.

- [x] **Leaves parentheses the new send does not need, or doubles them.** Done in the image. Extracting `(3 + 4) factorial` to a unary message gave `(self m2) factorial`; `((42))` gave `((self m2))`; `(2 + arg) * 3` to a keyword message gave `((self m2: arg)) * 3`, one pair from the source and one added for precedence; a cascade in parentheses gave `at: 1 put: (self m2);`. The decision now lives in one object, `ExpressionReplacement` (`of:in:by:withPrecedence:`), which replaces the range together with every pair of parentheses around it and writes the new expression with exactly one pair when the parent node needs it (`ParseNode>>requiresParenthesesToReplace:withAnExpressionOfPrecedence:` on `MessageNode` and `CascadeNode`; precedence 1 to 4 named on `ParseNode class`). `ExtractMethodReplacement` is its first client, with the precedence of the send collaboration from `ExtractMethodProgrammer>>sendCollaborationPrecedence` (`ExpressionReplacementTest`, `ExtractMethodTest` 162 to 165 and 167, 019, 038 and 161 corrected, `SourceCodeIntervalTest` 26 and 27).
- [ ] **The same parentheses problem in the other refactorings**, to be moved onto `ExpressionReplacement` one at a time: `RemoveParameter` leaves `(self m1) yourself` when the pair is no longer needed; `AddParameter` produces `self m1: 1 yourself` when a pair becomes needed; `InlineMethod` (`addParenthesesIfNeededTo:`, `messageSendIsInsideMessageNode:`) wraps any message inside a message; `InlineTemporaryVariable` has its own walk over unary, infix and keyword parents; `CodeForNodeToMove` wraps assignments only.

- [x] **Extracting the receiver of a cascade written in parentheses failed from the browser.** Done in the image: `SourceCodeOfMethodToBeExtractedPrecondition` took the whole cascade as the initial node whenever the selection was inside one, so the covered range began at the cascade's `(` and *the selected code contains an invalid expression* was signalled; and `EquivalentNodesFinder` reported the receiver twice, once as a partial cascade and once by the plain visit, so the browser offered the repeated-code window instead of extracting (`ExtractMethodFinderTest>>test61`).

## RemoveParameter

- [x] **Leaves the whitespace of the removed keyword behind.** Done in the image: when the last keyword goes and the selector stays a keyword one, the separators before it go with it, in implementors and senders (`RemoveParameterTest` 08 corrected, 17 and 18 added). Removing `ofImageNamed:` from
  `MCPJsonLinesCallLog class>>toFile:ofImageNamed:`, `writingWith:ofImageNamed:` and the
  `initialize…` left a trailing space after every rewritten selector (`toFile: aFileName `), a
  dangling indented empty line where the keyword stood in a multi-line send, and a space before
  the closing parenthesis of a sender (`toFile: aFileName )`). Five methods cleaned by hand.
  Fix: take the keyword out together with the separators around it.

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
- [x] **Publish the base-image change that lets a global be the receiver.** Done: commit `9f658f6` of Cuis-Smalltalk-Refactoring.
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
