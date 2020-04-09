%Construction  of  the  2nd  cluster  (ellipse,  centered  at  (0,0),  a=3,b=1))
n_points = [200  200];
a = 3;
b = 1;
noise = 0.2;
mini = -a;
maxi = a;
step=(maxi-mini)/(fix(n_points(2)/2)-1);
for  x=mini:step:maxi
    y1 = b*sqrt(1-x^2/a^2)+noise*(rand-.5);
    y2 =-b*sqrt(1-x^2/a^2)+noise*(rand-.5);
    X6 =[X6;  x  y1;  x  y2];
end