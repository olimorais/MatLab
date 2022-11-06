%% Caso 2: resolucao com atraso ideal, com média móvel e com acumulador.
%Alunos: Ana Luiza Morais e Pedro Cota
%%
clear;
clc;

fs=1000;
N=1000;
fc=45;

%%teste 1
x=randn(1,500);
h=randn(1,500);


%% fitro butterworth : utilizado para evitar aliasing
[b,a]=butter(4,fc/(fs/2));
xfilt=filter(b,a,x);
hfilt=filter(b,a,h);

%%Atraso ideal

   for i=2:length(x)
   xd(i)=xfilt(i-1);
   hd(i)=hfilt(i-1);
   end
   
   yd=conv(xd,hd); %função nativa
   Yd=ConvF(xd,hd); %função convolução criada
   
%%Media movel

 for i=2:length(x)
 xm(i)=(xfilt(i)+xfilt(i-1))/length(xfilt);
 hm(i)=(hfilt(i)+hfilt(i-1))/length(hfilt);
 end
 
  ym=conv(xm,hm); %função nativa
  Ym=ConvF(xm,hm);%função convolução criada
 
 %%Acumulador
 
 xsum = 0;
 hsum = 0;
 for i=2:length(x)
 xsum = xsum + xfilt(i-1);
 xa(i)=xsum;

 hsum = hsum + hfilt(i-1);
 ha(i)=hsum;
 end
 
 ya=conv(xa,ha); %função nativa
 Ya=ConvF(xa,ha); %função convolução criada
 
%% gráficos
figure()
subplot(3,1,1);
plot(yd);
grid on
title('Convolucao: Atraso Ideal');
ylabel('Amplitude');
xlabel('Tempo')

subplot(3,1,2);
plot(ym);
grid on
title('Convolucao: Filtro de Media Movel');
ylabel('Amplitude');
xlabel('Tempo')

subplot(3,1,3);
plot(ya);
grid on
title('Convolucao: Acumulador');
ylabel('Amplitude');
xlabel('Tempo')
%% gráficos da conv. usando a ConvF
figure()
subplot(3,1,1);
plot(Yd);
grid on
title('Convolucao: Atraso Ideal');
ylabel('Amplitude');
xlabel('Tempo')

subplot(3,1,2);
plot(Ym);
grid on
title('Convolucao: Filtro de Media Movel');
ylabel('Amplitude');
xlabel('Tempo')

subplot(3,1,3);
plot(Ya);
grid on
title('Convolucao: Acumulador');
ylabel('Amplitude');
xlabel('Tempo')

