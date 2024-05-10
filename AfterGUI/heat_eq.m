holder = heat_gui;
if isvalid(holder)
    waitfor(holder)
end;


function [x, u] = heat_equation(L, T, Nx, Nt, alpha)
    % Parameters
    dx = L / Nx;                % Spatial step size
    dt = T / Nt;                % Temporal step size
    x = linspace(0, L, Nx+1);   % Spatial grid
    t = linspace(0, T, Nt+1);   % Temporal grid

    % Initial condition
    u0 = sin(pi*x/L);

    % Initialize solution matrix
    u = zeros(Nx+1, Nt+1);
    u(:, 1) = u0;

    % Crank-Nicolson method
    r = alpha * dt / (2 * dx^2);
    A = diag(2*(1+r)*ones(Nx-1, 1)) + diag(-r*ones(Nx-2, 1), 1) + diag(-r*ones(Nx-2, 1), -1);
    B = diag(2*(1-r)*ones(Nx-1, 1)) + diag(r*ones(Nx-2, 1), 1) + diag(r*ones(Nx-2, 1), -1);

    for n = 1:Nt
        u(2:end-1, n+1) = A \ (B * u(2:end-1, n));
    end
end
% Parameters
L = l_Val2;          % Length of the domain (m)
T = t_Val2;          % Total time (s)
Nx = nx_Val2;        % Number of spatial grid points
Nt = nt_Val2;        % Number of time steps
alpha = alpha_Val;          % Wave speed (m/s)


% Solve using Crank-Nicolson method
[x, u] = heat_equation(L, T, Nx, Nt, alpha);

% Print size of solution matrix
fprintf('Size of solution matrix u: %dx%d\n', size(u));

% Plotting
[X, T] = meshgrid(x, linspace(0, T, Nt+1));
surf(X, T, u');  % Transpose u for correct orientation
xlabel('x');
ylabel('t');
zlabel('u(x,t)');
title('Solution of 1D heat equation using Crank-Nicolson method');


% Save the plot as an image
print('solution_plot.png', '-dpng');
holder2 = showPlot;
if isvalid(showPlot)
    waitfor(showPlot)
end;

