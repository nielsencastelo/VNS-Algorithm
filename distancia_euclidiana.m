% Calcula a distância euclidiana entre os dados e os centros
% Data: 05/06/2013
% Autor: Nielsen C. Damasceno
% Entrada:  x - são os dados
%           classe - é o vetor da posição das classes
% Saída:    
%           classes - retorna a nova classe

function classes = distancia_euclidiana(x,classes) 
    
    high = size(x,1);
    k = ver_classes(classes);
    centros = centroide(x,classes);
        dist = zeros(high,k);
        for var = 1:high
            for c = 1:k
                soma = 0;
                for s = 1:size(x,2)
                    soma = soma + (x(var,s) - centros(c,s)).^2;
                end
                dist(var,c) = sqrt(soma);
            end
        end
        % Atribuindo as classes para os valores
        for var = 1:high
            [~,indice] = min(dist(var,:));
            classes(var) = indice;
        end
end