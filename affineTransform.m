% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 2nd Assignment - 2020/05/15
function cq = affineTransform(cp, R, ct)
% Params:
%   cp      matrix 3xN, a set of points in 3d space
%   R       matrix 3x3, rotation matrix
%   ct      vector, for translation
% Returns
%   cq      matrix 3xN, a set of points after rotation and translation
% Summary:
%   Applies rotation and then translation to a set of points and 
%   returns the result.
cq = R*cp;
cq = cq + ct(:);
end