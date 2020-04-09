function [res] = clustercol(pos,N)
    x1=rand(1,N)/4-(0.25)/2;
    y1=rand(1,N)/4-(0.25)/2;
    res=[x1+pos(1);y1+pos(2)];
end