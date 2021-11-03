clear
clc

rng(1985)

load data_pol
%U_m = macrouncertainty;
U_m = realuncertainty;
U_f = financialuncertainty;
act = log(monthlyGDP); % ip log(monthlyGDP) monthlyGDPgrowth
stock = SP500; % SP500 DJIA
gold = gold;
monetary = gs1; % ffr gs1 shadowrate
monshock = policy_news_shocks; % FFR_shock policy_news_shocks
price = log(core_cpi_l); % log(cpi_l) cpi_g log(pce_l) pce_g log(core_cpi_l) core_cpi_g log(core_pce_l) core_pce_g
tfp_inst = tfp; % tfp tfp_u

trend = 2; % 0 = intercept only, 1 = intercept and linear, 2 = intercept and quardratic

bekaert = 0; % 0 = full sample, 1 = ~ 2007:12

VAR.vars = [U_m act U_f monetary price];

if bekaert == 1
    VAR.vars = VAR.vars(1:end-132,:);
end

num_draw = 1500000;
VAR.p = 6;
cbar1 = 0.1;
cbar2 = 0.3;
cbar = 0.1;
bcbar = 0.4; 

if bekaert == 1
    bcbar = 0.1;
    cbar1 = 0.05;
    cbar = 0.05;
end

k1bar = 3;
k2bar = 3;
k3bar = 3;
irhor = 60;
t1 = 328-VAR.p-243;
t2 = 570-VAR.p-243;
t3 = 588-VAR.p-243;
t4 = 174-VAR.p-1;
t5 = 403-VAR.p-1;

% reduced form regression

[Y X]      = lagmatrix(VAR.vars,VAR.p,0);

VAR.T = size(Y,1);
VAR.n = size(Y,2);

tt = 1:1:length(X);
tt2 = tt.^2;
tt = tt';
tt2 = tt2';

if trend == 0
    VAR.bet=[X ones(length(X),1)]\Y; 
    VAR.res = Y-[X ones(length(X),1)]*VAR.bet;
elseif trend == 1
    VAR.bet=[X ones(length(X),1) tt]\Y; 
    VAR.res = Y-[X ones(length(X),1) tt]*VAR.bet;
elseif trend == 2
    VAR.bet=[X ones(length(X),1) tt tt2]\Y; 
    VAR.res = Y-[X ones(length(X),1) tt tt2]*VAR.bet;
end

