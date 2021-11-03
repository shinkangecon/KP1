%% Robustness Check: Cholesky Decomposition
clear;clc;

%% Setup
load data_pol;
U_m = realuncertainty;
U_f = financialuncertainty;
act = log(monthlyGDP);          % ip log(monthlyGDP) monthlyGDPgrowth
monetary = gs1;                 % ffr gs1 shadowrate
trend = 2;                      % 0 = intercept only, 1 = intercept and linear, 2 = intercept and quardratic
bekaert = 0;                    % 0 = full sample, 1 = ~ 2007:12
VAR.p = 6;                      % half-year lag (monthly data)
irhor=60;                       % Periods of impulse response functions (IRFs)

% Ordering
VAR.vars1 = [act U_m U_f monetary];
VAR.vars2 = [act U_f U_m monetary];
VAR.vars3 = [U_f U_m act monetary];
VAR.vars4 = [U_m U_f act monetary];
VAR.vars5 = [act monetary U_m U_f];
VAR.vars6 = [act monetary U_f U_m];

% Bekaert period
VAR.vars1_Bekaert = VAR.vars1(1:end-132,:);
VAR.vars2_Bekaert = VAR.vars2(1:end-132,:);
VAR.vars3_Bekaert = VAR.vars3(1:end-132,:);
VAR.vars4_Bekaert = VAR.vars4(1:end-132,:);
VAR.vars5_Bekaert = VAR.vars5(1:end-132,:);
VAR.vars6_Bekaert = VAR.vars6(1:end-132,:);


%% Reduced-Form Regression
% 1. Full sample
[Y1, X1]      = lagmatrix(VAR.vars1,VAR.p,0);
[Y2, X2]      = lagmatrix(VAR.vars2,VAR.p,0);
[Y3, X3]      = lagmatrix(VAR.vars3,VAR.p,0);
[Y4, X4]      = lagmatrix(VAR.vars4,VAR.p,0);
[Y5, X5]      = lagmatrix(VAR.vars5,VAR.p,0);
[Y6, X6]      = lagmatrix(VAR.vars6,VAR.p,0);

% 2. Bekaert period
[Y1_Bekaert, X1_Bekaert]      = lagmatrix(VAR.vars1_Bekaert,VAR.p,0);
[Y2_Bekaert, X2_Bekaert]      = lagmatrix(VAR.vars2_Bekaert,VAR.p,0);
[Y3_Bekaert, X3_Bekaert]      = lagmatrix(VAR.vars3_Bekaert,VAR.p,0);
[Y4_Bekaert, X4_Bekaert]      = lagmatrix(VAR.vars4_Bekaert,VAR.p,0);
[Y5_Bekaert, X5_Bekaert]      = lagmatrix(VAR.vars5_Bekaert,VAR.p,0);
[Y6_Bekaert, X6_Bekaert]      = lagmatrix(VAR.vars6_Bekaert,VAR.p,0);

VAR.T = size(Y1,1);
VAR.n = size(Y1,2);
VAR.T_Bekaert = size(Y1_Bekaert,1);
VAR.n_Bekaert = size(Y1_Bekaert,2);

tt = 1:1:length(X1);
tt = tt';
tt2 = tt.^2;
tt_Bekaert=linspace(1,size(X1_Bekaert,1),size(X1_Bekaert,1))';
tt2_Bekaert=tt_Bekaert.^2;


% Regression with linear and quadratic trends, and intercept 
VAR.bet1=[X1 ones(length(X1),1) tt tt2]\Y1; 
VAR.bet2=[X2 ones(length(X2),1) tt tt2]\Y2; 
VAR.bet3=[X3 ones(length(X3),1) tt tt2]\Y3; 
VAR.bet4=[X4 ones(length(X4),1) tt tt2]\Y4;
VAR.bet5=[X5 ones(length(X5),1) tt tt2]\Y5;
VAR.bet6=[X6 ones(length(X6),1) tt tt2]\Y6; 

