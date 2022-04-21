main

%% SIMPLIFICATION
% Distance samples from the building 2D image (px)
X = [ XX ; XY ];
% Real distance samples from the real world (m)
Y = [ YX ; YY ];

%% LINEAR LEAST SQUARES
% Scaling factors (mm / px)
A = X \ Y

%% SORTING
[~,ix]=sort(X);
X = X(ix);
Y = Y(ix);

%% VISUALIZATION
figure
hold on
plot(X,Y,'rx')
plot([0 max(X)],[0 A*max(X)],'b-')
grid on
xlabel('X , Y (px) \rightarrow')
ylabel('X , Y (mm) \rightarrow')

%% DEPARTMENT SIZE
img2 = imread("../../doc/feup/feup-deec_floor(-1)_cropped.png");
size_department_px = size(img2);
size_department_mm = A*size_department_px;
size_department_m  = size_department_mm/1000;
fliplr(size_department_m(1:2))
