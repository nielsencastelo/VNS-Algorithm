% Implementa a busca local nos cluster (Vers�o 2)
% Para cada objeto verifica � qual classe ele pertence a partir da menor
% dist�ncia euclidiana
% Se depois da busca tiver um cluster com um n�mero de objetos menor que g
% o respectivo cluster se juntar� com outro cluster aleat�rioamente
% Data: 05/06/2013
% Autor: Nielsen C. Damasceno
% Entrada:  d - s�o os dados
%           k - quantidade de classes
%           it - maxima itera��o
%           classe - as classes
% Sa�da:    
%           classes
%           centros

function [classes,centros] = busca_local2(d,max_it,classes,g)
    
    % Setando vari�veis iniciais
    [~, p] = size(d);
    high = size(d,1);
    
    % Estabelecendo os centros iniciais
    centros = centroide(d,classes);
    
    % Estabelecendo la�o
    var_cond = 1;
    W = 1;
    while W
        % Guardando classes
        ant_classe = classes;
        
        % Calculando dist�ncia euclidiana entre os centroides e os dados
        classes = distancia_euclidiana(d,classes);
        
        nov_classe = organiza(classes);
        
        % Calculando novos centroides
        centros = centroide(d,nov_classe);
    
        % Variavel de la�o
        if ant_classe == nov_classe
            W = 0;
        end
    
        % Controle
        if var_cond > max_it
            W = 0;
        end
        
        % La�o
        var_cond = var_cond + 1;
    end % Fim do While

    % Aqui que vamos ver qual grupo tem o n� de objetos menor que g
    nov_classe = invibialidade(d,nov_classe,centros,g);
 
    % Finalizando
    classes = nov_classe;
end