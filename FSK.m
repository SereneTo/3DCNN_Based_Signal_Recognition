function FSK(M,fc,Rs,n,freqsep,times)
close all
% fc = 30e6; Rs = 1e6;
% times = 4; n = 100;
% M = 4; freqsep = 1*Rs;  % Frequency separation (Hz)
nsamp = 20;    % Number of samples per symbol
Fs = Rs*nsamp ;      % Sample rate (Hz)
fs = 3*fc; 
if fc == 0
    up = 8;down = 1;
else
    [up,down] = rat(fs/Fs);
end
rolloff = 0.6; span = 4; sps = up; % upsample factor
filterCoeffs = rcosdesign(rolloff,span,sps);% pulse-shaping filter

type = [num2str(M),'FSK']; fs = Fs*sps/down;
%ProgressBar = waitbar(0,'please wait');
fskdata = struct;
commparameter = struct;

for i = 1:times
    x = randi([0 M-1],1,n);
    modData = fskmod(x,M,freqsep,nsamp,Fs);
    %%match the sample rate
    y = filter(filterCoeffs,1,upsample(modData,sps)); %pulse-shaping
    fskdata(i).data = downsample(y,down);
    commparameter(i).data = {type,fc,fs,freqsep};
    %%intermediate frequency
    L = length(fskdata(i).data);
    if fc ~= 0
        ts = 1/fs;
        t = 0:ts:(L-1)*ts;
        fskdata(i).data = fskdata(i).data.*exp(1j*2*pi*fc*t);
    end
    %waitbar(i/times,ProgressBar)
end

% f = (-L/2:L/2-1)/L*Fs*up/down;
% figure(1);subplot(211);plot(real(downsample(y,down)));
% title([type,'�������']);
% subplot(212);
% plot(f/1e6,fftshift(abs(fft(downsample(y,down))/L*2)));
% xlim([-10,10]); xlabel('frequncy(MHz)');
% if fc ~= 0
%     figure(2);
%     subplot(311);plot(real(fskdata(i).data))
%     title('��Ƶ')
%     subplot(312); plot(f/1e6,fftshift(abs(fft(fskdata(i).data)))/L*2);
%     xlabel('frequncy(MHz)');
%     subplot(313);spectrogram(fskdata(i).data,256,250,256,Fs*up/down,'centered','yaxis')
% end

%%save data,parameters
if exist("commparameters.mat",'file')
    load('commparameters.mat','commparameters')
    load('commdata.mat','commdata')
    commdata = [commdata,fskdata];
    L = length(commparameters);
    for i = 1:times
        commparameters(L+i).data = commparameter(i).data;
    end
else
    commdata = fskdata;
    commparameters = commparameter;
end
warning off
save commdata commdata;
save commparameters commparameters;
%delete(ProgressBar)
% end