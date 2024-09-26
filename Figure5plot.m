close all
clear all
clc
% load files
load("datasets\testing_dataset.mat")

load("datasets\training_dataset.mat")
kinematics_observed = testing_data.hand_kinematics;
f2_wrist = load("results\featuresW.mat"); % feature 2
f2_hand = load("results\featuresH.mat");
f2_wrist = load("results\features1W.mat"); % feature 1
f1_hand = load("results\features1H.mat");
k1h = load("kin_predict_1h.mat");
k1w = load("kin_predict_1w.mat");
k2h = load("kinematics_p2H.mat");
k2w = load("kinematics_p2W.mat");

%%
f1_hand = max(xcorr(k1h.kinematics_predicted(:,1),kinematics_observed(:,1)))
f2_hand = max(xcorr(k2h.kinematics_predicted(:,1),kinematics_observed(:,1)))
f1_wrist = max(xcorr(k1w.kinematics_predicted(:,2),kinematics_observed(:,2)))
f2_wrist = max(xcorr(k2w.kinematics_predicted(:,2),kinematics_observed(:,2)))
f2 = [f2_hand,f2_wrist]
f1 = [f1_hand,f1_wrist]
titlearray = ["Feature 1";"Feature 2"]
figure;
bar(titlearray,[f1;f2])

title('Maximum Cross Correlation Signal for Feature 1 and 2 in Predicting Hand/Wrist Flexion')
ylabel('Maximum Cross Correlation Signal Max(Rxy[n])')
legend('Hand','Wrist')