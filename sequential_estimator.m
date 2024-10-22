function error = sequential_estimator(mu,sigma)
%SEQUENTIAL_ESTIMATOR Summary of this function goes here
%   Detailed explanation goes here
    
    function_txt = ['Data point source function: N(', num2str(mu), ', ', num2str(sigma), ')'];
    disp(function_txt);
    disp(' ');
    error = 1;
    count = 0;
    mean_old = 0;
    M2 = 0;
    population_variance_old = 0;
    %max_iter = 100;
    epsilon = 1e-3;
    while (1)
        % Get new data point
        new_point = uni_gauss_dg(mu, sigma);
        new_point_txt = ['Add data point: ', num2str(new_point)];
        
        % Find current estimates to mu and sigma
        count = count +1;
        delta = new_point - mean_old;
        mean_new = mean_old + delta/count;
        mean_txt = ['Mean = ', num2str(mean_new)];
        delta2 = new_point - mean_new;
        M2 = M2 + delta*delta2;
        population_variance_new = M2/count;
        variance_txt = [' Variance = ', num2str(sqrt(population_variance_new))];
        sample_variance_new = M2/(count-1);
        %Print this iteration results
        disp(new_point_txt);
        disp([mean_txt, variance_txt]);
        % Convergence condition
        if abs(mean_new - mean_old) < epsilon && abs(population_variance_new - population_variance_old)<epsilon && count>2
            break;
        end
        population_variance_old = population_variance_new;
        mean_old = mean_new;
    end
    error = 0;
end

