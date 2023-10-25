%% Session 5: Angel Prat, Haopeng Lin

%% Intro
im = imread('gull.tif');
imsp = imnoise(im,'salt & pepper',0.2);
figure,imshow(im),title('imatge original')
figure,imshow(imsp),title('sorroll s&p')

%% Filtre gaussià
h = fspecial('gaussian',7,2);
filgaus = imfilter(imsp,h);
figure,imshow(filgaus),title('filtrat gausià')

%% Mediana
filmed=medfilt2(imsp,[5,5]);
figure,imshow(filmed),title('filtrat mediana')

%% Gradient 
im = zeros(256);
im(:,128:end)=1;
figure,imshow(im),title('negro blanco')

Gx= im(:,2:end) - im(:,1:end-1);
figure,imshow(Gx),title('Gradient x')

%% Gradient horitzontal i vertical
Mx = [-1,0,1];
My = [1;0;-1];
img = imread("rabbit.jpg");

figure,imshow(img),title('imagen original')

%% Uint
Gx = imfilter(img,Mx);
figure,imshow(Gx),title('Gradient horitzontal')

Gy = imfilter(img,My);
figure,imshow(Gy),title('Gradient vertical')

%% Double
dImg = double(img);
Gx = imfilter(dImg,Mx);
figure,imshow(Gx),title('Gradient horitzontal double')

Gy = imfilter(dImg,My);
figure,imshow(Gy),title('Gradient vertical double')

%% Operador sobel
% Finestra de convolució horitzontal
Sy = fspecial('sobel')/4;
% Finestra de convolució vertical
Sx = Sy';

img = double(img);
Gy = imfilter(img,Sy);
Gx = imfilter(img,Sx);
figure,imshow(Gx,[]),title('Gradient horitzontal')
figure,imshow(Gy,[]),title('Gradient vertical')

%% Modul && direcció
mod=sqrt(Gx.^2+Gy.^2);
dir=atan2(Gy,Gx);
figure,imshow(mod,[]),title('modul')
figure,imshow(dir,[]),title('direcció')


%% Mascares

% Mascare per trobar el contorn
mask = (mod<15);
figure,imshow(mask,[]),title('modul < 15')
% Mostrar només gradient importants
dir(mask)=0;
figure,imshow(dir,[]),title('direccion del gradient importants')

figure,mesh(mod)