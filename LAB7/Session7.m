%% Sesión 7: Haopeng Lin Ye


%% Act 1
filas = 257;
columnas = 257;
o = 70; 

% Coordenadas del centro de la imagen
x_centro = (filas + 1) / 2;
y_centro = (columnas + 1) / 2;

im = zeros(filas, columnas);


for x = 1:filas
    for y = 1:columnas
        % Calcular las coordenadas centradas
        x_centrado = x - x_centro;
        y_centrado = y - y_centro;
        
        % Calcular el valor de la gaussiana centrada en esta posición
        valor_gaussiano = exp(-(x_centrado^2 + y_centrado^2) / (2 * o^2));
        
        % Escalar el valor al rango de 0 a 255
        valor_pixel = uint8(valor_gaussiano * 255);
        
        % Asignar el valor a la posición correspondiente en la imagen
        im(x, y) = valor_pixel;
    end
end

% Mostrar la imagen sintética
mesh(im);
title('Imagen Act1');
colormap 'jet';


%% Act 2
im2 = im;
% im2 = double(im2);
Sy = fspecial("sobel")/4;
Sx = Sy';

%% Gradiente vertical y horizontal
Gy = imfilter(im2,Sy);
Gx = imfilter(im2,Sx);
figure,imshow(Gx,[]),title('Gradiente horitzontal')
figure,imshow(Gy,[]),title('Gradiente vertical')

%% Modulo y dirección
mod=sqrt(Gx.^2+Gy.^2);
dir=atan2(Gy,Gx);
figure,imshow(mod,[]),title('modulo')
figure,imshow(dir,[]),title('dirección')

%% Act 3

figure,imshow(mod,[]),title('modulo del gradiente'),colorbar,colormap 'jet'


%% Act 4

% Iniciar vector de histograma
histograma = zeros(361, 1);
factor_escala = 360 / (2 * pi);
% Redondear 
dir2 = round(dir*factor_escala+180);

% Obtener tamaño de la imagen(Matriz)
[M, N] = size(dir2);
% Obtener las frequencias
for i = 1:M
    for j = 1:N
        intensidad = dir2(i, j);
        if intensidad > 361
            intensidad = 361;
        end

        histograma(intensidad + 1) = histograma(intensidad+1) + 1;

    end
end

figure,plot(histograma),title('Histograma de la imagen en escala de grises'),
xlabel('Nivel de intensidad'),ylabel('Frecuencia de píxeles')

% Debido a los angulos del gradiente

