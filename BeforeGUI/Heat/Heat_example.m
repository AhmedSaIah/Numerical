% Parameters
L = 1;          % Length of the domain
T = 1;          % Total time
Nx = 4;         % Number of spatial grid points
Nt = 4;         % Number of temporal grid points
alpha = 16;     % Thermal diffusivity coefficient

% Solve using Crank-Nicolson method
[x, u] = crank_nicolson_heat_equation(L, T, Nx, Nt, alpha);

% Print size of solution matrix
fprintf('Size of solution matrix u: %dx%d\n', size(u));

% Plotting
[X, T] = meshgrid(x, linspace(0, T, Nt+1));
surf(X, T, u');  % Transpose u for correct orientation
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Solution of 1D heat equation using Crank-Nicolson method');

