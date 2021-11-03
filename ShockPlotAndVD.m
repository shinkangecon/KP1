clc;clear;
load('result_m_mon_each');
e_real=struc_e_max(:,1);        % Structural RU Shock
e_gdp=struc_e_max(:,2);         % Structural GDP Shock
e_financial=struc_e_max(:,3);   % Structural FU Shock
e_mp=struc_e_max(:,4);    % Structural MP Shock

%% Histogram
figure()
subplot(1,2,1);
hist(e_real)
title('Histogram: Identified RU Shock')
set(gca,'FontSize',10)
grid on
subplot(1,2,2);
hist(e_financial)
title('Histogram: Identified FU Shock')
grid on;
set(gca,'FontSize',10)
saveas(gcf,'Histogram_RUFU','epsc');

figure()
hist(e_real)
title('Histogram: Identified RU Shock')
set(gca,'FontSize',11)
grid on
set(gca,'FontSize',11)
saveas(gcf,'Histogram_RU','epsc');

figure()
hist(e_financial)
title('Histogram: Identified FU Shock')
set(gca,'FontSize',11)
grid on
set(gca,'FontSize',11)
saveas(gcf,'Histogram_FU','epsc');

figure()
hist(e_gdp)
title('Histogram: Identified GDP Shock')
set(gca,'FontSize',11)
grid on
set(gca,'FontSize',11)
saveas(gcf,'Histogram_GDP','epsc');

figure()
hist(e_mp)
title('Histogram: Identified MP Shock')
set(gca,'FontSize',11)
grid on
set(gca,'FontSize',11)
saveas(gcf,'Histogram_MP','epsc');


%% Time Series: Recession Plot
T=size(e_real,1);
time=linspace(1981+3/12,2018+11/12,T)';
dates = datenum([time,ones(T,2)]);

kr=2;
kf=2;
kgdp=2;
kmp=2;

positive_kr=ones(T,1).*kr;
negative_kr=-ones(T,1).*kr;
positive_kf=ones(T,1).*kf;
negative_kf=-ones(T,1).*kf;
positive_kgdp=ones(T,1).*kf;
negative_kgdp=-ones(T,1).*kf;
positive_kmp=ones(T,1).*kmp;
negative_kmp=-ones(T,1).*kmp;

% Skewness of identified shocks
skew_real=skewness(e_real);
skew_financial=skewness(e_financial);
skew_gdp=skewness(e_gdp);
skew_mp=skewness(e_mp);

% Kurtosis of identified shocks
kurt_real=kurtosis(e_real);
kurt_financial=kurtosis(e_financial);
kurt_gdp=kurtosis(e_gdp);
kurt_mp=kurtosis(e_mp);

disp('Skewness: RU Shock')
skew_real
disp('Kurtosis: RU Shock')
kurt_real
disp('Skewness: FU Shock')
skew_financial
disp('Kurtosis: FU Shock')
kurt_financial
disp('Skewness: GDP Shock')
skew_gdp
disp('Kurtosis: GDP Shock')
kurt_gdp
disp('Skewness: MP Shock')
skew_mp
disp('Kurtosis: MP Shock')
kurt_mp

str_real = sprintf('Skewness=%f, Kurtosis=%f',skew_real,kurt_real);
str_fin = sprintf('Skewness=%f, Kurtosis=%f',skew_financial,kurt_financial);
str_gdp = sprintf('Skewness=%f, Kurtosis=%f',skew_gdp,kurt_gdp);
str_mp = sprintf('Skewness=%f, Kurtosis=%f',skew_mp,kurt_mp);

dim = [.3 .5 .35 .35];

