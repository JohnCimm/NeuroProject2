n = 5000
window = ones([1,n]);
buffer = zeros([1,948198]);

spike_locations = (abs(filt_neural_data(:,1))> 7.5);


for i  = 1:length(buffer)-n;
    if sum(spike_locations((i):(n+i),1))> 0;
        
    end
 
    buffer(i) = sum(spike_locations((i):(n+i),1))/n;
    
    
        %if buffer(i)> 0.18;
        %    buffer(i) = 5*buffer(i);
        %end
    
        if buffer(i)>0.148*0.3;
           buffer(i) = 0.1485;
        end 

end
figure

plot(buffer)
title('test')
[envHigh, envLow] = envelope(buffer,5,"peak");
envMean = (envHigh+envLow)/2;
hoursPerDay = 100;
coeff24hMA = ones(1, hoursPerDay)/hoursPerDay;

figure
feature = filter(coeff24hMA, 1, buffer);
plot(feature)
figure;
plot((envMean))
max(buffer)