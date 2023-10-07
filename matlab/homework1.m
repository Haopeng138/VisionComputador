%% Homework 1

%% 1
% 1. Obtenir la imatge diferència entre el patró i la imatge Blispac2, i comprovar si la falta
% d'aliniament entre les imatges pot portar problemes en el control de qualitat.
A = double(imread("Blispac1.tif"))/255;
B = double(imread("Blispac2.tif"))/255;
D = abs(A - B);
imshow(D)

%% 2
% 2. Obtenir la matriu de tranformació afí (T) que permeti alinear les dues imatges. Els valors
% de la matriu T s'hauran d'obtenir resolent les equacions pertinents, a partir de les
% coordenades de les pastilles en les imatges (podeu obtenir les coordenades de forma
% manual).
Ag = rgb2gray(A);
X = medfilt2(Ag,[5,5])>0.5;
X = bwareafilt(X,12);
T = regionprops('table',X,'Centroid'); % cercles centroids
LT = min(T.Centroid);  % coordenades del centre de la pastilla superior esquerre
RB = max(T.Centroid);  % inferior dreta
LB = [LT(1) RB(2)];    % inferior esquerre
RT = [RB(1) LT(2)];    % superior dreta

M = [LT; RB; LB; RT];  % matriu amb els quatre punts fixes

Bg = rgb2gray(B);
Y = medfilt2(Bg,[5,5])>0.5;
Y = bwareafilt(Y,12);
S = regionprops('table',Y,'Centroid'); % cercles centroids
LT = min(S.Centroid);  % coordenades del centre de la pastilla superior esquerre
RB = max(S.Centroid);  % inferior dreta
LB = [LT(1) RB(2)];    % inferior esquerre
RT = [RB(1) LT(2)];    % superior dreta

N = [LT; RB; LB; RT];  % matriu amb els quatre punts a moure

tform = fitgeotrans(N,M,'similarity');

%% 3
% 3. Transformar geomètricament una de les imatges per a que quedi alineada amb l'altra.
% (podeu usar la funció imwarp)
B_aligned = imwarp(B,tform,'Outputview',imref2d(size(B)));

%% 4
% 4. Obtenir la imatge diferència entre les dues imatges alineades i detectar la presència de
% pastilles de color diferent.
D = abs(A-B_aligned);
Dg = rgb2gray(D);
Dg(Dg>0.1) = 1;
imshow(Dg)
