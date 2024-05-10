function dydt = ODEs_system(t, y, a, b, c, d)
    % ODE system definition
    % y = [x; y]
    % dydt = [dx/dt; dy/dt]

    % Extract variables
    x = y(1);
    y = y(2);

    % ODEs
    dxdt = a * x - b * x * y;  % the first fucntion i want to solve , where a,b are are coefficients

    dydt = -c * y + d * x * y;  % the second fucntion i want to solve where c,d are are coefficients

    dydt = [dxdt; dydt];
end

