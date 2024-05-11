f = @(x) x.^2 + 10*x + 25; 
f_prime = @(x) 2*x + 10;

figure;
x_vals = linspace(-15, 5, 100);
y_vals = f(x_vals);
plot(x_vals, y_vals);
grid on;
xlabel('x');
ylabel('f(x)');
title('Function Graph');

prompt = 'Enter initialization value: ';
init_value = input(prompt);

prompt = 'Enter minimum error: ';
error = input(prompt);

prompt = 'Enter number of iterations: ';
iter = input(prompt);

% Newton-Raphson yöntemi
[value_list, error_list] = newtonRaphson(f, f_prime, init_value, error, iter);

fprintf('Root: ');
disp(value_list);
fprintf('Error History(%%): ');
disp(error_list);


function [value_list, error_list] = newtonRaphson(f, f_prime, init_value, error, iter)
    value_list = [];
    error_list = [];
    value_list(1) = init_value;
    
    for i = 1:iter
        f_value = f(value_list(i));
        f_prime_value = f_prime(value_list(i));
        value_list(i+1) = value_list(i) - f_value / f_prime_value;
        error_list(i) = abs((value_list(i+1) - value_list(i))/value_list(i+1))*100;    
    end


    hold on;
    if error_list(end) <= error
        plot(value_list(end), f(value_list(end)), 'rx'); 
    else
        disp('You cannot reach minimum error with this iteration number.');
        plot(value_list(end), f(value_list(end)), 'rx');
    end
    title('Root Graph');


    figure;
    for i = 1:iter
            plot(error_list(i), i, 'ro');
            grid on;
            xlabel('Error');
            ylabel('Iteration');
            hold on;
    end
end
