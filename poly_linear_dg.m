function y = poly_linear_dg(n, a, w)
%POLY_LINEAR_DG Polynomial basis linear model data generator
%   y = W'phi(x) + e
    x = rand*2 -1;
    e = uni_gauss_dg(0, a);
    % generate phi
    phi = zero(size(w));
    for i=1:n
       phi(i) = x^(i-1);
    end
    y = w'*phi + e;
end

