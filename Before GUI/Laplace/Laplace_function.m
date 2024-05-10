% Function definition for Laplace equation solver using finite difference method
function T = Laplace_function(nx, ny)
    % nx: Number of grid points in x-direction
    % ny: Number of grid points in y-direction

    % Grid spacing
    dx = 1 / (nx - 1);
    dy = 1 / (ny - 1);

    % Initialize temperature matrix
    T = zeros(nx, ny);

    % Boundary conditions
    T(1,:) = 0;        % T(0, y) = 0
    T(nx,:) = 0;       % T(1, y) = 0
    T(:,1) = 0;        % T(x, 0) = 0
    T(:,ny) = 100;     % T(x, 1) = 100°C

    % Finite difference iterations
    max_iter = 10000;
    tol = 1e-6;
    iter = 0;
    while true
        T_old = T;

        % Update interior points
        for i = 2:nx-1
            for j = 2:ny-1
                T(i, j) = (T(i+1, j) + T(i-1, j) + T(i, j+1) + T(i, j-1)) / 4;
            end
        end

        % Check for convergence
        if max(abs(T_old(:) - T(:))) < tol || iter > max_iter
            break;
        end

        iter = iter + 1;
    end
end

