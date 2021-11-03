%% Aggregate: Max-C Responses

mod_confidence;         % Bootstrapping followed by LMN

figure()
subplot(5,5,1)
%fill([hh';flipud(hh')],[IRS_min2_m(:,1);flipud(IRS_max2_m(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,1),'LineWidth',2.2);
line(hh',IRS_min1_m(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_m(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
%fill([hh';flipud(hh')],[IRS_min2_m(:,2);flipud(IRS_max2_m(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,2),'LineWidth',2.2);
line(hh',IRS_min1_m(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_m(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
%fill([hh';flipud(hh')],[IRS_min2_m(:,3);flipud(IRS_max2_m(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,3),'LineWidth',2.2);
line(hh',IRS_min1_m(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_m(:,3),'LineWidth',1.2);   
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
%fill([hh';flipud(hh')],[IRS_min2_m(:,4);flipud(IRS_max2_m(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_m(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_m(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
%fill([hh';flipud(hh')],[IRS_min2_m(:,5);flipud(IRS_max2_m(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_m(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_m(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
%fill([hh';flipud(hh')],[IRS_min2_y(:,1);flipud(IRS_max2_y(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,1),'LineWidth',2.2);
line(hh',IRS_min1_y(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_y(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
%fill([hh';flipud(hh')],[IRS_min2_y(:,2);flipud(IRS_max2_y(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,2),'LineWidth',2.2);
line(hh',IRS_min1_y(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_y(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
%fill([hh';flipud(hh')],[IRS_min2_y(:,3);flipud(IRS_max2_y(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_y(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_y(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
%fill([hh';flipud(hh')],[IRS_min2_y(:,4);flipud(IRS_max2_y(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_y(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_y(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
%fill([hh';flipud(hh')],[IRS_min2_y(:,5);flipud(IRS_max2_y(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_y(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_y(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
%fill([hh';flipud(hh')],[IRS_min2_p(:,1);flipud(IRS_max2_p(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,1),'LineWidth',2.2);
line(hh',IRS_min1_p(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_p(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
%fill([hh';flipud(hh')],[IRS_min2_p(:,2);flipud(IRS_max2_p(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,2),'LineWidth',2.2);
line(hh',IRS_min1_p(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_p(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
%fill([hh';flipud(hh')],[IRS_min2_p(:,3);flipud(IRS_max2_p(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_p(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_p(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
%fill([hh';flipud(hh')],[IRS_min2_p(:,4);flipud(IRS_max2_p(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_p(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_p(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
%fill([hh';flipud(hh')],[IRS_min2_p(:,5);flipud(IRS_max2_p(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_p(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_p(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
%fill([hh';flipud(hh')],[IRS_min2_f(:,1);flipud(IRS_max2_f(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,1),'LineWidth',2.2);
line(hh',IRS_min1_f(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_f(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
%fill([hh';flipud(hh')],[IRS_min2_f(:,2);flipud(IRS_max2_f(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,2),'LineWidth',2.2);
line(hh',IRS_min1_f(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_f(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
%fill([hh';flipud(hh')],[IRS_min2_f(:,3);flipud(IRS_max2_f(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_f(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_f(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
%fill([hh';flipud(hh')],[IRS_min2_f(:,4);flipud(IRS_max2_f(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_f(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_f(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
%fill([hh';flipud(hh')],[IRS_min2_f(:,5);flipud(IRS_max2_f(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_f(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_f(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
%fill([hh';flipud(hh')],[IRS_min2_mon(:,1);flipud(IRS_max2_mon(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,1),'LineWidth',2.2);
line(hh',IRS_min1_mon(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_mon(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
%fill([hh';flipud(hh')],[IRS_min2_mon(:,2);flipud(IRS_max2_mon(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,2),'LineWidth',2.2);
line(hh',IRS_min1_mon(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_mon(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
%fill([hh';flipud(hh')],[IRS_min2_mon(:,3);flipud(IRS_max2_mon(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_mon(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_mon(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
%fill([hh';flipud(hh')],[IRS_min2_mon(:,4);flipud(IRS_max2_mon(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_mon(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_mon(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
%fill([hh';flipud(hh')],[IRS_min2_mon(:,5);flipud(IRS_max2_mon(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_mon(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_mon(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP')                                                                           
set(gca,'FontSize',13)
grid on
sgtitle('Benchmark Model: Max-C Solutions') 
print('Aggregate_MaxC','-depsc')  

%% Aggregate: No endogenous responses from financial uncertainty
figure()
subplot(5,5,1)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_financial(:,1);flipud(IRS_max2_m_noendo_financial(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_financial(:,1),'LineWidth',2.2);
line(hh',IRS_min1_m_noendo_financial(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_financial(:,1),'LineWidth',1.2);       
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_financial(:,2);flipud(IRS_max2_m_noendo_financial(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_financial(:,2),'LineWidth',2.2);
line(hh',IRS_min1_m_noendo_financial(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_financial(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_financial(:,3);flipud(IRS_max2_m_noendo_financial(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_financial(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo_financial(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_financial(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_financial(:,4);flipud(IRS_max2_m_noendo_financial(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_financial(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo_financial(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_financial(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_financial(:,5);flipud(IRS_max2_m_noendo_financial(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_financial(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo_financial(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_financial(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_financial(:,1);flipud(IRS_max2_y_noendo_financial(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_financial(:,1),'LineWidth',2.2);
line(hh',IRS_min1_y_noendo_financial(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_financial(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_financial(:,2);flipud(IRS_max2_y_noendo_financial(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_financial(:,2),'LineWidth',2.2);
line(hh',IRS_min1_y_noendo_financial(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_financial(:,2),'LineWidth',1.2);  
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_financial(:,3);flipud(IRS_max2_y_noendo_financial(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_financial(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo_financial(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_financial(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_financial(:,4);flipud(IRS_max2_y_noendo_financial(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_financial(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo_financial(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_financial(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_financial(:,5);flipud(IRS_max2_y_noendo_financial(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_financial(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo_financial(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_financial(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_financial(:,1);flipud(IRS_max2_p_noendo_financial(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_financial(:,1),'LineWidth',2.2);
line(hh',IRS_min1_p_noendo_financial(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_financial(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_financial(:,2);flipud(IRS_max2_p_noendo_financial(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_financial(:,2),'LineWidth',2.2);
line(hh',IRS_min1_p_noendo_financial(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_financial(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_financial(:,3);flipud(IRS_max2_p_noendo_financial(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_financial(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo_financial(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_financial(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_financial(:,4);flipud(IRS_max2_p_noendo_financial(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_financial(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo_financial(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_financial(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_financial(:,5);flipud(IRS_max2_p_noendo_financial(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_financial(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo_financial(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_financial(:,5),'LineWidth',1.2);
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_financial(:,1);flipud(IRS_max2_f_noendo_financial(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_financial(:,1),'LineWidth',2.2);
line(hh',IRS_min1_f_noendo_financial(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_financial(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_financial(:,2);flipud(IRS_max2_f_noendo_financial(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_financial(:,2),'LineWidth',2.2);
line(hh',IRS_min1_f_noendo_financial(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_financial(:,2),'LineWidth',1.2); 
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')     
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_financial(:,3);flipud(IRS_max2_f_noendo_financial(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_financial(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo_financial(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_financial(:,3),'LineWidth',1.2);
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_financial(:,4);flipud(IRS_max2_f_noendo_financial(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_financial(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo_financial(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_financial(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_financial(:,5);flipud(IRS_max2_f_noendo_financial(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_financial(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo_financial(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_financial(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP') 
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_financial(:,1);flipud(IRS_max2_mon_noendo_financial(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_financial(:,1),'LineWidth',2.2);
line(hh',IRS_min1_mon_noendo_financial(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_financial(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_financial(:,2);flipud(IRS_max2_mon_noendo_financial(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_financial(:,2),'LineWidth',2.2);
line(hh',IRS_min1_mon_noendo_financial(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_financial(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_financial(:,3);flipud(IRS_max2_mon_noendo_financial(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_financial(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo_financial(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_financial(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('MP Shock to Inflation')                                                                                   
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_financial(:,4);flipud(IRS_max2_mon_noendo_financial(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_financial(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo_financial(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_financial(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU')  
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_financial(:,5);flipud(IRS_max2_mon_noendo_financial(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_financial(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo_financial(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_financial(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP') 
set(gca,'FontSize',13)
grid on
sgtitle('No Endogenous Financial Uncertainty') 
print('Aggregate_maxC_noendo_financial','-depsc')  

%% Aggregate: No endogenous responses from real uncertainty
figure()
subplot(5,5,1)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_real(:,1);flipud(IRS_max2_m_noendo_real(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_real(:,1),'LineWidth',2.2);
line(hh',IRS_min1_m_noendo_real(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_real(:,1),'LineWidth',1.2);       
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_real(:,2);flipud(IRS_max2_m_noendo_real(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_real(:,2),'LineWidth',2.2);
line(hh',IRS_min1_m_noendo_real(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_real(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_real(:,3);flipud(IRS_max2_m_noendo_real(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_real(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo_real(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_real(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_real(:,4);flipud(IRS_max2_m_noendo_real(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_real(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo_real(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_real(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo_real(:,5);flipud(IRS_max2_m_noendo_real(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo_real(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo_real(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo_real(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_real(:,1);flipud(IRS_max2_y_noendo_real(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_real(:,1),'LineWidth',2.2);
line(hh',IRS_min1_y_noendo_real(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_real(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_real(:,2);flipud(IRS_max2_y_noendo_real(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_real(:,2),'LineWidth',2.2);
line(hh',IRS_min1_y_noendo_real(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_real(:,2),'LineWidth',1.2);  
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_real(:,3);flipud(IRS_max2_y_noendo_real(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_real(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo_real(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_real(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_real(:,4);flipud(IRS_max2_y_noendo_real(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_real(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo_real(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_real(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo_real(:,5);flipud(IRS_max2_y_noendo_real(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo_real(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo_real(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo_real(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_real(:,1);flipud(IRS_max2_p_noendo_real(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_real(:,1),'LineWidth',2.2);
line(hh',IRS_min1_p_noendo_real(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_real(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_real(:,2);flipud(IRS_max2_p_noendo_real(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_real(:,2),'LineWidth',2.2);
line(hh',IRS_min1_p_noendo_real(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_real(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_real(:,3);flipud(IRS_max2_p_noendo_real(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_real(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo_real(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_real(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_real(:,4);flipud(IRS_max2_p_noendo_real(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_real(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo_real(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_real(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo_real(:,5);flipud(IRS_max2_p_noendo_real(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo_real(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo_real(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo_real(:,5),'LineWidth',1.2);
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_real(:,1);flipud(IRS_max2_f_noendo_real(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_real(:,1),'LineWidth',2.2);
line(hh',IRS_min1_f_noendo_real(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_real(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_real(:,2);flipud(IRS_max2_f_noendo_real(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_real(:,2),'LineWidth',2.2);
line(hh',IRS_min1_f_noendo_real(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_real(:,2),'LineWidth',1.2); 
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')     
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_real(:,3);flipud(IRS_max2_f_noendo_real(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_real(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo_real(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_real(:,3),'LineWidth',1.2);
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_real(:,4);flipud(IRS_max2_f_noendo_real(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_real(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo_real(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_real(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo_real(:,5);flipud(IRS_max2_f_noendo_real(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo_real(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo_real(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo_real(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP') 
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_real(:,1);flipud(IRS_max2_mon_noendo_real(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_real(:,1),'LineWidth',2.2);
line(hh',IRS_min1_mon_noendo_real(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_real(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_real(:,2);flipud(IRS_max2_mon_noendo_real(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_real(:,2),'LineWidth',2.2);
line(hh',IRS_min1_mon_noendo_real(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_real(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_real(:,3);flipud(IRS_max2_mon_noendo_real(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_real(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo_real(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_real(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('MP Shock to Inflation')                                                                                   
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_real(:,4);flipud(IRS_max2_mon_noendo_real(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_real(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo_real(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_real(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU')  
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo_real(:,5);flipud(IRS_max2_mon_noendo_real(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo_real(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo_real(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo_real(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP') 
set(gca,'FontSize',13)
grid on
sgtitle('No Endogenous Real Uncertainty') 
print('Aggregate_maxC_noendo_real','-depsc')  

%% Aggregate: No endogenous responses from real and financial uncertainty
figure()
subplot(5,5,1)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo(:,1);flipud(IRS_max2_m_noendo(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo(:,1),'LineWidth',2.2);
line(hh',IRS_min1_m_noendo(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo(:,1),'LineWidth',1.2);       
xlabel('Months')
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,2)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo(:,2);flipud(IRS_max2_m_noendo(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo(:,2),'LineWidth',2.2);
line(hh',IRS_min1_m_noendo(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,3)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo(:,3);flipud(IRS_max2_m_noendo(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('RU Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,4)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo(:,4);flipud(IRS_max2_m_noendo(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,5)
%fill([hh';flipud(hh')],[IRS_min2_m_noendo(:,5);flipud(IRS_max2_m_noendo(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_m_max_noendo(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_m_noendo(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_m_noendo(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('RU Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,6)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo(:,1);flipud(IRS_max2_y_noendo(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo(:,1),'LineWidth',2.2);
line(hh',IRS_min1_y_noendo(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,7)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo(:,2);flipud(IRS_max2_y_noendo(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo(:,2),'LineWidth',2.2);
line(hh',IRS_min1_y_noendo(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo(:,2),'LineWidth',1.2);  
xlabel('Months')
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,8)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo(:,3);flipud(IRS_max2_y_noendo(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('GDP Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,9)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo(:,4);flipud(IRS_max2_y_noendo(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,10)
%fill([hh';flipud(hh')],[IRS_min2_y_noendo(:,5);flipud(IRS_max2_y_noendo(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_y_max_noendo(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_y_noendo(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_y_noendo(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('GDP Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,11)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo(:,1);flipud(IRS_max2_p_noendo(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo(:,1),'LineWidth',2.2);
line(hh',IRS_min1_p_noendo(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('Inflation Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,12)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo(:,2);flipud(IRS_max2_p_noendo(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo(:,2),'LineWidth',2.2);
line(hh',IRS_min1_p_noendo(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('Inflation Shock to GDP')
set(gca,'FontSize',13)
grid on
subplot(5,5,13)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo(:,3);flipud(IRS_max2_p_noendo(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('Inflation Shock to Inflation')
set(gca,'FontSize',13)
grid on
subplot(5,5,14)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo(:,4);flipud(IRS_max2_p_noendo(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('Inflation Shock to FU')
set(gca,'FontSize',13)
grid on
subplot(5,5,15)
%fill([hh';flipud(hh')],[IRS_min2_p_noendo(:,5);flipud(IRS_max2_p_noendo(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_p_max_noendo(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_p_noendo(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_p_noendo(:,5),'LineWidth',1.2);
xlabel('Months')
ylabel('FFR')
title('Inflation Shock to MP')
set(gca,'FontSize',13)
grid on

subplot(5,5,16)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo(:,1);flipud(IRS_max2_f_noendo(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo(:,1),'LineWidth',2.2);
line(hh',IRS_min1_f_noendo(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(5,5,17)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo(:,2);flipud(IRS_max2_f_noendo(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo(:,2),'LineWidth',2.2);
line(hh',IRS_min1_f_noendo(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo(:,2),'LineWidth',1.2); 
xlabel('Months')
ylabel('GDP')
title('FU Shock to GDP')     
set(gca,'FontSize',13)
grid on
subplot(5,5,18)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo(:,3);flipud(IRS_max2_f_noendo(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo(:,3),'LineWidth',1.2);
xlabel('Months')
ylabel('Inflation')
title('FU Shock to Inflation') 
set(gca,'FontSize',13)
grid on
subplot(5,5,19)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo(:,4);flipud(IRS_max2_f_noendo(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('FU Shock to FU') 
set(gca,'FontSize',13)
grid on
subplot(5,5,20)
%fill([hh';flipud(hh')],[IRS_min2_f_noendo(:,5);flipud(IRS_max2_f_noendo(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_f_max_noendo(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_f_noendo(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_f_noendo(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('FU Shock to MP') 
set(gca,'FontSize',13)
grid on

subplot(5,5,21)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo(:,1);flipud(IRS_max2_mon_noendo(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo(:,1),'LineWidth',2.2);
line(hh',IRS_min1_mon_noendo(:,1),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo(:,1),'LineWidth',1.2); 
xlabel('Months')
ylabel('RU')
title('MP Shock to RU') 
set(gca,'FontSize',13) 
grid on
subplot(5,5,22)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo(:,2);flipud(IRS_max2_mon_noendo(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo(:,2),'LineWidth',2.2);
line(hh',IRS_min1_mon_noendo(:,2),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo(:,2),'LineWidth',1.2);   
xlabel('Months')
ylabel('GDP')
title('MP Shock to GDP') 
set(gca,'FontSize',13)
grid on
subplot(5,5,23)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo(:,3);flipud(IRS_max2_mon_noendo(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo(:,3),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo(:,3),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo(:,3),'LineWidth',1.2); 
xlabel('Months')
ylabel('Inflation')
title('MP Shock to Inflation')                                                                                   
set(gca,'FontSize',13)
grid on
subplot(5,5,24)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo(:,4);flipud(IRS_max2_mon_noendo(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo(:,4),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo(:,4),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo(:,4),'LineWidth',1.2); 
xlabel('Months')
ylabel('FU')
title('MP Shock to FU')  
set(gca,'FontSize',13)
grid on
subplot(5,5,25)
%fill([hh';flipud(hh')],[IRS_min2_mon_noendo(:,5);flipud(IRS_max2_mon_noendo(:,5))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mon_max_noendo(:,5),'LineWidth',2.2);  
line(hh',IRS_min1_mon_noendo(:,5),'LineWidth',1.2); 
line(hh',IRS_max1_mon_noendo(:,5),'LineWidth',1.2); 
xlabel('Months')
ylabel('FFR')
title('MP Shock to MP') 
set(gca,'FontSize',13)
grid on
sgtitle('No Endogenous Real & Financial Uncertainty') 
print('Aggregate_maxC_noendo','-depsc')  

