%% Aggregate: Max-C Responses
mod_LMNbootstrap;
hh = 0:1:irhor-1;

%% Bootstrapping with event & correlation constraints
figure()
subplot(5,5,1)
fill([hh';flipud(hh')],[IRS_stock_ci_m_min2(:,1);flipud(IRS_stock_ci_m_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
fill([hh';flipud(hh')],[IRS_stock_ci_m_min2(:,2);flipud(IRS_stock_ci_m_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
fill([hh';flipud(hh')],[IRS_stock_ci_m_min2(:,3);flipud(IRS_stock_ci_m_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,3),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_max1(:,3),'LineWidth',1.2);   
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
fill([hh';flipud(hh')],[IRS_stock_ci_m_min2(:,4);flipud(IRS_stock_ci_m_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
fill([hh';flipud(hh')],[IRS_stock_ci_m_min2(:,5);flipud(IRS_stock_ci_m_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
fill([hh';flipud(hh')],[IRS_stock_ci_y_min2(:,1);flipud(IRS_stock_ci_y_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
fill([hh';flipud(hh')],[IRS_stock_ci_y_min2(:,2);flipud(IRS_stock_ci_y_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
fill([hh';flipud(hh')],[IRS_stock_ci_y_min2(:,3);flipud(IRS_stock_ci_y_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
fill([hh';flipud(hh')],[IRS_stock_ci_y_min2(:,4);flipud(IRS_stock_ci_y_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
fill([hh';flipud(hh')],[IRS_stock_ci_y_min2(:,5);flipud(IRS_stock_ci_y_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
fill([hh';flipud(hh')],[IRS_stock_ci_p_min2(:,1);flipud(IRS_stock_ci_p_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
fill([hh';flipud(hh')],[IRS_stock_ci_p_min2(:,2);flipud(IRS_stock_ci_p_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
fill([hh';flipud(hh')],[IRS_stock_ci_p_min2(:,3);flipud(IRS_stock_ci_p_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
fill([hh';flipud(hh')],[IRS_stock_ci_p_min2(:,4);flipud(IRS_stock_ci_p_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
fill([hh';flipud(hh')],[IRS_stock_ci_p_min2(:,5);flipud(IRS_stock_ci_p_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
fill([hh';flipud(hh')],[IRS_stock_ci_f_min2(:,1);flipud(IRS_stock_ci_f_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
fill([hh';flipud(hh')],[IRS_stock_ci_f_min2(:,2);flipud(IRS_stock_ci_f_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
fill([hh';flipud(hh')],[IRS_stock_ci_f_min2(:,3);flipud(IRS_stock_ci_f_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
fill([hh';flipud(hh')],[IRS_stock_ci_f_min2(:,4);flipud(IRS_stock_ci_f_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
fill([hh';flipud(hh')],[IRS_stock_ci_f_min2(:,5);flipud(IRS_stock_ci_f_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_min2(:,1);flipud(IRS_stock_ci_mon_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_min2(:,2);flipud(IRS_stock_ci_mon_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_min2(:,3);flipud(IRS_stock_ci_mon_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_min2(:,4);flipud(IRS_stock_ci_mon_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_min2(:,5);flipud(IRS_stock_ci_mon_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP')                                                                           
set(gca,'FontSize',13)
grid on
sgtitle('Benchmark Model: Max-C Solutions -Event&Corr') 
print('Aggregate_MaxC_bootstrap_eventcorr','-depsc')  

% No Endogenous Uncertainty
figure()
subplot(5,5,1)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_min2(:,1);flipud(IRS_stock_ci_m_noendo_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_min2(:,2);flipud(IRS_stock_ci_m_noendo_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_min2(:,3);flipud(IRS_stock_ci_m_noendo_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,3),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_max1(:,3),'LineWidth',1.2);   
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_min2(:,4);flipud(IRS_stock_ci_m_noendo_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_noendo_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_min2(:,5);flipud(IRS_stock_ci_m_noendo_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_noendo_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_min2(:,1);flipud(IRS_stock_ci_y_noendo_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_noendo_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_min2(:,2);flipud(IRS_stock_ci_y_noendo_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_noendo_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_min2(:,3);flipud(IRS_stock_ci_y_noendo_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_min2(:,4);flipud(IRS_stock_ci_y_noendo_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_min2(:,5);flipud(IRS_stock_ci_y_noendo_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_min2(:,1);flipud(IRS_stock_ci_p_noendo_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_noendo_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_min2(:,2);flipud(IRS_stock_ci_p_noendo_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_noendo_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_min2(:,3);flipud(IRS_stock_ci_p_noendo_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_min2(:,4);flipud(IRS_stock_ci_p_noendo_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_min2(:,5);flipud(IRS_stock_ci_p_noendo_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_min2(:,1);flipud(IRS_stock_ci_f_noendo_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_noendo_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_min2(:,2);flipud(IRS_stock_ci_f_noendo_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_noendo_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_min2(:,3);flipud(IRS_stock_ci_f_noendo_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_min2(:,4);flipud(IRS_stock_ci_f_noendo_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_min2(:,5);flipud(IRS_stock_ci_f_noendo_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_min2(:,1);flipud(IRS_stock_ci_mon_noendo_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_noendo_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_min2(:,2);flipud(IRS_stock_ci_mon_noendo_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_noendo_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_min2(:,3);flipud(IRS_stock_ci_mon_noendo_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_min2(:,4);flipud(IRS_stock_ci_mon_noendo_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_min2(:,5);flipud(IRS_stock_ci_mon_noendo_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP')                                                                           
set(gca,'FontSize',13)
grid on
sgtitle('No Endogenus Uncertainty: Max-C Solutions -Event&Corr') 
print('Aggregate_MaxC_noendo_bootstrap_eventcorr','-depsc')  

% No Endogenous RU
figure()
subplot(5,5,1)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_real_min2(:,1);flipud(IRS_stock_ci_m_noendo_real_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_real_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_real_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_real_min2(:,2);flipud(IRS_stock_ci_m_noendo_real_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_real_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_real_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_real_min2(:,3);flipud(IRS_stock_ci_m_noendo_real_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,3),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_real_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_real_max1(:,3),'LineWidth',1.2);   
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_real_min2(:,4);flipud(IRS_stock_ci_m_noendo_real_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_noendo_real_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_real_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_real_min2(:,5);flipud(IRS_stock_ci_m_noendo_real_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_noendo_real_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_real_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_real_min2(:,1);flipud(IRS_stock_ci_y_noendo_real_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_noendo_real_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_real_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_real_min2(:,2);flipud(IRS_stock_ci_y_noendo_real_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_noendo_real_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_real_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_real_min2(:,3);flipud(IRS_stock_ci_y_noendo_real_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_real_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_real_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_real_min2(:,4);flipud(IRS_stock_ci_y_noendo_real_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_real_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_real_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_real_min2(:,5);flipud(IRS_stock_ci_y_noendo_real_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_real_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_real_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_real_min2(:,1);flipud(IRS_stock_ci_p_noendo_real_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_noendo_real_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_real_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_real_min2(:,2);flipud(IRS_stock_ci_p_noendo_real_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_noendo_real_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_real_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_real_min2(:,3);flipud(IRS_stock_ci_p_noendo_real_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_real_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_real_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_real_min2(:,4);flipud(IRS_stock_ci_p_noendo_real_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_real_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_real_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_real_min2(:,5);flipud(IRS_stock_ci_p_noendo_real_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_real_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_real_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_real_min2(:,1);flipud(IRS_stock_ci_f_noendo_real_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_noendo_real_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_real_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_real_min2(:,2);flipud(IRS_stock_ci_f_noendo_real_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_noendo_real_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_real_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_real_min2(:,3);flipud(IRS_stock_ci_f_noendo_real_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_real_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_real_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_real_min2(:,4);flipud(IRS_stock_ci_f_noendo_real_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_real_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_real_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_real_min2(:,5);flipud(IRS_stock_ci_f_noendo_real_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_real_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_real_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_real_min2(:,1);flipud(IRS_stock_ci_mon_noendo_real_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_noendo_real_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_real_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_real_min2(:,2);flipud(IRS_stock_ci_mon_noendo_real_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_noendo_real_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_real_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_real_min2(:,3);flipud(IRS_stock_ci_mon_noendo_real_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_real_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_real_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_real_min2(:,4);flipud(IRS_stock_ci_mon_noendo_real_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_real_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_real_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_real_min2(:,5);flipud(IRS_stock_ci_mon_noendo_real_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_real_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_real_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP')                                                                           
set(gca,'FontSize',13)
grid on
sgtitle('No Endogenus RU: Max-C Solutions -Event&Corr') 
print('Aggregate_MaxC_noendo_real_bootstrap_eventcorr','-depsc')  

% No Endogenous FU
figure()
subplot(5,5,1)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_financial_min2(:,1);flipud(IRS_stock_ci_m_noendo_financial_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_financial_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_financial_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_financial_min2(:,2);flipud(IRS_stock_ci_m_noendo_financial_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_financial_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_financial_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_financial_min2(:,3);flipud(IRS_stock_ci_m_noendo_financial_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,3),'LineWidth',2.2);
line(hh',IRS_stock_ci_m_noendo_financial_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_financial_max1(:,3),'LineWidth',1.2);   
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_financial_min2(:,4);flipud(IRS_stock_ci_m_noendo_financial_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_noendo_financial_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_financial_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
fill([hh';flipud(hh')],[IRS_stock_ci_m_noendo_financial_min2(:,5);flipud(IRS_stock_ci_m_noendo_financial_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_m_noendo_financial_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_m_noendo_financial_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_financial_min2(:,1);flipud(IRS_stock_ci_y_noendo_financial_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_noendo_financial_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_financial_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_financial_min2(:,2);flipud(IRS_stock_ci_y_noendo_financial_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_y_noendo_financial_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_financial_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_financial_min2(:,3);flipud(IRS_stock_ci_y_noendo_financial_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_financial_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_financial_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_financial_min2(:,4);flipud(IRS_stock_ci_y_noendo_financial_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_financial_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_financial_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
fill([hh';flipud(hh')],[IRS_stock_ci_y_noendo_financial_min2(:,5);flipud(IRS_stock_ci_y_noendo_financial_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_y_noendo_financial_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_y_noendo_financial_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_financial_min2(:,1);flipud(IRS_stock_ci_p_noendo_financial_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_noendo_financial_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_financial_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_financial_min2(:,2);flipud(IRS_stock_ci_p_noendo_financial_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_p_noendo_financial_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_financial_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_financial_min2(:,3);flipud(IRS_stock_ci_p_noendo_financial_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_financial_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_financial_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_financial_min2(:,4);flipud(IRS_stock_ci_p_noendo_financial_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_financial_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_financial_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
fill([hh';flipud(hh')],[IRS_stock_ci_p_noendo_financial_min2(:,5);flipud(IRS_stock_ci_p_noendo_financial_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_p_noendo_financial_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_p_noendo_financial_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_financial_min2(:,1);flipud(IRS_stock_ci_f_noendo_financial_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_noendo_financial_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_financial_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_financial_min2(:,2);flipud(IRS_stock_ci_f_noendo_financial_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_f_noendo_financial_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_financial_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_financial_min2(:,3);flipud(IRS_stock_ci_f_noendo_financial_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_financial_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_financial_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_financial_min2(:,4);flipud(IRS_stock_ci_f_noendo_financial_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_financial_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_financial_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
fill([hh';flipud(hh')],[IRS_stock_ci_f_noendo_financial_min2(:,5);flipud(IRS_stock_ci_f_noendo_financial_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_f_noendo_financial_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_f_noendo_financial_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_financial_min2(:,1);flipud(IRS_stock_ci_mon_noendo_financial_max2(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,1),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_noendo_financial_min1(:,1),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_financial_max1(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_financial_min2(:,2);flipud(IRS_stock_ci_mon_noendo_financial_max2(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,2),'LineWidth',2.2);
line(hh',IRS_stock_ci_mon_noendo_financial_min1(:,2),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_financial_max1(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_financial_min2(:,3);flipud(IRS_stock_ci_mon_noendo_financial_max2(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,3),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_financial_min1(:,3),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_financial_max1(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_financial_min2(:,4);flipud(IRS_stock_ci_mon_noendo_financial_max2(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,4),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_financial_min1(:,4),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_financial_max1(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
fill([hh';flipud(hh')],[IRS_stock_ci_mon_noendo_financial_min2(:,5);flipud(IRS_stock_ci_mon_noendo_financial_max2(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,5),'LineWidth',2.2);  
line(hh',IRS_stock_ci_mon_noendo_financial_min1(:,5),'LineWidth',1.2); 
line(hh',IRS_stock_ci_mon_noendo_financial_max1(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP')                                                                           
set(gca,'FontSize',13)
grid on
sgtitle('No Endogenus FU: Max-C Solutions -Event&Corr') 
print('Aggregate_MaxC_noendo_financial_bootstrap_eventcorr','-depsc')  


