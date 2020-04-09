%Construction  of  the  4th  cluster  (semicircle,  center  (13,0),  R=3;,  y<0)
R=3;
x_center=13;
mini=x_center-R;
maxi=x_center+R;
step=(maxi-mini)/(n_points(4)-1);
for  x=mini:step:maxi
y=-sqrt(R^2-(x-x_center)^2)+noise*(rand-.5);
X6=[X6;  x  y];
end
X6=X6';
figure(1),  plot(X6(1,:),X6(2,:),'.b')
figure(1),  axis  equal