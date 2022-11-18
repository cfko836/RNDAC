function output=RightSide_RACZNN(t,x,gamma, lambda)
    X = reshape(x(1:4), 2, 2);
    M = kron(eye(2), X);
    N = kron(X', eye(2));
    A = MatrixA(t);
    DotA = DiffA(t);
    x_length = length(x);
    half = (x_length/2);
    x_cur = x(1:half);
    
    err = X^2-A;
    reshape_err = reshape(err, 4,1);
    inte = reshape(x(5:8), 2, 2);
    momentum = norm(reshape_err);
    scal_param_one = (momentum^5 + gamma);

    scal_param_two = (5^(norm(inte)) + gamma);
    Con_noise = [5,5;5,5];
    Linear_noise = 2*[t,t;t,t];
    Rand_noise = 0.5*rand(2,2)+3;

    right = -scal_param_one*(err) - scal_param_two*(inte) + DotA;
    right_reshape = reshape(right, 4, 1);
    
    dotx = inv(M+N) * (right_reshape);
    output = [dotx;reshape_err];
    t
