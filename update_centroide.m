% Função que atualiza centroide de um cluster x de dimensão nx2
% utilizando Späth (1980)
% Data: 10/07/2013
% Autor: Nielsen C. Damasceno
% Entrada:      x - são os dados
%               classe - as classes
% Saída:        centros nx2
function centros = update_centroide(x,centros,classes,ant_classe)
    
    k = ver_classes(classes);
    centros = zeros(k,size(x,2));
    
    %         for c = 1:k
%             y = d(classes == c,:);
%             n = length(y);
%             vij = zeros(1,n);
%             for i = 1 : n
%                 vij(i) = ((nocla(2)/nocla(2)+1) * norm(centros(2,:) - y(i,:))^2) - ...
%                      (((nocla(1))/nocla(1)-1) * norm(centros(1,:) - y(i,:))^2);
%                  
%                  if min(vij) < 0
%                     centros(1,:) = (nocla(1)*centros(1,:) - y(i,:)) / (nocla(1) - 1);
%                     centros(2,:) = (nocla(2)*centros(2,:) - y(i,:)) / (nocla(2) + 1);
%                  end
%             end
%         end
    
%     for c = 1:k
%         y = x(classes == c,:);
%         %centros(c,:) = sum(y)/size(y,1);
%         centros(c,:) = mean(y);
%     end
end