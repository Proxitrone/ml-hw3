function error = plot_bayes(true_w, true_error, final_w, final_error, mean_ten, error_ten, mean_fifty, error_fifty, x, y, beta)
%PLOT_BAYES Plot 4 graphs of the process of learning Bayesian model
%parameters
%   Ground truth, final result, after 10, after 50
   
    point_x = linspace(-2, 2);
    num_points = size(point_x, 2);
    phi = zeros(numel(true_w), numel(point_x));
    n = numel(true_w);
    for i=1:n
       phi(i, :) =  point_x.^(i-1);
    end
    
    figure;
    subplot(2, 2, 1);
    % Ground truth       
    ground_plot = true_w' * phi;
    low_var = ground_plot - true_error;
    high_var = ground_plot + true_error;
    % Mean curve
    title('Ground truth');
    plot(point_x, ground_plot, 'Color', 'k');
    hold on
    % Variance curves
    plot(point_x, low_var, 'Color', 'r');
    plot(point_x, high_var, 'Color', 'r');
    hold off
    
    % Predicted result
    predicted_plot = final_w'*phi;
    var = zeros(size(predicted_plot));
    for i=1:num_points
        var(i) = 1/beta + phi(:,i)'* final_error*phi(:,i);
    end
    low_var = predicted_plot - var;
    high_var = predicted_plot + var;
    
    %Mean curve of predictive distribution
    subplot(2, 2, 2);
    title('Predicted result');
    plot(point_x, predicted_plot, 'Color', 'k');
    hold on
    % Variance curves of predictive distribution
    plot(point_x, low_var, 'Color', 'r');
    plot(point_x, high_var, 'Color', 'r');
    % Plot points
    scatter(x, y);
    hold off
    
    % After 10 incomes
    ten_plot = mean_ten'*phi;
    var = zeros(size(predicted_plot));
    for i=1:num_points
        var(i) = 1/beta + phi(:,i)'* error_ten*phi(:,i);
    end
    low_var = ten_plot - var;
    high_var = ten_plot + var;
    
    %Mean curve of predictive distribution
    subplot(2, 2, 3);
    title('After 10 incomes');
    plot(point_x, ten_plot, 'Color', 'k');
    hold on
    % Variance curves of predictive distribution
    plot(point_x, low_var, 'Color', 'r');
    plot(point_x, high_var, 'Color', 'r');
    % Plot points
    scatter(x(1:10), y(1:10));
    hold off
    
    % After 50 incomes
    fifty_plot = mean_fifty'*phi;
    var = zeros(size(fifty_plot));
    for i=1:num_points
        var(i) = 1/beta + phi(:,i)'* error_fifty*phi(:,i);
    end
    low_var = fifty_plot - var;
    high_var = fifty_plot + var;
    %Mean curve of predictive distribution
    subplot(2, 2, 4);
    title('After 50 incomes');
    plot(point_x, fifty_plot, 'Color', 'k');
    hold on
    % Variance curves of predictive distribution
    plot(point_x, low_var, 'Color', 'r');
    plot(point_x, high_var, 'Color', 'r');
    % Plot points
    scatter(x(1:50), y(1:50));
    hold off
end

