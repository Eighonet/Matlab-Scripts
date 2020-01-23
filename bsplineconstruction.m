v=-1

point= {0.999+v, 1.286+v, 1.464+v, 0.459+v, -1.536+v, -2.932+v, -2.430+v,-0.507+v, 1.134+v, 1.472+v;
        -0.001, 0.194, 1.180, 2.383, 2.361, 0.599, -1.644, -2.598, -1.850, -0.592}

r = cell2mat(point(1:2, 1:10))

x = (1.2:0.1:10)
y = zeros(2, length(x)-1)
z = zeros(2, length(x)-1)
k = zeros(2, length(x)-1)
for i=1:length(x)-1
    y(1:2,i) = F03(x(i))*r(1:2,1) + ...
    F13(x(i))*r(1:2,2)+ ...
    F23(x(i))*r(1:2,3)+ ...
    F33(x(i))*r(1:2,4)+ ...
    F43(x(i))*r(1:2,5)+ ...
    F53(x(i))*r(1:2,6)+ ...
    F63(x(i))*r(1:2,7)+ ...
    F73(x(i))*r(1:2,8)+ ...
    F83(x(i))*r(1:2,9)+ ...
    F93(x(i))*r(1:2,10);
end

for i=1:length(x)-1
    z(1:2,i) = F02(x(i))*r(1:2,1) + ...
    F12(x(i))*r(1:2,2)+ ...
    F22(x(i))*r(1:2,3)+ ...
    F32(x(i))*r(1:2,4)+ ...
    F42(x(i))*r(1:2,5)+ ...
    F52(x(i))*r(1:2,6)+ ...
    F62(x(i))*r(1:2,7)+ ...
    F72(x(i))*r(1:2,8)+ ...
    F82(x(i))*r(1:2,9)+ ...
    F92(x(i))*r(1:2,10);
end

for i=1:length(x)-1
    k(1:2,i) = F04(x(i))*r(1:2,1) + ...
    F14(x(i))*r(1:2,2)+ ...
    F24(x(i))*r(1:2,3)+ ...
    F34(x(i))*r(1:2,4)+ ...
    F44(x(i))*r(1:2,5)+ ...
    F54(x(i))*r(1:2,6)+ ...
    F64(x(i))*r(1:2,7)+ ...
    F74(x(i))*r(1:2,8)+ ...
    F84(x(i))*r(1:2,9)+ ...
    F94(x(i))*r(1:2,10);
end


hold on

%plot(r(1,1:10)-v,r(2,1:10),'x') %точки сглаживаемой функции
plot(z(1,1:length(x)-1)-v,z(2,1:length(x)-1)) %b-сплайн второго порядка
%plot(y(1,1:length(x)-1)-v, y(2,1:length(x)-1)) %b-сплайн третьего порядка
plot(k(1,1:length(x)-1)-v,k(2,1:length(x)-1)) %b-сплайн четвертого порядка

hold off

k = 4

c = F44(k)+ F34(k) + F24(k) + F14(k) + F04(k)

