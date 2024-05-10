% Example usage
nx = 50; % Number of grid points in x-direction
ny = 50; % Number of grid points in y-direction

% Call the Laplace solver function
T = Laplace_function(nx, ny);

% Plot the temperature distribution
[X, Y] = meshgrid(linspace(0, 1, nx), linspace(0, 1, ny));
contourf(X, Y, T');
colorbar;
xlabel('x');
ylabel('y');
title('Temperature Distribution (°C)');

