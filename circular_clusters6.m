%Construction  of  the  3rd  cluster  (semicircle,  center  (21,0),  R=3;,  y<0)
n_points = 50;
R=3;
x_center=21;
y_center=0;
mini=x_center-R;
maxi=x_center+R;
step=(maxi-mini)/(n_points(3)-1);
for  x=mini:step:maxi
y=y_center  -  sqrt(R^2-(x-x_center)^2)+noise*(rand-.5);
X8=[X8;  x  y];
end