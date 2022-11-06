clear;
clc;

fs=1000;
N=500;
fc=80;

%%teste 1
%x=randn(1,500);
%h=randn(1,500);

%%teste 2
x=[3 -2.5 4 -1.5 -1];
h=[-2.5 4 3 -2.75 0];


%% fitro butterworth : utilizado para evitar aliasing
[b,a]=butter(4,fc/(fs/2));
xfilt=filter(b,a,x);
hfilt=filter(b,a,h);


%% teste com conv
tic;
Resposta1 = conv(xfilt,hfilt);
temp1=toc;
fprintf('Tempo gasto para realizar a convolução com a função já exixtente: %d',temp1);
fprintf('\n');

%% teste com função criada
tic;
Resposta2 = ConvF(xfilt,hfilt);
temp2=toc;
fprintf('Tempo gasto para realizar a convolução com a função criada:%d',temp2);
fprintf('\n');
%% Erro quadrático médio

M=Resposta1-Resposta2;
No= sum(M);
novo=(No^2)/(length(M));
fprintf('O erro quadrático médio eh: %d',novo);

%% gráficos
figure ()
subplot(3,1,1)
stem(xfilt, 'r')
grid on;
title('Sinal de entrada x[n]');
ylabel('Amplitude');
xlabel('Tempo');

subplot(3,1,2)
stem(hfilt,'r')
grid on;
title('Resposta ao impulso h[n]');
ylabel('Amplitude');
xlabel('Tempo');

subplot(3,1,3)
stem(Resposta1, 'r')
grid on;
title('Saída da função de convolução já existente');
ylabel('Amplitude');
xlabel('Tempo');

%% gráfico 2
figure ()
subplot(3,1,1)
stem(xfilt,'r')
grid on;
title('Sinal de entrada x[n]');
ylabel('Amplitude');
xlabel('Tempo');

subplot(3,1,2)
stem(hfilt,'r')
grid on;
title('Resposta ao impulso h[n]');
ylabel('Amplitude');
xlabel('Tempo');


subplot(3,1,3)
stem (Resposta2,'r')
grid on;
title('Saída da função de convolução criada');
ylabel('Amplitude');
xlabel('Tempo');
