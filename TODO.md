# MCPServer — to do

## Naming

- [ ] **Rename the temporaries and block arguments called `some…` and `each…`.** They say that
  there are several or that a block iterates, which the code already shows, and not the role the
  object plays; `someNames` in `MCPDeclaredProperties>>assertDeclares:` became
  `additionalArgumentNames` on 2026-09-25. The packages still hold many (`MCPBatch`,
  `MCPToolDecorator`, `MCPDeclaredProperties>>valuesFrom:`, the tool groups' `collect:` blocks).
  They are renamed with the rename-temporary refactoring as each method is touched, not swept.
