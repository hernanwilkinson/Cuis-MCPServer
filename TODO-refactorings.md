# Refactorings — to do

Errors and shortcomings found in the refactorings while driving them through the MCP tools
(session of 2026-09-09). Each entry says what was observed, where, and what the fix should be.

## MoveToInstanceOrClassMethod

- [x] **Senders on the side the method leaves are not rewritten.** Done in the image: `MoveToInstanceOrClassMethod for:implementors:senders:` takes a scope like rename selector, moves every implementor on the same side and redirects the senders (`self` ↔ `self class`, the class by name to `self` or `X new`, `X new` to `X`); with LiveTyping, any receiver it saw hold the instance or the class. The applier shows the implementors and senders windows (`MoveToInstanceOrClassMethodTest` 06–24, `MoveToInstanceOrClassMethodInActualScopeTest`). `moveMethod` recompiles the
  same source on the other side and removes the original; a `self foo` sender left behind on
  the instance side breaks (`MessageNotUnderstood`). Seen moving
  `MCPRefactoringTool>>acceptedWarningsPropertyName` to the class side:
  `acceptedWarningsProperty` kept sending `self acceptedWarningsPropertyName`, and the live
  move tool — itself an `MCPRefactoringTool` — failed on the next call.
  Fix: rewrite `self foo` → `self class foo` in the instance side when moving up, and
  `self class foo` → `self foo` on the class side when moving down; the same for senders in
  other classes that name the class (`Foo new foo` / `Foo foo`) is harder and may stay a warning.
- [x] **A moved method whose body sends `self class bar`** Done in the image: the body is retargeted so every `self` send keeps reaching the method its side resolved: `self class bar` → `self bar` going up, `self bar` → `self class bar` going down when the sides resolve `bar` differently, and a body going up that sends to itself something the class side resolves differently is refused (`MoveToInstanceOrClassMethodTest` 25–33). Originally: ends up on the class side sending
  `self class bar` to the metaclass. Not hit, but it is the mirror of the case above.

## PushUpMethod

- [x] **Pushing up the dependant methods misses a keyword one.** Done in the image: not the keyword, the nesting — `MessageNode>>sendsMessageToSelf:` only saw a send that was a whole statement (`^ self foo`), so one nested as a receiver (`self foo + 1`), an argument, a cascade, an assignment or a brace was missed, and `receiver referencesSelf` matched a receiver merely containing `self`. Now the receiver has to be `self` and the search recurses through receivers, arguments, cascades, assignments and braces (`PushUpMethodTest` 25–28). The self-recursion warning of the parser, which shares the message, sees a nested recursive send too. Pushing up
  `MCPModelStructureToolsTest>>methodIn:source:category:`, whose body is
  `^(self methodIn: aClassName source: aSource) at: ... ; yourself`, with *push up the dependant
  methods* moved only itself; `methodIn:source:` — sent to self, not implemented by the superclass —
  stayed behind and had to be pushed up in a second call. Either the dependants are looked for
  among unary sends only, or a send that is the receiver of a cascade is not seen.

## MCP tool findings (fixed on the way)

- [x] **`refactor_extract_method` refused a piece using a variable unless `argumentNames`
  was sent**, although the property is optional: the asked names were counted against the
  parameters even when none were asked. Fixed in `MCPRefactoringTools>>namesRenaming:asAskedIn:`.
