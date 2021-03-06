clear all;
% Initiate parameter
N= 32;
Kp = 0.11;
Ki = 0.01;
Kdco = 3e6;
Fref = 25e6;
BBPFD_delay= 1e-12;
Ref_Seed = 0;%for reprodusability
DCO_Seed = 1;%for reprodusability

% Free running frequency is set to Fref*N to to eliminate transient
% time. change 0.99 into 0.9 if you want to calculate the setling time
Ffree = Fref*N*1;
% DCO noise is 16 nano second
% please change value accordingly
DCO_Noise = (16e-12*(N*Fref)^2)^2;
% zero noise
Ref_Noise = 0;

%Obselete parameter
% K3 = 36;
% K4 = 37;

% Setilng time percentage
SetPos = 0.05; %5 percent
% time capture
tic;


% Run the simulation
% you can pick model between pseudonn, base or autocor
sim('ADPLL_base.slx',linspace(0,0.0003,300000));
% Take only steady state sample (non-transient)
temp = rem(phs_err,2*pi);
phs_err = temp - (2*pi)*(temp>pi)+ (2*pi)*(temp<-pi);
NPT_FRAME = 1000;
NPT = NPT_FRAME * 200;
X = phs_err(length(phs_err)-NPT+1:length(phs_err));
% Transform into power value in Frefuency domain
fs = 4*Fref; %maximum Frefuency to be considered
W = window(@hanning,NPT_FRAME,'periodic');
[Psyn,Fsyn] = pwelch(X,W,[],NPT_FRAME,fs,'twosided');
PN = 10*log10(Psyn);
% Calcualte the jitter performance
PN2=PN';
RB = fs/NPT_FRAME;
RMS_Fref = 1/(2*pi*N*Fref)*( sum(10.^(PN2(1:NPT_FRAME)./10)*RB) ).^0.5;
RMS_TIME = 1/(2*pi*N*Fref)*rms(X);
% calculate setring time
S1 = stepinfo(Ffree-out_freq,tout,Ffree-Fref*N,'SettlingTimeThreshold',SetPos);
SetTime = S1.SettlingTime;

% time capture
toc

% Plot the resulting data
figure;
semilogx(Fsyn,PN);
xlim([1e5 50e6]);
figure;
plot(tout,out_freq);

fprintf("rms time: %e, setling time %fl\n", RMS_TIME,SetTime)