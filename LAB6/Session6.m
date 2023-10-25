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


