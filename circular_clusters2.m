%  Construction  of  the  3rd  cluster  (line  segment,  endpoints  (8,-7),  (8,7))
mini=-7;
maxi=7;
step=(maxi-mini)/(n_points(3)-1);
x_coord=8;
for  y=mini:step:maxi
X6=[X6;  x_coord+noise*(rand-.5)  y+noise*(rand-.5)];
end