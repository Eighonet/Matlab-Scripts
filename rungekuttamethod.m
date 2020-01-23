a = 0;

ay = 1;
y0 = ay; %initial condition for solution 
tspan = [0 1.8]; %the realm of observation 

[t,y] = ode45(@(t,y) tan(y-2*t), tspan, y0);
n = 10; %number of steps - variable
h = 1/(n+1) %step

Y = zeros(1, n+1)
T = a:1/n:a+1;
Y(1) = ay;
for i=2:n
Y(i) = Y(i-1) + (h*(k1(T(i-1), Y(i-1)) + 2*k2(T(i-1), Y(i-1), h) + ...
    2*k3(T(i-1), Y(i-1), h) + k4(T(i-1), Y(i-1), h)))/6; 
end

Y(1)
y(1)


Y(3)
y(2)

hold on
axis([0 1.5 0 2.5]);
plot(T,Y)
plot(t,y) 
hold off



function m = tg(t, y)
    m = tan(y-2*t);
end

function f = k1(t, y)
    f = tg(t, y);
end

function f = k2(t, y, h)
    f = tg(t+h/2, y+(h*tg(t, y))/2);
end

function f = k3(t, y, h)
    f = tg(t+h/2, y+(h*tg(t+h/2, y+(h*tg(t, y))/2))/2); 
end

function f = k4(t, y, h)
    f = tg(t+h, y+(h*tg(t+h/2, y+(h*tg(t+h/2, y+(h*tg(t, y))/2))/2)));
end

