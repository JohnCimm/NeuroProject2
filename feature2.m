sample_rate = 10000
% hand
filt_neural_data_h= smoothdata(filter_neuro(testing_data.raw_neural_data,[200,600]));%(filtfilt(d3,filt_neural_data1));
n = 1000
window = ones([1,n]);
buffer2 = zeros([1,948198]);

tempC= smoothdata(abs((filt_neural_data_h(:,1))> 7.6).*abs(filt_neural_data_h(:,1)));




feat = filter(ones(1,100)/100, 1, tempC);
figure;
plot(feat   )

