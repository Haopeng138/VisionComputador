%% Sessión 17: Angel Prat, Haopeng Lin

%% 

% load 'df_fulle.mat'
% 48 = 3(tipo de hoha)*16 (img) * 2000(coordenadas de furier)


%% Cargar el imagen
N = 2000;
tmp = df_norm(1,:);
tmp(N+1:end-N) = 0;
figure,plot(log(abs(tmp))),title('espectro reducido')
mida = 1000;
aux2=zeros(mida);
ss2 = ifft(tmp);
% parte real
files = round(real(ss2)+mida/2);
% parte imaginaria
cols = round(imag(ss2)+mida/2);
aux2(sub2ind(size(aux2),files,cols))=1;
figure,imshow(aux2),title('2000 descriptores')

%% Menos descriptor

N = 20;
tmp = df_norm(1,:);
tmp(N+1:end-N) = 0;
figure,plot(log(abs(tmp))),title('espectro reducido')
mida = 1000;
aux2=zeros(mida);
ss2 = ifft(tmp);
% parte real
files = round(real(ss2)+mida/2);
% parte imaginaria
cols = round(imag(ss2)+mida/2);
aux2(sub2ind(size(aux2),files,cols))=1;
figure,imshow(aux2),title('20 descriptor')

%% Conseguir descriptores


% obtener el modulo
desc = abs(df_norm);

% patron + etiqueta => 2000/2 + 1 
patrons = zeros(48,1001);

patrons(:,1:1000) = desc(:,1:1000);
patrons(:,end) = label_tree(:);

