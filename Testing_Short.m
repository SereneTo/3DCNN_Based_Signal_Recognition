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