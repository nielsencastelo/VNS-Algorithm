% Fun��o que gera uma n�mero inteiro aleat�rio de acordo com o intervalo 
% a = 1 e b = 3;
function x = gera_indice(a,b)    
    % a = 1;
    % b = 3;
    x = round(a + (b-a).*rand);
end