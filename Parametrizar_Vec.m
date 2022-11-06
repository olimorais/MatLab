function outvec = Parametrizar_Vec(vector, tam)
% Função que realiza a convolução de dois sinais
% function output = ConvF(sinal 1, sinal 2)
% 
% a função recebe estes sinais de entrada, parametriza os sinais
% ordena os vetores de forma específica em uma matriz para realizar a
% multiplicação que a fórmula expressa. A saída expressa a solução da
% convolução.
%
% Ana Luiza Morais e Pedro Cota
  outvec = zeros(1,tam);
  for k = 1:length(vector)
    outvec(k) = vector(k);
  end
end