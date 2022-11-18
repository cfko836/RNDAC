function output = AF_Adaptive(X)
    bound = 2;
    reshape_X = reshape(X, 4, 1);
    output = zeros(length(reshape_X), 1);
    
    for index = 1:length(reshape_X)
        if reshape_X(index) > bound
            output(index) = bound;
        end
        if reshape_X(index) < -bound
            output(index) = -bound;
        end
        if reshape_X(index) <= bound && reshape_X(index) >= -bound
            output(index) = (((abs(reshape_X(index))+1).^5)+5) .* reshape_X(index);
        end
    end
    
    output = reshape(reshape_X, 2, 2);
end