function f = F01(t)
if ((0 <= t) && (t< 1))
f = 1
else
f =0
end
end
function f = F11(t)
if ((1 <= t) && (t < 2))
f = 1
else
f =0
end
end
function f = F21(t)
if ((2 <= t) && (t< 3))
f = 1
else
f =0
end
end
function f = F31(t)
if ((3 <= t) && (t< 4))
f = 1
else
f =0
end
end
function f = F41(t)
if ((4 <= t) && (t< 5))
f = 1
else
f =0
end
end
function f = F51(t)
if ((5 <= t) && (t < 6))
f = 1
else
f =0
end
end
function f = F61(t)
if ((6 <= t) && (t < 7))
f = 1
else
f =0
end
end
function f = F71(t)
if ((7 <= t) && (t < 8))
f = 1
else
f =0
end
end
function f = F81(t)
if ((8 <= t) && (t< 9))
f = 1
else
f =0
end
end
function f = F91(t)
if ((9 <= t) && (t< 10))
f = 1
else
f =0
end
end
function f = F02(t)
if ((0 <= t) && (t< 1))
f = t
end
if ((1 <= t) && (t< 2))
f = 2-t
end
if (t >= 2)
f = 0
end
end
function f = F12(t)
if ((1 <= t) && (t < 2))
f = (t-1)
end
if ((2 <= t) && (t < 3))
f = 2-(t-1)
end
if ((t < 1)||(t >= 3))
f = 0
end
end
function f = F22(t)
if ((2 <= t) && (t < 3))
f = (t-2)
end
if ((3 <= t) && (t < 4))
f = 2-(t-2)
end
if ((t < 2)||(t >= 4))
f = 0
end
end
function f = F32(t)
if ((3 <= t) && (t < 4))
f = (t-3)
end
if ((4 <= t) && (t < 5))
f = 2-(t-3)
end
if ((t < 3)||(t >= 5))
f = 0
end
end
function f = F42(t)
if ((4 <= t) && (t < 5))
f = (t-4)
end
if ((5 <= t) && (t < 6))
f = 2-(t-4)
end
if ((t < 4)||(t >= 6))
f = 0
end
end
function f = F52(t)
if ((5 <= t) && (t < 6))
f = (t-5)
end
if ((6 <= t) && (t < 7))
f = 2-(t-5)
end
if ((t < 5)||(t >= 7))
f = 0
end
end
function f = F62(t)
if ((6 <= t) && (t < 7))
f = (t-6)
end
if ((7 <= t) && (t < 8))
f = 2-(t-6)
end
if ((t < 6)||(t >= 8))
f = 0
end
end
function f = F72(t)
if ((7 <= t) && (t < 8))
f = (t-7)
end
if ((8 <= t) && (t < 9))
f = 2-(t-7)
end
if ((t < 7)||(t >= 9))
f = 0
end
end
function f = F82(t)
if ((8 <= t) && (t < 9))
f = (t-8)
end
if ((9 <= t) && (t < 10))
f = 2-(t-8)
end
if ((t < 8)||(t >= 10))
f = 0
end
end
function f = F92(t)
if ((9 <= t) && (t < 10))
f = (t-9)
end
if ((10 <= t) && (t < 11))
f = 2-(t-9)
end
if ((t < 9)||(t >= 11))
f = 0
end
end
function f = F03(t)
if ((0 <= t) && (t < 1))
f = (t^2)/2
end
if ((1 <= t) && (t < 2))
f = -t^2 +3*t -3/2
end
if ((2 <= t) && (t < 3))
f = (t^2)/2 - 3*t + 9/2  
end
if ((t < 0)||(t >= 3))
f = 0
end
end
function f = F13(t)
if ((1 <= t) && (t < 2))
f = ((t-1)^2)/2
end
if ((2 <= t) && (t < 3))
f = -(t-1)^2 +3*(t-1) -3/2
end
if ((3 <= t) && (t < 4))
f = ((t-1)^2)/2 - 3*(t-1) + 9/2  
end
if ((t < 1)||(t >= 4))
f = 0
end
end
function f = F23(t)
if ((2 <= t) && (t < 3))
f = ((t-2)^2)/2
end
if ((3 <= t) && (t < 4))
f = -(t-2)^2 +3*(t-2) -3/2
end
if ((4 <= t) && (t < 5))
f = ((t-2)^2)/2 - 3*(t-2) + 9/2  
end
if ((t < 2)||(t >= 5))
f = 0
end
end
function f = F33(t)
if ((3 <= t) && (t < 4))
f = ((t-3)^2)/2
end
if ((4 <= t) && (t < 5))
f = -(t-3)^2 +3*(t-3) -3/2
end
if ((5 <= t) && (t < 6))
f = ((t-3)^2)/2 - 3*(t-3) + 9/2  
end
if ((t < 3) || (t >= 6))
f = 0
end
end
function f = F43(t)
if ((4 <= t) && (t < 5))
f = ((t-4)^2)/2
end
if ((5 <= t) && (t < 6))
f = -(t-4)^2 +3*(t-4) -3/2
end
if ((6 <= t) && (t < 7))
f = ((t-4)^2)/2 - 3*(t-4) + 9/2  
end
if ((t < 4)||(t >= 7))
f = 0
end
end
function f = F53(t)
if ((5 <= t) && (t < 6))
f = ((t-5)^2)/2
end
if ((6 <= t) && (t < 7))
f = -(t-5)^2 +3*(t-5) -3/2
end
if ((7 <= t) && (t < 8))
f = ((t-5)^2)/2 - 3*(t-5) + 9/2  
end
if ((t < 5)||(t >= 8))
f = 0
end
end
function f = F63(t)
if ((6 <= t) && (t < 7))
f = ((t-6)^2)/2
end
if ((7 <= t) && (t < 8))
f = -(t-6)^2 +3*(t-6) -3/2
end
if ((8 <= t) && (t < 9))
f = ((t-6)^2)/2 - 3*(t-6) + 9/2  
end
if ((t < 6)||(t >= 9))
f = 0
end
end
function f = F73(t)
if ((7 <= t) && (t < 8))
f = ((t-7)^2)/2
end
if ((8 <= t) && (t < 9))
f = -(t-7)^2 +3*(t-7) -3/2
end
if ((9 <= t) && (t < 10))
f = ((t-7)^2)/2 - 3*(t-7) + 9/2  
end
if ((t < 7)||(t >= 10))
f = 0
end
end
function f = F83(t)
if ((8 <= t) && (t < 9))
f = ((t-8)^2)/2
end
if ((9 <= t) && (t < 10))
f = -(t-8)^2 +3*(t-8) -3/2
end
if ((10 <= t) && (t < 11))
f = ((t-8)^2)/2 - 3*(t-8) + 9/2  
end
if ((t < 8)||(t >= 11))
f = 0
end
end
function f = F93(t)
if ((9 <= t) && (t < 10))
f = ((t-9)^2)/2
end
if ((10 <= t) && (t < 11))
f = -(t-9)^2 +3*(t-9) -3/2
end
if ((11 <= t) && (t < 12))
f = ((t-9)^2)/2 - 3*(t-9) + 9/2  
end
if ((t < 9)||(t >= 12))
f = 0
end
end

