% Implementar o k-means com animação
clear; clc; close all;

% Cria conjunto de dados nx2
%x = [1 1.5 1.7 2.2 2 2.5 5.5 4.5 5.1 5 5.3 6; 1 2 0.9 1.9 1.5 1 5 4 3.6 3 4.2 4 ]';
x = class5(10);

k = 5;
max_it = 10;
% Setando variáveis iniciais
low = 1;
high = size(x,1);
centros = zeros(k,size(x,2));
indice = zeros(1,k);

% Estabelecendo os k iniciais
for var = 1:k
    indice(var) = round(low + (high - low)*rand);
    centros(var,:) = x(indice(var),:);
end

% Estabelecendo laço
classe = zeros(high,1);

var_cond = 1;
W = 1;
while W

    % Calculando distância euclidiana entre os centroides e os dados
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
     
    % Guardando classes
    ant_classe = classe;
    
    % Atribuindo as classes para os valores
    for var = 1:high
        [~,indice] = min(dist(var,:));
         classe(var) = indice;
    end
    
    % Mostra resultados visuais iniciais
    colors = rand(k,3);
    clf;
    plota(x,classe,colors);
    pause(1);
    plotaCentroide(centros,'r');
    plota_linhas(x,classe,centros);
    teclar;
    
    % Guardando classes
    nov_classe = classe;
        
    % Calculando novos centroides
    for c = 1:k
        y = x(classe == c,:);
        centros(c,:) = sum(y)/size(y,1);
    end
    
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
end


% Finalizando
classe = nov_classe;
num_it = var_cond;

% Mostra resultados visuais
colors = rand(k,3);

figure(1);
hold on;
for i = 1: length(x)
    p = plot(x(i,1), x(i,2),'mx','LineWidth',3');
    set(p, 'color', colors(classe(i),:))
end