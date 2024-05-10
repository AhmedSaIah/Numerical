function [x, u] = crank_nicolson_heat_equation(L, T, Nx, Nt, alpha)
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

