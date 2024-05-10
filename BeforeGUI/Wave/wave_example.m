% Parameters
L = 1;          % Length of the domain (m)
T = 1;          % Total time (s)
Nx = 10;        % Number of spatial grid points
Nt = 40;        % Number of time steps
c = 1;          % Wave speed (m/s)

% Solve the wave equation
[x, t, u] = wave_equation(L, T, Nx, Nt, c);

% Plot the solution
[X, T] = meshgrid(x, t);
surf(X, T, u');
xlabel('Position (x) [m]');
ylabel('Time (t) [s]');
zlabel('Displacement (u)');
title('Solution of 1D Wave Equation using Finite Difference Method');
view(-30, 45); % Adjust the viewing angle
colormap(jet); % Change the colormap
colorbar; % Add colorbar

