

y1 = training_data.raw_neural_data(:,1);

y2 = filt_neural_data2(:,1);

y3 = (spike_waveforms(1,1));
t = (0:1:length(spike_locations)-1)'/training_data.sample_rate;
figure(1)
subplot(3,1,1)

plot(t,y1)
title('Channel 1: Raw Neural Data')
xlabel('Time (s)')
ylabel('Voltage (\muV)')
subplot(3,1,2)
plot(t,y2)
xlabel('Time (s)')
ylabel('Voltage (\muV)')



title('Channel 1: Filtered Neural Data for Hand Flexion (BandPass [600, 2000] Hz Used)')

subplot(3,1,3)
chan_idx = 1; % random channel
waveform_idx = 1; % random waveform
%The waveform itself is a vector containing 22 samples of neural data, which is equivalent to 0.1 ms before and 0.6 ms after the spike detection event.
waveform_data = spike_waveforms{chan_idx}{waveform_idx}

waveform_time = (-3:1:18)'/training_data.sample_rate*1e3;
plot(waveform_time, waveform_data, LineWidth=3)

xline(0, LineWidth=3, LineStyle="--")
xlabel("Time [ms]")
ylabel("Voltage [\muV]")
title('First Spike Waveform From Channel 1 With Spike Threshold of -15.9')
legend(["Action Potential", "Action Potential Threshold Crossing"])


