%% Historical Decomposition
% Only consider contribution of each structural shock
clc;clear;
load 'result';

nvar=VAR.n;
neq=VAR.p;
nvarXeq=nvar*neq;
nlag=VAR.p;
nobs=VAR.T;
invA=B_max;
BB=VAR.bet(1:24,1:4)';
Fcomp=zeros(nvarXeq,nvarXeq);
Fcomp(1:nvar,1:nvarXeq)=BB;
Fcomp(nvar+1:nvarXeq,:)=[eye(nvar*(neq-1),nvar*(neq-1)) zeros(nvar*neq-nvar,nvar)];


%% HD of structural shocks
invA_big = zeros(nvarXeq,nvar);
invA_big(1:nvar,:) = invA;
Icomp = [eye(nvar) zeros(nvar,(nlag-1)*nvar)];
HDshock_big = zeros(nlag*nvar,nobs+1,nvar);
HDshock = zeros(nvar,nobs+1,nvar);


for j=1:nvar  % for each variable
    eps_big = zeros(nvar,nobs+1); % matrix of shocks conformable with companion
    eps_big(j,2:end) = struc_e_max(:,j);
    for i = 2:nobs+1
        HDshock_big(:,i,j) = invA_big*eps_big(:,i) + Fcomp*HDshock_big(:,i-1,j);
        HDshock(:,i,j) =  Icomp*HDshock_big(:,i,j);
    end
end

HD.shock = zeros(nobs+nlag,nvar,nvar);  % [nobs x shock x var]
for i=1:nvar
    for j=1:nvar
        HD.shock(:,j,i) = [nan(nlag,1); HDshock(i,2:end,j)'];
    end
end

HD.ru_shock=HD.shock(VAR.p+1:end,:,1);
HD.gdp_shock=HD.shock(VAR.p+1:end,:,2);
HD.fu_shock=HD.shock(VAR.p+1:end,:,3);
HD.mp_shock=HD.shock(VAR.p+1:end,:,4);

%% Plot
T=size(HD.ru_shock,1);
time=linspace(1981+3/12,2018+11/12,T)';
dates = datenum([time,ones(T,2)]);

figure()
plot(dates,HD.ru_shock(:,1),'--',dates,HD.ru_shock(:,2),dates,HD.ru_shock(:,3),'d--',dates,HD.ru_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of Real Uncertainty')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;

figure()
plot(dates,HD.gdp_shock(:,1),'--',dates,HD.gdp_shock(:,2),dates,HD.gdp_shock(:,3),'d--',dates,HD.gdp_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of GDP')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;

figure()
plot(dates,HD.fu_shock(:,1),'--',dates,HD.fu_shock(:,2),dates,HD.fu_shock(:,3),'d--',dates,HD.fu_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of Financial Uncertainty')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;

figure()
plot(dates,HD.mp_shock(:,1),'--',dates,HD.mp_shock(:,2),dates,HD.mp_shock(:,3),'d--',dates,HD.mp_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of Monetary Policy')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;

%% Plot all together
figure()
subplot(2,2,1)
plot(dates,HD.ru_shock(:,1),dates,HD.ru_shock(:,2),'--',dates,HD.ru_shock(:,3),'d--',dates,HD.ru_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of Real Uncertainty')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
subplot(2,2,2)
plot(dates,HD.gdp_shock(:,1),'--',dates,HD.gdp_shock(:,2),dates,HD.gdp_shock(:,3),'d--',dates,HD.gdp_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of GDP')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
subplot(2,2,3)
plot(dates,HD.fu_shock(:,1),'d--',dates,HD.fu_shock(:,2),'--',dates,HD.fu_shock(:,3),dates,HD.fu_shock(:,4),'o--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of Financial Uncertainty')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
subplot(2,2,4)
plot(dates,HD.mp_shock(:,1),'o--',dates,HD.mp_shock(:,2),'--',dates,HD.mp_shock(:,3),'d--',dates,HD.mp_shock(:,4),'LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
title('Historical Decomposition of Monetary Policy')
legend('RU Shock','GDP Shock','FU Shock','MP Shock')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;



    

                       