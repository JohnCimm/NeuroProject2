sample_rate = 10000
% hand
filt_neural_data_h= filter_neuro(testing_data.raw_neural_data,[200,600]);%(filtfilt(d3,filt_neural_data1));
n = 1000
window = ones([1,n]);
buffer2 = zeros([1,948198]);

spike_locations2 = (abs(filt_neural_data_h(:,1))> 7.5);
for i  = 10:length(buffer2)-n;
    if i<length(buffer2)/2
       buffer2(i) = sum(spike_locations2((i):(n+i),1))/n;
    
    
        if buffer2(i)> 0.1*0.2;
            buffer2(i) = 50*buffer1(i);
        end
    
        if buffer2(i)>0.1;
           buffer2(i) = 0.1485;
        end    
    end
 
  

end

figure
%
plot(buffer2)
title('test')
