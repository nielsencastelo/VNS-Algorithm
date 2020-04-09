% Imprime as classes utilizando o kmeans
clear;clc;close all;
N = 200;
%x = class5(N);                   % Cria base de dados
x = class9(N);
%x = circular_clusters8(N);
% vamos pegar sepal-length e petal-length
%load iris.dat
%x = [iris(:,1),iris(:,3)];
k = 9;
maxIt= 100;
tic;
[classes,centros, iter] = kmeansm(x,k,maxIt);
tempo = toc;


% Mostra resultados visuais
colors = rand(k,3);

figure(1);
plota(x,classes,colors);
plotaCentroide(centros);

fprintf('Qtd de iterações: %d\n',iter);
fprintf('Tempo: %f\n',tempo);