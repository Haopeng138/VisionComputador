%% Homework 1

%% 1 Diferència original
% 1. Obtenir la imatge diferència entre el patró i la imatge Blispac2, i comprovar si la falta
% d'aliniament entre les imatges pot portar problemes en el control de qualitat.

model = imread("Blispac1.tif");
img = imread("Blispac2.tif");

% canvis de tipus de dades
dModel = double(model)/255;
dImg = double(img)/255;
DiffModelImg = abs(dModel - dImg);
figure,imshow(DiffModelImg),title('Diferència de imatge no alineat')

%% 2 Calcul matriu de transformació 
% 2. Obtenir la matriu de tranformació afí (T) que permeti alinear les dues imatges. Els valors
% de la matriu T s'hauran d'obtenir resolent les equacions pertinents, a partir de les
% coordenades de les pastilles en les imatges (podeu obtenir les coordenades de forma
% manual).

% Cercar punts fixes del model
gModel = rgb2gray(dModel);
X = medfilt2(gModel,[5,5])>0.5;
X = bwareafilt(X,12);
T = regionprops('table',X,'Centroid'); % cercles centroids
LT = min(T.Centroid);  % coordenades del centre de la pastilla superior esquerre
RB = max(T.Centroid);  % inferior dreta
LB = [LT(1) RB(2)];    % inferior esquerre
RT = [RB(1) LT(2)];    % superior dreta

M = [LT; RB; LB; RT];  % matriu amb els quatre punts fixes

% Cercar punts del img no alineat
gImg = rgb2gray(dImg);
Y = medfilt2(gImg,[5,5])>0.5;
Y = bwareafilt(Y,12);
S = regionprops('table',Y,'Centroid'); % cercles centroids
LT = min(S.Centroid);  % coordenades del centre de la pastilla superior esquerre
RB = max(S.Centroid);  % inferior dreta
LB = [LT(1) RB(2)];    % inferior esquerre
RT = [RB(1) LT(2)];    % superior dreta

N = [LT; RB; LB; RT];  % matriu amb els quatre punts a moure

tform = fitgeotrans(N,M,'similarity');

%% 3 Transformació
% 3. Transformar geomètricament una de les imatges per a que quedi alineada amb l'altra.
% (podeu usar la funció imwarp)
alignedImg = imwarp(dImg,tform,'Outputview',imref2d(size(dImg)));

%% 4 Diferència alineada
% 4. Obtenir la imatge diferència entre les dues imatges alineades i detectar la presència de
% pastilles de color diferent.
DiffAligned = abs(dModel-alignedImg);
gDiffAligned = rgb2gray(DiffAligned);
gDiffAligned(gDiffAligned>0.1) = 1;
figure,imshow(gDiffAligned),title('Diferència de imatge alineat')