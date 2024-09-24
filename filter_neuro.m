function [filt_data] = filter_neuro(data,w)
sample_rate = 10000
[b, a] = butter(4,w/ (sample_rate/2),'bandpass')

%[b2, a2] = butter(4,500/ (sample_rate/2),'low')
ch_init_conds = zeros(8, 6); %initial conditions for filter for all channels

[filt_neural_data1, ~] = FilterX(b, a, data,ch_init_conds);
%[filt_neural_data, ~] = FilterX(b2, a2, filt_neural_data, zeros(4, 6) );
%[b3, a3] = butter(4,250/ (sample_rate/2),'low')
d = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
               'DesignMethod','butter','SampleRate',sample_rate);
d2 = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',119,'HalfPowerFrequency2',121, ...
               'DesignMethod','butter','SampleRate',sample_rate);
d3 = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',179,'HalfPowerFrequency2',181, ...
               'DesignMethod','butter','SampleRate',sample_rate);
filt_neural_data= filtfilt(d,filt_neural_data1);
filt_neural_data= filtfilt(d2,filt_neural_data1);
filt_data= (filtfilt(d3,filt_neural_data1));
end