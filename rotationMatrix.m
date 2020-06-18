% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 2nd Assignment - 2020/05/15
function R = rotationMatrix(theta, u)
% Params:
%    theta     scalar, angle of the rotation in rads.
%    u         vector, the axis of rotation
% Summary:
%    Returns the rotation matrix for rotation of angle theta
%    around u axis in non homgenous form
%    using the Rodrigues formula.

ux = u(1);
uy = u(2);
uz = u(3);

R = (1-cos(theta))*[ux*ux, ux*uy, ux*uz;
     uy*ux, uy*uy, uy*uz;
     uz*ux, uz*uy, uz*uz];
R = R + cos(theta)*eye(3);
R = R + sin(theta)*[0, -uz, uy; uz, 0, -ux;-uy, ux, 0];
end