- [x] **`refactor_add_parameter` failed with `String>>isKeyword` on a keyword selector**:
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
- [x] **RemoveParameter leaves `(self m1) yourself` when the pair is no longer needed, and AddParameter produces `self m1: 1 yourself` when one becomes needed.** Done in the image: whenever a selector change alters the precedence of the send, `ChangeSelector>>addParenthesesRangesOf:to:` adds, next to the keyword edits of every send, the edits `ExpressionReplacement` answers for the send kept in place (`of:in:withPrecedence:` and `parenthesesEdits`): every pair around it goes and one comes back only where the parent needs it. The sends come from `MethodNode>>messageSendRangesOf:ifAbsent:`; the edits are sorted with `<=` so an insertion and the closing parenthesis at the same position keep their order. `RemoveParameterTest` 19 to 21, `AddParameterTest` 36 (no longer an expected failure) to 39, `ExpressionReplacementTest` 16 to 20.
- [x] **InlineMethod wrapped any message inside a message.** Done in the image: `InlineMethod>>statementWithMessageSend:usedIn:inlinedWith:withPrecedence:` replaces the send through `ExpressionReplacement` with the precedence of the inlined expression (`ParseNode>>expressionPrecedence`: 0 for a literal, variable, block or brace, the message precedence, 4 for a cascade or an assignment), so `(self m1) printString` with a unary body becomes `3 factorial printString` and a binary body used as a keyword argument is not wrapped (`InlineMethodTest` 40, 41; 31 now expects `10 + 5 * 3`, the way the printer writes it). `addParenthesesIfNeededTo:` and `messageSendIsInsideMessageNode:` are gone.
- [x] **InlineTemporaryVariable had its own walk over unary, infix and keyword parents.** Done in the image: every reference is replaced through `ExpressionReplacement` with the precedence of the assigned value (`InlineTemporaryVariable>>replaceReference:with:withPrecedence:`), and the value's own parentheses are trimmed first. Two expectations were wrong code and changed: `self m2: self m1: 1` is now `self m2: (self m1: 1)` and `2 * self m2: 5` is `2 * (self m2: 5)` (`InlineTemporaryVariableTest` 06, 15, 16, 17 corrected, 34 added for a cascade). Since a variable referenced twice shares one parse node, `ExpressionReplacement` now tells the receiver from an argument by position, not identity (`ExpressionReplacementTest>>test21`).
- [x] **RemoveParameter garbled a send nested in an argument of the same selector.** Done in the image: `self m1: (self m1: 1)` losing the parameter gave `self m1self m1`, because the keyword edit of the outer send removed `m1: (self m1: 1)` whole while the inner send's edits still applied inside it. `ChangeSelector>>rangesToKeywordsOf:` now drops every edit that lies inside another edit's removed range (`ChangeSelector>>withoutTheRangesToNewStringsInsideAnotherOf:`, `Interval>>strictlyIncludesRange:`), so the result is `self m1` (`RemoveParameterTest>>test22`, `ExpressionReplacementTest>>test22`).
- [x] **The actual-scope variants re-parenthesized every send, not only the ones in scope.** Done in the image: removing the parameter of `m1:` with `self m1: (self m1: 1). Juan new m1: (Juan new m1: 1)` left `Juan new m1: Juan new m1: 1` when only the sends to self were in scope. `ChangeSelector>>addParenthesesRangesOf:to:` now asks `sendRangesToReparenthesizeIn:`, every send by default; `RemoveParameterWithActualScope` and `AddParameterWithActualScope` answer only the actual sends through the new `MethodNode>>actualMessageSendRangesOfAll:ifAbsent:withPossibleMessageSends:` (LiveTyping). `RemoveParameterWithActualScopeTest` and `AddParameterWithActualScopeTest` 14.
- [x] **RenameSelectorWithActualScope re-parenthesized every send when the precedence changed.** Done in the image: renaming a binary selector to a keyword one, or back, goes through the same parentheses pass, so it narrows it to the actual sends too (`RenameSelectorWithActualScopeTest>>test13`; `RenameSelectorTest` 34 and 35 pin the base case). Inlining, extracting as a parameter and gathering parameters in the actual scope were checked and already right (`InlineMethodWithActualScopeTest`, `ExtractAsParameterWithActualScopeTest`, `ExtractParameterObjectTest>>test24`, `MCPExtraLiveTypingRefactoringToolsTest>>testGatheringParametersInTheActualScopeKeepsTheParenthesesTheSendNeeds`).
- [x] **MoveInstanceVariable did not parenthesize a cascade assigned to the moved variable.** Done in the image: `iv5 := OrderedCollection new add: x; yourself` moved through `iv2` gave `iv2 iv5: OrderedCollection new add: x; yourself`, one cascade on `iv2`. `CodeForNodeOnMethod>>visitAssignmentNode:` now asks the value `requiresParenthesesAsAKeywordArgument`, like move method (`MoveInstanceVariableTest>>test47`).
- [x] **ExtractParameterObject wrapped every getter send of a gathered parameter in parentheses.** Done in the image: `(aParameterClass a) + b + (aParameterClass c)` is now `aParameterClass a + b + aParameterClass c`, since a unary send needs none anywhere (`ExtractParameterObject>>replaceParametersWithParameterObjectGetters`; `ExtractParameterObjectTest>>test25`, nine expectations corrected). The actual-scope variants inherit both, checked through the MCP tools (`MCPExtraLiveTypingRefactoringToolsTest`: the moved cascade, the moved assignment used as a receiver, the getter without parentheses).
- [x] **The extra refactorings with actual scope had no tests of their own.** Done in the image, in a new package `ExtraRefactoringsLiveTypingTest`: `ExtractParameterObjectWithActualScopeTest` (the sends it saw, a possible send when told to, a send to another class left alone, the kept parentheses, the getter without them), and `MoveMethodWithActualScopeApplierTest` / `MoveInstanceVariableWithActualScopeApplierTest` for the class the appliers suggest from what LiveTyping saw an instance variable or a parameter hold. The two `initialAnswerForInstanceVariable:in:` now read their parameters instead of the applier's own state, which is what made them testable without a window. The seven tests of `MCPServerExtraLiveTypingRefactoringsTests` that repeated those facts through the tools are gone; the five left are about the tools.
- [x] **`CodeForNodeToMove` (move method) wrapped the value of a moved assignment only when it was a keyword message or an assignment.** Done in the image: it now asks the value's `expressionPrecedence`, so a cascade assigned to a moved instance variable is parenthesized too (`MoveMethodTest` 208; 207 and 209 pin the assignment used as a receiver and as a super-send argument, which were already right). The generated text is new code, not a replacement in a method, so it does not go through `ExpressionReplacement`.

