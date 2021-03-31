fileName='64QAM';
dataLength=1100;

file1=['SimilarSet/',fileName,'.mat'];
% file2=['DataSet/5GHz/',fileName,'.mat'];

load(file1);
trainingData = struct;
testingData = struct;

m=1;
n=1;
for i=1:1:dataLength
    if mod(i,11)==0
        testingData(m).data=expandedData(i).data;
        m=m+1;
    else
        trainingData(n).data=expandedData(i).data;
        n=n+1;
    end
end

% load(file2)
% 
% for j=1:1:dataLength
%     if mod(j,11)==0
%         testingData(m).data=expandedData(j).data;
%         m=m+1;
%     else
%         trainingData(n).data=expandedData(j).data;
%         n=n+1;
%     end
% end

training=trainingData;
testing=testingData;
outputFileName1=['TrainingSet/',fileName,'.mat'];
save(outputFileName1,'training','-v7.3');
outputFileName2=['TestingSet/',fileName,'.mat'];
save(outputFileName2,'testing','-v7.3');

