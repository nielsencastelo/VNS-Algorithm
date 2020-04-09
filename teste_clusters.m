% Teste criação de dados
clc;clear;close all;
c1 = clustercol([0.9 0.8],100); 
c2 = clustercol([0.7 0.6],100); 
c3 = clustercol([0.5 0.4],150); 
clus = [c1 c2 c3];

hold on;
plot(c1(1,:),c1(2,:),'ro');
plot(c2(1,:),c2(2,:),'go');
plot(c3(1,:),c3(2,:),'yo');