% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 2nd Assignment - 2020/05/15
function [P,D] = projectCameraKu(w, cv, ck ,cu, p)
% Params:
%   w       scalar, distance of the camera from the lense.
%   cv      vector, position of the camera in the world coordinate system.
%   ck      vector, position of the target in the world coordinate system.
%   cu      vector, up vector for the cameras orientation.
%   p       matrix 3xN, a set of points
% Returns:
%   P       matrix 2xN, the 2d projection of the points
%   D       vector, depth: the distance of the points from the lense.
% Summary:
%   Calculates the x,y,z axis of the camera given its position, target and up vector.
%   Then calls projectCamera for the projection.
    cu = -cu;
    ck = cv-ck;
    zc = ck/norm(ck);
    yc = cu - dot(cross(cu, zc),zc);
    yc = yc/norm(yc);
    xc = cross(yc,zc);
   
    [P,D] = projectCamera(w, cv, xc, yc, p);
end

