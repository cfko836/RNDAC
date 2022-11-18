function y = Nonconvex(x,c1,c2,c3)
    [m,n] = size(x);
    for i = 1:m
        for j = 1:n
            if x(i,j) > c1
                y(i,j) = c2;
            elseif x(i,j) < -c1
                y(i,j) = c3;
                else y(i,j) = x(i,j);
            end
        end
    end
end