VAR.Omega = (VAR.res'*VAR.res)/(VAR.T-VAR.n*VAR.p-1-3);

% Initialize B matrix

kk = 1;
b_c_crit_old = 0;
Pmat = chol(VAR.Omega,'lower');
B = Pmat;

stock = stock(VAR.p+1:end,1);
gold = gold(VAR.p+1:end,1);

if bekaert == 1
    stock = stock(1:end-132,1);
    gold = gold(1:end-132,1);
end

% Iteration

for i = 1:num_draw
    
    % Rotating B matrix and building structural shocks
    
    temp_m = rand(5,5);
    [Q, R] = qr(temp_m);
    
    if Q(1,1) < 0
        Q(:,1) = -1*Q(:,1);
    end
    if Q(2,2) < 0
        Q(:,2) = -1*Q(:,2);
    end
    if Q(3,3) < 0
        Q(:,3) = -1*Q(:,3);
    end
    if Q(4,4) < 0
        Q(:,4) = -1*Q(:,4);
    end
    if Q(5,5) < 0
        Q(:,5) = -1*Q(:,5);
    end
    
    B = Pmat*Q';
    
    struc_e = VAR.res*inv(B');
    
    % refreshing signals
    
    signal1 = 0;
    signal2 = 0;
    signal3 = 0;
    
    % calculating correlations
    
    q_real = zeros(151,1);
    for mm = 1:151
        for nn = 1:3
            q_real(mm,1) = q_real(mm,1) + struc_e((mm-1)*3+nn,2);
        end
    end
    
    if bekaert == 0      
        c_1f = corr(stock,struc_e(:,3));                               % financial uncertainty and stock returns
        c_2m = corr(gold,struc_e(:,1));                                % real uncertainty and gold price
        c_4m = corr(struc_e(t4:t5,4),monshock(t4+VAR.p:t5+VAR.p,1));   % monetary policy shock instrument
        c_5t1 = corr(q_real,tfp_inst);
        c_5t2 = corr(q_real(2:end,1),tfp_inst(1:end-1,1));
        c_5t3 = corr(q_real(1:end-1,1),tfp_inst(2:end,1));
        c_5t = max([c_5t1,c_5t2,c_5t3]);                                 % TFP instrument
        b_c = [c_1f c_2m c_4m c_5t]';                                  % overall corr
    
    else
        c_1f = corr(stock,struc_e(:,3));
        c_2m = corr(gold,struc_e(:,1));
        c_4m = corr(struc_e(t4:t5-75,4),monshock(t4+VAR.p:t5+VAR.p-75,1));
        b_c = [c_1f c_2m c_4m]';
    end
        
    % event constraints

    if bekaert == 0                             % Lehman bros
        if struc_e(t2+9,3) >= k2bar
            signal1 = 1;
        else
            disp('continue1')
            continue
        end
    else
        signal1 = 1;
    end

    if bekaert == 0                             % sum of GDP shock during GFC 
        if sum(struc_e(t2:t3,2))<0
            signal2 = 1;
        else
            disp('continue2')
            continue
        end
    else
        signal2 = 1;
    end

    if bekaert == 0                             % debt ceiling
        if struc_e(t3+25,3) >= 0
            signal3 = 1;
        elseif  struc_e(t3+26,3) >= 0
            signal3 = 1;
        else
            disp('continue3')
            continue
        end
    else
        signal3 = 1;
    end
    
    if c_1f <= -cbar && c_2m >= cbar && c_4m > cbar1 && c_5t > cbar2 && sqrt(b_c'*b_c) > bcbar && B(1,1) > 0 && B(2,2) > 0 && B(3,3) > 0 && B(4,4) > 0 && B(5,5) > 0     % correlation criteria
        if struc_e(t1,3) > k1bar && signal1 == 1 && signal2 == 1 && signal3 == 1                                                            % checking event constraints
                        
            % generating IRFs w/wo endogeneity
            
            irs_t_m(VAR.p+1,:) = B*[1 0 0 0 0]';
            irs_t_y(VAR.p+1,:) = B*[0 1 0 0 0]';
            irs_t_f(VAR.p+1,:) = B*[0 0 1 0 0]';
            irs_t_mon(VAR.p+1,:) = B*[0 0 0 1 0]';
            irs_t_p(VAR.p+1,:) = B*[0 0 0 0 1]';
            
            % _noendo -> shutting off contemporaneous feedbacks
            
            B_noendo = B;
            B_noendo(1,2:5) = [0 0 0 0];
            B_noendo(3,1:2) = [0 0];
            B_noendo(3,4:5) = [0 0];
            
            irs_t_m_noendo(VAR.p+1,:) = B_noendo*[1 0 0 0 0]';
            irs_t_y_noendo(VAR.p+1,:) = B_noendo*[0 1 0 0 0]';
            irs_t_f_noendo(VAR.p+1,:) = B_noendo*[0 0 1 0 0]';
            irs_t_mon_noendo(VAR.p+1,:) = B_noendo*[0 0 0 1 0]';
            irs_t_p_noendo(VAR.p+1,:) = B_noendo*[0 0 0 0 1]';
            
            VAR.bet_noendo = VAR.bet;

            for jj=2:irhor
                lvars_m = (irs_t_m(VAR.p+jj-1:-1:jj,:))';
                lvars_y = (irs_t_y(VAR.p+jj-1:-1:jj,:))';
                lvars_f = (irs_t_f(VAR.p+jj-1:-1:jj,:))';
                lvars_mon = (irs_t_mon(VAR.p+jj-1:-1:jj,:))';
                lvars_p = (irs_t_p(VAR.p+jj-1:-1:jj,:))';
                irs_t_m(VAR.p+jj,:) = lvars_m(:)'*VAR.bet(1:VAR.p*VAR.n,:);
                irs_t_y(VAR.p+jj,:) = lvars_y(:)'*VAR.bet(1:VAR.p*VAR.n,:);
                irs_t_f(VAR.p+jj,:) = lvars_f(:)'*VAR.bet(1:VAR.p*VAR.n,:);
                irs_t_mon(VAR.p+jj,:) = lvars_mon(:)'*VAR.bet(1:VAR.p*VAR.n,:);
                irs_t_p(VAR.p+jj,:) = lvars_p(:)'*VAR.bet(1:VAR.p*VAR.n,:);
                
                lvars_m_noendo = (irs_t_m_noendo(VAR.p+jj-1:-1:jj,:))';
                lvars_y_noendo = (irs_t_y_noendo(VAR.p+jj-1:-1:jj,:))';
                lvars_f_noendo = (irs_t_f_noendo(VAR.p+jj-1:-1:jj,:))';
                lvars_mon_noendo = (irs_t_mon_noendo(VAR.p+jj-1:-1:jj,:))';
                lvars_p_noendo = (irs_t_p_noendo(VAR.p+jj-1:-1:jj,:))';
                irs_t_m_noendo(VAR.p+jj,:) = lvars_m_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
                irs_t_y_noendo(VAR.p+jj,:) = lvars_y_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
                irs_t_f_noendo(VAR.p+jj,:) = lvars_f_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
                irs_t_mon_noendo(VAR.p+jj,:) = lvars_mon_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
                irs_t_p_noendo(VAR.p+jj,:) = lvars_p_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
            end

            VAR.irs_t_m   = irs_t_m(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_y   = irs_t_y(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_f   = irs_t_f(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_mon   = irs_t_mon(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_p   = irs_t_p(VAR.p+1:VAR.p+irhor,:);
            
            VAR.irs_t_m_noendo   = irs_t_m_noendo(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_y_noendo   = irs_t_y_noendo(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_f_noendo   = irs_t_f_noendo(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_mon_noendo   = irs_t_mon_noendo(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_p_noendo   = irs_t_p_noendo(VAR.p+1:VAR.p+irhor,:);
            
            Bstock(:,:,kk) = B;
            kk = kk+1

            IRS_stock_m(:,:,kk) = VAR.irs_t_m;
            IRS_stock_y(:,:,kk) = VAR.irs_t_y;
            IRS_stock_f(:,:,kk) = VAR.irs_t_f;
            IRS_stock_mon(:,:,kk) = VAR.irs_t_mon;
            IRS_stock_p(:,:,kk) = VAR.irs_t_p;

            IRS_stock_m_noendo(:,:,kk) = VAR.irs_t_m_noendo;
            IRS_stock_y_noendo(:,:,kk) = VAR.irs_t_y_noendo;
            IRS_stock_f_noendo(:,:,kk) = VAR.irs_t_f_noendo;
            IRS_stock_mon_noendo(:,:,kk) = VAR.irs_t_mon_noendo;
            IRS_stock_p_noendo(:,:,kk) = VAR.irs_t_p_noendo;
            
            % Computing multipliers
            
            bench_mon(1,kk) = sum(VAR.irs_t_mon(1:20,2))/sum(VAR.irs_t_mon(1:20,4));
            noendo_mon(1,kk) = sum(VAR.irs_t_mon_noendo(1:20,2))/sum(VAR.irs_t_mon_noendo(1:20,4));
            diff_mon(1,kk) = noendo_mon(1,kk)-bench_mon(1,kk);
            
            % Searching max-C

            if sqrt(b_c'*b_c) > b_c_crit_old
                B_max = B;
                VAR.irs_t_m_max = VAR.irs_t_m;
                VAR.irs_t_y_max = VAR.irs_t_y;
                VAR.irs_t_f_max = VAR.irs_t_f;
                VAR.irs_t_mon_max = VAR.irs_t_mon;
                VAR.irs_t_p_max = VAR.irs_t_p;    
                struc_e_max = struc_e;
                
                VAR.irs_t_m_max_noendo = VAR.irs_t_m_noendo;
                VAR.irs_t_y_max_noendo = VAR.irs_t_y_noendo;
                VAR.irs_t_f_max_noendo = VAR.irs_t_f_noendo;
                VAR.irs_t_mon_max_noendo = VAR.irs_t_mon_noendo;
                VAR.irs_t_p_max_noendo = VAR.irs_t_p_noendo;
                
                bench_mon_maxC = bench_mon(1,kk);
                noendo_mon_maxC = noendo_mon(1,kk);
            end
            
        end
    else
        disp('continue4')
        continue
    end
   
    b_c_crit_old = sqrt(b_c'*b_c);
end

% Computing quantiles

IRS_max1_m = quantile(IRS_stock_m,0.84,3);
IRS_min1_m = quantile(IRS_stock_m,0.16,3);
IRS_max2_m = quantile(IRS_stock_m,0.95,3);
IRS_min2_m = quantile(IRS_stock_m,0.05,3);
IRS_med_m=  quantile(IRS_stock_m,0.5,3);

IRS_max1_y = quantile(IRS_stock_y,0.84,3);
IRS_min1_y = quantile(IRS_stock_y,0.16,3);
IRS_max2_y = quantile(IRS_stock_y,0.95,3);
IRS_min2_y = quantile(IRS_stock_y,0.05,3);
IRS_med_y = quantile(IRS_stock_y,0.5,3);

IRS_max1_f = quantile(IRS_stock_f,0.84,3);
IRS_min1_f = quantile(IRS_stock_f,0.16,3);
IRS_max2_f = quantile(IRS_stock_f,0.95,3);
IRS_min2_f = quantile(IRS_stock_f,0.05,3);
IRS_med_f = quantile(IRS_stock_f,0.5,3);

IRS_max1_mon = quantile(IRS_stock_mon,0.84,3);
IRS_min1_mon = quantile(IRS_stock_mon,0.16,3);
IRS_max2_mon = quantile(IRS_stock_mon,0.95,3);
IRS_min2_mon = quantile(IRS_stock_mon,0.05,3);
IRS_med_mon = quantile(IRS_stock_mon,0.5,3);

IRS_max1_p = quantile(IRS_stock_p,0.84,3);
IRS_min1_p = quantile(IRS_stock_p,0.16,3);
IRS_max2_p = quantile(IRS_stock_p,0.95,3);
IRS_min2_p = quantile(IRS_stock_p,0.05,3);
IRS_med_p = quantile(IRS_stock_p,0.5,3);

IRS_max1_m_noendo = quantile(IRS_stock_m_noendo,0.84,3);
IRS_min1_m_noendo = quantile(IRS_stock_m_noendo,0.16,3);
IRS_max2_m_noendo = quantile(IRS_stock_m_noendo,0.95,3);
IRS_min2_m_noendo = quantile(IRS_stock_m_noendo,0.05,3);
IRS_med_m_noendo=  quantile(IRS_stock_m_noendo,0.5,3);

IRS_max1_y_noendo = quantile(IRS_stock_y_noendo,0.84,3);
IRS_min1_y_noendo = quantile(IRS_stock_y_noendo,0.16,3);
IRS_max2_y_noendo = quantile(IRS_stock_y_noendo,0.95,3);
IRS_min2_y_noendo = quantile(IRS_stock_y_noendo,0.05,3);
IRS_med_y_noendo = quantile(IRS_stock_y_noendo,0.5,3);

IRS_max1_f_noendo = quantile(IRS_stock_f_noendo,0.84,3);
IRS_min1_f_noendo = quantile(IRS_stock_f_noendo,0.16,3);
IRS_max2_f_noendo = quantile(IRS_stock_f_noendo,0.95,3);
IRS_min2_f_noendo = quantile(IRS_stock_f_noendo,0.05,3);
IRS_med_f_noendo = quantile(IRS_stock_f_noendo,0.5,3);

IRS_max1_mon_noendo = quantile(IRS_stock_mon_noendo,0.84,3);
IRS_min1_mon_noendo = quantile(IRS_stock_mon_noendo,0.16,3);
IRS_max2_mon_noendo = quantile(IRS_stock_mon_noendo,0.95,3);
IRS_min2_mon_noendo = quantile(IRS_stock_mon_noendo,0.05,3);
IRS_med_mon_noendo = quantile(IRS_stock_mon_noendo,0.5,3);

IRS_max1_p_noendo = quantile(IRS_stock_p_noendo,0.84,3);
IRS_min1_p_noendo = quantile(IRS_stock_p_noendo,0.16,3);
IRS_max2_p_noendo = quantile(IRS_stock_p_noendo,0.95,3);
IRS_min2_p_noendo = quantile(IRS_stock_p_noendo,0.05,3);
IRS_med_p_noendo = quantile(IRS_stock_p_noendo,0.5,3);

bench_mon_multi_max1 = quantile(bench_mon,0.84);
bench_mon_multi_min1 = quantile(bench_mon,0.16);
bench_mon_multi_max2 = quantile(bench_mon,0.95);
bench_mon_multi_min2 = quantile(bench_mon,0.05);
bench_mon_multi_med = quantile(bench_mon,0.5);

noendo_mon_multi_max1 = quantile(noendo_mon,0.84);
noendo_mon_multi_min1 = quantile(noendo_mon,0.16);
noendo_mon_multi_max2 = quantile(noendo_mon,0.95);
noendo_mon_multi_min2 = quantile(noendo_mon,0.05);
noendo_mon_multi_med = quantile(noendo_mon,0.5);

hh = 0:1:irhor-1;

% saving results

if bekaert == 0
    save 'result_m_mon_each_p';
else
    save 'result_m_mon_bekaert_each_p';
end

% plotting module
mod_plot_m_p;