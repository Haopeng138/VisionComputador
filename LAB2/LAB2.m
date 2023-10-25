%% Laboratorio 2
close all 
clear all

im = imread('flowers.tif');
imshow(im)
impixelinfo

%% Descomponer imagen
r = im(:,:,1);
g = im(:,:,2);
b = im(:,:,3);

%figure,montage({r,g,b})

%% Mapa de color

% variable de tipo double 
mapa = gray(256);

%% Mapa rojo
mapRed = zeros(256,3);
n = 256;
mapRed(:, 1) = (0:(n-1))' / (n-1);
figure,imshow(r,mapRed),title("Mapa rojo")

%% Mapa verde
mapGreen = zeros(256,3);
n = 256;
mapGreen(:, 2) = (0:(n-1))' / (n-1);
figure,imshow(r,mapGreen),title("Mapa verde")

%% Mapa azul
mapBlue = zeros(256,3);
n = 256;
mapBlue(:, 3) = (0:(n-1))' / (n-1);
figure,imshow(r,mapBlue),title("Mapa azul")

%% Suma de los tres componentes
rgb = cat(3,r,g,b);
figure,imshow(rgb),title("Suma de los tres componentes")

%% Escala de grises 

gris = rgb2gray(rgb);
figure,imshow(gris),title("Escala gris")

%% Normalizar

rNormalized = double(r) ./ double(r+g+b);
gNormalized = double(g) ./ double(r+g+b);
bNormalized = double(b) ./ double(r+g+b);
rgbNormalized = cat(3,rNormalized, gNormalized, bNormalized);
figure,imshow(rgbNormalized),title("Imagen normalizado")

%% HSV

imhsv = rgb2hsv(im);

hue = imhsv(:,:,1);
sat = imhsv(:,:,2);
i = imhsv(:,:,3);

figure,imshow(hue),title("Hue"),colormap HSV
figure,imshow(sat),title("Saturación")

%% Nomarlizar hsv 
iNormal = i;
iNormal(:,:,:) = 0.33;
hsvNormal = cat(3,hue,sat,iNormal);
figure,imshow(hsvNormal),title("HSV Normalizado"),colormap(hsv)
