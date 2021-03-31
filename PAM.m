function PAM(M,fc,Rs,Bw,n,times)
close all
% fc = 20e6; Rs = 1e6; Bw = 1e6;
% times = 400; n = 400; M = 8;
fs = 3*fc; 
if fc == 0
    up = 8;down = 1;
else
    [up,down] = rat(fs/Rs);
end
rolloff = 2*Bw/Rs-1; span = 4; sps = up; % upsample factor
filterCoeffs = rcosdesign(rolloff,span,sps);% pulse-shaping filter
type = [num2str(M),'PAM']; fs = Rs*sps/down;
%ProgressBar = waitbar(0,'please wait');
pamdata = struct;
commparameter = struct;
for i = 1:times
    Data = randi([0,M-1],1,n);
    modData = pammod(Data,M);
    %%match the sample rate
    y = filter(filterCoeffs,1,upsample(modData,sps)); %pulse-shaping
    pamdata(i).data = downsample(y,down);
    commparameter(i).data = {type,fc,fs,Bw};
    %%intermediate frequency
    L = length(pamdata(i).data);
    if fc ~= 0
        ts = 1/fs;
        t = 0:ts:(L-1)*ts;
        pamdata(i).data = pamdata(i).data.*exp(1j*2*pi*fc*t);
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
%     subplot(311);plot(real(pamdata(i).data))
%     title('��Ƶ')
%     subplot(312); plot(f/1e6,fftshift(abs(fft(pamdata(i).data)))/L*2);
%     xlabel('frequncy(MHz)');
%     subplot(313);spectrogram(pamdata(i).data,256,250,256,Rs*up/down,'centered','yaxis')
% end

%%save data,parameters
if exist("commparameters.mat",'file')
    load('commparameters.mat','commparameters')
    load('commdata.mat','commdata')
    commdata = [commdata,pamdata];
    L = length(commparameters);
    for i = 1:times
        commparameters(L+i).data = commparameter(i).data;
    end
else
    commdata = pamdata;
    commparameters = commparameter;
end
warning off
save commdata commdata;
save commparameters commparameters;
%delete(ProgressBar)
end