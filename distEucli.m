% Calculando dist�ncia euclidiana entre os centroides e os dados
% Data: 28/02/2013
% Autor: Nielsen C. Damasceno
% Entrada:
%           x s�o os pontos
%           c s�o os centros
% Sa�da:    dist - s�o as dist�ncias

function [ dist ] = distEucli(x, c) 
    dist = sqrt((x(1) - c(1))^2 + (x(2) - c(2))^2);
end