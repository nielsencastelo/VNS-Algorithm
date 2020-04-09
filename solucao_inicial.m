% Função que gera solução inicial, separa os dados iniciais
% em apenas dois clusters.(independente de quantos grupos há nos dados)
% Data: 25/02/2013
% Autor: Nielsen C. Damasceno
% 
% Entrada:  x - são os dados
%           g - garante o tamanho mínimo de cada clusters
% Saída:    classes
function [classes] = solucao_inicial(x,g)

    tam = length(x);
    gera = gera_indice(1,tam);
    menor = g;
    maior = tam - (g - 1);
    classes = zeros(1,tam);
    
    while(gera <= menor || gera >= maior); % Garante que vai respeitar o tamanho
                                       % de g no limite interior e superior
        gera = gera_indice(1,tam);
    end
    
    % Atribuindo as classes para os valores
    classes(1:gera) = 1;
    classes(gera + 1 : end) = 2;
    
end