% Fun��o que verifica se o x � par ou impar
% OBS.: Apenas para n�meros inteiros
% Data: 08/05/2013
% Autor: Nielsen C. Damasceno

function res = ispar(x)
   if mod(x,2) == 1
      %sprintf('� �mpar')
      res = 0;
   else
      res = 1;
      %sprintf('� par')
   end
end