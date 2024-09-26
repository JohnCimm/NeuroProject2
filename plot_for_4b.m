
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
figure
tlo = tiledlayout('flow');
t = (0:1:length(kinematics_observed)-1)/testing_data.sample_rate;
nexttile
hold on
plot(t, kinematics_observed(:,1), 'LineStyle','-','Color', "#1761B0", 'LineWidth', 3)
plot(t, k1h.kinematics_predicted(:,1), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
xlabel("Samples")
ylabel("Hand Position")
yticks([0 1])
yticklabels({"Open" "Closed"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 1: Predicted Kinematics For Hand Flexion with Training From Hand Dataset')
nexttile
hold on
plot(t, kinematics_observed(:,2), 'LineStyle','-','Color', "#D2292D", 'LineWidth', 3)
plot(t, k1h.kinematics_predicted(:,2), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
legend(["Observed Kinematics", "Predicted Kinematics"])
xlabel("Samples")
ylabel("Wrist Position")
yticks([0 1])
yticklabels({"Pronated" "Supinated"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 1: Predicted Kinematics For Wrist Flexion with Training From Hand Dataset')
nexttile
hold on
plot(t, kinematics_observed(:,1), 'LineStyle','-','Color', "#1761B0", 'LineWidth', 3)
plot(t, k1w.kinematics_predicted(:,1), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
xlabel("Samples")
ylabel("Hand Position")
yticks([0 1])
yticklabels({"Open" "Closed"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 1: Predicted Kinematics For Hand Flexion with Wrist Dataset')
nexttile
hold on
plot(t, kinematics_observed(:,2), 'LineStyle','-','Color', "#D2292D", 'LineWidth', 3)
plot(t, k1w.kinematics_predicted(:,2), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
legend(["Observed Kinematics", "Predicted Kinematics"])
xlabel("Samples")
ylabel("Wrist Position")
yticks([0 1])
yticklabels({"Pronated" "Supinated"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 1: Predicted Kinematics For Wrist Flexion with Wrist Dataset')



figure
tlo = tiledlayout('flow');
nexttile
% feature2


hold on
plot(t, kinematics_observed(:,1), 'LineStyle','-','Color', "#1761B0", 'LineWidth', 3)
plot(t, k2h.kinematics_predicted(:,1), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
xlabel("Samples")
ylabel("Hand Position")
yticks([0 1])
yticklabels({"Open" "Closed"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 2: Predicted Kinematics For Hand Flexion with Wrist Dataset')
nexttile
hold on
plot(t, kinematics_observed(:,2), 'LineStyle','-','Color', "#D2292D", 'LineWidth', 3)
plot(t, k2h.kinematics_predicted(:,2), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
legend(["Observed Kinematics", "Predicted Kinematics"])
xlabel("Samples")
ylabel("Wrist Position")
yticks([0 1])
yticklabels({"Pronated" "Supinated"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 2: Predicted Kinematics For Hand Flexion with Wrist Dataset')
nexttile
hold on
plot(t, kinematics_observed(:,1), 'LineStyle','-','Color', "#1761B0", 'LineWidth', 3)
plot(t, k2w.kinematics_predicted(:,1), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
xlabel("Samples")
ylabel("Hand Position")
yticks([0 1])
yticklabels({"Open" "Closed"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 2: Predicted Kinematics For Wrist Flexion with Hand Dataset')

nexttile
hold on
plot(t, kinematics_observed(:,2), 'LineStyle','-','Color', "#D2292D", 'LineWidth', 3)
plot(t, k2w.kinematics_predicted(:,2), 'LineStyle','-','Color', "#282828", 'LineWidth', 1.5)
hold off
legend(["Observed Kinematics", "Predicted Kinematics"])
xlabel("Samples")
ylabel("Wrist Position")
yticks([0 1])
yticklabels({"Pronated" "Supinated"})
legend(["Observed Kinematics", "Predicted Kinematics"])
title('Feature 2: Predicted Kinematics For Wrist Flexion with Wrist Dataset')