function f = F04(t)
if ((0 <= t) && (t < 1))
f = (t^3)/6
end
if ((1 <= t) && (t < 2))
f = -(1/6)*(3*t^3 - 12*t^2 + 12*t - 4)
end
if ((2 <= t) && (t < 3))
f = (3*t^3 - 24*t^2 + 60*t - 44)/6  
end
if ((3 <= t)&&(t < 4))
f =  -(t^3)/6 + 2*t^2 - 8*t + 32/3
end
if ((t < 0) || (t >= 4))
f = 0
end
end

function f = F14(t)
if ((1 <= t) && (t < 2))
f = ((t-1)^3)/6
end
if ((2 <= t) && (t < 3))
f = -(1/6)*(3*(t-1)^3 - 12*(t-1)^2 + 12*(t-1) - 4)
end
if ((3 <= t) && (t < 4))
f = (3*(t-1)^3 - 24*(t-1)^2 + 60*(t-1) - 44)/6  
end
if ((4 <= t)&&(t < 5))
f =  -((t-1)^3)/6 + 2*(t-1)^2 - 8*(t-1) + 32/3
end
if ((t < 1) || (t >= 5))
f = 0
end
end

function f = F24(t)
if ((2 <= t) && (t < 3))
f = ((t-2)^3)/6
end
if ((3 <= t) && (t < 4))
f = -(1/6)*(3*(t-2)^3 - 12*(t-2)^2 + 12*(t-2) - 4)
end
if ((4 <= t) && (t < 5))
f = (3*(t-2)^3 - 24*(t-2)^2 + 60*(t-2) - 44)/6  
end
if ((5 <= t)&&(t < 6))
f = -((t-2)^3)/6 + 2*(t-2)^2 - 8*(t-2) + 32/3
end
if ((t < 2) || (t >= 6))
f = 0
end
end

function f = F34(t)
if ((3 <= t) && (t < 4))
f = ((t-3)^3)/6
end
if ((4 <= t) && (t < 5))
f = -(1/6)*(3*(t-3)^3 - 12*(t-3)^2 + 12*(t-3) - 4)
end
if ((5 <= t) && (t < 6))
f = (3*(t-3)^3 - 24*(t-3)^2 + 60*(t-3) - 44)/6  
end
if ((6 <= t)&&(t < 7))
f = -((t-3)^3)/6 + 2*(t-3)^2 - 8*(t-3) + 32/3
end
if ((t < 3) || (t >= 7))
f = 0
end
end

