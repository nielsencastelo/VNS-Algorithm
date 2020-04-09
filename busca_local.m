% Implementa a busca local nos cluster (Vers�o 1)
% Para cada objeto verifica � qual classe ele pertence a partir da menor
% dist�ncia euclidiana
% Data: 25/02/2013
% Autor: Nielsen C. Damasceno
% Entrada:  d - s�o os dados
%           k - quantidade de classes
%           it - maxima itera��o
%           classe - as classes
% Sa�da:    
%           classes
%           centros

function classes = busca_local(d,max_it,classes)
    
    % Setando vari�veis iniciais
    high = size(d,1);
    
    % Estabelecendo os centros iniciais
    centros = centroide(d,classes);
    
    

    % Estabelecendo la�o
    %classe = zeros(high,1);
    var_cond = 1;
    W = 1;
    while W

        % Calculando dist�ncia euclidiana entre os centroides e os dados
        k = ver_classes(classes);
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
        ant_classe = classes;
    
        % Atribuindo as classes para os valores
        for var = 1:high
            [~,indice] = min(dist(var,:));
            classes(var) = indice;
        end
    
        % Guardando classes
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
    end


    % Finalizando
    classes = nov_classe;
    num_it = var_cond;
end