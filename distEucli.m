% Calculando distância euclidiana entre os centroides e os dados
% Data: 28/02/2013
% Autor: Nielsen C. Damasceno
% Entrada:
%           x são os pontos
%           c são os centros
% Saída:    dist - são as distâncias

function [ dist ] = distEucli(x, c) 
    dist = sqrt((x(1) - c(1))^2 + (x(2) - c(2))^2);
end