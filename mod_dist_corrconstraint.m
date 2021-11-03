mu_c1r=mean(tmp_c1r);
mu_c1f=mean(tmp_c1f);
mu_c2r=mean(tmp_c2r);
mu_c2f=mean(tmp_c2f);
mu_c4=mean(tmp_c4);
mu_c5=mean(tmp_c5);

std_c1r=std(tmp_c1r);
std_c1f=std(tmp_c1f);
std_c2r=std(tmp_c2r);
std_c2f=std(tmp_c2f);
std_c4=std(tmp_c4);
std_c5=std(tmp_c5);

kurtosis_c1r=kurtosis(tmp_c1r);
kurtosis_c1f=kurtosis(tmp_c1f);
kurtosis_c2r=kurtosis(tmp_c2r);
kurtosis_c2f=kurtosis(tmp_c2f);
kurtosis_c4=kurtosis(tmp_c4);
kurtosis_c5=kurtosis(tmp_c5);

skewness_c1r=skewness(tmp_c1r);
skewness_c1f=skewness(tmp_c1f);
skewness_c2r=skewness(tmp_c2r);
skewness_c2f=skewness(tmp_c2f);
skewness_c4=skewness(tmp_c4);
skewness_c5=skewness(tmp_c5);

[c1r_kden,xi_c1r]=ksdensity(tmp_c1r);
[c1f_kden,xi_c1f]=ksdensity(tmp_c1f);
[c2r_kden,xi_c2r]=ksdensity(tmp_c2r);
[c2f_kden,xi_c2f]=ksdensity(tmp_c2f);
[c4_kden,xi_c4]=ksdensity(tmp_c4);
[c5_kden,xi_c5]=ksdensity(tmp_c5);

if bekaert == 0    
    [ev1r_kden,xi_ev1r]=ksdensity(tmp_event1_r);
    [ev1f_kden,xi_ev1f]=ksdensity(tmp_event1_f);
    [ev2_kden,xi_ev2]=ksdensity(tmp_event2);
    [ev4r1_kden,xi_ev4r1]=ksdensity(tmp_event4_r1);
    [ev4f1_kden,xi_ev4f1]=ksdensity(tmp_event4_f1);
    [ev4r2_kden,xi_ev4r2]=ksdensity(tmp_event4_r2);
    [ev4f2_kden,xi_ev4f2]=ksdensity(tmp_event4_f2);
end
[black_kden,xi_black]=ksdensity(tmp_black);


str_c = sprintf('Corr(e_{RU},S_1): Mean=%f, Std Dev=%f, Skewness=%f, Kurtosis=%f \n Corr(e_{FU},S_1): Mean=%f, Std Dev=%f, Skewness=%f, Kurtosis=%f \n Corr(e_{RU},S_2): Mean=%f, Std Dev=%f, Skewness=%f, Kurtosis=%f \n Corr(e_{FU},S_2): Mean=%f, Std Dev=%f, Skewness=%f, Kurtosis=%f \n Corr(e_{MP},S_3): Mean=%f, Std Dev=%f, Skewness=%f, Kurtosis=%f \n Corr(e_{GDP},S_4): Mean=%f, Std Dev=%f, Skewness=%f, Kurtosis=%f',mu_c1r,std_c1r,skewness_c1r,kurtosis_c1r, mu_c1f,std_c1f,skewness_c1f,kurtosis_c1f,mu_c2r,std_c2r,skewness_c2r,kurtosis_c2r,mu_c2f,std_c2f,skewness_c2f,kurtosis_c2f,mu_c4,std_c4,skewness_c4,kurtosis_c4,mu_c5,std_c5,skewness_c5,kurtosis_c5);
dim = [.3 .5 .35 .4];

% Need to save with full-screen size
figure()
plot(xi_c1r,c1r_kden,xi_c1f,c1f_kden,'d',xi_c2r,c2r_kden,'o',xi_c2f,c2f_kden,'--',xi_c4,c4_kden,'+',xi_c5,c5_kden,'*','LineWidth',2)
legend('Distribution: Corr(e_{RU},S_1)','Distribution: Corr(e_{FU},S_1)','Distribution: Corr(e_{RU},S_2)','Distribution: Corr(e_{FU},S_2)','Distribution: Corr(e_{MP},S_3)','Distribution: Corr(e_{GDP},S_4)')
title('Empirical Distribution for Each Correlation')
annotation('textbox',dim,'String',str_c,'FitBoxToText','on');
grid on
set(gca,'FontSize',14)
saveas(gcf,'Dist_CorrelationConstraint','epsc');

if bekaert == 0        
    figure()
    plot(xi_ev1r,ev1r_kden,xi_ev1f,ev1f_kden,'d',xi_ev2,ev2_kden,'o',xi_ev4r1,ev4r1_kden,'--',xi_ev4f1,ev4f1_kden,'+',xi_ev4r2,ev4r2_kden,'*',xi_ev4f2,ev4f2_kden,':','LineWidth',2)
    legend('GFC_ru','GFC_ru','GFC_y','DC_r1','DC_f1','DC_r2','DC_f2')
    title('Empirical Distribution of Shocks for Each Event')
    grid on
    set(gca,'FontSize',14)
end

figure()
plot(xi_black,black_kden,'LineWidth',2)
title('Empirical Distribution of Shock for Black Monday')
grid on
set(gca,'FontSize',14)

%thres_c1r = quantile(tmp_c1r,0.5)
%thres_c1f = quantile(tmp_c1f,0.5)
%thres_c2r = quantile(tmp_c2r,0.5)
%thres_c2f = quantile(tmp_c2f,0.5)
%thres_c4 =  quantile(tmp_c4,0.5)
%thres_c5 =  quantile(tmp_c5,0.5)
%
%if bekaert == 0    
%    thres_ev1r = quantile(tmp_event1_r,0.5)
%    thres_ev1f = quantile(tmp_event1_f,0.5)
%    thres_ev2 = quantile(tmp_event2,0.5)
%    thres_ev4r1 = quantile(tmp_event4_r1,0.5)
%    thres_ev4f1 = quantile(tmp_event4_f1,0.5)
%    thres_ev4r2 = quantile(tmp_event4_r2,0.5)
%    thres_ev4f2 = quantile(tmp_event4_f2,0.5)
%end
%thres_black = quantile(tmp_black,0.5)