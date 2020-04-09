% Cria dados aleatorios numa distribuição gaussina

a = 5 * [randn(500,1)+5, randn(500,1)+5];
b = 5 * [randn(500,1)+5, randn(500,1)-5];
c = 5 * [randn(500,1)-5, randn(500,1)+5];
d = 5 * [randn(500,1)-5, randn(500,1)-5];
e = 5 * [randn(500,1), randn(500,1)];
f = 5 * [randn(500,1)+10, randn(500,1)-10];
g = 5 * [randn(500,1)+10, randn(500,1)+10];
h = 5 * [randn(500,1)+10, randn(500,1)-10];

all = [a;b;c;d;e;f;g;h];

plot(a(:,1), a(:,2),'.'); hold on;
plot(b(:,1), b(:,2),'r.'); hold on;
plot(c(:,1), c(:,2),'g.'); hold on;
plot(d(:,1), d(:,2),'k.'); hold on;
plot(e(:,1), e(:,2),'c.'); hold on;
plot(f(:,1), f(:,2),'c.'); hold on;
plot(g(:,1), g(:,2),'c.'); hold on;
plot(h(:,1), h(:,2),'c.'); hold on;

id = kmeans(all, 8);

for k = 1 : length(all)
    text(all(k,1), all(k,2),num2str(id(k))); hold on;
end

y = pdist(all);
z = linkage(y);
thershold = 1.2;
t = cluster(z,'cutoff',thershold);

for k = 1 : length(all)
    text(all(k,1), all(k,2),num2str(t(k))); hold on;
end
axis([-70 70 -70 70])