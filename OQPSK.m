function OQPSK(fc,Rs,Bw,n,times)
close all
% fc = 20e6; Rs = 1e6; Bw = 1e6;
% times = 4; n = 400;
fs = 3*fc; 
if fc == 0
    up = 8;down = 1;
else
    [up,down] = rat(fs/Rs);
end
rolloff = 2*Bw/Rs-1; span = 4; sps = up; % upsample factor
type = 'OQPSK'; fs = Rs*sps/down;
ProgressBar = waitbar(0,'please wait');
oqpskdata = struct;
commparameter = struct;
modulator = comm.OQPSKModulator('BitInput',true,'SamplesPerSymbol', ...
    up,'PulseShape','Root raised cosine',"RolloffFactor",rolloff, ...
    "FilterSpanInSymbols",span);
for i = 1:times
    Data = randi([0,1],n,1);
    modData = modulator(Data).';
    oqpskdata(i).data = downsample(modData,down);
    commparameter(i).data = {type,fc,fs,Bw};
    %%intermediate frequency
    L = length(oqpskdata(i).data);
    if fc ~= 0
        ts = 1/fs;
        t = 0:ts:(L-1)*ts;
        oqpskdata(i).data = oqpskdata(i).data.*exp(1j*2*pi*fc*t);
    end
    waitbar(i/times,ProgressBar)
end
f = (-L/2:L/2-1)/L*Rs*up/down;
figure(1);subplot(211);plot(real(downsample(modData,down)));
title([type,'Âö³å³ÉÐÍ']);
subplot(212);
plot(f/1e6,fftshift(abs(fft(downsample(modData,down))/L*2)));
xlim([-20,20]); xlabel('frequncy(MHz)');
if fc ~= 0
    figure(2);
    subplot(311);plot(real(oqpskdata(i).data))
    title('ÖÐÆµ')
    subplot(312); plot(f/1e6,fftshift(abs(fft(oqpskdata(i).data)))/L*2);
    xlabel('frequncy(MHz)');
    subplot(313);spectrogram(oqpskdata(i).data,256,250,256,Rs*up/down,'centered','yaxis')
end

%%save data,parameters
if exist("commparameters.mat",'file')
    load('commparameters.mat','commparameters')
    load('commdata.mat','commdata')
    commdata = [commdata,oqpskdata];
    L = length(commparameters);
    for i = 1:times
        commparameters(L+i).data = commparameter(i).data;
    end
else
    commdata = oqpskdata;
    commparameters = commparameter;
end
warning off
save commdata commdata;
save commparameters commparameters;
delete(ProgressBar)
end