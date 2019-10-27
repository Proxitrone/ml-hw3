function point = uni_gauss_dg(mu,sigma)
%UNI_GAUSS_DG Univariate gaussian data generator
%   Using Box-Mueller algorithm
    U = rand;
    V = rand;
    
    X = sqrt(-2*log(U)) * cos(2*pi*V);
    Y = sqrt(-2*log(U)) * sin(2*pi*V);
    
    point = mu + sigma*X;
end

