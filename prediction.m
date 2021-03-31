% load('TrainingSet_Short/trainingData_Similar.mat');
% load('TrainingSet_Short/trainingLabel_Similar.mat');
load('TrainingSet_Short/testingData_diff.mat');
load('TrainingSet_Short/testingLabel_diff.mat');
fprintf('fininshed!');
% Y=categorical(trainingLabel);
validation=categorical(testingLabel);

load('Training 1000/model_diff.mat');

rxTestPred = classify(net,testingData);
testAccuracy = mean(rxTestPred == validation);
disp("Test accuracy: " + testAccuracy*100 + "%")

figure
cm = confusionchart(validation, rxTestPred);
cm.Title = 'Confusion Matrix for Test Data';
cm.RowSummary = 'row-normalized';
cm.Parent.Position = [cm.Parent.Position(1:2) 740 424];
