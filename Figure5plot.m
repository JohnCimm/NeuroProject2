close all
clear all
clc
% load files
load("datasets\testing_dataset.mat")

load("training_dataset.mat")
kinematics_observed = testing_data.hand_kinematics;
f2_wrist = load("featuresW.mat"); % feature 2
f2_hand = load("featuresH.mat");
f2_wrist = load("features1W.mat"); % feature 1
f1_hand = load("features1H.mat");
k1h = load("kin_predict_1h.mat");
k1w = load("kin_predict_1w.mat");
k2h = load("kinematics_p2H.mat");
k2w = load("kinematics_p2W.mat");
plot(kinematics_observed(:,1)+ kinematics_observed(:,2))
klh
%% actual statistics part %%%%%%%%%%%%%%%%%%%%%%%%%%

t1 = 7000
t2 = 17000
t3 = 27000
t4 = 37000
t5 = 47000
t6 = 57000
t8 = 67000
t9 = 77000
t10 = 87000
f1_hand = []
f2_hand = []
f1_wrist = []
f2_wrist = []
% segmentation 
b = 70000
i1 = 1

for i=1:10
    
    if i > 1
        b = 90000
        
    end
    
    i2 = i1+ b

    max(xcorr(k1h.kinematics_predicted(i1:i2,1),kinematics_observed(i1:i2,1)))
    
    f1_hand = [f1_hand, max(xcorr(k1h.kinematics_predicted(i1:i2,1),kinematics_observed(i1:i2,1)))]
    f2_hand = [f2_hand, max(xcorr(k2h.kinematics_predicted(i1:i2,1),kinematics_observed(i1:i2,1)))]
    f1_wrist = [f1_wrist, max(xcorr(k1w.kinematics_predicted(i1:i2,2),kinematics_observed(i1:i2,2)))]
    f2_wrist= [f2_wrist, max(xcorr(k2w.kinematics_predicted(i1:i2,2),kinematics_observed(i1:i2,2)))]
    
    i1 = i2
end
% anova test
f1 = [f1_hand(1:5) ;f1_wrist(6:10) ];
f2 = [f2_hand(1:5) ;f2_wrist(6:10)];
[p1,t1,stats1] = anova1(f1_hand(1:5) ,f1_wrist(6:10) );
[p2,t2,stats2] = anova1(f2_hand(1:5) ,f2_wrist(6:10) );

%%
figure;

[c,m,h,gnames] = multcompare(stats1);
legend()

%%
t2h = anova(f2_hand(1:5))


t1w = anova(f1_wrist(5:10))
t2w = anova(f2_hand(5:10))

%%
f1_hand = []
f2_hand = []
f1_wrist = []
f2_wrist = []
f1_hand = max(xcorr(k1h.kinematics_predicted(:,1),kinematics_observed(:,1)))
f2_hand = max(xcorr(k2h.kinematics_predicted(:,1),kinematics_observed(:,1)))
f1_wrist = max(xcorr(k1w.kinematics_predicted(:,2),kinematics_observed(:,2)))
f2_wrist = max(xcorr(k2w.kinematics_predicted(:,2),kinematics_observed(:,2)))
f2 = [f2_hand,f2_wrist]
f1 = [f1_hand,f1_wrist]
%titlearray = ["Feature 1";"Feature 2"]
%figure;
%bar(titlearray,[f1;f2])

%title('Maximum Cross Correlation Signal for Feature 1 and 2 in Predicting Hand/Wrist Flexion')
%ylabel('Maximum Cross Correlation Signal Max(Rxy[n])')
%legend('Hand','Wrist')