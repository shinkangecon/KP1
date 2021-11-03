%% Distributions of Shocks at Oct. 1987 (Black Monday) and Aug. 2009 (Global Financial Crisis)
clc;clear;
load result_m_mon_each_maxCrevised;

%% Setup
for i=1:kk-1
    struc_e_all(:,:,i) = VAR.res*inv(Bstock(:,:,i)');
end

blackmonday=96;
gfc=2+29*12+8;

ru_bm=struc_e_all(blackmonday,1,:);
ru_bm=reshape(ru_bm,size(struc_e_all,3),1);
ru_gfc=struc_e_all(gfc,1,:);
ru_gfc=reshape(ru_gfc,size(struc_e_all,3),1);

gdp_bm=struc_e_all(blackmonday,2,:);
gdp_bm=reshape(gdp_bm,size(struc_e_all,3),1);
gdp_gfc=struc_e_all(gfc,2,:);
gdp_gfc=reshape(gdp_gfc,size(struc_e_all,3),1);

fu_bm=struc_e_all(blackmonday,3,:);
fu_bm=reshape(fu_bm,size(struc_e_all,3),1);
fu_gfc=struc_e_all(gfc,3,:);
fu_gfc=reshape(fu_gfc,size(struc_e_all,3),1);

mp_bm=struc_e_all(blackmonday,4,:);
mp_bm=reshape(mp_bm,size(struc_e_all,3),1);
mp_gfc=struc_e_all(gfc,4,:);
mp_gfc=reshape(mp_gfc,size(struc_e_all,3),1);

%% Kernal density
[ru_bm_kden,xi_ru_bm]=ksdensity(ru_bm);
[ru_gfc_kden,xi_ru_gfc]=ksdensity(ru_gfc);
[fu_bm_kden,xi_fu_bm]=ksdensity(fu_bm);
[fu_gfc_kden,xi_fu_gfc]=ksdensity(fu_gfc);
[gdp_bm_kden,xi_gdp_bm]=ksdensity(gdp_bm);
[gdp_gfc_kden,xi_gdp_gfc]=ksdensity(gdp_gfc);
[mp_bm_kden,xi_mp_bm]=ksdensity(mp_bm);
[mp_gfc_kden,xi_mp_gfc]=ksdensity(mp_gfc);

figure()
plot(xi_ru_bm,ru_bm_kden,xi_ru_gfc,ru_gfc_kden,'--','LineWidth',2)
legend('Black Monday','Global Financial Crisis')
title('Distributions of Identified RU Shocks')
grid on
xline(0,'--',{'Zero'},'LineWidth',1.8)
set(gca,'FontSize',12)
saveas(gcf,'Dist_RU_BMGFC','epsc');

figure()
plot(xi_fu_bm,fu_bm_kden,xi_fu_gfc,fu_gfc_kden,'--','LineWidth',2)
legend('Black Monday','Global Financial Crisis')
title('Distributions of Identified FU Shocks')
grid on
xline(0,'--',{'Zero'},'LineWidth',1.8)
set(gca,'FontSize',12)
saveas(gcf,'Dist_FU_BMGFC','epsc');

figure()
plot(xi_gdp_bm,gdp_bm_kden,xi_gdp_gfc,gdp_gfc_kden,'--','LineWidth',2)
legend('Black Monday','Global Financial Crisis')
title('Distributions of Identified GDP Shocks')
grid on
xline(0,'--',{'Zero'},'LineWidth',1.8)
set(gca,'FontSize',12)
saveas(gcf,'Dist_GDP_BMGFC','epsc');

figure()
plot(xi_mp_bm,mp_bm_kden,xi_mp_gfc,mp_gfc_kden,'--','LineWidth',2)
legend('Black Monday','Global Financial Crisis')
title('Distributions of Identified MP Shocks')
grid on
xline(0,'--',{'Zero'},'LineWidth',1.8)
set(gca,'FontSize',12)
saveas(gcf,'Dist_MP_BMGFC','epsc');

figure()
subplot(1,2,1);
hist(ru_bm)
title('Histogram: Identified RU Shock in October 1987')
set(gca,'FontSize',10)
grid on
subplot(1,2,2);
hist(ru_gfc)
title('Histogram: Identified RU Shock in August 2009')
grid on;
set(gca,'FontSize',10)
saveas(gcf,'Histogram_RU_BMGFC','epsc');

