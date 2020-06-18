% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 2nd Assignment - 2020/05/15
function [P,D] = projectCamera(w, cv, cx, cy, p)
% Params:
%   w       scalar, distance of the camera from the lense.
%   cv      vector, position of the camera in the world coordinate system.
%   cx      vector, x axis of the camera
%   cy      vector, y axis of the camera
%   p       matrix 3xN, a set of points
% Returns:
%   P       matrix 2xN, the 2d projection of the points
%   D       vector, depth: the distance of the points from the lense.
% Summary:
%   Transforms the points to the coordinate system of the camera. Then project them 
%   to the x-y plane of the camera.
    
    cz = cross(cx,cy);
    p = systemTransform(p, cx, cy, cz, cv);
    
    x = p(1,:);
    y = p(2,:);
    z = p(3,:);
    xp = (w./z).*x;
    xp = xp(:);
    yp = (w./z).*y;
    yp = yp(:);
    P = [xp, -yp];
    D = z(:);
end