VAR.res1 = Y1-[X1 ones(length(X1),1) tt tt2]*VAR.bet1;
VAR.res2 = Y2-[X2 ones(length(X2),1) tt tt2]*VAR.bet2;
VAR.res3 = Y3-[X3 ones(length(X3),1) tt tt2]*VAR.bet3;
VAR.res4 = Y4-[X4 ones(length(X4),1) tt tt2]*VAR.bet4;
VAR.res5 = Y5-[X5 ones(length(X5),1) tt tt2]*VAR.bet5;
VAR.res6 = Y6-[X6 ones(length(X6),1) tt tt2]*VAR.bet6;

VAR.bet1_Bekaert =[X1_Bekaert ones(length(X1_Bekaert),1) tt_Bekaert tt2_Bekaert]\Y1_Bekaert; 
VAR.bet2_Bekaert =[X2_Bekaert ones(length(X2_Bekaert),1) tt_Bekaert tt2_Bekaert]\Y2_Bekaert; 
VAR.bet3_Bekaert =[X3_Bekaert ones(length(X3_Bekaert),1) tt_Bekaert tt2_Bekaert]\Y3_Bekaert; 
VAR.bet4_Bekaert =[X4_Bekaert ones(length(X4_Bekaert),1) tt_Bekaert tt2_Bekaert]\Y4_Bekaert;
VAR.bet5_Bekaert =[X5_Bekaert ones(length(X5_Bekaert),1) tt_Bekaert tt2_Bekaert]\Y5_Bekaert;
VAR.bet6_Bekaert =[X6_Bekaert ones(length(X6_Bekaert),1) tt_Bekaert tt2_Bekaert]\Y6_Bekaert; 
VAR.res1_Bekaert = Y1_Bekaert-[X1_Bekaert ones(length(X1_Bekaert),1) tt_Bekaert tt2_Bekaert]*VAR.bet1_Bekaert;
VAR.res2_Bekaert = Y2_Bekaert-[X2_Bekaert ones(length(X2_Bekaert),1) tt_Bekaert tt2_Bekaert]*VAR.bet2_Bekaert;
VAR.res3_Bekaert = Y3_Bekaert-[X3_Bekaert ones(length(X3_Bekaert),1) tt_Bekaert tt2_Bekaert]*VAR.bet3_Bekaert;
VAR.res4_Bekaert = Y4_Bekaert-[X4_Bekaert ones(length(X4_Bekaert),1) tt_Bekaert tt2_Bekaert]*VAR.bet4_Bekaert;
VAR.res5_Bekaert = Y5_Bekaert-[X5_Bekaert ones(length(X5_Bekaert),1) tt_Bekaert tt2_Bekaert]*VAR.bet5_Bekaert;
VAR.res6_Bekaert = Y6_Bekaert-[X6_Bekaert ones(length(X6_Bekaert),1) tt_Bekaert tt2_Bekaert]*VAR.bet6_Bekaert;

