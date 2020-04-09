% Função que verifica a quantidade de objetos em cada classes
% Data: 23/05/2013
% Autor: Nielsen C. Damasceno
% Entrada: classes - as classes
%          maxClass - a quantidade de classes
% Saída: tamClasse - nx1, cada linha é o nº de objtos na classe
function tamClass = qtd_classes(classes,maxClass)

    %maxClass = ver_classes(classes);
    tamClass = zeros(maxClass,1);
    classes = organiza(classes);
    for i = 1 : maxClass
        tamClass(i) = length(find(classes==i));
    end
end