
syms y(t)
Dy = diff(y);
cond1 = y(1) == 0
cond2 = y(2) == 0
conds = [cond1 cond2]  

odee = diff(y,t,2) - 2*y*t^(-2) == sin(log(t))*t^(-2);
ySol1(t) = dsolve(odee, conds)


a = 1
b = 2 %border values
n = 400 %number of steps -1
h = (b-a)/n %the value of step


px = a:h:b;   qx = a:h:b;   fx = a:h:b;
py = zeros(1, n+1); qy = zeros(1, n+1); fy = zeros(1, n+1);

 
for i =1:n+1
   py(i) = p(px(i)); 
   qy(i) = q(qx(i));
   fy(i) = fk(fx(i));
end


A=zeros(n+1);
B=zeros(n+1,1);

B(1)=(-2*fy(1)*h^3)/(1-(h/2)*py(1));
for i =2:n
   B(i)=fy(i)*h^2;
end 
B(n+1)=(-2*fy(n+1)*h^3)/(1-(h/2)*py(n+1));


A(1,1) =  (2*h*(2 - (h^2)*qy(1)))/(1+(h/2)*py(1));
A(1,2) = (2*h*(1+(h/2)*py(1)))/(1-(h/2)*py(1));
for i =2:n
A(i,i-1) = (1-(h/2)*py(i)); 
A(i,i) = -(2 - (h^2)*qy(i)); 
A(i,i+1) = (1+(h/2)*py(i)); 
end
A(n+1,n) =  (2*h*(2 - (h^2)*qy(n+1)))/(1+(h/2)*py(n+1)); 
A(n+1,n+1) =  (2*h*(1+(h/2)*py(n+1)))/(1-(h/2)*py(n+1));

X = linsolve(A,B)
hold on
axis([1 2 -0.1 0.1]);
t=1:1/n:2
plot(t, ySol1(t))
plot(t, X)
hold off

function f = p(t)
    f = 0;
end

function f = q(t)
    f = -2*t^(-2);
end

function f = fk(t)
    f = sin(log(t))*t^(-2);
end