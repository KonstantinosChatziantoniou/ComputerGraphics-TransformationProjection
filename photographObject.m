function [P2d, D] = photographObject(p,M,N,H,W,w,cv,ck,cu)
    % Params:
    %   p       matrix 3xN, a set of points
    %   M       scalar, resolution of the camera for x axis
    %   N       scalar, resolution of the camera for y axis
    %   H       scalar, size of the camera's lense (x axis)
    %   W       scalar, size of the camera's lense (y axis)
    %   w       scalar, distance of the camera from the lense.
    %   cv      vector, position of the camera in the world coordinate system.
    %   ck      vector, position of the target in the world coordinate system.
    %   cu      vector, up vector for the cameras orientation.
    % Returns:
    %   P2d     matrix 2xN, the 2d projection of the points
    %   D       vector, depth: the distance of the points from the lense.
    % Summary:
    %   Implements the pipeline of photographing an object
    [P,D] = projectCameraKu(w, cv, ck, cu, p);
    P2d = rasterize(P, M, N, H, W);
end