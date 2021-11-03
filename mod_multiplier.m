%% Monetary mulitiplier
diff_mon_real=abs(bench_mon)-abs(noendo_real_mon);
diff_mon=abs(bench_mon)-abs(noendo_mon);
diff_mon_financial=abs(bench_mon)-abs(noendo_financial_mon);

[f_mon,xi]=ksdensity(diff_mon);
[f_mon_real,xi_real]=ksdensity(diff_mon_real);
[f_mon_financial,xi_financial]=ksdensity(diff_mon_financial);

[f_mon_cdf,xi_cdf]=ksdensity(diff_mon,xi,'Function','cdf');
[f_mon_real_cdf,xi_real_cdf]=ksdensity(diff_mon_real,xi_real,'Function','cdf');
[f_mon_financial_cdf,xi_financial_cdf]=ksdensity(diff_mon_financial,xi_financial,'Function','cdf');

prob0_mon=1-interp1q(xi_cdf',f_mon_cdf',0);
prob0_mon_real=1-interp1q(xi_real_cdf',f_mon_real_cdf',0);
prob0_mon_financial=1-interp1q(xi_financial_cdf',f_mon_financial_cdf',0);

figure()
plot(xi,f_mon,xi_real,f_mon_real,'--',xi_financial,f_mon_financial,'-d','LineWidth',2)
legend('All Exogenous','Endo FU, Exog RU','Endo RU Exog FU')
title('Kernal density estimate: |Endo| - |Exog| Monetary Multiplier')
grid on
xline(0,'--',{'Zero'},'LineWidth',1.8)
set(gca,'FontSize',12)

%% For table
fprintf('\n');
fprintf('68 percent benchmark multiplier=%f, 68 percent benchmark multiplier=%f \n',bench_mon_multi_min1,bench_mon_multi_max1);
fprintf('Max C benchmark multiplier=%f \n',bench_mon_maxC);
fprintf('\n');
fprintf('68 percent no-endogenous multiplier=%f, 68 percent no-endogenous multiplier=%f \n',noendo_mon_multi_min1,noendo_mon_multi_max1);
fprintf('Max C no-endogenous multiplier=%f \n',noendo_mon_maxC);
fprintf('\n');
fprintf('68 percent no-financial multiplier=%f, 68 percent no-financial multiplier=%f \n',noendo_financial_mon_multi_min1,noendo_financial_mon_multi_max1);
fprintf('Max C no-endogenous financial multiplier=%f \n',noendo_financial_mon_maxC);
fprintf('\n');
fprintf('68 percent no-real multiplier=%f, 68 percent no-real multiplier=%f \n',noendo_real_mon_multi_min1,noendo_real_mon_multi_max1);
fprintf('Max C no-endogenous real multiplier=%f \n',noendo_real_mon_maxC);
fprintf('\n');
fprintf('\n');
fprintf('\n');


fprintf('68 percent endo-exo=%f, endo-exo=%f \n',diff_mon_min1,diff_mon_max1);
fprintf('Max C difference of endo-exo=%f \n',diff_mon_maxC);
fprintf('\n');

fprintf('68 percent endo-exo financial=%f, endo-exo financial=%f \n',diff_mon_financial_min1,diff_mon_financial_max1);
fprintf('Max C difference of endo-exo financial=%f \n',diff_mon_financial_maxC);
fprintf('\n');

fprintf('68 percent endo-exo real=%f, endo-exo real=%f \n',diff_mon_real_min1,diff_mon_real_max1);
fprintf('Max C difference of endo-exo real=%f \n',diff_mon_real_maxC);
fprintf('\n');

fprintf('\n');
fprintf('Prob(diff>0) for all exogenous: %f \n',prob0_mon);
fprintf('Prob(diff>0) for endogenous real exogenous financial: %f \n',prob0_mon_financial);
fprintf('Prob(diff>0) for endogenous financial exogenous real: %f \n',prob0_mon_real);
