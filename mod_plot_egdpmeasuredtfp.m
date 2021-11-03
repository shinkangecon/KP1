%% Comparison with TFP, Utilization adjusted TFP, and e_{GDP}
% taking average to adjust monthly to quarterly
T_q=floor(T/3);                     % quarterly frequency
e_qgdp=zeros(T_q,1);
j=1;
for t=1:T_q
    e_qgdp(t)=mean(e_gdp(j:j+2));
    j=j+3;
end

% read tfp data
tfp_data=xlsread('TFP.xlsx');
tfp=tfp_data(:,1);
tfp_adj=tfp_data(:,2);
clear tfp_data;

% plot
time_q=linspace(1981+1/4,2018+4/3,T_q)';
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