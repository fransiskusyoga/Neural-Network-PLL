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

%how many clock cycle to be eavaluated for final jitter calculation
Eval_period = 50000; 

% initialize variables
dt = zeros([1 max]);
pfd = zeros([1 max]);
m = zeros([1 max]);
dlf = zeros([1 max]);

% counter initialzation
counter = 1;
counter_rst = 0;
counter_tw = 0;
counter_tw_prev = 0;
counter_all = zeros([1 ceil(max/Eval_period)]); %save the random walk of counter for evaluation

% Distribution monitoring parameter
dco_2_tw = 7.5;
tw = -dco_noise * dco_2_tw;

% KP parameters
Kp_max = 255;
Kp_min = 1;
Kp_int = 10; %integer value of kp, you can set initial value here
Kp = Kp_int/(Kp_max+1);
Eval_period = 256*64;
Kp_all = zeros([1 ceil(max/Eval_period)]); %save the random walk of Kp for evaluation

%load model
load("nnmodel_v5_red.mat");

% calculation
for i=d+2:max
    %noise = sum(normrnd(0,dco_noise,1,N));
    noise = normrnd(0,dco_noise)*sqrt(N);
    dt(i) = dt(i-1)+Tref-N*(Tfree+Kt*dlf(i-1)) - noise;
    dt(i) = rem(dt(i),Tref);    %dt is periodic
    pfd(i) = sign(dt(i));  
    m(i) = m(i-1) + pfd(i);
    dlf(i) = Kp*pfd(i-d) + Ki*m(i-d);
    % Adaptive loop gain controller
    counter = counter + (abs(pfd(i)-pfd(i-1))==2);
    counter_rst = counter_rst+1;
    counter_tw = counter_tw + (dt(i)>tw);
    Kp = Kp_int/(Kp_max+1);
    if (counter_rst == Eval_period)        
        Kp_all(ceil(i/Eval_period)) = Kp_int;
        counter_all(ceil(i/Eval_period)) = counter;
        %txt = sprintf("count = %d, kp = %d\n",[counter, Kp_int]);
        %fprintf(txt);
        % Neural network
        LayersVal = forwprop(w,b,Kp);
        target_rise = LayersVal{end}*2*Eval_period;
        Kp_int = Kp_int+( 1-2*(counter>target_rise) ); 
        % Jitter distribution
        %prev_dir = prev_dir*( 1-2*(counter_tw<counter_tw_prev) );
        %Kp_int = Kp_int+prev_dir; 
        % normalization
        if (Kp_int>Kp_max)
           Kp_int = Kp_max;
        elseif (Kp_int<Kp_min)
           Kp_int = Kp_min;
        end            
        % update counter
        counter_rst = 0;
        counter = 0;
        counter_tw_prev = counter_tw;
        counter_tw = 0;
    end
end

rms_jitter = rms(dt(end-Eval_period:end));
fprintf("rms jitter = %e\n",rms_jitter);
figure;
plot(Kp_all);
title('The random walk of Kp');
figure;
plot(counter_all);
title('The random walk of counter');