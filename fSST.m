% Calculo do SST
% Data: 15/05/2013
% Autor: Nielsen C. Damasceno
% Entrada:      x - s�o os dados
%               classes - s�o os grupos
% Sa�da:        sst - � o erro quadrado que resultar se todos 
%                     os registros foram inclu�dos em um �nico grupo

function sst = fSST(x)
    [m,n] = size(x);
    classes = ones(1,m);
    %xbar = zeros(1,n);
%     for i = 1 : n
%         xbar(:,i) = mean(x(:,i));
%     end

    xbar = centroideclass(x,classes);
    
    sst = 0;
    for j = 1 : m           
        sst = sst + (x(j,:) - xbar) * (x(j,:) - xbar)';
    end
    
    % Vers�o C++
    %sst2 = 0;
    %for j = 1 : m
    %    for k = 1 :n
    %        sst2 = sst2 + (x(j,k) - xbar(k)) * (x(j,k) - xbar(k));
    %    end
    %end
end