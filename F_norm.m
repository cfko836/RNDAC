function F_norm(x0, gamma, lambda)
    format long;
    tspan = 0: 0.01:5;
    options = odeset();
    [t, x] = ode45(@RightSide_AND, tspan, x0, options, gamma, lambda);
    max_val = 0;
    average_val = 0;
    cout_val = 0;
    
    for j = 1:length(t)
        T = t(j);
        A = MatrixA(T);
        X = reshape(x(j,1:4), 2, 2);

        temp = X^2-A;
        Err(:, j) = reshape(temp, 4, 1);
        nerr(j) = norm(Err(:,j));
        
        if T > 6
            average_val = average_val + nerr(j);
        end
        if T > 8
                if nerr(j) > max_val
                max_val = nerr(j);
            end
        end
        cout_val = cout_val + 1;
    end
    
    ASSRE = (average_val / cout_val)
    MSSRE = max_val

    set(gca,'FontSize',14)
    plot(t, nerr, 'LineWidth', 2);
    txt = {'||{\Lambda}(t)||_F'};
    text(0.6,0,txt)
    txt = {'{\itt} (s)'};
    text(4,0.3,txt)
    hold on;