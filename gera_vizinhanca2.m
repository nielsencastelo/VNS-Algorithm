% Junta cluster (V2)
function classes = gera_vizinhanca2(classes,k)
    %disp('V2');
    maxClass = ver_classes(classes);
    
    if (k > maxClass) || (maxClass <= 2)
        %fprintf('N� de vizinhan�a(%d) n�o pode ser maior que o n� de classes(%d)\n',k,maxClass);
        % garante que o n�mero minimo de cluster seja 2 se maxClass � menor
        % que isso, o algoritmo n�o faz o movimento, retorna classes.
        return;
    end
    
    % Se for menor que o numero m�ximo de classes
    % Escolhe as classes que v�o ser manipuladas aleat�riamente
    if (k < maxClass)
        [ ~, aleatorios ] = sort(rand(1, k + 1));
        origem = aleatorios(2:end);       % Classe origem se juntar�
        destino = aleatorios(1);          % com a classe destino
        
        % Come�a a modificar as classes para seu destino
        for i = 1 : length(origem)
            %[~,pos] = find(origem(i)==classes);
            pos = encontrar(classes,origem(i));
            classes(pos) = destino;
        end
        
    else % Se for igual, toda as classe v�o ser juntada
        classes(1:end) = gera_indice(1,maxClass);
    end
    
    % Depois de todo o processo.
    % Se houver uma classe ela agora chama-se classe 1
    maxClass = ver_classes(classes);
    if maxClass == 1
        classes = ones(1,length(classes));
    end        
end