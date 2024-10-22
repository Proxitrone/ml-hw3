function error = print_bayes(new_x, new_y, posterior_mean, posterior_vari, predictive_mean, predictive_vari, fileID)
%PRINT_BAYES Print new data information to a txt file
%   print new datapoint, posterior mean and variance, predicitive
%   distribution
    error = 1;
    precision = 10;
    
    datapoint_txt = ['Add data point: (', num2str(new_x, 5), ', ', num2str(new_y, 5), ')\n\n'];
    
    posterior_mean_txt = 'Posterior mean:\n';
    posterior_vari_txt = 'Posterior variance:\n';
    predictive_txt = ['Predicitve distribution ~ N(', num2str(predictive_mean, 5), ', ', num2str(predictive_vari, 5), ')'];
    point_end_txt = '-----------------------------------------------\n';
    
    fprintf(fileID, datapoint_txt);
    fprintf(fileID, posterior_mean_txt);
    for i=1:numel(posterior_mean)
        fprintf(fileID, [num2str(posterior_mean(i), precision), '\n']);
    end
    fprintf(fileID, '\n');
    I = size(posterior_vari, 1);
    J = size(posterior_vari,2);
    
    fprintf(fileID, posterior_vari_txt);
    for i=1:I
       text = ''; 
       for j=1:J
           text = [text, num2str(posterior_vari(i, j), precision), ', '];
           
       end
       text = text(1:end-2);
       text = [text, '\n'];
       fprintf(fileID, text);
    end
    fprintf(fileID, '\n');
    
    fprintf(fileID, predictive_txt);
    fprintf(fileID, '\n');
    fprintf(fileID, point_end_txt);
end

