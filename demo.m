clc
clear
close all
show_figs = false;
save_img = true;
%% Load data %%
A = load('hw2.mat');
% ------ Camera Info ------
cv = A.cv;  % cam coords
ck = A.ck;  % target coords
cu = A.cu;  % up vector
w = A.w;    % cam distance from lence
M = A.M;    % resolution x
N = A.N;    % resolution y
H = A.H;    % size
W = A.W;    % size
% ------ Scene Info ------
V3d = A.V';   % coords of points in 3d world space
C = A.C;     % color of each point
F = A.F;    % set of points forming a triangle

%% Step 0 -Initial position 
% 0.1 Photograph object with photographObject
[P,D] = photographObject(V3d,M,N,H,W,w,cv,ck,cu);
% 0.2 Paint object with ObjectPainter with gouraud
I0 = objectPainter(P, F, C, D);
% Save result
if save_img
    imwrite(I0, '0.jpg');
end
% Plot result
if show_figs
    figure(1)
    subplot(1,2,1)
    imshow(I0)
    title("0")
    subplot(1,2,2)
    scatter3(V3d(1,:), V3d(2,:), V3d(3,:));
    hold on
    quiver3(cv(1), cv(2), cv(3), ck(1)-cv(1), ck(2)-cv(2), ck(3)-cv(3));
    hold on
    quiver3(ck(1), ck(2), ck(3), A.t1(1), A.t1(2), A.t1(3));
    hold off
end
%% Step 1 - Translate by t1
% 1.1 Apply translation
V3d = affineTransform(V3d, eye(3), A.t1);
% 1.2 Photograph object with photographObject
[P,D] = photographObject(V3d,M,N,H,W,w,cv,ck,cu);
% 1.3 Paint object with ObjectPainter with gouraud
I1 = objectPainter(P, F, C, D);
% Save result
if save_img
    imwrite(I1, '1.jpg');
end
if show_figs
    figure(2)
    subplot(1,2,1)
    imshow(I1)
    title("1")
    subplot(1,2,2)
    scatter3(V3d(1,:), V3d(2,:), V3d(3,:));
    hold on
    quiver3(cv(1), cv(2), cv(3), ck(1)-cv(1), ck(2)-cv(2), ck(3)-cv(3));
    hold on
    quiver3(ck(1),ck(2),ck(3), A.g(1)*20, A.g(2)*20, A.g(3)*20);
    hold off
end
%% Step 2 - Rotate by theta around given axis
% 2.1 Apply rotation
Rot = rotationMatrix(A.theta, A.g);
V3d = affineTransform(V3d, Rot, [0,0,0]);
% V3d = affineTransform(V3d, eye(3), -ck);
% Rot = rotationMatrix(A.theta, A.g);
% V3d = affineTransform(V3d, Rot, ck);

% 2.2 Photograph object with photographObject
[P,D] = photographObject(V3d,M,N,H,W,w,cv,ck,cu);
% 2.3 Paint object with ObjectPainter with gouraud
I2 = objectPainter(P, F, C, D);
% Save result
if save_img
    imwrite(I2, '2.jpg');
end
if show_figs
    figure(3)
    subplot(1,2,1)
    imshow(I2)
    title("2")
    subplot(1,2,2)
    scatter3(V3d(1,:), V3d(2,:), V3d(3,:));
    hold on
    quiver3(cv(1), cv(2), cv(3), ck(1)-cv(1), ck(2)-cv(2), ck(3)-cv(3));
    hold on
    quiver3(ck(1), ck(2), ck(3), A.t2(1), A.t2(2), A.t2(3));
    hold on
    quiver3(ck(1),ck(2),ck(3), A.g(1)*20, A.g(2)*20, A.g(3)*20);
    hold off
end
%% Step 3 - Translate back
% 3.1 Apply translation
V3d = affineTransform(V3d, eye(3), A.t2);
% 3.2 Photograph object with photographObject
[P,D] = photographObject(V3d,M,N,H,W,w,cv,ck,cu);
% 3.3 Paint object with ObjectPainter with gouraud
I3 = objectPainter(P, F, C, D);
% Save result
if save_img
    imwrite(I3, '3.jpg');
end
if show_figs
    figure(4)
    subplot(1,2,1)
    imshow(I3)
    title("3")
    subplot(1,2,2)
    scatter3(V3d(1,:), V3d(2,:), V3d(3,:));
hold on
quiver3(cv(1), cv(2), cv(3), ck(1)-cv(1), ck(2)-cv(2), ck(3)-cv(3));
hold off
end