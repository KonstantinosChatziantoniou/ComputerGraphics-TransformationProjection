% Konstantinos Chatziantoniou 8941 konstantic@ece.auth.gr
% Aristotle University of Thessaloniki
% Computer Graphics
% 1st Assignment - 2020/03/17
clear
close all
data = load('duck_hw1.mat');

%% parse the object
V = data.V_2d;
F = data.F;
C = data.C;
D = data.D;
tic
img = paintObject(V,F,C,D,"Gouraud");
toc
%imshow(img)
imwrite(img, 'GouraudRes.jpg');