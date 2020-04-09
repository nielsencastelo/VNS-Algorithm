% Cria um conjunto de 5 classes
% Data: 27/03/2013
% Autor: Nielsen C. Damasceno
% Entrada:  N é a quantidade de pontos em cada classe
% Saída : x é uma matriz nx2 com as classes criadas

function x = class9(N)

    a = 5 * [randn(N,1) + 5, randn(N,1) + 5];
    b = 5 * [randn(N,1) + 5, randn(N,1) - 5];
    c = 5 * [randn(N,1) - 5, randn(N,1) + 5];
    d = 5 * [randn(N,1) - 5, randn(N,1) - 5];
    e = 5 * [randn(N,1), randn(N,1)];
    f = 5 * [randn(N,1) + 10, randn(N,1) + 10];
    g = 5 * [randn(N,1) + 10, randn(N,1) - 10];
    h = 5 * [randn(N,1) - 10, randn(N,1) + 10];
    i = 5 * [randn(N,1) - 10, randn(N,1) - 10];
    x = [a;b;c;d;e;f;g;h;i];
end