function f = F44(t)
if ((4 <= t) && (t < 5))
f = ((t-4)^3)/6
end
if ((5 <= t) && (t < 6))
f = -(1/6)*(3*(t-4)^3 - 12*(t-4)^2 + 12*(t-4) - 4)
end
if ((6 <= t) && (t < 7))
f = (3*(t-4)^3 - 24*(t-4)^2 + 60*(t-4) - 44)/6  
end
if ((7 <= t)&&(t < 8))
f = -((t-4)^3)/6 + 2*(t-4)^2 - 8*(t-4) + 32/3
end
if ((t < 4) || (t >= 8))
f = 0
end
end

function f = F54(t)
if ((5 <= t) && (t < 6))
f = ((t-5)^3)/6
end
if ((6 <= t) && (t < 7))
f = -(1/6)*(3*(t-5)^3 - 12*(t-5)^2 + 12*(t-5) - 4)
end
if ((7 <= t) && (t < 8))
f = (3*(t-5)^3 - 24*(t-5)^2 + 60*(t-5) - 44)/6  
end
if ((8 <= t)&&(t < 9))
f = -((t-5)^3)/6 + 2*(t-5)^2 - 8*(t-5) + 32/3
end
if ((t < 5) || (t >= 9))
f = 0
end
end

function f = F64(t)
if ((6 <= t) && (t < 7))
f = ((t-6)^3)/6
end
if ((7 <= t) && (t < 8))
f = -(1/6)*(3*(t-6)^3 - 12*(t-6)^2 + 12*(t-6) - 4)
end
if ((8 <= t) && (t < 9))
f = (3*(t-6)^3 - 24*(t-6)^2 + 60*(t-6) - 44)/6  
end
if ((9 <= t)&&(t < 10))
f = -((t-6)^3)/6 + 2*(t-6)^2 - 8*(t-6) + 32/3
end
if ((t < 6) || (t >= 10))
f = 0
end
end

function f = F74(t)
if ((7 <= t) && (t < 8))
f = ((t-7)^3)/6
end
if ((8 <= t) && (t < 9))
f = -(1/6)*(3*(t-7)^3 - 12*(t-7)^2 + 12*(t-7) - 4)
end
if ((9 <= t) && (t < 10))
f = (3*(t-7)^3 - 24*(t-7)^2 + 60*(t-7) - 44)/6  
end
if ((10 <= t)&&(t < 11))
f = -((t-7)^3)/6 + 2*(t-7)^2 - 8*(t-7) + 32/3
end
if ((t < 7) || (t >= 11))
f = 0
end
end

function f = F84(t)
if ((8 <= t) && (t < 9))
f = ((t-8)^3)/6
end
if ((9 <= t) && (t < 10))
f = -(1/6)*(3*(t-8)^3 - 12*(t-8)^2 + 12*(t-8) - 4)
end
if ((10 <= t) && (t < 11))
f = (3*(t-8)^3 - 24*(t-8)^2 + 60*(t-8) - 44)/6  
end
if ((11 <= t)&&(t < 12))
f = -((t-8)^3)/6 + 2*(t-8)^2 - 8*(t-8) + 32/3
end
if ((t < 8) || (t >= 12))
f = 0
end
end


function f = F94(t)
if ((9 <= t) && (t < 10))
f = ((t-9)^3)/6
end
if ((10 <= t) && (t < 11))
f = -(1/6)*(3*(t-9)^3 - 12*(t-9)^2 + 12*(t-9) - 4)
end
if ((11 <= t) && (t < 12))
f = (3*(t-9)^3 - 24*(t-9)^2 + 60*(t-9) - 44)/6  
end
if ((12 <= t)&&(t < 13))
f = -((t-9)^3)/6 + 2*(t-9)^2 - 8*(t-9) + 32/3
end
if ((t < 9) || (t >= 13))
f = 0
end
end