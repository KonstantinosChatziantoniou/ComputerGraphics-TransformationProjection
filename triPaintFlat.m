% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 1st Assignment - 2020/03/17
function Y = triPaintFlat(X, V, C)%img = paintTriangle(img, triangle, slopes, clr) %%SORTED triangle
    % Fills a given triangle with color on an image, overwriting pixels.
    % Input :
    %       X :     image MxNx3 with pre-existing painted triangles
    %       V :     array 3x2 containing the coordinates of the edges of the triangle
    %       C :     array 3x3 containing the RGB color of the edges
    % Output :
    %       Y :     image MxNx3. The input image X, with the given triangle painted, overwriting 
    %               existing triangles.
    % ------------------------------------------------------------------------------------------

    % sort triangle edges by y axis and calculate the slope of the vertices
    [triangle,slopes] = findActiveEdges(V);
    clr = sum(C./3);
    
    
    
    % Inital x coord, slope
    x1 = triangle(1,2);
    slope1 = slopes(1);
    x2 = triangle(1,2);
    slope2 = slopes(2);
    %Check if we reached the end of the second vertex
    for y = (triangle(1,1)):triangle(3,1) %intergrated check: special case -> flat top vertice
       if y == triangle(2,1)
            x1 = triangle(2,2);
            slope1 = slopes(3);
            %Check if the third vertex is flat
            if y == triangle(3,1)
                x2 = triangle(3,2);
                %restore x1 if just horizontal line
                if y == triangle(1,1)
                    x1 = triangle(1,2);
                end
            end
        end
        %find the active scan line points and interpolated colors
        sgn = sign(x2-x1);
        if sgn == 0
            sgn = 1;
        end
        X(round(x1):sgn:round(x2),y,1) = clr(1);
        X(round(x1):sgn:round(x2),y,2) = clr(2);
        X(round(x1):sgn:round(x2),y,3) = clr(3); 
        %Update the active vertex point
        x1 = x1 + slope1;
        x2 = x2 + slope2;
    end
    Y = X;
end


function [tr, slopes] = findActiveEdges(triangle)
    %Sorts the edges based on y axis and calculates slopes.
    % Input :
    %       triangle :      The edges of the triangle
    % Output : 
    %       tr :            Rearranged triangle edges
    %       slopes :        The slopes for each vertex 
    % -----------------------------------------------------------
    [sortedV, ~] = sortrows(triangle); %sort triangle points by y
    invSlope = [0 0 0];
    pairs = [1 2; 1 3; 2 3];
    for i = 1:3
        invSlope(i) = (sortedV(pairs(i,1),1)-sortedV(pairs(i,2),1))/(sortedV(pairs(i,1),2)-sortedV(pairs(i,2),2));
        invSlope(i) = 1/invSlope(i);
    end
    tr = sortedV;
    slopes = invSlope;
end