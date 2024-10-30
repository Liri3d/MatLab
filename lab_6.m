% Данные
profit = [30; 25; 40; 28; 15; 50]; % Прибыль
cost = [40; 20; 45; 30; 12; 30];   % Себестоимость
revenue = [20; 30; 54; 35; 20; 40];% Доходы

% Рентабельность. Сколько получает прибыли
% за каждую потраченную единицу на производство
profitability = profit ./ cost;
disp('Рентабельность (прибыль / себестоимость):');
disp(profitability);

% Коэффициент рентабельности. Какую долю от всех продаж составляет прибыль
coefProb = profit ./ revenue;
disp('Коэффициент рентабельности (прибыль / доход):');
disp(coefProb);

% Общая эффективность как среднее значение
overall_profitability  = (profitability  + coefProb) / 2;
disp('Общая эффективность');
disp(overall_profitability);

% Находим индексы наиболее эффективных предприятий
threshold = mean(overall_profitability);
disp('Средняя эффективность - порог');
disp(threshold);

% Выбор эффективных предприятий
most_efficient_indices = find(overall_profitability  > threshold);

% Вывод результатов
fprintf('Наиболее эффективно работающие предприятия:\n');
for i = 1:length(most_efficient_indices)
    fprintf('Предприятие %d: Эффективность = %.2f\n', most_efficient_indices(i), overall_efficiency(most_efficient_indices(i)));
end