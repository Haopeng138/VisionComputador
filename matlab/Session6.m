%% Sessió 6: Angel Prat, Haopeng Lin

%% Laplacià
im = imread('rabbit.jpg');
imshow(im);
lap=[0,1,0;1,-4,1;0,1,0];

im=double(im);

im_lap = imfilter(im,lap);
figure,imshow(im_lap,[]),title('Laplacià')


%% Gausià

aux = fspecial('gaussian',5,1);
dog = aux(1:3,:)-aux(3:5,:);

imDogy = imfilter(im,dog);
figure,imshow(imDogy,[]),title('DoG y')

imDogx = imfilter(im,dog');
figure,imshow(imDogx,[]),title('DoG x')

%% Laplacià + Gausià

w = fspecial('log',5);
imLog=imfilter(im,w);
figure,imshow(imLog,[]),title('LoG')

%% Canny 

res=edge(im,'canny',[0.1,0.4],3.75);
figure,imshow(res,[]),title('Canny')

imGaus = imfilter(im,aux);
figure,imshow(imGaus,[]),title('Filtrat gausià')
figure,imshow(im-imGaus,[]),title('Filtrat gausià')


%% Homework


im = double(imread('rabbit.jpg'));
imshow(im,[])
%% Aplicar Laplaciano
hL = [0 1 0;1 -4 1;0 1 0];
imLaplacia = imfilter(im,hL);
imshow(imLaplacia,[])

%% Laplaciano + Gaussiano
w = fspecial('log',5);
imLoG=imfilter(im,w);
figure,imshow(imLoG,[]),title('LoG')


%% Detección de pasos por zero
 
% Busca la laplaciana que pasa por zero
% Buscar aquellos pixeles en que tenga un vecino que sea positivo y alguno
% que sea negativo

valorPos = imLoG > 0; % pixeles con valor positivo
valorNeg = imLoG < 0; % pixeles con valor negativo


sumPos = colfilt(valorPos,[3 3],"sliding",@sum); % obtiene el número de vecinos positivos
sumNeg = colfilt(valorNeg,[3 3],"sliding",@sum); % obtiene el número de vecinos negativos
% Nota: la función colfilt nos proporciona los vecinos de cada pixel y
% después aplica la función que le pasamos con los vecinos de cada pixel

UP = sumPos > 0; % Al menos tiene un vecino positvo
UN = sumNeg > 0; % Al menos tiene un vecino negativo

Z = UP & UN; % Los que tiene al menos un vecino positivo y negativo, entonces pasa por zero
figure,imshow(Z),title("Paso por zero")

%% Utilizar el gradiente de clase
Gx = imfilter(im, dog);
Gy = imfilter(im, dog'); 
G = abs(Gx) + abs(Gy); % modul del gradiente (dx,dy)



R = Z .* G; % Resaltar los pixeles de paso por zero con el modulo del gradiente
R(R>5)= 255; % Limpiar un poco de ruido en la imagen
figure,imshow(R,[]),title("Imagen de contorno");

