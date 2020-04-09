% Função que desordena a classe aleatoriamente
% Data: 15/04/2013
% Autor: Nielsen C. Damasceno
function y = desordenar(classes)    
    tam = length(classes);
    pos = randperm(tam);
    y = classes(:,pos);
end