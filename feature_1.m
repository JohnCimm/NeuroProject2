function [buffer] = feature_1(filt_neural_data)
window = ones([1,9599]);
buffer = zeros([1,948199]);

spike_locations = smoothdata(abs(filt_neural_data> 6.5));


for i  = 1:length(buffer)-9599;
    if sum(spike_locations((i):(9599+i)))> 0;
        
    end
 
    buffer(i) = sum(spike_locations((i):(9599+i)))/9599;
    
    
        %if buffer(i)> 0.18;
        %    buffer(i) = 5*buffer(i);
        %end
    
        if buffer(i)>0.148*0.3;
           buffer(i) = 0.1485;
        end 

end
end