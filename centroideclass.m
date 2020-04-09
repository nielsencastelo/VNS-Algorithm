% Fun��o que calcula o centroide de um cluster x de dimens�o nx2
% Data: 15/04/2013
% Autor: Nielsen C. Damasceno
% Entrada:      x - s�o os dados
%               classe - as classes
% Sa�da:        centros nx2
function centros = centroideclass(x,classes)
    
    %k = ver_classes(classes);
    k = max(classes);
    %centros = zeros(k,size(x,2));
    
%     for c = 1:k
%         y = x(classes == c,:);
%         centros(c,:) = sum(y)/size(y,1);
%         %centros(c,:) = mean(y);
%     end
    %Vers�o da rotina para c++
    [tam,dim] = size(x);
    centros = zeros(k,dim);
    soma = zeros(1,dim);
    for i = 1 : k
        comprimento = 0;
        for j = 1 : tam
            for d = 1 : dim
                if classes(j) == i
                    soma(d) = soma(d) + x(j,d);
                end
            end
            if classes(j) == i % Calcula o comprimento
                comprimento = comprimento + 1;
            end
        end
        % Adiciona a soma na vetor centros e calcula a m�dia
        for n  = 1 : dim
            centros(i,n) = soma(n)/comprimento;
        end
        soma = zeros(1,dim); %  zera somas
    end
end