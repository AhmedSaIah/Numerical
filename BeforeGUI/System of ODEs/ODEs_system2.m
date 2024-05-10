% for more than two funtions in the System of ODEs

function dydt = ODEs_system2(t, y, params)
    % ODE system definition
    % y = [x; y; z; ...]
    % dydt = [dx/dt; dy/dt; dz/dt; ...]

    % Extract variables
    num_vars = length(y);
    variables = y(1:num_vars);

    % Extract parameters
    alpha = params.alpha;
    beta = params.beta;
    gamma = params.gamma;
    delta = params.delta;
    % Add more parameters as needed

    % Preallocate dydt
    dydt = zeros(num_vars, 1);

    % ODEs
    for i = 1:num_vars
        % Compute derivatives for each variable
        dydt(i) = compute_derivative(i, variables, params);
    end
end

function deriv = compute_derivative(index, variables, params)
    % Compute derivative for a specific variable

    switch index
        case 1
            % Equation for the first variable (e.g., x)
            deriv = params.alpha * variables(1) - params.beta * variables(1) * variables(2);
        case 2
            % Equation for the second variable (e.g., y)
            deriv = -params.gamma * variables(2) + params.delta * variables(1) * variables(2);
        % Add more cases for additional variables if needed
    end
end

% Example usage of solving system of ODEs
% Initial conditions
x0 = 2;
y0 = 1;
z0 = 0; % Initial condition for additional variable, if present
y_init = [x0; y0; z0]; % Add more initial conditions as needed

% Parameters
params.alpha = 1.2;
params.beta = 0.6;
params.gamma = 0.8;
params.delta = 0.3;
% Add more parameters as needed

% Time span
tspan = [0, 10];

% Solve the system of ODEs
[t, y] = ode45(@(t, y) ODEs_system2(t, y, params), tspan, y_init);

% Plot the solution
plot(t, y(:, 1), '-o', t, y(:, 2), '-o');
xlabel('Time (t)');
ylabel('Population');
legend('x(t)', 'y(t)');
title('Solution of System of ODEs');

