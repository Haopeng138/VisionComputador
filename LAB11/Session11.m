%% Sessión 10: Angel Prat, Haopeng Lin

%% Figura orginal
im = imread('pcb1bin.tif');
figure,imshow(im),title('Figura orginal')

%% Quitar agujeros
ee = strel('disk',4,0);
sinAgujeros = imclose(im,ee);
figure,imshow(sinAgujeros),title('Solo agujeros')
imres = imsubtract(sinAgujeros,im);
figure,imshow(imres),title('Quitar agujeros')

ee = strel('disk',1,0);
imres = imopen(imres,ee);
figure,imshow(imres),title('Quitar agujeros Limpio')


%% Rectangles
ee = strel('rectangle',[9,30]);
rectangulos = imopen(sinAgujeros,ee);
figure,imshow(rectangulos),title('Solo rectangulos')


% Eliminación de bordes 
mark = rectangulos;
mark(2:end-1,2:end-1) = 0;
rec = imreconstruct(mark,rectangulos);
resRectangulos = imsubtract(rectangulos,rec);
figure,imshow(resRectangulos ),title("Eliminación de bordes rectangulos")

% Limpiar imagen original
im = imsubtract(double(sinAgujeros),double(resRectangulos));
figure,imshow(im,[]),title("Quitar rectangulos")

%% Cuadrados
ee = strel('square',14);
cuadrados = imopen(im,ee);
figure,imshow(cuadrados),title('Solo Cuadrados')

% Eliminación de bordes 
mark = cuadrados;
mark(2:end-1,2:end-1) = 0;
rec = imreconstruct(mark,cuadrados);
resCuadrados = imsubtract(cuadrados,rec);
figure,imshow(resCuadrados  ),title("Eliminación de bordes Cuadrados")

% Limpiar imagen original
im = imsubtract(double(im),double(resCuadrados));
figure,imshow(im,[]),title("Quitar Cuadrados")

%% Cercles
ee = strel('disk',6,0);
cercles = imopen(im,ee);
figure,imshow(cercles),title('Solo Cercles')

% Eliminación de bordes 
mark = cercles;
mark(2:end-1,2:end-1) = 0;
rec = imreconstruct(mark,cercles);
resCercles = imsubtract(cercles,rec);
figure,imshow(resCercles),title("Eliminación de bordes Cercles")

% Limpiar imagen original
im = imsubtract(double(im),double(resCercles));
figure,imshow(im,[]),title("Quitar Cercles")


%% Lineas
ee = strel('disk',1,0);
lineas = imopen(im,ee);
figure,imshow(lineas),title('Solo Lineas')

%% Etiquetas
a = imres + 2*resRectangulos + 3*resCuadrados + 4*resCercles;
figure,imshow(a,[]),title("Etiquetado"),colormap jet;

figure,imshow(lineas,[]),title("lineas"),colormap jet;

