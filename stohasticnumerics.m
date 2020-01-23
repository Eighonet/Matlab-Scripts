T = 5
curvesNumber = 50
nsteps = 300
h = T/nsteps
t = 0:h:(T-h)
W = zeros(curvesNumber, nsteps);
mu=0;
sigma=sqrt(h)
for j=1:curvesNumber
for i=2:nsteps
    
W(j,i) = W(j,i-1)+ sigma.*randn;
end
end

for j=1:curvesNumber
hold on
figure(1)
set(gcf,'Color',[0,0,0])
plot (t, W(j,1:nsteps))
set(gca,'Color','k')
rectangle('Position',[0 -1 0 2],'FaceColor','Black')
grid on
set(gca, 'YColor', [1 1 1])
set(gca, 'XColor', [1 1 1])
hold off
end

SIG = 0.2
R = 0.05
S0 = 100.0

aSol = zeros(curvesNumber, nsteps);

for j=1:curvesNumber
for i=1:nsteps
aSol(j,i) = S0 * exp((R - SIG * SIG / 2.0) * h*i + SIG * W(j,i));
end
end

aM = sum(aSol)/curvesNumber

for j=1:curvesNumber
hold on
figure(2)
set(gcf,'Color',[0,0,0])
plot (t, aSol(j,1:nsteps))
plot (t, aM(1:nsteps), 'LineWidth',4)
set(gca,'Color','k')
rectangle('Position',[0 -1 0 2],'FaceColor','Black')
grid on
set(gca, 'YColor', [1 1 1])
set(gca, 'XColor', [1 1 1])
hold off
end

