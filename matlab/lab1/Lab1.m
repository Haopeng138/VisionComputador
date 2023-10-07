%% Session 1

%% Manipulating image

% Read image
im = imread("Floppy.bmp");

% Grey intensity of pixel
im(67,123);

% Get range of matrix
im(67:70,123:130);

% Asign to variables
[rows,cols] = size(im);

% Show image
imshow(im);

% run with imshow()
impixelinfo;

% run with imshow() and select line
%improfile;

% Put title to image
title("Image Original");

colormap jet;
colorbar;
%% Subplots
figure;
subplot(1,2,1),imshow(im),title('original');
subplot(1,2,2),imshow(255-im),title('negatiu');

figure, mesh(im), title('representació 3D');

%% Generate random image
B = rand(256)*1000;

% imshow() only show values bettween [0,1]
figure,imshow(B),title('image random1');

% change accepted range to [0,1000]
figure,imshow(B,[0,1000]),title('image random2');

% use the max and min of the image for the range
figure,imshow(B,[]),title('image random3');

% write image
imwrite(B,'random.png')


