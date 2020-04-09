% Algoritmo kmeans
% Data: 07/05/2013
% Autor: Nielsen C. Damasceno
% Entradas:
%           d(nx2)- s�o os dados iniciais
%           k - quantidade de clusters
%           max_it - n�mero m�ximo de itera��es
% Sa�das:
%           classes - s�o as classes
%           centros - os centros
%           num_it - n�mero de itera��es alcan�ada
% Exemplo: [classe,centros,num_it] = kmeans(d, k, max_it)

function [classe,centros,num_it] = kmeansm(d, k, max_it)

    % Setando vari�veis iniciais
    low = 1;
    high = size(d,1);
    centros = zeros(k,size(d,2));

    % Estabelecendo os k iniciais
    for var = 1:k
        indice(var) = round(low + (high - low)*rand);
        centros(var,:) = d(indice(var),:);
    end


    % Estabelecendo la�o
    classe = zeros(high,1);
    var_cond = 1;
    W = 1;
    while W

        % Calculando dist�ncia euclidiana entre os centroides e os dados
        dist = zeros(high,k);
        for var = 1:high
            for c = 1:k
                soma = 0;
                for s = 1:size(d,2)
                    soma = soma + (d(var,s) - centros(c,s)).^2;
                end
                dist(var,c) = sqrt(soma);
            end
        end
     
        % Guardando classes
        ant_classe = classe;
    
        % Atribuindo as classes para os valores
        for var = 1:high
            [~,indice] = min(dist(var,:));
            classe(var) = indice;
        end
    
        % Guardando classes
        nov_classe = classe;
        
        % Calculando novos centroides
        for c = 1:k
            y = d(classe == c,:);
            centros(c,:) = sum(y)/size(y,1);
        end
    
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
    end


    % Finalizando
    classe = nov_classe;
    num_it = var_cond;
end          