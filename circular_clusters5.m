%Construction  of the 2nd cluster  (line segment,  endpoints  (10,-7),  (10,7))
mini=-7;
maxi=7;
step=(maxi-mini)/(n_points(2)-1);
x_coord=10;
for  y=mini:step:maxi
X8=[X8;  x_coord+noise*(rand-.5)  y+noise*(rand-.5)];
end