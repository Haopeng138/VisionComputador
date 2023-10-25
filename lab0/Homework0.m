% Clear env
clear; close all

% 1. Genera una matriu A de 10x10 amb valors aleatoris entre 0 i 255 de tipus enter
A = randi([0, 255], 10, 10);
% 2. Obté un vector amb la 4a fila de A
A(4,:);
% 3. Obté un vector amb la 4a columna de A
A(:,4);
% 4. Obté una matriu on s'hagi suprimit la 4a columna de A
Result_4 = A;
Result_4(:,4) = [];
% 5. Obté un vector amb el valor màxim de cada columna de A
MaxColsValues = max(A);
% 6. Obté el valor màxim de la matriu A
MaxMatrixValue = max(A(:));
% 7. Obté una matriu amb només les files parells de A
evenRows = A(2:2:end,:);
% 8. Obté la fila i columna on es troba el valor mínim de A
[min_value, min_index] = min(A(:));
[row, col] = ind2sub(size(A), min_index);
% 9. Genera la matriu B trasposant la matriu A
B = A';
% 10. Obté el producte de les matrius A i B
Result_10 = A * B;
% 11. Obté el producte element a element de A i B
Result_11 = A .* B;
% 12. Genera una matriu booleana on cada element (i,j) valgui 1 si A(i,j) > B(i,j), i 0 en cas contrari
Result_12 = A > B;
% 13. Genera un vector amb tots els elements A(i,j) més grans que B(i,j)
Result_13 = A(Result_12);
% 14. Genera una matriu on cada element (i,j) valgui A(i,j) si A(i,j)>B(i,j) , i 0 en cas contrari
Result_14 = A .* Result_12;
% Genera un únic document pdf amb les operacions demanades i el resultat obtingut a sota de cada comentari. Usa la funció PUBLISH
% publish('Homework0.m', 'format', 'pdf');
