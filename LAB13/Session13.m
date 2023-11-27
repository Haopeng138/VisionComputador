%% Sessión 13: Angel Prat, Haopeng Lin

im = imread("rabbit.jpg");
figure,imshow(im),title('imagen originar')

%% Gradient
ee = strel('disk', 1);
grad = imsubtract(imdilate(im, ee), im);
figure,imshow(grad),title('Gradient')
figure,mesh(grad);

%% Whaterhed
segm = watershed(grad);
figure,imshow(segm, []),title('Segmentacio');
colormap 'jet'
figure,imshow(segm==0),title('Contorns');

%% Marques per profunditat
grad2 = imhmin(grad, 5);
eti=watershed(grad2);
figure,imshow(eti==0),title('Watershed, Markers per profunditat');

figure,imshow(imregionalmin(grad)),title('Pous de la imatge gradient');
figure,imshow(imregionalmin(grad2)),title('Pous de la imatge gradient de profunditat > 5');

%% Watershed, Markers per forma
ee = strel('disk', 15);
grad3 = imclose(grad, ee);
etif = watershed(grad3);
figure,imshow(etif==0),title('Watershed, Markers per forma');

%% Watershed, markers per forma i pous de profunditat > 5
grad4 = imhmin(grad, 5);
ee = strel('disk',5);
grad5 = imclose(grad4, ee);
etif2 = watershed(grad5);
figure,imshow(etif2==0),title('Watershed, Markers per forma');


%% Toutching blobs
im = imread("touchcell.tif");
figure,imshow(im),title('imagen originar');
td = bwdist(~im);
figure,imshow(td, []),title('transformada de distancia');
figure,mesh(-td)
eti = watershed(-td);
figure,imshow(eti, []),title('Imatge etiquetada');
colormap 'colorcube'
figure,imshow(eti>0),title('On es troben les aigues');
figure,imshow(im & eti>0),title('Separacio de toutching blobs');

%% Separa grans d'arros 
im = imread('arros.tif');
ee = strel('disk', 20);
th = imtophat(im, ee);
arros = im2bw(th, graythresh(th));
figure,imshow(arros),title("arrossos")

%% Filtrar les bores
ee = strel('disk', 2);
op = imopen(arros, ee);
figure,imshow(op),title("Arrossos filtrats")

td = bwdist(~op);
figure,mesh(td)

eti = watershed(-td);
figure,imshow(arros&(eti>0)),title('Separacio de arrossos')
figure,imshow(imregionalmax(td)),title('Maximsde regionals')

tdh = imhmax(td, 2);
eti2 = watershed(-tdh);
figure,imshow(arros&(eti2>0)),title('Separacio de arrossos perfecta')
figure,imshow(imregionalmax(tdh)),title('maxims regionals filtrats')

