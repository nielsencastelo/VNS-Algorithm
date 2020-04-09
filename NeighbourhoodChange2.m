% Fun��o modifica ou n�o modifica a solu��o (Improved) VNS
% Data: 17/12/2013
% Autor: Nielsen C. Damasceno
% Entrada:
%       novasolu��o � a solu��o corrente
%       solu��o � solu��o inicial
%       k � a quantidade de vizinhan�a
%       x s�o as amostras
% Sa�da:
%       solu��o � a nova solu��o
%       k � a vizinhan�a
function [solucao,k,sseSol] = NeighbourhoodChange2(x,solucao,novasolucao,k,g)
 
    sseSol = fSSE(x,solucao,g);
    sseNSol = fSSE(x,novasolucao,g);
    % Verificar se a nova solucao eh melhor, ou seja,
    % Se novasolucao < solucaoatual
    if sseNSol < sseSol
        solucao = novasolucao;
            k = 1; % Para o VNS
    else % vai depender da vizinhan�a botado no shaker
            k = k + 1;
    end    
end