% Algoritmo VNS aplicados a microagregação
% Data: 25/02/2013
% Autor: Nielsen C. Damasceno

clc; clear; close all;
%N = 50;
%x = class9(N);                  % Cria base de dados
x = ler_tarragona();
%x = ler_census();
%x = ler_eia2();
%x = company();

%load iris.dat                   % Vamos pegar sepal-length e petal-length
%x = [iris(:,1),iris(:,3)];
nVizinhanca = 3;
iteracaoTotal = 10;
iteracaoAtual = 1;
g = 3;                          % Grupos de ní indivíduos
%classes = solucao_inicial(x,g); % Gera solução inicial
[qtd,~] = size(x);
classes = constroi_classes(4,qtd);
classes = organiza(classes);
%classes = mdav(x,g);

classesmdav = mdav(x,g);

% Auxiliar para imprimir as classes com cores distintas
% maxClass = ver_classes(classes); % Quantidade de classes
% colors = rand(maxClass,3);
% plota(x,classes,colors);        % Visualiza as amostras inicias
% teclar;                         % Espera usuário apertar qualquer botão 

solucao = classes;              % Solução inicial
novasolucao = solucao;          % Solução atual
%matlabpool(2);
tic
while iteracaoAtual < iteracaoTotal
    
    k = 1;    
    while k <= nVizinhanca       
       
        novasolucao = shake(novasolucao,k,g);      % Utiliza o shaker
        novasolucao = organiza(novasolucao);
                
%         maxClass = ver_classes(novasolucao);        % Quantidade de classes
%         clf;
%         colors = rand(maxClass,3);
%         plota(x,novasolucao,colors);
%         pause(0.0005);
        
        %novasolucao = busca_local(x,20,novasolucao);    % Busca Local 1
        [novasolucao, novo_centros] = busca_local2(x,20,novasolucao,g);  % Busca Local 2 (k-means)
        %[novasolucao, novo_centros] = busca_local3(x,novasolucao,g); % Busca Local 3 (H-means)
        %novasolucao = invibialidade(x,novasolucao,novo_centros,g);
        
%         hold on;
%         plotaCentroide(novo_centros); % Visualizaa os centroides
%         pause(0.0005);
        
        novasolucao = organiza(novasolucao);
                        
        % Verificar se a nova solucao eh melhor, ou seja,
        % Se novasolucao < solucaoatual
        [solucao,k,sse] = NeighbourhoodChange2(x,solucao,novasolucao,k,g);
   
    end
    iteracaoAtual = iteracaoAtual + 1;
    fprintf('Iter VNS: %d\n',iteracaoAtual);
    fprintf('SSE %f\n',sse);
end
tempo = toc;

% Visualiza resultados
clf;
maxClass = ver_classes(solucao);        % Quantidade de classes
colors = rand(maxClass,3);
solucao = organiza(solucao);
centros = centroide(x,solucao);  % Encontra centroides
plota(x,solucao,colors);
plotaCentroide(centros,'r'); % Visualizaa os centroides

fprintf('Tempo: %f\n',tempo);

sst = fSST(x);
loss = sse/sst; % Perda de informação
fprintf('IL: %f\n',loss);

ssemdav = fSSE(x,classesmdav,g);
lossmdav = ssemdav/sst;
fprintf('IL Mdav: %f\n',lossmdav);
fprintf('SSE Mdav: %f\n',ssemdav);
%matlabpool close;