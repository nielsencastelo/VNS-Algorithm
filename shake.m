% Função que melhorar a estrutura vizinhanca
% Entrada:
%           x - são os dados
%           classes - são as classes encontradas
%           k - são o número de vizinhança atual
%           g - é o critério de cada clusrtes na microagregação
function classes = shake(classes,k,g)
    
    % Gera um inteiro randominco entre 1 e 3 para selecionar aleatoriamente
    % as vizinhanças
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