% Fun��o que melhorar a estrutura vizinhanca
% Entrada:
%           x - s�o os dados
%           classes - s�o as classes encontradas
%           k - s�o o n�mero de vizinhan�a atual
%           g - � o crit�rio de cada clusrtes na microagrega��o
function classes = shake(classes,k,g)
    
    % Gera um inteiro randominco entre 1 e 3 para selecionar aleatoriamente
    % as vizinhan�as
    gr = gera_indice(1,3); 
    switch gr
        case 1
            classes = gera_vizinhanca1(classes,k); % Troca elemento de seu cluster
        case 2
            classes = gera_vizinhanca2(classes,k); % Junta cluster
        case 3
            classes = gera_vizinhanca3(classes,g,k); % Separa cluster
    end
end