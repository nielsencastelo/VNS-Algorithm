% Implementa a busca local nos cluster (Versão 2)
% Para cada objeto verifica à qual classe ele pertence a partir da menor
% distância euclidiana
% Se depois da busca tiver um cluster com um número de objetos menor que g
% o respectivo cluster se juntará com outro cluster aleatórioamente
% Data: 05/06/2013
% Autor: Nielsen C. Damasceno
% Entrada:  d - são os dados
%           k - quantidade de classes
%           it - maxima iteração
%           classe - as classes
% Saída:    
%           classes
%           centros

function [classes,centros] = busca_local2(d,max_it,classes,g)
    
    % Setando variáveis iniciais
    [~, p] = size(d);
    high = size(d,1);
    
    % Estabelecendo os centros iniciais
    centros = centroide(d,classes);
    
    % Estabelecendo laço
    var_cond = 1;
    W = 1;
    while W
        % Guardando classes
        ant_classe = classes;
        
        % Calculando distância euclidiana entre os centroides e os dados
        classes = distancia_euclidiana(d,classes);
        
        nov_classe = organiza(classes);
        
        % Calculando novos centroides
        centros = centroide(d,nov_classe);
    
        % Variavel de laço
        if ant_classe == nov_classe
            W = 0;
        end
    
        % Controle
        if var_cond > max_it
            W = 0;
        end
        
        % Laço
        var_cond = var_cond + 1;
    end % Fim do While

    % Aqui que vamos ver qual grupo tem o nº de objetos menor que g
    nov_classe = invibialidade(d,nov_classe,centros,g);
 
    % Finalizando
    classes = nov_classe;
end