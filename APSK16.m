function APSK16(fc,Rs,Bw,gamma,times)
close all
% fc = 20e6; Rs = 1e6; Bw = 1e6; 
% gamma=2; times = 4; 
r1=1; r2=gamma*r1; radii=[r1 r2];
M=[4 12]; modOrder=sum(M);
n = 200;
fs = 3*fc; 
if fc == 0
    up = 8;down = 1;
else
    [up,down] = rat(fs/Rs);
end
rolloff = 2*Bw/Rs-1; span = 4; sps = up; % upsample factor
filterCoeffs = rcosdesign(rolloff,span,sps);% pulse-shaping filter
type = '16APSK'; fs = Rs*sps/down;
ProgressBar = waitbar(0,'please wait');
apsk16data = struct;
commparameter = struct;
for i = 1:times    
    x = randi([0,modOrder-1],1,n);
    modData = apskmod(x,M,radii);
    %%match the sample rate
    y = filter(filterCoeffs,1,upsample(modData,sps)); %pulse-shaping
    apsk16data(i).data = downsample(y,down);
    commparameter(i).data = {type,fc,fs,Bw};
    %%intermediate frequency
    L = length(apsk16data(i).data);
    if fc ~= 0
        ts = 1/fs;        
        t = 0:ts:(L-1)*ts;
        apsk16data(i).data = apsk16data(i).data.*exp(1j*2*pi*fc*t);
    end
    waitbar(i/times,ProgressBar)
end

scatterplot(modData);title([type,'ÐÇ×ùÍ¼'])
f = (-L/2:L/2-1)/L*Rs*up/down;
figure(2);subplot(211);plot(real(downsample(y,down)));
title([type,'Âö³å³ÉÐÍ']);
subplot(212);
plot(f/1e6,fftshift(abs(fft(downsample(y,down))/L*2)));
xlim([-20,20]); xlabel('frequncy(MHz)');
if fc ~= 0
    figure(3);
    subplot(311);plot(real(apsk16data(i).data))
    title('ÖÐÆµ')
    subplot(312); plot(f/1e6,fftshift(abs(fft(apsk16data(i).data)))/L*2);
    xlabel('frequncy(MHz)');
    subplot(313);spectrogram(apsk16data(i).data,256,250,256,Rs*up/down,'centered','yaxis')
end

%%save data,parameters
if exist("commparameters.mat",'file')
    load('commparameters.mat','commparameters')
    load('commdata.mat','commdata')
    commdata = [commdata,apsk16data];
    L = length(commparameters);
    for i = 1:times
        commparameters(L+i).data = commparameter(i).data;
    end
else
    commdata = apsk16data;
    commparameters = commparameter;
end
warning off
save commdata commdata;
save commparameters commparameters;
delete(ProgressBar)
end