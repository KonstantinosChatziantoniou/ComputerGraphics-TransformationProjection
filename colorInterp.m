function c = colorInterp(A, B, a, b, x)
    % Finds the color of a point with linear interpolation
    % is VECTORIZED
    % Input:
    %       A :     Color of the first point
    %       a :     x coord of the first point
    %       B :     Color of the last point
    %       b :     x coord of the last point
    %       x :     x coord of the point(s) we want to calculate the color(s)
    % Output:
    %       c :     color(s) of the point(s)
    % -----------------------------------------------------------------------
    a = round(a);
    b = round(b);
    %% check if a b are the same point
    if a == b
        c = A;
        return
    end
    c = A - ((A-B)./(a-b)).*(a - x(:));
end