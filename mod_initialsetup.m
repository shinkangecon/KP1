load data;
VIX = -VIX;

U_r = ru1;  % ru1, ru3, ru12, mu1, mu3, mu12
U_f = fu1;  % fu1, fu3, fu12
act = log(GDP);          
stock = SP500;      % SP500 VIX
monetary = gs1;     % ffr gs1 shadowrate
monshock = mpnews;  % mpnews, ffrnews
price = CorePCE; % PCE, CPI, CoreCPI, CorePCE
real_proxy = tfp; % tfp, tfpu

trend = 2; % 0 = intercept only, 1 = intercept and linear, 2 = intercept and quardratic

VAR.vars = [U_r act price U_f monetary];
nvar=size(VAR.vars,2);

if bekaert == 1
    VAR.vars = VAR.vars(1:end-132,:);
end

nboot = 1000;
ci_p = 0.05;
ci_p1 = 0.32;
num_draw = 3000000;
VAR.p = 2;

k1bar = 3.33;
k2bar = 2.57;
k3bar = 3.53;
k_y = -0.25;
k_4f1 = 1.13; 
k_4f2 = 1.14;
k_4r1 = 0.53;
k_4r2 = 0.45;
k_c1f = -0.04;
k_c1r = 0;
k_c2r = 0.03;
k_c2f = 0.03;
k_c4  = 0.08;
k_c5y = 0.12;

irhor = 60;

t1 = 100-VAR.p;
t2 = 351-VAR.p;
t31 = 342-VAR.p;
t32 = 360-VAR.p;
t4 = 286;
t5 = 57;
t6 = 385-VAR.p;

accept=zeros(num_draw,1);
tmp_B=zeros(nvar,nvar,num_draw);

