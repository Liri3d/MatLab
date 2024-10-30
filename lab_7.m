criteria = {'Разрешение', 'Частота кадров', 'Стабилизация', 'Дополнительные функции', 'Цена', 'Отзывы'};
num_criteria = length(criteria);
weights = [0.3, 0.25, 0.15, 0.15, 0.1, 0.05];

scores = [
3, 2, 1, 1, 3, 1; % Камера 1
2, 3, 1, 1, 2, 1; % Камера 2
3, 3, 0, 1, 3, 0; % Камера 3
1, 2, 1, 1, 4, -1; % Камера 4
3, 2, 1, 1, 1, 1; % Камера 5
2, 1, 1, 1, 2, 0 % Камера 6
];


% Нормируем оценки
normalized_scores = scores ./ sum(scores, 1);
disp('Нормализованные оценки');
disp(normalized_scores);

% Умножаем на веса
final_scores = normalized_scores * weights';
disp('Финальные оценки');
disp(final_scores);

% Имена камер
camera = {'Камера 1', 'Камера 2', 'Камера 3', 'Камера 4', 'Камера 5', 'Камера 6'};

% Вывод результатов
[best_camera_score, best_camera_idx] = max(final_scores);
fprintf('Лучшая видеокамера: %s с оценкой: %.4f\n', camera{best_camera_idx}, best_camera_score);