figure()
plot(dates,e_real,dates,positive_kr,'k--',dates,negative_kr,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('RU Shock');
title('Identified e_{RU}')
annotation('textbox',dim,'String',str_real,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'RU_TimeSeries','epsc');

figure()
plot(dates,e_financial,dates,positive_kf,'k--',dates,negative_kf,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('FU Shock');
title('Identified e_{FU}')
annotation('textbox',dim,'String',str_fin,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'FU_TimeSeries','epsc');

figure()
plot(dates,e_gdp,dates,positive_kgdp,'k--',dates,negative_kgdp,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('GDP Shock');
title('Identified e_{GDP}')
annotation('textbox',dim,'String',str_gdp,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'GDP_TimeSeries','epsc');

figure()
plot(dates,e_mp,dates,positive_kmp,'k--',dates,negative_kmp,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('MP Shock');
title('Identified e_{MP}')
annotation('textbox',dim,'String',str_mp,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'MP_TimeSeries','epsc');


%% Exceeds threshold
exceed_real=zeros(T,1);
exceed_financial=zeros(T,1);
exceed_gdp=zeros(T,1);
exceed_mp=zeros(T,1);
for t=1:T
    if e_real(t)>2
        exceed_real(t)=e_real(t);
    end
    
    if e_financial(t)>2
        exceed_financial(t)=e_financial(t);
    end
    
    if e_gdp(t)<-2                  % negative gdp shock
        exceed_gdp(t)=-e_gdp(t);
    end
    
    if e_mp(t)<-2                   % expansionary mp shock
        exceed_mp(t)=-e_mp(t);
    end
end

figure()
plot(dates,exceed_real,dates,positive_kr,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('RU Shock');
title('Positive Structural RU Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'RU_Exceeding','epsc');

figure()
plot(dates,exceed_financial,dates,positive_kf,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('FU Shock');
title('Positive Structural FU Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'FU_Exceeding','epsc');

figure()
plot(dates,exceed_gdp,dates,positive_kgdp,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('GDP Shock');
title('Negative Structural GDP Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'GDP_Exceeding','epsc');

figure()
plot(dates,exceed_mp,dates,positive_kmp,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('MP Shock');
title('Negative Structural MP Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'MP_Exceeding','epsc');



%% Together
dim1=[.25 .5 .45 .4];
dim2=[.65 .5 .45 .4];
figure()
subplot(2,2,1)
plot(dates,e_real,dates,positive_kr,'k--',dates,negative_kr,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('RU Shock');
title('Identified Structural RU Shocks')
annotation('textbox',dim1,'String',str_real,'FitBoxToText','on');
grid on;
set(gca,'FontSize',15)
axis tight;
recessionplot;
subplot(2,2,2);
plot(dates,e_financial,dates,positive_kf,'k--',dates,negative_kf,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('FU Shock');
title('Identified Structural FU Shocks')
annotation('textbox',dim2,'String',str_fin,'FitBoxToText','on');
grid on;
set(gca,'FontSize',15)
axis tight;
recessionplot;
subplot(2,2,3);
plot(dates,exceed_real,dates,positive_kr,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('RU Shock');
title('Positive Structural RU Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',15)
axis tight;
recessionplot;
subplot(2,2,4);
plot(dates,exceed_financial,dates,positive_kf,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('FU Shock');
title('Positive Structural FU Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',15)
axis tight;
recessionplot;

%% Comparison with TFP, Utilization adjusted TFP, and e_{GDP}
% taking average to adjust monthly to quarterly
T_q=floor(T/3);                     % quarterly frequency
e_qgdp=zeros(T_q,1);
j=1;
for t=1:T_q
    e_qgdp(t)=mean(e_gdp(j:j+2));
    j=j+3;
end
tfp_data=xlsread('TFP.xlsx');
tfp=tfp_data(:,1);
tfp_adj=tfp_data(:,2);
clear tfp_data;

% Plot
time_q=linspace(1981+1/4,2018+4/3,T_q)';
dates_q = datenum([time_q,ones(T_q,2)]);

figure()
plot(dates_q,e_qgdp,dates_q,tfp,'--',dates_q,tfp_adj,'-d','LineWidth',1.8)
ax.XTick = dates_q(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: 1981 Q2 ~ 2018 Q3');
ylabel('e_{GDP} and Measured TFP');
legend('e_{GDP}','TFP','Adjusted TFP')
title('Identified e_{GDP} and measured TFP')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'GDPShockTFP','epsc');

set(0,'DefaultLegendAutoUpdate','off')
hold on
yyaxis left
plot(dates_q,e_qgdp,'LineWidth',1.8)
ax.XTick = dates_q(1:2:end);
datetick('x','yyyy','keepticks')
ylabel('e_{GDP}');
grid on;
set(gca,'FontSize',14)
yyaxis right
plot(dates_q,tfp,'--',dates_q,tfp_adj,'-d','LineWidth',1.8)
ax.XTick = dates_q(1:2:end);
datetick('x','yyyy','keepticks')
xlabel('Period: 1981 Q2 ~ 2018 Q3');
ylabel('Measured TFP');
title('Identified e_{GDP} and measured TFP')
grid on;
legend('e_{GDP}','TFP','Adjusted TFP')
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'GDPShockTFP_yaxis','epsc');
hold off;