trainingData=[];
testingData=[];
trainingLabel={};
testingLabel={};
numberOfClass=0;
totalNum=0;
dataLength=1000;
testLength=100;
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

fileName='16QAM';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'16QAM'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;
fprintf('16QAM finished!');


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


fileName='D8PSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'D8PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='DBPSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'DBPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='DQPSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'DQPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='pi_2 DBPSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'pi_2 DBPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;


fileName='pi_4 DQPSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'pi_4 DQPSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;

fileName='pi_8 D8PSK';
file=['TrainingSet/',fileName,'.mat'];

load(file);
for i=1:1:dataLength
    temp=ReShape(training(i).data);
    trainingData=cat(5,trainingData,temp);
    tempLabel=[trainingLabel,'pi_8 D8PSK'];
    trainingLabel=tempLabel;
end

totalNum=totalNum+dataLength;
numberOfClass=numberOfClass+1;


Y=categorical(trainingLabel);
save('TrainingSet/trainingData_Similar','trainingData','-v7.3');
save('TrainingSet/trainingLabel_Similar','trainingLabel','-v7.3');
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
save('TrainingSet/testingData_Similar','testingData','-v7.3');
save('TrainingSet/testingLabel_Simliar','testingLabel','-v7.3');
validation=categorical(testingLabel);