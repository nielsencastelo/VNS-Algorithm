% Separar cluster (V3)
function  classes = gera_vizinhanca3(classes,g,k)
    %disp('V3');
    %x = [1 1.5 1.7 2.2 2 2.5 5.5 4.5 5.1 5 5.3 6; 1 2 0.9 1.9 1.5 1 5 4 3.6 3 4.2 4 ]';
    %g = 2;
    %k = 10;
    %classes =  [1 3 3 3 4 2 2 1 1 4 1 1 1 4 1 5 1 5 5 5]; % Gera solução inicial
    
    tenta = 1;          % Evita que fique muito tempo no loop
    teste = 50  ;      % Até que atinge o numero de teste
    for val = 1 : k     % Fazer isso k-vezes
        
        maxClass = ver_classes(classes);          % ver a qtd de classes
        tamClass = qtd_classes(classes,maxClass); % cada linha é o nº de objetos na classe
    
        % Vejo qual é a classe que têm mais objetos para separa-los
        [tam,cla] = max(tamClass); % Pego a qtd de objetos e sua posição
    
        if ver_g(g,tam)  % Tenho que verificar se atende ao critério de g
            return
        end
    
        outraClasse = maxClass + 1; % Cria outra classes
        gera = gera_indice(1,tam);  % Cria um ponto aleatóriamente para dividir a classe
        menor = g;
        maior = tam - (g - 1);
    
        while(gera <= menor || gera >= maior); % Garante que vai respeitar o tamanho
                                               % de g dentro do limite inferior e superior
            gera = gera_indice(1,tam);
            tenta = tenta + 1;
            
            if tenta == teste    % Tenta teste-vezes para gera um nº aleatório
                return;          % se não conseguir retorna
            end
        end
    
        % Atribuindo os valores as classes
        posicao = encontrar(classes,cla);
        for i = 1 : gera
            classes(posicao(i)) = cla;
        end
        for j = gera + 1 : tam
            classes(posicao(j)) = outraClasse;
        end
        
    end % Fim do for k-vezes
end