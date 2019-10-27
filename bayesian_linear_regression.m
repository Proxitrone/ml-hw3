function error = bayesian_linear_regression(b, n, a, w)
%BAYESIAN_LINEAR_REGRESSION Online learning of bayesian linear regression
%   Detailed explanation goes here
    rng(10);
    error = 1;
    count = 0;
    points_x = [];
    points_y = [];
    PHI = [];
    posterior_old = 0;
    epsilon = 1e-3;
    % precision parameter
    beta = (1/a)^2;
    % Intial prior
    I = eye(numel(w));
    prior = uni_gauss_dg(0, b^-1*I);
    fileID = fopen('bayes_ans.txt', 'w');
    while(1)
       % Generate new datapoint randomly
       [new_x, new_y] = poly_linear_dg(n, a, w);
       % Generate new datapoint with a given x
%        new_x = -0.64152;
%        new_y = poly_linear_dg_withX(n, a, w, new_x);
       
       points_x = [points_x, new_x];
       points_y = [points_y, new_y];
       count = count +1;
       % Compose the basis function PHI
       curr_PHI = zeros(size(w));
       for i=1:n
           curr_PHI(i) = new_x^(i-1);
       end
       PHI = [PHI, curr_PHI];
       % Calculate posterior mean and variance
       sigma_new = inv(b*I + beta*PHI*PHI');
       mean_new = beta*sigma_new*PHI*points_y';
       % Calculate posterior probability
       posterior_new = uni_gauss_dg(mean_new, sigma_new);
       % calculate predictive mean and variance
       % predict 
       predictive_mean = mean_new'*curr_PHI;
       predicitve_vari = 1/beta + curr_PHI'*sigma_new*curr_PHI;
       
       % Print the results of this iteration
       print_bayes(new_x, new_y, mean_new, sigma_new, predictive_mean, predicitve_vari, fileID);
       if count == 10
          mean_ten =  mean_new;
          sigma_ten = sigma_new;
       end
       if count == 50
          mean_fifty =  mean_new;
          sigma_fifty = sigma_new;
       end
       if max(abs(posterior_new - posterior_old),[],'all')<epsilon && count>2
           plot_bayes(w, a, mean_new, sigma_new, mean_ten, sigma_ten, mean_fifty, sigma_fifty, points_x, points_y, beta)
           break;
       end
       posterior_old = posterior_new;
    end
    fclose(fileID);
end

