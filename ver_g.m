% Função que verificar se atende ao critério de g
% Data: 23/05/2013
% Autor: Nielsen C. Damasceno
% Entrada: tam é a qtd de objetos na classe
% Saída: res é 1 se não atendeu
        
function res = ver_g(g,tam)
    
     res = false;
    if tam < g || tam < g * 2
        %fprintf('Não atendeu a critério do g(%d)\n', tam);
        res = true;
    end
end