VAR.Omega1 = (VAR.res1'*VAR.res1)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega2 = (VAR.res2'*VAR.res2)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega3 = (VAR.res3'*VAR.res3)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega4 = (VAR.res4'*VAR.res4)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega5 = (VAR.res5'*VAR.res5)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega6 = (VAR.res6'*VAR.res6)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega1_Bekaert = (VAR.res1_Bekaert'*VAR.res1_Bekaert)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega2_Bekaert = (VAR.res2_Bekaert'*VAR.res2_Bekaert)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega3_Bekaert = (VAR.res3_Bekaert'*VAR.res3_Bekaert)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega4_Bekaert = (VAR.res4_Bekaert'*VAR.res4_Bekaert)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega5_Bekaert = (VAR.res5_Bekaert'*VAR.res5_Bekaert)/(VAR.T-VAR.n*VAR.p-1-3);
VAR.Omega6_Bekaert = (VAR.res6_Bekaert'*VAR.res6_Bekaert)/(VAR.T-VAR.n*VAR.p-1-3);

%% Cholesky Decomposition and IRFs
B1 = chol(VAR.Omega1,'lower');
B2 = chol(VAR.Omega2,'lower');
B3 = chol(VAR.Omega3,'lower');
B4 = chol(VAR.Omega4,'lower');
B5 = chol(VAR.Omega5,'lower');
B6 = chol(VAR.Omega6,'lower');

B1_Bekaert = chol(VAR.Omega1_Bekaert,'lower');
B2_Bekaert = chol(VAR.Omega2_Bekaert,'lower');
B3_Bekaert = chol(VAR.Omega3_Bekaert,'lower');
B4_Bekaert = chol(VAR.Omega4_Bekaert,'lower');
B5_Bekaert = chol(VAR.Omega5_Bekaert,'lower');
B6_Bekaert = chol(VAR.Omega6_Bekaert,'lower');


%% Impulse Response Functions  
irs_t_gdp1(VAR.p+1,:) = B1*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
irs_t_gdp2(VAR.p+1,:) = B2*[1 0 0 0]';         % GDP shock if Y>FU>RU>MP
irs_t_gdp3(VAR.p+1,:) = B3*[0 0 1 0]';         % GDP shock if FU>RU>Y>MP
irs_t_gdp4(VAR.p+1,:) = B4*[0 0 1 0]';         % GDP shock if RU>FU>Y>MP
irs_t_gdp5(VAR.p+1,:) = B5*[1 0 0 0]';         % GDP shock if Y>MP>RU>FU
irs_t_gdp6(VAR.p+1,:) = B6*[1 0 0 0]';         % GDP shock if Y>MP>FU>RU

irs_t_ru1(VAR.p+1,:) = B1*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
irs_t_ru2(VAR.p+1,:) = B2*[0 0 1 0]';          % RU shock if Y>FU>RU>MP
irs_t_ru3(VAR.p+1,:) = B3*[0 1 0 0]';          % RU shock if FU>RU>Y>MP
irs_t_ru4(VAR.p+1,:) = B4*[1 0 0 0]';          % RU shock if RU>FU>Y>MP
irs_t_ru5(VAR.p+1,:) = B5*[0 0 1 0]';          % RU shock if Y>MP>RU>FU
irs_t_ru6(VAR.p+1,:) = B6*[0 0 0 1]';          % RU shock if Y>MP>FU>RU

irs_t_fu1(VAR.p+1,:) = B1*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
irs_t_fu2(VAR.p+1,:) = B2*[0 1 0 0]';          % FU shock if Y>FU>RU>MP
irs_t_fu3(VAR.p+1,:) = B3*[1 0 0 0]';          % FU shock if FU>RU>Y>MP
irs_t_fu4(VAR.p+1,:) = B4*[0 1 0 0]';          % FU shock if RU>FU>Y>MP
irs_t_fu5(VAR.p+1,:) = B5*[0 0 0 1]';          % FU shock if Y>MP>RU>FU
irs_t_fu6(VAR.p+1,:) = B6*[0 0 1 0]';          % FU shock if Y>MP>FU>RU

irs_t_mp1(VAR.p+1,:) = B1*[0 0 0 1]';          % MP shock if Y>RU>FU>MP
irs_t_mp2(VAR.p+1,:) = B2*[0 0 0 1]';          % MP shock if Y>FU>RU>MP
irs_t_mp3(VAR.p+1,:) = B3*[0 0 0 1]';          % MP shock if FU>RU>Y>MP
irs_t_mp4(VAR.p+1,:) = B4*[0 0 0 1]';          % MP shock if RU>FU>Y>MP
irs_t_mp5(VAR.p+1,:) = B5*[0 1 0 0]';          % MP shock if Y>MP>RU>FU
irs_t_mp6(VAR.p+1,:) = B6*[0 1 0 0]';          % MP shock if Y>MP>FU>RU

for jj=2:irhor
     lvars_gdp1 = (irs_t_gdp1(VAR.p+jj-1:-1:jj,:))';
     lvars_ru1 = (irs_t_ru1(VAR.p+jj-1:-1:jj,:))';
     lvars_fu1 = (irs_t_fu1(VAR.p+jj-1:-1:jj,:))';
     lvars_mp1 = (irs_t_mp1(VAR.p+jj-1:-1:jj,:))';
     irs_t_gdp1(VAR.p+jj,:) = lvars_gdp1(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
     irs_t_ru1(VAR.p+jj,:) = lvars_ru1(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
     irs_t_fu1(VAR.p+jj,:) = lvars_fu1(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
     irs_t_mp1(VAR.p+jj,:) = lvars_mp1(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
     
     lvars_gdp2 = (irs_t_gdp2(VAR.p+jj-1:-1:jj,:))';
     lvars_ru2 = (irs_t_ru2(VAR.p+jj-1:-1:jj,:))';
     lvars_fu2 = (irs_t_fu2(VAR.p+jj-1:-1:jj,:))';
     lvars_mp2 = (irs_t_mp2(VAR.p+jj-1:-1:jj,:))';
     irs_t_gdp2(VAR.p+jj,:) = lvars_gdp2(:)'*VAR.bet2(1:VAR.p*VAR.n,:);
     irs_t_ru2(VAR.p+jj,:) = lvars_ru2(:)'*VAR.bet2(1:VAR.p*VAR.n,:);
     irs_t_fu2(VAR.p+jj,:) = lvars_fu2(:)'*VAR.bet2(1:VAR.p*VAR.n,:);
     irs_t_mp2(VAR.p+jj,:) = lvars_mp2(:)'*VAR.bet2(1:VAR.p*VAR.n,:);
     
     lvars_gdp3 = (irs_t_gdp3(VAR.p+jj-1:-1:jj,:))';
     lvars_ru3 = (irs_t_ru3(VAR.p+jj-1:-1:jj,:))';
     lvars_fu3 = (irs_t_fu3(VAR.p+jj-1:-1:jj,:))';
     lvars_mp3 = (irs_t_mp3(VAR.p+jj-1:-1:jj,:))';
     irs_t_gdp3(VAR.p+jj,:) = lvars_gdp3(:)'*VAR.bet3(1:VAR.p*VAR.n,:);
     irs_t_ru3(VAR.p+jj,:) = lvars_ru3(:)'*VAR.bet3(1:VAR.p*VAR.n,:);
     irs_t_fu3(VAR.p+jj,:) = lvars_fu3(:)'*VAR.bet3(1:VAR.p*VAR.n,:);
     irs_t_mp3(VAR.p+jj,:) = lvars_mp3(:)'*VAR.bet3(1:VAR.p*VAR.n,:);
     
     
     lvars_gdp4 = (irs_t_gdp4(VAR.p+jj-1:-1:jj,:))';
     lvars_ru4 = (irs_t_ru4(VAR.p+jj-1:-1:jj,:))';
     lvars_fu4 = (irs_t_fu4(VAR.p+jj-1:-1:jj,:))';
     lvars_mp4 = (irs_t_mp4(VAR.p+jj-1:-1:jj,:))';
     irs_t_gdp4(VAR.p+jj,:) = lvars_gdp4(:)'*VAR.bet4(1:VAR.p*VAR.n,:);
     irs_t_ru4(VAR.p+jj,:) = lvars_ru4(:)'*VAR.bet4(1:VAR.p*VAR.n,:);
     irs_t_fu4(VAR.p+jj,:) = lvars_fu4(:)'*VAR.bet4(1:VAR.p*VAR.n,:);
     irs_t_mp4(VAR.p+jj,:) = lvars_mp4(:)'*VAR.bet4(1:VAR.p*VAR.n,:);
     
     lvars_gdp5 = (irs_t_gdp5(VAR.p+jj-1:-1:jj,:))';
     lvars_ru5 = (irs_t_ru5(VAR.p+jj-1:-1:jj,:))';
     lvars_fu5 = (irs_t_fu5(VAR.p+jj-1:-1:jj,:))';
     lvars_mp5 = (irs_t_mp5(VAR.p+jj-1:-1:jj,:))';
     irs_t_gdp5(VAR.p+jj,:) = lvars_gdp5(:)'*VAR.bet5(1:VAR.p*VAR.n,:);
     irs_t_ru5(VAR.p+jj,:) = lvars_ru5(:)'*VAR.bet5(1:VAR.p*VAR.n,:);
     irs_t_fu5(VAR.p+jj,:) = lvars_fu5(:)'*VAR.bet5(1:VAR.p*VAR.n,:);
     irs_t_mp5(VAR.p+jj,:) = lvars_mp5(:)'*VAR.bet5(1:VAR.p*VAR.n,:);
     
     
     lvars_gdp6 = (irs_t_gdp6(VAR.p+jj-1:-1:jj,:))';
     lvars_ru6 = (irs_t_ru6(VAR.p+jj-1:-1:jj,:))';
     lvars_fu6 = (irs_t_fu6(VAR.p+jj-1:-1:jj,:))';
     lvars_mp6 = (irs_t_mp6(VAR.p+jj-1:-1:jj,:))';
     irs_t_gdp6(VAR.p+jj,:) = lvars_gdp6(:)'*VAR.bet6(1:VAR.p*VAR.n,:);
     irs_t_ru6(VAR.p+jj,:) = lvars_ru6(:)'*VAR.bet6(1:VAR.p*VAR.n,:);
     irs_t_fu6(VAR.p+jj,:) = lvars_fu6(:)'*VAR.bet6(1:VAR.p*VAR.n,:);
     irs_t_mp6(VAR.p+jj,:) = lvars_mp6(:)'*VAR.bet6(1:VAR.p*VAR.n,:);
end
VAR.irs_t_gdp1   = irs_t_gdp1(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru1   = irs_t_ru1(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu1   = irs_t_fu1(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp1   = irs_t_mp1(VAR.p+1:VAR.p+irhor,:);

VAR.irs_t_gdp2   = irs_t_gdp2(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru2   = irs_t_ru2(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu2   = irs_t_fu2(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp2   = irs_t_mp2(VAR.p+1:VAR.p+irhor,:);

VAR.irs_t_gdp2   = irs_t_gdp2(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru2   = irs_t_ru2(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu2   = irs_t_fu2(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp2   = irs_t_mp2(VAR.p+1:VAR.p+irhor,:);

VAR.irs_t_gdp3   = irs_t_gdp3(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru3   = irs_t_ru3(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu3   = irs_t_fu3(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp3   = irs_t_mp3(VAR.p+1:VAR.p+irhor,:);

VAR.irs_t_gdp4   = irs_t_gdp4(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru4   = irs_t_ru4(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu4   = irs_t_fu4(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp4   = irs_t_mp4(VAR.p+1:VAR.p+irhor,:);

VAR.irs_t_gdp5   = irs_t_gdp5(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru5   = irs_t_ru5(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu5   = irs_t_fu5(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp5   = irs_t_mp5(VAR.p+1:VAR.p+irhor,:);

VAR.irs_t_gdp6   = irs_t_gdp6(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_ru6   = irs_t_ru6(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_fu6   = irs_t_fu6(VAR.p+1:VAR.p+irhor,:);
VAR.irs_t_mp6   = irs_t_mp6(VAR.p+1:VAR.p+irhor,:);


%% Confidence Interval: Overlapped Moving Block Bootstraping
%mod_bootstrap;
mod_bootstrap_ci;

%% Plot
mod_recursive_plot;


            