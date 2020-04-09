% Busca local para separar dois clusters
% Data: 08/04/2013
% Autor: Nielsen C. Damasceno

clc; clear; close all;

a = 5 * [randn(500,1)+5, randn(500,1)+5];
b = 5 * [randn(500,1)+5, randn(500,1)-5];
c = 5 * [randn(500,1)-5, randn(500,1)+5];
d = 5 * [randn(500,1)-5, randn(500,1)-5];
e = 5 * [randn(500,1), randn(500,1)];
x = [a;e]';
% x = [1 2 2.5 3 5 6; 2 1 2.5 1.5 4 5];
% x = [1 1.5 1.7 2.2 2 2.5 5.5 4.5 5.1 5 5.3 6; 1 2 0.9 1.9 1.5 1 5 4 3.6 3 4.2 4 ];
x1 = x(:,1:400);
x2 = x(:,401:end);

% amostras = 30;
% x = randi(t,2,amostras);
% x1 = x(:,1:amostras/2);
% x2 = x(:,amostras/2+1:end);

c1 = mean(x1,2); % Calcula centroide do 1º cluster
c2 = mean(x2,2); % Calcula centroide do 2º cluster

% imprime os clusters
plota(x1,x2);axis([-70 70 -70 70 ]);
plotaCentroid(c1,c2);
pause(1);



% Busca local
dist1 = 0;
dist2 = 0;
xn1 = zeros(2,1);
xn2 = zeros(2,1);
cont1 = 1;
cont2 = 1;

for i = 1 : length(x)
    dist1 = distEucli(x(:,i),c1);
    dist2 = distEucli(x(:,i),c2);
        
    if dist1 < dist2
        xn1(:,cont1) = x(:,i); % Objeto de x1 vai para x2
        cont1 = cont1 + 1;
    else
        xn2(:,cont2) = x(:,i); % Objeto de x1 vai para x2
        cont2 = cont2 + 1;
    end            
end

figure(1), hold off;
x1 = xn1;
x2 = xn2;
plota(x1,x2);axis([-70 70 -70 70 ]);
plotaCentroid(c1,c2);