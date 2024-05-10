function [x, t, u] = wave_equation(L, T, Nx, Nt, c)
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

