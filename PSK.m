function PSK(M,fc,Rs,Bw,n,times)
close all
% fc = 20e6; Rs = 1e6; Bw = 1e6; 
% times = 4; n = 100; M = 4;
fs = 3*fc;
if fc == 0
    up = 8;down = 1;
else
    [up,down] = rat(fs/Rs);
end
rolloff = 2*Bw/Rs-1; span = 4; sps = up; % upsample factor
filterCoeffs = rcosdesign(rolloff,span,sps);% pulse-shaping filter
type = [num2str(M),'PSK']; fs = Rs*sps/down;
%ProgressBar = waitbar(0,'please wait');
pskdata = struct;
commparameter = struct;
for i = 1:times
    Data = randi([0,M-1],1,n);
    modData = pskmod(Data,M,pi/M);    
    %%match the sample rate
    y = filter(filterCoeffs,1,upsample(modData,sps)); %pulse-shaping
    pskdata(i).data = downsample(y,down);
    commparameter(i).data = {type,fc,fs,Bw};
    %%intermediate frequency
    L = length(pskdata(i).data);
    if fc ~= 0
        ts = 1/fs;        
        t = 0:ts:(L-1)*ts;
        pskdata(i).data = pskdata(i).data.*exp(1j*2*pi*fc*t);
    end
    %waitbar(i/times,ProgressBar)
end

% scatterplot(modData);title([type,'����ͼ'])
% f = (-L/2:L/2-1)/L*Rs*up/down;
% figure(2);subplot(211);plot(real(downsample(y,down)));
% title([type,'�������']);
% subplot(212);
% plot(f/1e6,fftshift(abs(fft(downsample(y,down))/L*2)));
% xlim([-20,20]); xlabel('frequncy(MHz)');
% if fc ~= 0
%     figure(3);
%     subplot(311);plot(real(pskdata(i).data))
%     title('��Ƶ')
%     subplot(312); plot(f/1e6,fftshift(abs(fft(pskdata(i).data)))/L*2);
%     xlabel('frequncy(MHz)');
%     subplot(313);spectrogram(pskdata(i).data,256,250,256,Rs*up/down,'yaxis')
% end

%%save data,parameters
if exist("commparameters.mat",'file')
    load('commparameters.mat','commparameters')
    load('commdata.mat','commdata')
    commdata = [commdata,pskdata];
    l = length(commparameters);
    for i = 1:times
        commparameters(l+i).data = commparameter(i).data;
    end
else
    commdata = pskdata;
    commparameters = commparameter;
end
warning off
save commdata commdata;
save commparameters commparameters;
%delete(ProgressBar)
end