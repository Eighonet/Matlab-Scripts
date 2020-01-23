a = 2;
l = 1;
T = 2;
h = l/40; k = h/a/10; x = [0:h:l]; 
y = [0:h:l]; z = [0:h:l]; t_ = [0:k:T];
f = 5
g = 3
U = zeros(length(x), length(y), length(t_));
r = a*k/h;
U(:, :, 1) = f;
U(:, :, 2) = f + k*g;

for t=2:length(t_)-1
    for i=2:length(x)-1
        for j=2:length(y)-1
                U(i,j,t+1) = 2*(1-2*r^2)*U(i,j, t) + ...
                r^2*( U(i,j+1,t) + U(i,j-1,t) + ... 
                U(i+1,j,t) + U(i-1,j,t))-U(i,j, t-1);
        end
    end
end

m1 = max(max(U)); m2 = min(min(U));

for j=1:length(t_)
surf(x,y,U(:,:,j));
axis tight;
shading flat;
M(j)=getframe;
filename = 'TestAnimated2D.gif'
frame = getframe; 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 
% Write to the GIF File 

if j == 1 

imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
else 
imwrite(imind,cm,filename,'gif','WriteMode','append'); 
end
end
