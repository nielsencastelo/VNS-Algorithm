% Fun��o realiza a busca local baseado no H-Means VNS
% Proposto por Pierre Hansen e Nenad Mladenovic (2001)
% Data: 13/06/2013
% Autor: Nielsen C. Damasceno
% Entrada:  x - s�o os dados
%           k - quantidade de classes
%           it - maxima itera��o
%           classe - as classes
% Sa�da:    
%           classes
%           centros

function [classes, centros] = busca_local3(x,classes,g)

    % Aqui come�a o h-means calculando novos centroides utilizando Sp�th (1980)
    k = ver_classes(classes);        % Quantidade de classes
    %parada = true;
    nova_classe = classes;
    centros = centroide(x,classes);
    for i = 1 : size(classes,2);
        nova_classe = classes;
        CL = nova_classe(i);
        %parada = true;
        for j = 1 : k
            %parada = true;
            nova_classe(i) = j;
            CI = j;
            numofclass = qtd_classes(nova_classe,k);
            NI = numofclass(CI);
            NL = numofclass(CL);
            XL_bar = centros(CL,:);
            XI_bar = centros(CI,:);
            XJ = x(classes(i),:);
            VIJ = ((NI/(NI + 1)) * norm(XI_bar - XJ).^2) - ((NL/(NL - 1)) * norm(XL_bar - XJ).^2);
            % Se VIJ for menor que zero atualiza centros
            if VIJ < 0
                centros(CL,:) = ((NL * XL_bar) - XJ) / (NL - 1);
                centros(CI,:) = ((NI * XI_bar) + XJ) / (NI + 1);
                %parada = false;
            end
            %if VIJ > 0 % se n�o houver melhoria a heuristica p�ra
                %classes = dist_classes(x,classes,centros);
                % Aqui, verificamos qual grupo que tem o cluster menor que g
                %classes = invibialidade(x,classes,centros,g);
                %return;
            %end
        end
    end
    % Se houve melhoria vamos atualizar a classes
    %classes = organiza(classes);
    classes = dist_classes(x,classes,centros);
    classes = organiza(classes);
    %centros = centroide(x,classes);
    % Come�a a rotina de Inviabilidade
    % Aqui, verificamos qual grupo que tem o cluster menor que g
    classes = invibialidade(x,classes,centros,g);
end