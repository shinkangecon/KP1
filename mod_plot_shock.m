%% Investigating structural shocks
% setup
% clc;clear;
% load('result');

% Max-C shocks
e_real=struc_e_max(:,1);        % Structural RU Shock
e_gdp=struc_e_max(:,2);         % Structural GDP Shock
e_inflation=struc_e_max(:,3);   % Structural FU Shock
e_financial=struc_e_max(:,4);   % Structural FU Shock
e_mp=struc_e_max(:,5);          % Structural MP Shock

% All shocks
for i=1:num_B-1
    struc_e_all(:,:,i) = VAR.res*inv(Identified_B(:,:,i)');
end

e_real_all=struc_e_all(:,1,:);
e_inflation_all=struc_e_all(:,3,:);
e_financial_all=struc_e_all(:,4,:);
e_gdp_all=struc_e_all(:,2,:);
e_mp_all=struc_e_all(:,5,:);

e_real_all=reshape(e_real_all,size(e_real,1),num_B-1);
e_gdp_all=reshape(e_gdp_all,size(e_real,1),num_B-1);
e_financial_all=reshape(e_financial_all,size(e_real,1),num_B-1);
e_mp_all=reshape(e_mp_all,size(e_real,1),num_B-1);
e_inflation_all=reshape(e_inflation_all,size(e_real,1),num_B-1);

e_real90=quantile(e_real_all,0.95,2);
e_real10=quantile(e_real_all,0.05,2);
e_gdp90=quantile(e_gdp_all,0.95,2);
e_gdp10=quantile(e_gdp_all,0.05,2);
e_financial90=quantile(e_financial_all,0.95,2);
e_financial10=quantile(e_financial_all,0.05,2);
e_mp90=quantile(e_mp_all,0.95,2);
e_mp10=quantile(e_mp_all,0.05,2);
e_inflation90=quantile(e_inflation_all,0.95,2);
e_inflation10=quantile(e_inflation_all,0.05,2);


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

figure()
hist(e_inflation)
title('Histogram: Identified Inflation Shock')
set(gca,'FontSize',11)
grid on
set(gca,'FontSize',11)
saveas(gcf,'Histogram_Inflation','epsc');


%% Time Series: Recession Plot
T=size(e_real,1);
time=linspace(2018+11/12-((1/12)*(T-1)),2018+11/12,T)';
dates = datenum([time,ones(T,2)]);

kr=2;
kf=2;
kgdp=2;
kmp=2;
kinf=2;

positive_kr=ones(T,1).*kr;
negative_kr=-ones(T,1).*kr;
positive_kf=ones(T,1).*kf;
negative_kf=-ones(T,1).*kf;
positive_kgdp=ones(T,1).*kf;
negative_kgdp=-ones(T,1).*kf;
positive_kmp=ones(T,1).*kmp;
negative_kmp=-ones(T,1).*kmp;
positive_kinf=ones(T,1).*kinf;
negative_kinf=-ones(T,1).*kinf;

% Skewness of identified shocks
skew_real=skewness(e_real);
skew_financial=skewness(e_financial);
skew_gdp=skewness(e_gdp);
skew_mp=skewness(e_mp);
skew_inf=skewness(e_inflation);

% Kurtosis of identified shocks
kurt_real=kurtosis(e_real);
kurt_financial=kurtosis(e_financial);
kurt_gdp=kurtosis(e_gdp);
kurt_mp=kurtosis(e_mp);
kurt_inf=kurtosis(e_inflation);

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
disp('Skewness: Inflation Shock')
skew_inf
disp('Kurtosis: Inflation Shock')
kurt_inf

str_real = sprintf('Skewness=%f, Kurtosis=%f',skew_real,kurt_real);
str_fin = sprintf('Skewness=%f, Kurtosis=%f',skew_financial,kurt_financial);
str_gdp = sprintf('Skewness=%f, Kurtosis=%f',skew_gdp,kurt_gdp);
str_mp = sprintf('Skewness=%f, Kurtosis=%f',skew_mp,kurt_mp);
str_inf = sprintf('Skewness=%f, Kurtosis=%f',skew_inf,kurt_inf);

dim = [.3 .5 .35 .35];

figure()
plot(dates,e_real,dates,positive_kr,'k--',dates,negative_kr,'k--',dates,e_real90,'d--',dates,e_real10,'d--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
ylabel('RU Shock');
title('Identified e_{RU}')
annotation('textbox',dim,'String',str_real,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'RU_TimeSeries','epsc');

figure()
subplot(2,1,1);
fill([dates;flipud(dates)],[e_real10;flipud(e_real90)],[.55, .55, .55],'LineStyle','none');    
line(dates,e_real,'LineStyle','--','LineWidth',0.5)
line(dates,positive_kr,'LineStyle','--')
line(dates,negative_kr,'LineStyle','--')
ylim([-2 2]);
datetick('x','yyyy','keepticks')
%xlabel('Period: Apr. 1981 ~ Dec. 2018');
ylabel('RU Shock');
title('Identified e_{RU}')
%annotation('textbox',dim,'String',str_real,'FitBoxToText','on');
grid on;
set(gca,'FontSize',11)
axis tight;
%recessionplot;
subplot(2,1,2);
fill([dates;flipud(dates)],[e_financial10;flipud(e_financial90)],[.4, .4, .4],'LineStyle','none');    
line(dates,e_financial,'LineStyle','--','LineWidth',0.5)
line(dates,positive_kf,'LineStyle','--')
line(dates,negative_kf,'LineStyle','--')
datetick('x','yyyy','keepticks')
ylabel('FU Shock');
title('Identified e_{FU}')
%annotation('textbox',dim,'String',str_fin,'FitBoxToText','on');
grid on;
set(gca,'FontSize',11)
axis tight;
%recessionplot;
saveas(gcf,'RUFU_TS_Bands1','epsc');
%saveas(gcf,'FU_TimeSeries_Revised','epsc');

figure()
plot(dates,e_financial,dates,positive_kf,'k--',dates,negative_kf,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
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
ylabel('MP Shock');
title('Identified e_{MP}')
annotation('textbox',dim,'String',str_mp,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'MP_TimeSeries','epsc');

figure()
plot(dates,e_inflation,dates,positive_kinf,'k--',dates,negative_kinf,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
ylabel('Inflation Shock');
title('Identified e_{INF}')
annotation('textbox',dim,'String',str_inf,'FitBoxToText','on');
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'Inflation_TimeSeries','epsc');

%% Exceeds threshold
exceed_real=zeros(T,1);
exceed_financial=zeros(T,1);
exceed_gdp=zeros(T,1);
exceed_mp=zeros(T,1);
exceed_inf=zeros(T,1);

jr=1;
jf=1;
jg=1;
jm=1;
ji=1;

for t=1:T
    if e_real(t)>2
        exceed_real(t)=e_real(t);
        event_ru(jr)=t;
        jr=jr+1;
    end
    
    if e_financial(t)>2
        exceed_financial(t)=e_financial(t);
        event_fu(jf)=t;
        jf=jf+1;
    end
    
    if e_inflation(t)>2
        exceed_inf(t)=e_inflation(t);
        event_inf(ji)=t;
        ji=ji+1;
    end
    
    if e_gdp(t)<-2                  % negative gdp shock
        exceed_gdp(t)=-e_gdp(t);
        event_gdp(jg)=t;
        jg=jg+1;
    end
    
    if e_mp(t)<-2                   % expansionary mp shock
        exceed_mp(t)=-e_mp(t);
        event_mp(jm)=t;
        jm=jm+1;
    end
end

[fu_kden_bm,xi_fu_bm]=ksdensity(e_financial_all(t1,:)');
[ru_kden_bm,xi_ru_bm]=ksdensity(e_real_all(t1,:)');

figure()
plot(xi_fu_bm,fu_kden_bm,'LineWidth',2)
title('Distribution of FU Shocks: Black Monday')
grid on
%xline(e_financial(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

figure()
plot(xi_ru_bm,ru_kden_bm,'LineWidth',2)
title('Distribution of RU Shocks: Black Monday')
grid on
%xline(e_real(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

[fu_kden_bm,xi_fu_bm]=ksdensity(e_financial_all(t2,:)');
[ru_kden_bm,xi_ru_bm]=ksdensity(e_real_all(t2,:)');

figure()
plot(xi_fu_bm,fu_kden_bm,'LineWidth',2)
title('Distribution of FU Shocks: Lehman bros')
grid on
%xline(e_financial(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

figure()
plot(xi_ru_bm,ru_kden_bm,'LineWidth',2)
title('Distribution of RU Shocks: Lehman bros')
grid on
%xline(e_real(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

[fu_kden_bm,xi_fu_bm]=ksdensity(e_financial_all(t6,:)');
[ru_kden_bm,xi_ru_bm]=ksdensity(e_real_all(t6,:)');

figure()
plot(xi_fu_bm,fu_kden_bm,'LineWidth',2)
title('Distribution of FU Shocks: Debt ceiling')
grid on
%xline(e_financial(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

figure()
plot(xi_ru_bm,ru_kden_bm,'LineWidth',2)
title('Distribution of RU Shocks: Debt ceiling')
grid on
%xline(e_real(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

[fu_kden_bm,xi_fu_bm]=ksdensity(e_financial_all(t6+1,:)');
[ru_kden_bm,xi_ru_bm]=ksdensity(e_real_all(t6+1,:)');

figure()
plot(xi_fu_bm,fu_kden_bm,'LineWidth',2)
title('Distribution of FU Shocks: Debt ceiling+1')
grid on
%xline(e_financial(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)

figure()
plot(xi_ru_bm,ru_kden_bm,'LineWidth',2)
title('Distribution of RU Shocks: Debt ceiling+1')
grid on
%xline(e_real(t1),'--',{'Max-C solution'},'LineWidth',1.8)
set(gca,'FontSize',12)




figure()
plot(dates,exceed_real,dates,positive_kr,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
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
ylabel('MP Shock');
title('Negative Structural MP Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'MP_Exceeding','epsc');

figure()
plot(dates,exceed_inf,dates,positive_kinf,'k','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
ylabel('Inflation Shock');
title('Positive Structural Inflation Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'Inf_Exceeding','epsc');

%% Together
dim1=[.25 .5 .45 .4];
dim2=[.65 .5 .45 .4];
figure()
subplot(2,2,1)
plot(dates,e_real,dates,positive_kr,'k--',dates,negative_kr,'k--','LineWidth',2);
ax.XTick = dates(1:2:end);
datetick('x','yyyy','keepticks')
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
ylabel('FU Shock');
title('Positive Structural FU Shocks Exceeding 2 Std. Dev')
grid on;
set(gca,'FontSize',15)
axis tight;
recessionplot;

%% Comparison with TFP, Utilization adjusted TFP, and e_{GDP}
% taking average to adjust monthly to quarterly
T_q=151;                     % quarterly frequency
e_qgdp=zeros(T_q,1);
% 
% for t=1:T_q
%     e_qgdp(t)=mean(e_gdp(j:j+2));
%     j=j+3;
% end
for mm = 1:151
    for nn = 1:3
        e_qgdp(mm,1) = e_qgdp(mm,1) + e_gdp((mm-1)*3+nn+21-VAR.p,1);
    end
end

% read tfp data

tfp_adj=tfpu;

% plot
time_q=linspace(2018+3/4-((1/4)*(T_q-1)),2018+3/4,T_q)';
dates_q = datenum([time_q,ones(T_q,2)]);


hold on
figure()
set(0,'DefaultLegendAutoUpdate','off')
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
ylabel('Measured TFP');
title('Identified e_{GDP} and measured TFP')
grid on;
legend('e_{GDP}','TFP','Adjusted TFP')
set(gca,'FontSize',14)
axis tight;
recessionplot;
saveas(gcf,'GDPShockTFP_yaxis','epsc');
hold off;