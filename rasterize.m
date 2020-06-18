% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 2nd Assignment - 2020/05/15
function Prast = rasterize(P,M,N,H,W)
% Params:
%   P       matrix 2xN, set of projected points.
%   M       scalar, resolution of the camera for x axis
%   N       scalar, resolution of the camera for y axis
%   H       scalar, size of the camera's lense (x axis)
%   W       scalar, size of the camera's lense (y axis)
% Returns:
%   Pras    matrix 2xN, the set of points assigned to a grid.
Prast = [M/H,N/W].*P + [M/2,N/2];
Prast = floor(Prast);


end