x = linspace(0.01, 2 * pi, 100)'; % Значения от 0 до 2pi
y = (sin(x).^2) ./ (x.^3); % Целевая функция

% Параметры сети
input_size = 1;  % Один входной нейрон
hidden_size = 10; % 10 нейронов в скрытом слое
output_size = 1; % Размер выхода
learning_rate = 0.001; % Скорость обучения
num_epochs = 1000;  % Количество итераций обучения

% Инициализация весов
W1 = rand(input_size, hidden_size);      % Веса от входного слоя к скрытому
b1 = rand(1, hidden_size);               % Смещения скрытого слоя
W2 = rand(hidden_size, output_size);     % Веса от скрытого к выходному
b2 = rand(1, output_size);               % Смещения выходного слоя

% Функция активации - сигмоидная
sigmoid = @(x) 1 ./ (1 + exp(-x));
sigmoid_derivative = @(x) x .* (1 - x); % Производная сигмоиды

% Обучение сети
for epoch = 1:num_epochs
    % Прямое распространение
    S1 = x * W1 + b1;   % Вход скрытого слоя
    Y1 = sigmoid(S1);   % Активация скрытого слоя
    
    S2 = Y1 * W2 + b2; % Вход выходного слоя
    output = S2;      

    % Ошибка
    error = y - output;  % Обратите внимание, y и output имеют одинаковую длину (100)

    % Обратное распространение
    d_output = error; % Градиент для выходного слоя 
    error_hidden_layer = d_output * W2';                % Ошибка скрытого слоя
    d_hidden_layer = error_hidden_layer .* sigmoid_derivative(Y1); % Градиент для скрытого слоя

    % Обновление весов и смещений
    W2 = W2 + Y1' * d_output * learning_rate; % Изменения в весах выходного слоя
    b2 = b2 + sum(d_output, 1) * learning_rate; 
    W1 = W1 + x' * d_hidden_layer * learning_rate;
    b1 = b1 + sum(d_hidden_layer, 1) * learning_rate; 
end

% Вывод обновленных весов
disp('Обновленные веса от входного к скрытому слою:');
disp(W1);
disp('Обновленные смещения скрытого слоя:');
disp(b1);
disp('Обновленные веса от скрытого к выходному слою:');
disp(W2);
disp('Обновленные смещения выходного слоя:');
disp(b2);

% Вывод окончательных предсказаний
disp('Предсказания после обучения:');
predictions = output';  % Транспонируем для удобства отображения
disp(predictions);

% Визуализация результатов
figure;
plot(x, y, 'b', 'LineWidth', 1.5); hold on; % Истинная функция
plot(x, predictions, 'r--', 'LineWidth', 1.5); % Предсказания нейронной сети
legend('Истинная функция', 'Предсказания нейронной сети');
xlabel('x');
ylabel('y');
title('Сравнение истинной функции и предсказаний нейронной сети');
grid on;
