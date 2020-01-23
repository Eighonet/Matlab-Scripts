a = 1;
l = 1;
T = 16;
h = l/5; k = h/25; x = [0:h:l]; y = [0:h:l]; 
z = [0:h:l]; t_ = [0:k:T];
[xx, yy, zz] = meshgrid(x,y,z);

f = 5
g = 3
U = zeros(length(x), length(y), length(z), length(t_));
r = a*k/h;
U(:, :, :, 1) = f;
U(:, :, :, 2) = f + k*g;

    for t=2:length(t_)-1
    for i=2:length(x)-1
        for j=2:length(y)-1
                   for k=2:length(z)-1
                    U(i,j,k,t+1) = 2*(1-3*r^2)*U(i,j,k, t) ...
                    + r^2*( U(i,j,k+1,t) + U(i,j,k-1,t) + ...
                    U(i,j+1,k,t) + U(i,j-1,k,t) + U(i+1,j,k,t)...
                    + U(i-1,j,k,t))-U(i,j,k, t-1);
                   end
            end
    end
end

m1 = max(max(max(max(U)))); m2 = min(min(min(min(U)))); 
for j=1:length(t_)

clf
isosurface(xx, yy, zz, U(:,:,:,j))
colorbar
colormap jet

[fe, ve, ce] = isocaps(x, y, z, U(:,:,:,j), 10);
p2 = patch('Faces', fe, 'Vertices', ve, 'FaceVertexCData', ce);

shading flat;
p2.FaceColor = 'interp';
p2.EdgeColor = 'none' ;
title('Temperatures');
set(gca, 'clim', [m2 m1])
set(get(colorbar, 'title'), 'string', ...
    'K', 'FontW', 'bold', 'fontname', ...
    'Times New Roman', 'fontsize', 14);
view(3)
M(j)=getframe;
filename = 'TestAnimated3D.gif'
frame = getframe; 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 
% Write to the GIF File 

end
