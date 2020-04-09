function plota(x,classes,colors)
    n = length(classes); % Pega a qtd de amostras
    %figure(1);
    hold on;
    
    for i = 1 : n
        p = plot(x(i,1), x(i,2),'mx','LineWidth',3);
        set(p, 'color', colors(classes(i),:))
    end
end