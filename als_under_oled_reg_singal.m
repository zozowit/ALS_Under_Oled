%% Initialization
clear ; close all; clc

%% Load Data
% (R	G	B	BL	ambient	LUX)
% The 1, 2, 3, 4, 5 columns contains the X values and the 6th column
%  contains the label (y).

data = load('data.txt');
% X = data(:, [1:5]);
X = data(:, 1);
y = data(:, 6);
X_length = length(X)
y_length = length(y)

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = %.0f, y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

%[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(X_length, 1) X];

fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 1: Regularized  Regression ============

% Add Polynomial regression Features

% Initialize fitting parameters
theta = zeros(size(X, 2), 1);

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

fprintf(' J_history = %.0f \n', [J_history(1:10,:)]);
fprintf('alpha %f \n', alpha);
pause;
% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


