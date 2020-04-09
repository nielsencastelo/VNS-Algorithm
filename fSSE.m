% Calculo do SSE
% Data: 15/05/2013
% Autor: Nielsen C. Damasceno
% Entrada:      x - são os dados
%               classes - são os grupos
% Saída:        sse - soma de todos os sse de cada cluster

function sse = fSSEMDAV(x,classes,g)
    % Estabelecendo os centros iniciais
    centros = centroideclass(x,classes);
    k = ver_classes(classes);        % Quantidade de classes
    %k = max(classes);
    c = 1 : k;
   
    ssex = zeros(k,1);
    %for i = 1 : g
        for j = 1 : length(c)           
            temp = x(encontrar(classes,c(j)),:);
            [tam,~] = size(temp); % pega o tamanho de cada classe
            for m = 1 : tam
                %ssex(j) = ssex(j) + norm((temp(m,:) - centros(j,:)) * (temp(m,:) - centros(j,:))');
                %ssex(j) = norm(temp(m,:) - centros(j,:))^2;
                ssex(j) = ssex(j) + (temp(m,:) - centros(j,:)) * (temp(m,:) - centros(j,:))';
            end
            
        end
        sse = sum(ssex);
    %end
    
end