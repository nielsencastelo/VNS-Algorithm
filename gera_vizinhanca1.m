% Troca elemento de seu grupo (V1)
function classes = gera_vizinhanca1(classes,k)
    %disp('V1');
    maxClass = ver_classes(classes);
    c = 1 : maxClass;
    posClass = zeros(1,maxClass);
    
    troca = zeros(1,maxClass);
    
    for i = 1 : k               % fazer isso k-vezes
        for j = 1 : length(c)           
            %[~, temp] = find(classes == c(j));
            temp = encontrar(classes,c(j));
            tam = length(temp); % pega o tamanho do vetor de indice de cada
                                % classe
            for m = 1 : tam
                posClass(m,j) = temp(m); % Cada coluna é uma classe
                                         % com os indices
            end
            troca(j) = gera_indice(1,tam);% Escolhe aleatóriamente um ponto 
                                          % em cada classe para fazer a troca
        end
       %fprintf('k = %d\n',i);
       %disp(posClass);
       % Aqui começa a troca dos clusters.
       for n = 1 : maxClass - 1
           t =  posClass(troca(n),n);
           tt = posClass(troca(n + 1),n + 1);
           
           posClass(troca(n),n) = tt;
           posClass(troca(n + 1),n + 1) = t;
       end
       %sprintf('depois da troca');
       %disp(posClass);
       
       % Agora vamos reconstruir todas as classes
        for n = 1 : tam
            for p = 1 : maxClass
                if posClass(n,p) ~= 0 % Verifica se é zero e não executa!
                    posicao = posClass(n,p);
                    classes(posicao) = c(p);
                end
            end
        end
    end
end