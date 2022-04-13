close all
clear all
clc

%% INITIALIZATION
% Distance samples from the building 2D image (px)
XX = [  132   40  114   31   25   62   41  132 ]';
XY = [  102  102   31   34   21   37 ]';
% Real distance samples from the real world (m)
YX = [ 7550 2400 6400 1890 1665 3200 2365 7220 ]';
YY = [ 5740 5650 1545 2055 1465 2255 ]';

%% READ BUILDING IMAGE FOR VISUALIZATION
img = imread("../../doc/feup/feup-deec_floor(-1)_measures.jpg");

figure
imshow(img)

%% LINEAR LEAST SQUARES
% Scaling factors (mm / px)
Ax = XX \ YX
Ay = XY \ YY

%% SORTING
[~,ix]=sort(XX);
XX = XX(ix);
YX = YX(ix);
[~,iy]=sort(XY);
XY = XY(iy);
YY = YY(iy);

%% VISUALIZATION
figure
hold on
plot(XX,YX,'rx')
plot([0 max(XX)],[0 Ax*max(XX)],'b-')
grid on
xlabel('X (px) \rightarrow')
ylabel('X (mm) \rightarrow')

figure
hold on
plot(XY,YY,'rx')
plot([0 max(XY)],[0 Ay*max(XY)],'b-')
grid on
xlabel('X (px) \rightarrow')
ylabel('X (mm) \rightarrow')
