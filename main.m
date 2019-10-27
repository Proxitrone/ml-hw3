
% mu = 3;
% sigma = 5;
% 
% sequential_estimator(mu, sigma);

% Test 1
b =1;
n =4;
a =1;
w = [1; 2; 3; 4];

bayesian_linear_regression(b, n, a, w);

% Test 2
b =100;
n =4;
a =1;
w = [1; 2; 3; 4];

bayesian_linear_regression(b, n, a, w);


% Test 3
b =1;
n =3;
a =3;
w = [1; 2; 3];

bayesian_linear_regression(b, n, a, w);