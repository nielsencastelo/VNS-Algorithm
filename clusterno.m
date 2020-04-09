function [q]=clusterno(clustertot,q)
d1=(clustertot'-repmat(q(1,:),length(clustertot),1)).^2;
d1=sum(d1');
d2=(clustertot'-repmat(q(2,:),length(clustertot),1)).^2;
d2=sum(d2');
d3=(clustertot'-repmat(q(3,:),length(clustertot),1)).^2;
d3=sum(d3');
[p,q]=min([d1;d2;d3]);
end