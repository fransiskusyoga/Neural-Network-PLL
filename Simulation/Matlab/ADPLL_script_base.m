clear all
% initialize paramater
Tref = 1/25e6;
max = 1e6; %number of clock cycle evaluated
d = 0; %delay
N = 10;
Kp = 0.1;
Ki = 0.01;
dco_noise = 4e-12; %in seconds
Tfree = 1.00001*Tref/N; %there must be a small shift 
Kt = 1e6*(Tref/N)^2;

% set random generator seed to default
%rng('default') % For reproducibility

% initialize variables
dt = zeros([1 max]);
pfd = zeros([1 max]);
m = zeros([1 max]);
dlf = zeros([1 max]);
% calculation
for i=d+2:max
    %noise = sum(normrnd(0,dco_noise,1,N));
    noise = normrnd(0,dco_noise)*sqrt(N);
    dt(i) = dt(i-1)+Tref-N*(Tfree+Kt*dlf(i-1)) - noise;
    dt(i) = rem(dt(i),Tref);    %dt is periodic
    pfd(i) = sign(dt(i));  
    m(i) = m(i-1) + pfd(i);
    dlf(i) = Kp*pfd(i-d) + Ki*m(i-d);
end

rms_jitter = rms(dt(1:end));
fprintf("rms jitter = %e\n",rms_jitter)
