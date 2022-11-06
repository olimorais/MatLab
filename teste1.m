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
fprintf('Tempo gasto para realizar a convolu��o com a fun��o j� exixtente: %d',temp1);
fprintf('\n');

%% teste com fun��o criada
tic;
Resposta2 = ConvF(xfilt,hfilt);
temp2=toc;
fprintf('Tempo gasto para realizar a convolu��o com a fun��o criada:%d',temp2);
fprintf('\n');
%% Erro quadr�tico m�dio

M=Resposta1-Resposta2;
No= sum(M);
novo=(No^2)/(length(M));
fprintf('O erro quadr�tico m�dio eh: %d',novo);

%% gr�ficos
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
title('Sa�da da fun��o de convolu��o j� existente');
ylabel('Amplitude');
xlabel('Tempo');

%% gr�fico 2
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
title('Sa�da da fun��o de convolu��o criada');
ylabel('Amplitude');
xlabel('Tempo');
