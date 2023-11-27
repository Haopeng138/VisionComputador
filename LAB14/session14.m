%% Sessión 14: Angel Prat, Haopeng Lin

%% 
im = imread('peppers.png');
figure,imshow(im),title("Imagen original")

%% Feature space
vect = reshape(double(im),512*512,3);
figure,scatter3(vect(:,1),vect(:,2),vect(:,3),1)
xlabel('R');ylabel('G');zlabel('B');
title('feature space RGB')

%% K-means
K = 2;
[cluster_eti cluster_ctr] = kmeans(vect, K, 'Distance', 'cityblock');

eti = reshape(cluster_eti, 512, 512);
figure,imshow(eti, []),title('kmean RGB')
colormap 'prism'

%% K-means amb HSV

hsv = rgb2hsv(im);
hs = hsv(:,:,1:2);

vect2 = reshape(double(hs),512*512,2);
figure,scatter(vect2(:,1),vect2(:,2),1);
xlabel('hue');ylabel('Sat');
title('feature space hue sat')

K = 2;
[cluster_eti2, cluster_ctr2] = kmeans(vect2, K, 'Distance', 'cityblock');

eti2 = reshape(cluster_eti2, 512, 512);
figure,imshow(eti2, []),title('kmean HSV')
colormap 'prism'
%%
% Tener en cuenta hue es ciclico
figure,scatter(vect2(:,1),vect2(:,2),1, cluster_eti2);
xlabel('hue');ylabel('Sat');
title('feature space hue sat')

%% 
% (hue,sat) => sat * sin(hue)
%           => sat * cos(hue)
h = hs(:,:,1)*2*pi;
sat = hs(:,:,2);
x = sat .* sin(h);
y = sat .* cos(h);

figure,scatter(x,y,1);
xlabel('hue');ylabel('Sat');
title('feature space hue sat')





%% Ejercicio

im = imread('cafe.tif');
ee = strel('disk',3);

%%
figure,imshow(im),title('imagen originar');
td = bwdist(im);
figure,imshow(td, []),title('transformada de distancia');
figure,mesh(-td)

%%

eti = watershed(-td);
figure,imshow(im|~(eti>0)),title('Separacio de caffes')
%%

tdh = imhmax(td, 2);
eti2 = watershed(-tdh);
res = im|~(eti2>0);
figure,imshow(res),title('Separacio de caffes')

eti = bwlabel(res,4);
figure,imshow(eti, []),title('kmean HSV'), colormap colorcube
