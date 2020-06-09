% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 1st Assignment - 2020/03/17
function I = paintObject(V, F, C, D, painter)
    % Input :
    %       V :     array Lx2. Contains the coordinates of the triangle edges
    %       F :     array Kx3. Contains the 3 edges that form a triangle. 
    %                          Contains the index in reference to the V array.
    %       C :     array Lx3  Contains the color of each edge
    %       D :     array Lx1  Contains the depth of each edge, prior to the projection
    % Output :
    %       I :     image MxN. Contains preexisting painted triangles.
    % ---------------------------------------------------------------------------------

    M = 1200; N = 1200;     %stated by the assignment
    I = ones(M, N, 3);

    % Calculate the edge of each triangle
    t_depth = sum((D(F)),2)/3;
    % Sort by tringles by depth
    [ ~, depth_index] = sort(t_depth);

    if painter == "Flat"
        for j = length(depth_index):-1:1
            %j
            i = depth_index(j);
            edge_pairs = F(i,:);
            triangle = V(edge_pairs, :);
            clr = C(edge_pairs, :);
            I =  triPaintFlat(I,triangle,clr);
        end
    end

    if painter == "Gouraud"
        for j = length(depth_index):-1:1
            %j
            i = depth_index(j);
            edge_pairs = F(i,:);
            triangle = V(edge_pairs, :);
            clr = C(edge_pairs, :);
            I =  triPaintGouraud(I,triangle,clr);
        end
    end
end