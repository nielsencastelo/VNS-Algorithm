% Função modifica ou não modifica a solução (Improved) VNS
% Data: 17/12/2013
% Autor: Nielsen C. Damasceno
% Entrada:
%       novasolução é a solução corrente
%       solução é solução inicial
%       k é a quantidade de vizinhança
%       x são as amostras
% Saída:
%       solução é a nova solução
%       k é a vizinhança
function [solucao,k,sseSol] = NeighbourhoodChange2(x,solucao,novasolucao,k,g)
 
    sseSol = fSSE(x,solucao,g);
    sseNSol = fSSE(x,novasolucao,g);
    % Verificar se a nova solucao eh melhor, ou seja,
    % Se novasolucao < solucaoatual
    if sseNSol < sseSol
        solucao = novasolucao;
            k = 1; % Para o VNS
    else % vai depender da vizinhança botado no shaker
            k = k + 1;
    end    
end