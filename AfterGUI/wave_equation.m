holder = wave_gui;
if isvalid(holder)
    waitfor(holder)
end;

function [x, t, u] = wave_function(L, T, Nx, Nt, c)
    % Parameters
    dx = L / (Nx - 1);  % Spatial step size
    dt = T / (Nt - 1);  % Time step size

    % Discretize spatial domain
    x = linspace(0, L, Nx);

    % Discretize time domain
    t = linspace(0, T, Nt);

    % Initialize solution array
    u = zeros(Nx, Nt);

    % Initial condition
    u(:,1) = zeros(Nx, 1);

    % Second initial condition (derivative)
    u(:,2) = zeros(Nx, 1);

    % Boundary conditions
    u(1,:) = 0;
    u(end,:) = 0;

    % Finite difference method
    for n = 2:Nt-1
        for i = 2:Nx-1
            u(i, n+1) = 2*u(i, n) - u(i, n-1) + (c*dt/dx)^2 * (u(i+1, n) - 2*u(i, n) + u(i-1, n));
        end
    end
end

% Parameters
L = l_Val;          % Length of the domain (m)
T = t_Val;          % Total time (s)
Nx = nx_Val;        % Number of spatial grid points
Nt = nt_Val;        % Number of time steps
c = c_Val;          % Wave speed (m/s)

% Solve the wave equation
[x, t, u] = wave_function(L, T, Nx, Nt, c);

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

% Save the plot as an image
print('solution_plot.png', '-dpng');
holder2 = showPlot;
if isvalid(showPlot)
    waitfor(showPlot)
end;