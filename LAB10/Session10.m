%% Sessión 10: Angel Prat, Haopeng Lin

%% Figura orginal
im = imread('n2538.tif');
figure,imshow(im),title('result')

ee = strel('disk',3);
dil = imdilate(im,ee);
ero = imerode(im,ee);

%% Comparación de los 4
op = imopen(im,ee);
cl = imclose(im,ee);
figure,imshow(dil),title('dilatación')
figure,imshow(ero),title('erosión')
figure,imshow(op),title('open')
figure,imshow(cl),title('close')

%% Residuos

im = imread('Birds.tif');
figure,imshow(im),title('imagen original')
ee = strel('square',3);
%% Elimina pequeñas estructura blancas
op = imopen(im,ee);
figure,imshow(op),title('open')
%% Elimina pequeñas estructuras negras
cl = imclose(op,ee);
figure,imshow(cl),title('close')

%% Resaltar contornos
% Resaltar contornos mediante la diferencia de dilatación y erosión
im = imread('Danaus.tif');
figure,imshow(im),title('imagen original')
ee = strel('disk',1);
dil = imdilate(im,ee);
ero = imerode(im,ee);
edge = imsubtract(dil,ero);
figure,imshow(edge),title('contorno doble')

%% Iluminación no uniforme

im = imread('nshadow.tif');
figure,imshow(im),title('imagen original')

ee = strel('disk',5);
op = imopen(im,ee);
figure,imshow(op),title('Iluminacion')
% tophat
th = imsubtract(im,op);
% usar [] para más contraste 
figure,imshow(th,[]),title('Top hat')

%% Histograma comparativa
figure,imhist(im),title("Histograma imatge original")
figure,imhist(th),title("Histograma top hat")

%% Ejercicio clase 

im = imread("r4x2_256.tif");
figure,imshow(im),title('imagen original')

ee = strel('line',50,90);
cl = imclose(im,ee);
res = imsubtract(cl,im);
figure,imshow(res,[]),title('Defectos')


%% Resconstrucción 

im = imread('bloodcells.tif');
figure,imshow(im),title('imagen original')
mark = im;
mark(2:end-1,2:end-1)=0;
rec = imreconstruct(mark,im); 
figure,imshow(rec),title('Imagen sin nucleo')

% Siempre que podemos hacer reconstrucción con gray level, se tiene que
% hace al final

%% Binarización


nrec = imcomplement(rec);
figure,imshow(nrec),title("Imagen negativo ")
mark2 = nrec;
mark2(2:end-1,2:end-1)=0;
rec2 = imreconstruct(mark2,nrec); 
figure,imshow(rec),title('Imagen sin nucleo')

figure,imshow(rec2),title('Celules a les bore')

res = imsubtract(nrec,rec2);
figure,imshow(res),title('Imagen resultat')

%% Maximos regional

im = imread("astablet.tif");
imshow(im),title('imagen original')

ee = strel('disk',20,0);
op = imopen(im ,ee);
figure,imshow(op,[]),title("opening")
res = imregionalmax(op);
figure,imshow(res),title("opening")
