%% Entrega 3

im = imread("Que_es.png");
imshow(im),title('Imagen original')

%% Iluminación
im2 = im + 200;
figure,imshow(im2),title('Brightness')

%% Contraste
im3 = im*10;
figure,imshow(im3),title('Contraste')

%% Negativo
im4 = 255-im3;
figure,imshow(im4),title('Negativo')

%% Imcomplement
im5 = imcomplement(im);
figure,imshow(im5),title('Incomplemento')

%% Histograma del imagen

% Iniciar vector de histograma
histograma = zeros(256, 1);

% Obtener tamaño de la imagen(Matriz)
[M, N] = size(im);

% Obtener las frequencias
for i = 1:M
    for j = 1:N
        intensidad = im(i, j);
        histograma(intensidad + 1) = histograma(intensidad + 1) + 1;
    end
end

figure,plot(histograma),title('Histograma de la imagen en escala de grises'),
xlabel('Nivel de intensidad'),ylabel('Frecuencia de píxeles')

%% Equalizar

im6 = histeq(im);
figure,imshow(im5),title('Equalización')

%% Transformaciones

ima = imread('lenna.tif');
imshow(ima)
%% Escala 1/4
ima2 = imresize(ima,0.25);
figure,imshow(ima2),title('Escala 1/4')

%% Zoom x4
ima3 = imresize(ima2,4);
figure,imshow(ima3),title('Zoom x4')

%% Rotación 45º
ima4 = imrotate(ima,45);
figure,imshow(ima4),title('Rotación 45º')

%% Con matriz de transformación
T = affine2d([1,0,0;.5,1,0;0,0,1]);
ima5 = imwarp(ima,T);
figure,imshow(ima5),title('Warping')

%% Soroll
soroll = rand(size(ima));
imshow(soroll)
soroll=soroll-0.5;
ima6 = double(ima)+soroll*80;
% [] => poner limites
figure,imshow(ima6, []),title('Soroll uniforme')

%% Soroll impulsional 

probabilidad = 0.20;

% Generar una matriz de números aleatorios con valores 0 o 255
ruidoBN = rand(size(ima));
imagenRuido = ima;

% Aplicar probabilidad
imagenRuido(ruidoBN < probabilidad/2) = 0; 
imagenRuido(ruidoBN > 1 - probabilidad/2) = 255; 

% Mostrar la imagen con ruido sal y pimienta
figure,imshow(imagenRuido, []),title('Ruido impulsional')



