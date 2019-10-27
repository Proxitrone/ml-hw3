function y = poly_linear_dg_withX(n, a, w, x)
%POLY_LINEAR_DG_WITHX Summary of this function goes here
%   Detailed explanation goes here
    %x = rand*2 -1;
    e = uni_gauss_dg(0, a);
    % generate phi
    phi = zeros(size(w));
    for i=1:n
       phi(i) = x^(i-1);
    end
    y = w'*phi + e;
end