- [x] **Extracting the receiver of a cascade written in parentheses failed from the browser.** Done in the image: `SourceCodeOfMethodToBeExtractedPrecondition` took the whole cascade as the initial node whenever the selection was inside one, so the covered range began at the cascade's `(` and *the selected code contains an invalid expression* was signalled; and `EquivalentNodesFinder` reported the receiver twice, once as a partial cascade and once by the plain visit, so the browser offered the repeated-code window instead of extracting (`ExtractMethodFinderTest>>test61`).

## RemoveParameter

- [x] **Leaves the whitespace of the removed keyword behind.** Done in the image: when the last keyword goes and the selector stays a keyword one, the separators before it go with it, in implementors and senders (`RemoveParameterTest` 08 corrected, 17 and 18 added). Removing `ofImageNamed:` from
  `MCPJsonLinesCallLog class>>toFile:ofImageNamed:`, `writingWith:ofImageNamed:` and the
  `initialize…` left a trailing space after every rewritten selector (`toFile: aFileName `), a
  dangling indented empty line where the keyword stood in a multi-line send, and a space before
  the closing parenthesis of a sender (`toFile: aFileName )`). Five methods cleaned by hand.
  Fix: take the keyword out together with the separators around it.

## MoveMethod (ExtraRefactorings)

- [x] **Moving through a global keeps the global in the moved body.** Done: `CodeForNodeToMove>>visitLiteralVariableNode:` asks first whether the literal is the variable moved through and writes `self` (`MoveMethodTest` 702, 703). Moving
  `MCPRefactoringToolGroup>>applyReportingChanges:` with `MCPRefactoringApplier` as the
  receiver produced `MCPRefactoringApplier class>>applyReportingChanges:` whose body is still
  `^(MCPRefactoringApplier applying: aRefactoring) applyReportingChanges`; it should be
  `self applying: aRefactoring`, the way a send through an instance variable becomes a send to
  `self`.
- [x] **The moved method loses its category.** Done: `CodeForNodeToMoveResult>>compileInTargetClassUnder:` compiles it under the category it came from (`MoveMethodTest` 800, 801). It was filed under `as yet unclassified` in the
  target class (`MCPRefactoringApplier class`); the source method was in `applying`.
  Fix: classify it under the category it came from, creating it in the target when needed.
- [x] **The delegation left behind is not formatted.** Done: `MoveMethod>>replaceMethodForDelegation` writes the empty line and no period (`MoveMethodTest` 802), and the generated getters, setters and `CHANGE_ME_super_` collaborations go through `CodeForNodeToMove>>sourceOfMethod:returning:` with the same layout. It was compiled as
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
  `evaluate`) blocks that MCP request until someone proceeds it in the image or the
  1800 s timeout ends it. `RefactoringWarning` is handled now by `MCPRefactoringTool`; the
  general case is open, and it cannot be a blanket `on: Warning` because of the entry above.
