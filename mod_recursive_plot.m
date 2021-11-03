hh = 0:1:irhor-1;

%% Model 1
figure()
sgtitle('Cholesky: Y>RU>FU>MP')
subplot(4,4,1)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp1_min(:,1);flipud(VAR.bootirs_t_gdp1_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp1(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp1_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp1_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,2)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp1_min(:,2);flipud(VAR.bootirs_t_gdp1_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp1(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp1_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp1_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,3)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp1_min(:,3);flipud(VAR.bootirs_t_gdp1_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp1(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp1_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp1_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,4)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp1_min(:,4);flipud(VAR.bootirs_t_gdp1_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp1(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp1_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp1_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('GDP Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,5)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru1_min(:,1);flipud(VAR.bootirs_t_ru1_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru1(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru1_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru1_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,6)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru1_min(:,2);flipud(VAR.bootirs_t_ru1_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru1(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru1_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru1_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,7)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru1_min(:,3);flipud(VAR.bootirs_t_ru1_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru1(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru1_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru1_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,8)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru1_min(:,4);flipud(VAR.bootirs_t_ru1_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru1(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru1_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru1_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('RU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,9)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu1_min(:,1);flipud(VAR.bootirs_t_fu1_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu1(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu1_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu1_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,10)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu1_min(:,2);flipud(VAR.bootirs_t_fu1_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu1(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu1_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu1_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,11)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu1_min(:,3);flipud(VAR.bootirs_t_fu1_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu1(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu1_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu1_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,12)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu1_min(:,4);flipud(VAR.bootirs_t_fu1_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu1(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu1_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu1_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('FU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,13)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp1_min(:,1);flipud(VAR.bootirs_t_mp1_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp1(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp1_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp1_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('MP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,14)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp1_min(:,2);flipud(VAR.bootirs_t_mp1_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp1(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp1_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp1_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('MP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,15)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp1_min(:,3);flipud(VAR.bootirs_t_mp1_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp1(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp1_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp1_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('MP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,16)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp1_min(:,4);flipud(VAR.bootirs_t_mp1_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp1(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp1_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp1_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('MP Shock to MP')
set(gca,'FontSize',13) 
grid on

%% Model 2: Y>FU>RU>MP
figure()
sgtitle('Cholesky: Y>FU>RU>MP')
subplot(4,4,1)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp2_min(:,1);flipud(VAR.bootirs_t_gdp2_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp2(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp2_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp2_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,2)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp2_min(:,3);flipud(VAR.bootirs_t_gdp2_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp2(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp2_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp2_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,3)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp2_min(:,2);flipud(VAR.bootirs_t_gdp2_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp2(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp2_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp2_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,4)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp2_min(:,4);flipud(VAR.bootirs_t_gdp2_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp2(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp2_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp2_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('GDP Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,5)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru2_min(:,1);flipud(VAR.bootirs_t_ru2_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru2(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru2_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru2_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,6)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru2_min(:,3);flipud(VAR.bootirs_t_ru2_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru2(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru2_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru2_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,7)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru2_min(:,2);flipud(VAR.bootirs_t_ru2_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru2(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru2_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru2_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,8)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru2_min(:,4);flipud(VAR.bootirs_t_ru2_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru2(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru2_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru2_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('RU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,9)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu2_min(:,1);flipud(VAR.bootirs_t_fu2_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu2(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu2_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu2_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,10)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu2_min(:,3);flipud(VAR.bootirs_t_fu2_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu2(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu2_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu2_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,11)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu2_min(:,2);flipud(VAR.bootirs_t_fu2_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu2(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu2_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu2_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,12)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu2_min(:,4);flipud(VAR.bootirs_t_fu2_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu2(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu2_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu2_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('FU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,13)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp2_min(:,1);flipud(VAR.bootirs_t_mp2_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp2(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp2_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp2_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('MP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,14)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp2_min(:,3);flipud(VAR.bootirs_t_mp2_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp2(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp2_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp2_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('MP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,15)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp2_min(:,2);flipud(VAR.bootirs_t_mp2_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp2(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp2_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp2_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('MP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,16)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp2_min(:,4);flipud(VAR.bootirs_t_mp2_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp2(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp2_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp2_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('MP Shock to MP')
set(gca,'FontSize',13) 
grid on

%% Model 3: FU>RU>Y>MP
figure()
sgtitle('Cholesky: FU>RU>Y>MP')
subplot(4,4,1)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp3_min(:,3);flipud(VAR.bootirs_t_gdp3_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp3(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp3_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp3_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,2)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp3_min(:,2);flipud(VAR.bootirs_t_gdp3_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp3(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp3_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp3_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,3)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp3_min(:,1);flipud(VAR.bootirs_t_gdp3_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp3(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp3_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp3_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,4)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp3_min(:,4);flipud(VAR.bootirs_t_gdp3_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp3(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp3_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp3_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('GDP Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,5)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru3_min(:,3);flipud(VAR.bootirs_t_ru3_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru3(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru3_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru3_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,6)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru3_min(:,2);flipud(VAR.bootirs_t_ru3_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru3(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru3_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru3_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,7)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru3_min(:,1);flipud(VAR.bootirs_t_ru3_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru3(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru3_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru3_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,8)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru3_min(:,4);flipud(VAR.bootirs_t_ru3_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru3(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru3_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru3_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('RU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,9)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu3_min(:,3);flipud(VAR.bootirs_t_fu3_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu3(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu3_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu3_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,10)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu3_min(:,2);flipud(VAR.bootirs_t_fu3_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu3(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu3_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu3_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,11)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu3_min(:,1);flipud(VAR.bootirs_t_fu3_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu3(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu3_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu3_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,12)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu3_min(:,4);flipud(VAR.bootirs_t_fu3_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu3(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu3_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu3_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('FU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,13)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp3_min(:,3);flipud(VAR.bootirs_t_mp3_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp3(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp3_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp3_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('MP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,14)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp3_min(:,2);flipud(VAR.bootirs_t_mp3_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp3(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp3_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp3_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('MP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,15)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp3_min(:,1);flipud(VAR.bootirs_t_mp3_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp3(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp3_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp3_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('MP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,16)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp3_min(:,4);flipud(VAR.bootirs_t_mp3_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp3(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp3_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp3_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('MP Shock to MP')
set(gca,'FontSize',13) 
grid on

%% Model 4: RU>FU>Y>MP
figure()
sgtitle('Cholesky: RU>FU>Y>MP')
subplot(4,4,1)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp4_min(:,3);flipud(VAR.bootirs_t_gdp4_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp4(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp4_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp4_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,2)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp4_min(:,1);flipud(VAR.bootirs_t_gdp4_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp4(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp4_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp4_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,3)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp4_min(:,2);flipud(VAR.bootirs_t_gdp4_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp4(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp4_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp4_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,4)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp4_min(:,4);flipud(VAR.bootirs_t_gdp4_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp4(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp4_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp4_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('GDP Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,5)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru4_min(:,3);flipud(VAR.bootirs_t_ru4_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru4(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru4_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru4_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,6)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru4_min(:,1);flipud(VAR.bootirs_t_ru4_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru4(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru4_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru4_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,7)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru4_min(:,2);flipud(VAR.bootirs_t_ru4_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru4(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru4_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru4_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,8)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru4_min(:,4);flipud(VAR.bootirs_t_ru4_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru4(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru4_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru4_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('RU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,9)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu4_min(:,3);flipud(VAR.bootirs_t_fu4_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu4(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu4_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu4_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,10)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu4_min(:,1);flipud(VAR.bootirs_t_fu4_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu4(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu4_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu4_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,11)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu4_min(:,2);flipud(VAR.bootirs_t_fu4_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu4(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu4_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu4_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,12)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu4_min(:,4);flipud(VAR.bootirs_t_fu4_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu4(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu4_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu4_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('FU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,13)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp4_min(:,3);flipud(VAR.bootirs_t_mp4_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp4(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp4_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp4_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('MP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,14)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp4_min(:,1);flipud(VAR.bootirs_t_mp4_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp4(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp4_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp4_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('MP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,15)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp4_min(:,2);flipud(VAR.bootirs_t_mp4_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp4(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp4_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp4_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('MP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,16)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp4_min(:,4);flipud(VAR.bootirs_t_mp4_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp4(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp4_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp4_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('MP Shock to MP')
set(gca,'FontSize',13) 
grid on

%% Model 5: Y>MP>RU>FU
figure()
sgtitle('Cholesky: Y>MP>RU>FU')
subplot(4,4,1)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp5_min(:,1);flipud(VAR.bootirs_t_gdp5_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp5(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp5_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp5_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,2)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp5_min(:,3);flipud(VAR.bootirs_t_gdp5_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp5(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp5_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp5_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,3)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp5_min(:,4);flipud(VAR.bootirs_t_gdp5_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp5(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp5_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp5_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,4)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp5_min(:,2);flipud(VAR.bootirs_t_gdp5_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp5(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp5_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp5_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('GDP Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,5)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru5_min(:,1);flipud(VAR.bootirs_t_ru5_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru5(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru5_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru5_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,6)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru5_min(:,3);flipud(VAR.bootirs_t_ru5_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru5(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru5_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru5_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,7)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru5_min(:,4);flipud(VAR.bootirs_t_ru5_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru5(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru5_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru5_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,8)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru5_min(:,2);flipud(VAR.bootirs_t_ru5_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru5(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru5_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru5_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('RU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,9)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu5_min(:,1);flipud(VAR.bootirs_t_fu5_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu5(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu5_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu5_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,10)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu5_min(:,3);flipud(VAR.bootirs_t_fu5_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu5(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu5_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu5_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,11)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu5_min(:,4);flipud(VAR.bootirs_t_fu5_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu5(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu5_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu5_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,12)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu5_min(:,2);flipud(VAR.bootirs_t_fu5_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu5(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu5_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu5_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('FU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,13)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp5_min(:,1);flipud(VAR.bootirs_t_mp5_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp5(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp5_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp5_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('MP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,14)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp5_min(:,3);flipud(VAR.bootirs_t_mp5_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp5(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp5_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp5_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('MP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,15)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp5_min(:,4);flipud(VAR.bootirs_t_mp5_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp5(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp5_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp5_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('MP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,16)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp5_min(:,2);flipud(VAR.bootirs_t_mp5_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp5(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp5_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp5_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('MP Shock to MP')
set(gca,'FontSize',13) 
grid on

%% Model 6: Y>MP>FU>RU
figure()
sgtitle('Cholesky: Y>MP>FU>RU')
subplot(4,4,1)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp6_min(:,1);flipud(VAR.bootirs_t_gdp6_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp6(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp6_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp6_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('GDP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,2)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp6_min(:,4);flipud(VAR.bootirs_t_gdp6_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp6(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp6_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp6_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('GDP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,3)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp6_min(:,3);flipud(VAR.bootirs_t_gdp6_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp6(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp6_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp6_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('GDP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,4)
fill([hh';flipud(hh')],[VAR.bootirs_t_gdp6_min(:,2);flipud(VAR.bootirs_t_gdp6_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_gdp6(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_gdp6_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_gdp6_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('GDP Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,5)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru6_min(:,1);flipud(VAR.bootirs_t_ru6_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru6(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru6_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru6_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('RU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,6)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru6_min(:,4);flipud(VAR.bootirs_t_ru6_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru6(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru6_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru6_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('RU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,7)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru6_min(:,3);flipud(VAR.bootirs_t_ru6_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru6(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru6_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru6_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('RU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,8)
fill([hh';flipud(hh')],[VAR.bootirs_t_ru6_min(:,2);flipud(VAR.bootirs_t_ru6_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_ru6(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_ru6_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_ru6_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('RU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,9)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu6_min(:,1);flipud(VAR.bootirs_t_fu6_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu6(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu6_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu6_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('FU Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,10)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu6_min(:,4);flipud(VAR.bootirs_t_fu6_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu6(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu6_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu6_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('FU Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,11)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu6_min(:,3);flipud(VAR.bootirs_t_fu6_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu6(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu6_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu6_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('FU Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,12)
fill([hh';flipud(hh')],[VAR.bootirs_t_fu6_min(:,2);flipud(VAR.bootirs_t_fu6_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_fu6(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_fu6_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_fu6_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('FU Shock to MP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,13)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp6_min(:,1);flipud(VAR.bootirs_t_mp6_max(:,1))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp6(:,1),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp6_min(:,1),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp6_max(:,1),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('GDP')
title('MP Shock to GDP')
set(gca,'FontSize',13) 
grid on
subplot(4,4,14)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp6_min(:,4);flipud(VAR.bootirs_t_mp6_max(:,4))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp6(:,4),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp6_min(:,4),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp6_max(:,4),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('RU')
title('MP Shock to RU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,15)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp6_min(:,3);flipud(VAR.bootirs_t_mp6_max(:,3))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp6(:,3),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp6_min(:,3),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp6_max(:,3),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('FU')
title('MP Shock to FU')
set(gca,'FontSize',13) 
grid on
subplot(4,4,16)
fill([hh';flipud(hh')],[VAR.bootirs_t_mp6_min(:,2);flipud(VAR.bootirs_t_mp6_max(:,2))],[.8, .8, .8],'LineStyle','none');    
line(hh',VAR.irs_t_mp6(:,2),'LineWidth',2.2);
line(hh',VAR.bootirs_t_mp6_min(:,2),'LineWidth',1.2); 
line(hh',VAR.bootirs_t_mp6_max(:,2),'LineWidth',1.2); 
xlabel('Month')                                                                                    
ylabel('MP')
title('MP Shock to MP')
set(gca,'FontSize',13) 
grid on

