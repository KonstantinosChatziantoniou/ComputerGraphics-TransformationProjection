% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 2nd Assignment - 2020/05/15
function dp = systemTransform(cp, b1, b2, b3, c0)
% Params:
%   cp      matrix 3xN, a set of points
%   b1      vector, the x axis coordinates of the new coordinate system
%   b2      vector, the y axis coordinates of the new coordinate system
%   b3      vector, the z axis coordinates of the new coordinate system
%   c0      the translation of the system from the original
% Returns:
%   dp      matrix 3xN, the coordinates of the points to the new system
% Summary: 
%   Apply the inverse rotation and translation to the points to find their
%   coordinates for the new system. We assume the original system is x = [1 0 0]
%   y=[0 1 0] and z = [0 0 1]
L = [b1(:),b2(:),b3(:)];
L = L';
c0 = -L*c0(:);
dp = affineTransform(cp,L, c0);

end