
function output = ConvF(vet1, vet2)
% Fun��o que realiza a convolu��o de dois sinais
% function output = Conv_Mat (sinal 1, sinal 2)
% 
% a fun��o recebe estes sinais de entrada, parametriza os sinais
% ordena os vetores de forma espec�fica em uma matriz para realizar a
% multiplica��o que a f�rmula expressa. A sa�da expressa a solu��o da
% convul��o.
%
% Ana Luiza Morais Oliveira e Pedro Cota

%% IN�CIO DO PROGRAMA

% Parametriza��o dos sinais de entrada
  vecN1 = Parametrizar_Vec(vet1,length(vet1)+length(vet2)-1); % VecN1 recebe o novo sinal parametrizado
  vecN2 = Parametrizar_Vec(vet2,length(vet1)+length(vet2)-1); % VecN2 recebe o novo sinal parametrizado
  x = 0;
  tamanho = length(vecN1); % tamanho recebe o tamanho do sinal de entrada
  matriz = zeros(tamanho, tamanho); % cria uma matriz de zeros, de ordem equivalente ao tamanho
  
for k = 1:tamanho
    for l = x+1:tamanho
        matriz(l,k) = vecN1(l-x); % ordena o sinal de entrada em uma forma espec�fica na matriz
    end
    x=x+1;
end
  
output = (matriz*vecN2')'; % sa�da recebe a multiplica��o da matriz pelo sinal 2
  
end