dataLength=8000;
takingLength=1600;
trainingShort=struct;

fileName='BPSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='4PSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='8PSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='8PAM';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);


fileName='8QAM';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='16QAM';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='64QAM';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='DBPSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='DQPSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='D8PSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='pi_2 DBPSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='pi_4 DQPSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);

fileName='pi_8 D8PSK';
inputFileName=['TrainingSet/',fileName,'.mat'];
load(inputFileName);
sequence=randperm(numel(training));
for i=1:1:takingLength
   trainingShort(i).data=training(sequence(i)).data;
end
outputFileName=['TrainingSet_Short/',fileName,'.mat'];
save(outputFileName,'trainingShort','-v7.3');
fprintf(fileName);