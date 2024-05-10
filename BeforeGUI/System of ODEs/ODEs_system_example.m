% Example usage of solving system of ODEs
% Initial conditions
x0 = 2;
y0 = 1;
y_init = [x0; y0];

% Parameters
a = 1.2;
b = 0.6;
c = 0.8;
d = 0.3;

% Time span
tspan = [0, 10];

% Solve the system of ODEs
[t, y] = ode45(@(t, y) ODEs_system(t, y, a, b, c, d), tspan, y_init); % where ode45 is a built in function to solve ODEs

% Plot the solution
plot(t, y(:, 1), '-o', t, y(:, 2), '-o');
xlabel('Time (t)');
ylabel('Value');
legend('x(t)', 'y(t)');
title('Solution of System of ODEs');
print('ODEs_solution_plot.png', '-dpng');

