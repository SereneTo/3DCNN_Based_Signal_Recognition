
%for fileName=['4PSK','8PAM','8PSK','8QAM','16QAM','64QAM','BPSK','D8PSK','DBPSK','DQPSK','pi_2 DBPSK','pi_4 DQPSK','pi_8 D8PSK']
    fileName='pi_2 DBPSK';
    inputFileName=['data/',fileName,'.mat'];
    load(inputFileName);
    tempData = struct;
    for i=1:1:55
        temp=commdata(i).data;
        tempLength=length(temp);
        totalLength=ceil(20000/tempLength);

        if totalLength==1
            fullSignal=temp;
            result=fullSignal(1,1:20000);
            tempData(4*i-3).data=result;
            tempData(4*i-2).data=awgn(result,5,'measured');
            tempData(4*i-1).data=awgn(result,10,'measured');
            tempData(4*i).data=awgn(result,15,'measured');
        else 
            fullSignal=temp;
            for j=1:1:totalLength
                temp1=[fullSignal temp];
                fullSignal=temp1;
            end
            result=fullSignal(1,1:20000);
            tempData(4*i-3).data=result;
            tempData(4*i-2).data=awgn(result,5,'measured');
            tempData(4*i-1).data=awgn(result,10,'measured');
            tempData(4*i).data=awgn(result,15,'measured');
        end
    end

    finalData = struct;
   
    chan1=rayleighchan(1/20000,50);
    chan2=rayleighchan(1/20000,100);
    chan3=rayleighchan(1/20000,150);
    chan4=rayleighchan(1/20000,200);
    
    for j=1:1:220
        temp1=tempData(j).data;
        finalData(5*j-4).data=filter(chan1,temp1);
        finalData(5*j-3).data=filter(chan2,temp1);
        finalData(5*j-2).data=filter(chan3,temp1);
        finalData(5*j-1).data=filter(chan4,temp1);
        finalData(5*j).data=temp1;
    end
    
    expandedData=finalData;
    outputFileName=['SimilarSet/',fileName,'.mat'];
    save(outputFileName,'expandedData');
%end