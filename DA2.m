% Define fuzzy variables
humidity = linspace(0, 100, 101);
temperature = linspace(0, 100, 101);
fan_speed = linspace(0, 100, 101);

% Define membership functions
humidity_low = trapmf(humidity, [0, 0, 25, 50]);
humidity_medium = trapmf(humidity, [25, 50, 70, 80]);
humidity_high = trapmf(humidity, [70, 80, 100, 100]);

temperature_cool = trapmf(temperature, [0, 0, 25, 50]);
temperature_moderate = trapmf(temperature, [25, 50, 70, 80]);
temperature_hot = trapmf(temperature, [70, 80, 100, 100]);

fan_speed_low = trapmf(fan_speed, [0, 0, 25, 50]);
fan_speed_medium = trapmf(fan_speed, [25, 50, 70, 80]);
fan_speed_high = trapmf(fan_speed, [70, 80, 100, 100]);

% Visualize membership functions
figure;
subplot(3, 1, 1);
plot(humidity, [humidity_low', humidity_medium', humidity_high']);
title('Humidity Membership Functions');
legend('Low', 'Medium', 'High');
xlabel('Humidity (%)');
ylabel('Membership Degree');

subplot(3, 1, 2);
plot(temperature, [temperature_cool', temperature_moderate', temperature_hot']);
title('Temperature Membership Functions');
legend('Cool', 'Moderate', 'Hot');
xlabel('Temperature (°C)');
ylabel('Membership Degree');

subplot(3, 1, 3);
plot(fan_speed, [fan_speed_low', fan_speed_medium', fan_speed_high']);
title('Fan Speed Membership Functions');
legend('Low', 'Medium', 'High');
xlabel('Fan Speed (%)');
ylabel('Membership Degree');

% Define fuzzy rules
rule1 = min(humidity_low, temperature_hot);
rule2 = min(humidity_medium, temperature_cool);
rule3 = min(humidity_high, temperature_moderate);

% Combine rules
combined_rule = max(rule1, max(rule2, rule3));

% Defuzzification (Centroid method)
fan_speed_output = defuzz(fan_speed, combined_rule, 'centroid');

% Display result
disp(['Fan Speed:', num2str(fan_speed_output)]);
