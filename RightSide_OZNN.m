function output=RightSide_OZNN(t,x,gamma)
    X = reshape(x(1:4), 2, 2);
    M = kron(eye(2), X);
    N = kron(X', eye(2));
    A = MatrixA(t);
    DotA = DiffA(t);
    
    err = X^2-A;
    
    Con_noise = [5,5;5,5];
    Linear_noise = 2*[t,t;t,t];
    Rand_noise = 0.5*rand(2,2)+3;
    
    right = (-gamma*err + DotA);
    right_reshape = reshape(right, 4, 1);

    dotx = inv(M+N) * (right_reshape);
    output = [dotx;0;0;0;0];
    t