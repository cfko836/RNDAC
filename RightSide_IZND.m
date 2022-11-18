function output=RightSide_IZND(t,x,gamma, lambda)
    global p;
    X = reshape(x(1:4), 2, 2);
    M = kron(eye(2), X);
    N = kron(X', eye(2));
    A = MatrixA(t);
    DotA = DiffA(t);
    m= gamma*100;
    err = X^2-A;
    reshape_err = reshape(err, 4,1);
    rp = Nonconvex(real(err),0.5,2,-2);
    ip = Nonconvex(imag(err),0.5,2,-2);   

    Con_noise = [5,5;5,5];
    Linear_noise = 2*[t,t;t,t];
    Rand_noise = 0.5*rand(2,2)+3;
    
   right = -(m*(rp+ip*1i) )+ DotA;
    right_reshape = reshape(right, 4, 1);

    dotx = inv(M+N) * (right_reshape);
    output = [dotx;reshape_err];
    t
