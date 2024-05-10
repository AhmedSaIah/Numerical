holder = ode_gui;
if isvalid(holder)
    waitfor(holder)
end;

function dydt = ODEs_solver_and_example(t, y, f1, f2)
    % ODE system definition
    % y = [x; y]
    % dydt = [dx/dt; dy/dt]

    % Extract variables
    x = y(1);
    y = y(2);

    % ODEs
    dxdt = f1;  % the first function to solve

    dydt = f2;  % the second function to solve

    dydt = [dxdt; dydt];
end

% Define the equations f1 and f2
f1 = str2func(['@(x, y)', val1]);
f2 = str2func(['@(x, y)', val2]);

% Example usage of solving system of ODEs
% Initial conditions
x0 = 2;
y0 = 1;
y_init = [x0; y0];

% Time span
tspan = [0, 10];

% Solve the system of ODEs
[t, y] = ode45(@(t, y) ODEs_solver_and_example(t, y, f1(y(1), y(2)), f2(y(1), y(2))), tspan, y_init); % where ode45 is a built-in function to solve ODEs

% Plot the solution
plot(t, y(:, 1), '-o', t, y(:, 2), '-o');
xlabel('Time (t)');
ylabel('Value');
legend('x(t)', 'y(t)');
title('Solution of System of ODEs');

% Save the plot as an image
print('solution_plot.png', '-dpng');
holder2 = showPlot;
if isvalid(showPlot)
    waitfor(showPlot)
end;

