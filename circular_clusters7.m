%  Construction  of  the  fourth  cluster  (archimidis  spiral)

asp = 0.2;
step=(5*pi)/(n_points(4)-1);
count=0;
x_tot=[];
y_tot=[];
for  theta=pi:step:6*pi
count=count+1;
r=asp*theta;
x_tot=[x_tot;  r*cos(theta)];
y_tot=[y_tot;  r*sin(theta)];
end
X8=[X8;  x_tot  y_tot];