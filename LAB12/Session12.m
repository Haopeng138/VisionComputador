%% Sessión 12: Angel Prat, Haopeng Lin


%% Binarizar por lindar fija

im = imread("airplane.tif");
figure,imshow(im),title("imagen originar")

aux = ones(512);
lindarMax = 50;
lindar = 70;
aux(im<lindarMax) =0;
aux(im>lindar) =1;
figure,imshow(aux),title("imagen binarizado")

%% Binarización por otsu

th = graythresh(im);
bw = im2bw(im,th);
figure,imshow(bw),title("Binarización por otsu")

%% Ejecicio, binarizar el imagen
im = imread("textsheet.jpg");
figure,imshow(im),title("imagen originar")

% Definir un filtro de media
kernel = ones(9)/9/9;
promig = imfilter(im, kernel, "conv", "replicate");
k = 23;
llindar = promig -k;
res = im > llindar;
figure,imshow(res),title("imagen res")

%% Obtener arros

im = imread("arros.tif");
figure,imshow(im),title("imagen originar")


th = graythresh(im);
bw = im2bw(im,th);
figure,imshow(bw),title("Binarización por otsu")

%% 1 
% Obtener fondo, utilizar open para quitar las pequeñas estructuras blancas
%(arroz) 
ee = strel("disk",20);
fons = imopen(im,ee);
figure,imshow(fons),title("Background")
figure,mesh(fons),title('background')

arros = imsubtract(im,fons);
figure,imshow(arros),title("arros")


%% 2 
% utilizar otsu para encontrar el optimo
th = graythresh(arros);
bw = im2bw(arros,th);
figure,imshow(bw),title("Top hat binarizado")

%% 3
% Genera imagen etiquetada de conectividad 4
 
eti = bwlabel(bw,4);
figure,imshow(eti,[]),title("Labeling"),colormap colorcube

%% 4

% obtener carecteristicas geometricas

dades = regionprops(eti,'all');
area50 = dades(50).Area;
arees = [dades.Area];
figure,hist(arees,20),title('arees')

%% 5

% buscar irregularidades

area_max = max(arees);
ganso = find(arees==695);
bw3=(eti==68);
figure,imshow(bw3),title('arros ganso')

%% 6 

% eliminar bordes
mark = eti;
mark(2:end-1,2:end-1) = 0;
rec = imreconstruct(mark,eti);
res = imsubtract(eti,rec);
figure,imshow(res),title("Eliminación de bordes arroz")

%% 7

% resultado final

eti2 = bwlabel(res,4);
figure,imshow(eti2,[]),title("Labeling"),colormap colorcube

%% 8 

% graficas

dades = regionprops(eti2,'all');
area50 = dades(50).Area;
arees = [dades.Area];
figure,hist(arees,20),title('arees')