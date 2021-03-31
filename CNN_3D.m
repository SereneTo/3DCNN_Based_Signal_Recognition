trainingData=[];
testingData=[];
trainingLabel={};
testingLabel={};
numberOfClass=0;
totalNum=0;
dataLength=1000;
testLength=800;
fprintf('loading start');
%training data loading
fileName='BPSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'BPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('BPSK finished!');


fileName='4PSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'4PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('4PSK finished!');

fileName='8PSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'8PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('8PSK finished!');

fileName='8PAM';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
     tempLabel=[trainingLabel,'8PAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('8PAM finished!');

fileName='8QAM';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'8QAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('8QAM finished!');

fileName='16QAM';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'16QAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('16QAM finished!');


fileName='64QAM';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'64QAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('64QAM finished!');


fileName='D8PSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'D8PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='DBPSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'DBPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='DQPSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'DQPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='pi_2 DBPSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'pi_2 DBPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;


fileName='pi_4 DQPSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'pi_4 DQPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='pi_8 D8PSK';
file=['TrainingSet_Short/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(trainingShort(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'pi_8 D8PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;


Y=categorical(trainingLabel);

%testing data loading
fileName='BPSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'BPSK'];
    testingLabel=tempValidationLabel;
end

fileName='4PSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'4PSK'];
    testingLabel=tempValidationLabel;
end

fileName='8PSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'8PSK'];
    testingLabel=tempValidationLabel;
end

fileName='8PAM';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'8PAM'];
    testingLabel=tempValidationLabel;
end

fileName='8QAM';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'8QAM'];
    testingLabel=tempValidationLabel;
end

fileName='16QAM';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'16QAM'];
    testingLabel=tempValidationLabel;
end

fileName='64QAM';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'64QAM'];
    testingLabel=tempValidationLabel;
end

fileName='DBPSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'DBPSK'];
    testingLabel=tempValidationLabel;
end

fileName='DQPSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'DQPSK'];
    testingLabel=tempValidationLabel;
end

fileName='D8PSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'D8PSK'];
    testingLabel=tempValidationLabel;
end

fileName='pi_2 DBPSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'pi_2 DBPSK'];
    testingLabel=tempValidationLabel;
end

fileName='pi_4 DQPSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'pi_4 DQPSK'];
    testingLabel=tempValidationLabel;
end

fileName='pi_8 D8PSK';
file=['TestingSet/',fileName,'.mat'];

load(file);
for i=1:10:testLength
    temp=ReShape(testing(i).data);
    testingData=cat(5,testingData,temp);
    tempValidationLabel=[testingLabel,'pi_8 D8PSK'];
    testingLabel=tempValidationLabel;
end

validation=categorical(testingLabel);
layers = [
    image3dInputLayer([2 100 200 1],'Name','3D input')
    convolution3dLayer([2,3,3],8,'Stride',[2 2 2],'Padding',1,'Name','conv_3D')
    tanhLayer('Name','tanh_1')
    maxPooling3dLayer([2 4 4],'Stride',[2 4 4],'Name','pooling_3D')
    tanhLayer('Name','tanh_2')
    fullyConnectedLayer(13,'Name','fullyConnection')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classification')];


% load('TrainingSet_Short/trainingData_Short.mat');
% load('TrainingSet_Short/trainingLabel_Short.mat');
% load('TrainingSet_Short/testingData_Short.mat');
% load('TrainingSet_Short/testingLabel_Short.mat');
% fprintf('fininshed!');
% Y=categorical(trainingLabel);
% validation=categorical(testingLabel);

% load('TrainingSet/trainingData_Similar.mat');
% load('TrainingSet/trainingLabel_Similar.mat');
% load('TrainingSet/testingData_Similar.mat');
% load('TrainingSet/testingLabel_Similar.mat');
% fprintf('fininshed!');
% Y=categorical(trainingLabel);
% validation=categorical(testingLabel);
% 


%CNN
options=trainingOptions('sgdm', ...
    'InitialLearnRate',0.02,...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.2, ...
    'LearnRateDropPeriod',9, ...
    'MaxEpochs',20, ...   
    'MiniBatchSize',256, ...
    'Plots','training-progress', ...
    'Shuffle','every-epoch', ...
    'ValidationData',{testingData,validation},...
    'ValidationFrequency', 50);
    

net=trainNetwork(trainingData,Y,layers_2,options);

save('model_similar','net')