function output = DiffA(t)
    syms u;
    A = MatrixA(u);
    DotA = diff(A);
    u=t;
    output = eval(DotA);