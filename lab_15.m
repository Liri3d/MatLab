x = [-1 1; -2 -1; 1 -2; 2 0]; 
target = [1; 0; 0; 1];
w = [0.1 0.9];
b = [1]; 

max_error = 0.01; 
learning_rate = 0.1;
epoch = 10; 

threshold = 0;
activation = @(z) double(z > threshold);

for e = 1 : epoch
    for i = 1 : size(x, 1)
        new_input = w * x(i, :)' + b;
        output = activation(new_input);

        error = target(i) - output;

        if abs(error) < max_error
            continue;
        end

        w = w + learning_rate * error * x(i, :);
        b = b + learning_rate * error;
    end
end

disp('Веса: ');
disp(w);
disp('Смещение: ');
disp(b);
