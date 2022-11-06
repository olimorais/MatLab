function outvec = Parametrizar_Vec(vector, tam)
% Fun��o que realiza a convolu��o de dois sinais
% function output = ConvF(sinal 1, sinal 2)
% 
% a fun��o recebe estes sinais de entrada, parametriza os sinais
% ordena os vetores de forma espec�fica em uma matriz para realizar a
% multiplica��o que a f�rmula expressa. A sa�da expressa a solu��o da
% convolu��o.
%
% Ana Luiza Morais e Pedro Cota
  outvec = zeros(1,tam);
  for k = 1:length(vector)
    outvec(k) = vector(k);
  end
end