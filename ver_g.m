% Fun��o que verificar se atende ao crit�rio de g
% Data: 23/05/2013
% Autor: Nielsen C. Damasceno
% Entrada: tam � a qtd de objetos na classe
% Sa�da: res � 1 se n�o atendeu
        
function res = ver_g(g,tam)
    
     res = false;
    if tam < g || tam < g * 2
        %fprintf('N�o atendeu a crit�rio do g(%d)\n', tam);
        res = true;
    end
end