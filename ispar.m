% Função que verifica se o x é par ou impar
% OBS.: Apenas para números inteiros
% Data: 08/05/2013
% Autor: Nielsen C. Damasceno

function res = ispar(x)
   if mod(x,2) == 1
      %sprintf('é ímpar')
      res = 0;
   else
      res = 1;
      %sprintf('é par')
   end
end