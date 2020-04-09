rand('seed',0)
n_points=[300  200  100  50];  %No  of  points  in  the  first  3  clusters
noise=.5;
X8=[];
%Construction  of  the  1st  cluster  (circle,  center  (-15,0),  R=6)
R=6;
x_center1=-15;
y_center1=0;
mini=x_center1-R;
maxi=x_center1+R;
step=(maxi-mini)/(n_points(1)-1);
for  x=mini:step:maxi
y1=y_center1  +  sqrt(R^2-(x-x_center1)^2)+noise*(rand-.5);
X8=[X8;  x  y1];
end