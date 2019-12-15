clear all;
% Initiate parameter
N= 16;
Kp = 0.05;
Ki = 0.01;
Kdco = 3e6;
Fref = 25e6;
Ffree = Fref*N*0.95;
BBPFD_delay= 1e-12;
Ref_Noise = 0;
DCO_Noise = (16e-12*(N*Fref)^2)^2;

% time capture
tic;

% Run the simulation
sim('ADPLL_model.slx');
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

% time capture
toc

% Plot the resulting data
figure;
semilogx(Fsyn,PN);
axis([1e5 50e6 -150 -80]);
figure;
plot(tout,out_freq);