%% Sessión 9: Angel Prat, Haopeng Lin

%% 
im = imread("blob3.tif");
figure,imshow(im),title("imagen condición")
% imagen de marca
mark = im;
mark(2:end-1,2:end-1) = 0;
figure,imshow(mark),title("imagen de marca")

%% Dilatación condicional

ee = strel('disk',1);
dilc = imdilate(mark,ee)&im;
figure,imshow(dilc),title("imagen de dilatacion condicional")

dilc = imdilate(dilc,ee)&im;

%% Reconstrucción
rec = imreconstruct(mark,im);
% conseguir los bordes
figure,imshow(rec),title("imagen de dilatacion condicional")

%% Eliminación de bordes 
res = imsubtract(im,rec);
figure,imshow(res),title("resultat")

%% Obtener agujeros

%% Imagen de condición 
im = imread('pcbholes.tif');
figure,imshow(im),title("imagen condición")
%% Imagen negativo
neg=~im; 
figure,imshow(neg),title("negatiu ")
%% Imagen de marka
mark = neg;
mark(2:end-1,2:end-1) = 0;
figure,imshow(neg),title("marcas")
%% Reconstrucción

rec = imreconstruct(mark,neg);
figure,imshow(rec),title("reconstruccion")

%% Obtener agujeros
forats = imsubtract(neg,rec);
figure,imshow(forats),title("agujeros")

%% Obtener herramientas del imagen 

im = imread('tools.tif');
figure,imshow(im),title('Imatge original')

% erosionar para descartar los objetos que no queremos 
ee = strel('disk',7);
mark = imerode(im,ee);
figure,imshow(mark),title('makers')

% 
rec = imreconstruct(mark,im);
figure,imshow(rec),title("Disco y llave ")

%% Obtener letras
im = imread("letters.tif"); 
figure,imshow(im),title('Imatge original')


ee = strel('line',15,90);
mark = imerode(im,ee);
mark(1:2,:)= 0;
figure,imshow(mark),title('makers')

%% Conseguir simbolo
rec = imreconstruct(mark,im);
figure,imshow(rec),title("Simbolo ")

%% Open & Close

im = imread('blob.tif');
figure,imshow(im),title('Imatge original')
ee = strel('disk',5);


%% Open
op = imopen(im,ee);
figure,imshow(op),title("Open")
%% Close
cl = imclose(im,ee);
figure,imshow(cl),title("Close")


%% Ejercicio

im = imread('gear.tif');
figure,imshow(im),title('Imatge original')

ee = strel('disk',1);
cl = imclose(im,ee);
figure,imshow(cl),title("Close")


forats = imsubtract(im,cl);
figure,imshow(forats),title("agujeros")

%% Profe solución

% dejar de usar la optimización para que no se octogonal
ee = strel('disk',15,0);
op = imopen(im,ee);
figure,imshow(op),title("Open")

dientes = imsubtract(im,op);
figure,imshow(dientes),title("agujeros")
 
%% Etiquetar

eti = bwlabel(dientes);
figure,imshow(eti,[]),title('Imagen etiquetad')
impixelinfo

%% SKIZ

im = imread("blob3.tif");
figure,imshow(im),title("Imagen original")

skiz = bwskel(~im);
figure,imshow(skiz),title("Imagen skiz")


figure,imshow(imfuse(skiz,im)),title("Imagen fusión")

%% Transformada de distancia

tdist = bwdist(im);
figure,mesh(tdist),title("Transformada de distancia")
