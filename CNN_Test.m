trainingData=[];
testingData=[];
trainingLabel={};
testingLabel={};
numberOfClass=0;
totalNum=0;
dataLength=8000;
testLength=800;
fprintf('loading start');

%training data loading
fileName='BPSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'BPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('BPSK finished!');


fileName='4PSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'4PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('4PSK finished!');

fileName='8PSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'8PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('8PSK finished!');

fileName='8PAM';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'8PAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('8PAM finished!');

fileName='8QAM';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'8QAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('8QAM finished!');



fileName='64QAM';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'64QAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('64QAM finished!');


Y=categorical(trainingLabel);


%CNN
options=trainingOptions('sgdm', ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.2, ...
    'LearnRateDropPeriod',5, ...
    'MaxEpochs',20, ...
    'Shuffle','every-epoch', ...
    'MiniBatchSize',64, ...
    'Plots','training-progress');
   

layers = [
    image3dInputLayer([2 100 200 1])
    convolution3dLayer([2,3,3],16,'Stride',[1 2 2],'Padding',1)
    tanhLayer
    maxPooling3dLayer(3,'Stride',[1 2 2])
    fullyConnectedLayer(numberOfClass)
    softmaxLayer
    classificationLayer];

net=trainNetwork(trainingData,Y,layers,options);

save('model',net)