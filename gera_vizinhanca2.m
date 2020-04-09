% Junta cluster (V2)
function classes = gera_vizinhanca2(classes,k)
    %disp('V2');
    maxClass = ver_classes(classes);
    
    if (k > maxClass) || (maxClass <= 2)
        %fprintf('Nº de vizinhança(%d) não pode ser maior que o nº de classes(%d)\n',k,maxClass);
        % garante que o número minimo de cluster seja 2 se maxClass é menor
        % que isso, o algoritmo não faz o movimento, retorna classes.
        return;
    end
    
    % Se for menor que o numero máximo de classes
    % Escolhe as classes que vão ser manipuladas aleatóriamente
    if (k < maxClass)
        [ ~, aleatorios ] = sort(rand(1, k + 1));
        origem = aleatorios(2:end);       % Classe origem se juntará
        destino = aleatorios(1);          % com a classe destino
        
        % Começa a modificar as classes para seu destino
        for i = 1 : length(origem)
            %[~,pos] = find(origem(i)==classes);
            pos = encontrar(classes,origem(i));
            classes(pos) = destino;
        end
        
    else % Se for igual, toda as classe vão ser juntada
        classes(1:end) = gera_indice(1,maxClass);
    end
    
    % Depois de todo o processo.
    % Se houver uma classe ela agora chama-se classe 1
    maxClass = ver_classes(classes);
    if maxClass == 1
        classes = ones(1,length(classes));
    end        
end