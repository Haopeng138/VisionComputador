%% Sessión 8: Angel Prat, Haopeng Lin

%% Dilatación
im = false(128);
im(64,:)=1;
im(:,64)=1;
figure,imshow(im),title('imagen Original')
% Elemento estructurado
ee = [1,1,1];
[row,col]= size(im);
%% Ejercicio dilatación
imaux = zeros(128);
for x = 1:col
    for y = 2:row-1
        if im(x,y) == 1
            imaux(x,y-1) = im(x,y-1)| ee(1);
            imaux(x,y) = im(x,y) | ee(2);
            imaux(x,y+1) =im(x,y+1)| ee(3);
        end
        
    end
end
figure,imshow(imaux),title('imagen Original')

%% Manera matricial (profe) 
dil = im;
dil(:,2:end-1)=im(:,2:end-1)|im(:,1:end-2)|im(:,3:end);
figure,imshow(dil),title('dilatación')

%% Manera con funciones

im = imread('blob.tif');
figure,imshow(im),title('iamgen original')
ee = ones(3);
dil2 = imdilate(im,ee);
figure,imshow(dil2),title('dilatación')

%% Dilatación  

ee = strel('disk',5);
dil2 = imdilate(im,ee);
figure,imshow(dil2),title('dilatación radio 5')

%% Erosión
ero = imerode(im,ee);
figure,imshow(ero),title('erosión radio 5')


%% Residuos

im = imread('blob3.tif');
figure,imshow(im),title('imagen original')
ee=strel('disk',1);
dil = imdilate(im,ee);
ero = imerode(im,ee);
% contorno interno
c_i = imsubtract(im,ero);
% contorno externo
c_e = imsubtract(dil,im);

figure,imshow(c_i),title('contorno interno')
figure,imshow(c_e),title('contorno externo')
% overlay => fusión de dos imagenes

%% Contorno doble
c_d = imfuse(c_e,c_i);
figure,imshow(c_d),title('contorno doble')

%% Transformadas 1

im = imread('touchcell.tif');
figure,imshow(im),title('imagen original')

tdist = double(im);
ero = imerode(im,ee);
tdist=tdist+ero;

figure,imshow(tdist,[]),title("tempo")

figure,mesh(tdist),title('temporal')


while(any(ero(:)))
    ero = imerode(ero,ee); tdist = tdist + ero;
end
figure,mesh(tdist),title('temporal')

%% Transformadas 2
% transformada del conjunto negro
tdist2 = bwdist(~im,"euclidean");

figure,mesh(tdist2),title('bwdist')


