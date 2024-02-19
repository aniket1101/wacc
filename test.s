AsmBlock(Directive(text),Label(main),List
    Push(Register(rbp)),
    Push(Register(rbx)),
    MovRegister(Register(rsp),Register(rbp)),
    MovImm(Immediate(0),Register(rax)),
    Pop(Register(rbx)),
    Pop(Register(rbp)),
    Ret()))