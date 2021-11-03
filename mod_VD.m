%% Forecasting Error Variance Decomposition

clear; clc;
load 'result';

%% 1-month ahead
Var_RU1=B_max(1,:)*B_max(1,:)';
Var_GDP1=B_max(2,:)*B_max(2,:)';
Var_inf1=B_max(3,:)*B_max(3,:)';
Var_FU1=B_max(4,:)*B_max(4,:)';
Var_MP1=B_max(5,:)*B_max(5,:)';


RU_VD1=(B_max(1,:).^2)'./Var_RU1;
GDP_VD1=(B_max(2,:).^2)'./Var_GDP1;
FU_VD1=(B_max(4,:).^2)'./Var_FU1;
MP_VD1=(B_max(5,:).^2)'./Var_MP1;
inf_VD1=(B_max(3,:).^2)'./Var_inf1;

% Identical method:
tmp_var_ru1=VAR.irs_t_m_max(1,1)^2 + VAR.irs_t_y_max(1,1)^2 + VAR.irs_t_f_max(1,1)^2 + VAR.irs_t_mon_max(1,1)^2 + VAR.irs_t_p_max(1,1)^2;
tmp_var_gdp1=VAR.irs_t_m_max(1,2)^2 + VAR.irs_t_y_max(1,2)^2 + VAR.irs_t_f_max(1,2)^2 + VAR.irs_t_mon_max(1,2)^2 + VAR.irs_t_p_max(1,2)^2;
tmp_var_fu1=VAR.irs_t_m_max(1,4)^2 + VAR.irs_t_y_max(1,4)^2 + VAR.irs_t_f_max(1,4)^2 + VAR.irs_t_mon_max(1,4)^2 + VAR.irs_t_p_max(1,4)^2;
tmp_var_mp1=VAR.irs_t_m_max(1,5)^2 + VAR.irs_t_y_max(1,5)^2 + VAR.irs_t_f_max(1,5)^2 + VAR.irs_t_mon_max(1,5)^2 + VAR.irs_t_p_max(1,5)^2;
tmp_var_inf1=VAR.irs_t_m_max(1,3)^2 + VAR.irs_t_y_max(1,3)^2 + VAR.irs_t_f_max(1,3)^2 + VAR.irs_t_mon_max(1,3)^2 + VAR.irs_t_p_max(1,3)^2;

tmp_ru_vd1=[VAR.irs_t_m_max(1,1)^2 ; VAR.irs_t_y_max(1,1)^2 ; VAR.irs_t_f_max(1,1)^2 ; VAR.irs_t_mon_max(1,1)^2 ; VAR.irs_t_p_max(1,1)^2]./tmp_var_ru1;
tmp_gdp_vd1=[VAR.irs_t_m_max(1,2)^2 ; VAR.irs_t_y_max(1,2)^2 ; VAR.irs_t_f_max(1,2)^2 ; VAR.irs_t_mon_max(1,2)^2 ; VAR.irs_t_p_max(1,2)^2]./tmp_var_gdp1;
tmp_var_fu1=[VAR.irs_t_m_max(1,4)^2 ; VAR.irs_t_y_max(1,4)^2 ; VAR.irs_t_f_max(1,4)^2 ; VAR.irs_t_mon_max(1,4)^2 ; VAR.irs_t_p_max(1,4)^2]./tmp_var_fu1;
tmp_var_mp1=[VAR.irs_t_m_max(1,5)^2 ; VAR.irs_t_y_max(1,5)^2 ; VAR.irs_t_f_max(1,5)^2 ; VAR.irs_t_mon_max(1,5)^2 ; VAR.irs_t_p_max(1,5)^2]./tmp_var_mp1;
tmp_var_inf1=[VAR.irs_t_m_max(1,3)^2 ; VAR.irs_t_y_max(1,3)^2 ; VAR.irs_t_f_max(1,3)^2 ; VAR.irs_t_mon_max(1,3)^2 ; VAR.irs_t_p_max(1,3)^2]./tmp_var_inf1;

%% 6 month ahead
Var_RU6=VAR.irs_t_m_max(1:6,1)'*VAR.irs_t_m_max(1:6,1) + VAR.irs_t_y_max(1:6,1)'*VAR.irs_t_y_max(1:6,1) + VAR.irs_t_f_max(1:6,1)'*VAR.irs_t_f_max(1:6,1) + VAR.irs_t_mon_max(1:6,1)'*VAR.irs_t_mon_max(1:6,1) + VAR.irs_t_p_max(1:6,1)'*VAR.irs_t_p_max(1:6,1);
Var_GDP6=VAR.irs_t_m_max(1:6,2)'*VAR.irs_t_m_max(1:6,2) + VAR.irs_t_y_max(1:6,2)'*VAR.irs_t_y_max(1:6,2) + VAR.irs_t_f_max(1:6,2)'*VAR.irs_t_f_max(1:6,2) + VAR.irs_t_mon_max(1:6,2)'*VAR.irs_t_mon_max(1:6,2) + VAR.irs_t_p_max(1:6,2)'*VAR.irs_t_p_max(1:6,2);
Var_FU6=VAR.irs_t_m_max(1:6,4)'*VAR.irs_t_m_max(1:6,4) + VAR.irs_t_y_max(1:6,4)'*VAR.irs_t_y_max(1:6,4) + VAR.irs_t_f_max(1:6,4)'*VAR.irs_t_f_max(1:6,4) + VAR.irs_t_mon_max(1:6,4)'*VAR.irs_t_mon_max(1:6,4) + VAR.irs_t_p_max(1:6,4)'*VAR.irs_t_p_max(1:6,4);
Var_MP6=VAR.irs_t_m_max(1:6,5)'*VAR.irs_t_m_max(1:6,5) + VAR.irs_t_y_max(1:6,5)'*VAR.irs_t_y_max(1:6,5) + VAR.irs_t_f_max(1:6,5)'*VAR.irs_t_f_max(1:6,5) + VAR.irs_t_mon_max(1:6,5)'*VAR.irs_t_mon_max(1:6,5) + VAR.irs_t_p_max(1:6,5)'*VAR.irs_t_p_max(1:6,5);
Var_inf6=VAR.irs_t_m_max(1:6,3)'*VAR.irs_t_m_max(1:6,3) + VAR.irs_t_y_max(1:6,3)'*VAR.irs_t_y_max(1:6,3) + VAR.irs_t_f_max(1:6,3)'*VAR.irs_t_f_max(1:6,3) + VAR.irs_t_mon_max(1:6,3)'*VAR.irs_t_mon_max(1:6,3) + VAR.irs_t_p_max(1:6,3)'*VAR.irs_t_p_max(1:6,3);

RU_VD6=[VAR.irs_t_m_max(1:6,1)'*VAR.irs_t_m_max(1:6,1);  VAR.irs_t_y_max(1:6,1)'*VAR.irs_t_y_max(1:6,1); VAR.irs_t_f_max(1:6,1)'*VAR.irs_t_f_max(1:6,1); VAR.irs_t_mon_max(1:6,1)'*VAR.irs_t_mon_max(1:6,1); VAR.irs_t_p_max(1:6,1)'*VAR.irs_t_p_max(1:6,1)]./Var_RU6;
GDP_VD6=[VAR.irs_t_m_max(1:6,2)'*VAR.irs_t_m_max(1:6,2);  VAR.irs_t_y_max(1:6,2)'*VAR.irs_t_y_max(1:6,2); VAR.irs_t_f_max(1:6,2)'*VAR.irs_t_f_max(1:6,2); VAR.irs_t_mon_max(1:6,2)'*VAR.irs_t_mon_max(1:6,2); VAR.irs_t_p_max(1:6,2)'*VAR.irs_t_p_max(1:6,2)]./Var_GDP6;
FU_VD6=[VAR.irs_t_m_max(1:6,4)'*VAR.irs_t_m_max(1:6,4);  VAR.irs_t_y_max(1:6,4)'*VAR.irs_t_y_max(1:6,4); VAR.irs_t_f_max(1:6,4)'*VAR.irs_t_f_max(1:6,4); VAR.irs_t_mon_max(1:6,4)'*VAR.irs_t_mon_max(1:6,4); VAR.irs_t_p_max(1:6,4)'*VAR.irs_t_p_max(1:6,4)]./Var_FU6;
MP_VD6=[VAR.irs_t_m_max(1:6,5)'*VAR.irs_t_m_max(1:6,5);  VAR.irs_t_y_max(1:6,5)'*VAR.irs_t_y_max(1:6,5); VAR.irs_t_f_max(1:6,5)'*VAR.irs_t_f_max(1:6,5); VAR.irs_t_mon_max(1:6,5)'*VAR.irs_t_mon_max(1:6,5); VAR.irs_t_p_max(1:6,5)'*VAR.irs_t_p_max(1:6,5)]./Var_MP6;
inf_VD6=[VAR.irs_t_m_max(1:6,3)'*VAR.irs_t_m_max(1:6,3);  VAR.irs_t_y_max(1:6,3)'*VAR.irs_t_y_max(1:6,3); VAR.irs_t_f_max(1:6,3)'*VAR.irs_t_f_max(1:6,3); VAR.irs_t_mon_max(1:6,3)'*VAR.irs_t_mon_max(1:6,3); VAR.irs_t_p_max(1:6,3)'*VAR.irs_t_p_max(1:6,3)]./Var_inf6;

%% 12-month ahead
Var_RU12=VAR.irs_t_m_max(1:12,1)'*VAR.irs_t_m_max(1:12,1) + VAR.irs_t_y_max(1:12,1)'*VAR.irs_t_y_max(1:12,1) + VAR.irs_t_f_max(1:12,1)'*VAR.irs_t_f_max(1:12,1) + VAR.irs_t_mon_max(1:12,1)'*VAR.irs_t_mon_max(1:12,1) + VAR.irs_t_p_max(1:12,1)'*VAR.irs_t_p_max(1:12,1);
Var_GDP12=VAR.irs_t_m_max(1:12,2)'*VAR.irs_t_m_max(1:12,2) + VAR.irs_t_y_max(1:12,2)'*VAR.irs_t_y_max(1:12,2) + VAR.irs_t_f_max(1:12,2)'*VAR.irs_t_f_max(1:12,2) + VAR.irs_t_mon_max(1:12,2)'*VAR.irs_t_mon_max(1:12,2) + VAR.irs_t_p_max(1:12,2)'*VAR.irs_t_p_max(1:12,2);
Var_FU12=VAR.irs_t_m_max(1:12,4)'*VAR.irs_t_m_max(1:12,4) + VAR.irs_t_y_max(1:12,4)'*VAR.irs_t_y_max(1:12,4) + VAR.irs_t_f_max(1:12,4)'*VAR.irs_t_f_max(1:12,4) + VAR.irs_t_mon_max(1:12,4)'*VAR.irs_t_mon_max(1:12,4) + VAR.irs_t_p_max(1:12,4)'*VAR.irs_t_p_max(1:12,4);
Var_MP12=VAR.irs_t_m_max(1:12,5)'*VAR.irs_t_m_max(1:12,5) + VAR.irs_t_y_max(1:12,5)'*VAR.irs_t_y_max(1:12,5) + VAR.irs_t_f_max(1:12,5)'*VAR.irs_t_f_max(1:12,5) + VAR.irs_t_mon_max(1:12,5)'*VAR.irs_t_mon_max(1:12,5) + VAR.irs_t_p_max(1:12,5)'*VAR.irs_t_p_max(1:12,5);
Var_inf12=VAR.irs_t_m_max(1:12,3)'*VAR.irs_t_m_max(1:12,3) + VAR.irs_t_y_max(1:12,3)'*VAR.irs_t_y_max(1:12,3) + VAR.irs_t_f_max(1:12,3)'*VAR.irs_t_f_max(1:12,3) + VAR.irs_t_mon_max(1:12,3)'*VAR.irs_t_mon_max(1:12,3) + VAR.irs_t_p_max(1:12,3)'*VAR.irs_t_p_max(1:12,3);

RU_VD12=[VAR.irs_t_m_max(1:12,1)'*VAR.irs_t_m_max(1:12,1);  VAR.irs_t_y_max(1:12,1)'*VAR.irs_t_y_max(1:12,1); VAR.irs_t_f_max(1:12,1)'*VAR.irs_t_f_max(1:12,1); VAR.irs_t_mon_max(1:12,1)'*VAR.irs_t_mon_max(1:12,1); VAR.irs_t_p_max(1:12,1)'*VAR.irs_t_p_max(1:12,1)]./Var_RU12;
GDP_VD12=[VAR.irs_t_m_max(1:12,2)'*VAR.irs_t_m_max(1:12,2);  VAR.irs_t_y_max(1:12,2)'*VAR.irs_t_y_max(1:12,2); VAR.irs_t_f_max(1:12,2)'*VAR.irs_t_f_max(1:12,2); VAR.irs_t_mon_max(1:12,2)'*VAR.irs_t_mon_max(1:12,2); VAR.irs_t_p_max(1:12,2)'*VAR.irs_t_p_max(1:12,2)]./Var_GDP12;
FU_VD12=[VAR.irs_t_m_max(1:12,4)'*VAR.irs_t_m_max(1:12,4);  VAR.irs_t_y_max(1:12,4)'*VAR.irs_t_y_max(1:12,4); VAR.irs_t_f_max(1:12,4)'*VAR.irs_t_f_max(1:12,4); VAR.irs_t_mon_max(1:12,4)'*VAR.irs_t_mon_max(1:12,4); VAR.irs_t_p_max(1:12,4)'*VAR.irs_t_p_max(1:12,4)]./Var_FU12;
MP_VD12=[VAR.irs_t_m_max(1:12,5)'*VAR.irs_t_m_max(1:12,5);  VAR.irs_t_y_max(1:12,5)'*VAR.irs_t_y_max(1:12,5); VAR.irs_t_f_max(1:12,5)'*VAR.irs_t_f_max(1:12,5); VAR.irs_t_mon_max(1:12,5)'*VAR.irs_t_mon_max(1:12,5); VAR.irs_t_p_max(1:12,5)'*VAR.irs_t_p_max(1:12,5)]./Var_MP12;
inf_VD12=[VAR.irs_t_m_max(1:12,3)'*VAR.irs_t_m_max(1:12,3);  VAR.irs_t_y_max(1:12,3)'*VAR.irs_t_y_max(1:12,3); VAR.irs_t_f_max(1:12,3)'*VAR.irs_t_f_max(1:12,3); VAR.irs_t_mon_max(1:12,3)'*VAR.irs_t_mon_max(1:12,3); VAR.irs_t_p_max(1:12,3)'*VAR.irs_t_p_max(1:12,3)]./Var_inf12;

% Reporting
RU_VD=[RU_VD1'; RU_VD6'; RU_VD12';];
GDP_VD=[GDP_VD1'; GDP_VD6'; GDP_VD12';];
FU_VD=[FU_VD1'; FU_VD6'; FU_VD12';];
MP_VD=[MP_VD1'; MP_VD6'; MP_VD12';];
inf_VD=[inf_VD1'; inf_VD6'; inf_VD12';];

VD.RU_VD=RU_VD;
VD.GDP_VD=GDP_VD;
VD.FU_VD=FU_VD;
VD.MP_VD=MP_VD;
VD.inf_VD=inf_VD;

%% Set Variance Decomposition: 90% set
%% 1. 1-month ahead FEVD
Var_RU1_95=IRS_max2_m(1,1)'*IRS_max2_m(1,1) + IRS_max2_y(1,1)'*IRS_max2_y(1,1) + IRS_max2_f(1,1)'*IRS_max2_f(1,1) + IRS_max2_mon(1,1)'*IRS_max2_mon(1,1) + IRS_max2_p(1,1)'*IRS_max2_p(1,1);
Var_GDP1_95=IRS_max2_m(1,2)'*IRS_max2_m(1,2) + IRS_max2_y(1,2)'*IRS_max2_y(1,2) + IRS_max2_f(1,2)'*IRS_max2_f(1,2) + IRS_max2_mon(1,2)'*IRS_max2_mon(1,2) + IRS_max2_p(1,2)'*IRS_max2_p(1,2);
Var_FU1_95=IRS_max2_m(1,4)'*IRS_max2_m(1,4) + IRS_max2_y(1,4)'*IRS_max2_y(1,4) + IRS_max2_f(1,4)'*IRS_max2_f(1,4) + IRS_max2_mon(1,4)'*IRS_max2_mon(1,4) + IRS_max2_p(1,4)'*IRS_max2_p(1,4);
Var_MP1_95=IRS_max2_m(1,5)'*IRS_max2_m(1,5) + IRS_max2_y(1,5)'*IRS_max2_y(1,5) + IRS_max2_f(1,5)'*IRS_max2_f(1,5) + IRS_max2_mon(1,5)'*IRS_max2_mon(1,5) + IRS_max2_p(1,5)'*IRS_max2_p(1,5);
Var_inf1_95=IRS_max2_m(1,3)'*IRS_max2_m(1,3) + IRS_max2_y(1,3)'*IRS_max2_y(1,3) + IRS_max2_f(1,3)'*IRS_max2_f(1,3) + IRS_max2_mon(1,3)'*IRS_max2_mon(1,3) + IRS_max2_p(1,3)'*IRS_max2_p(1,3);

RU_VD1_95=[IRS_max2_m(1,1)'*IRS_max2_m(1,1);  IRS_max2_y(1,1)'*IRS_max2_y(1,1); IRS_max2_f(1,1)'*IRS_max2_f(1,1); IRS_max2_mon(1,1)'*IRS_max2_mon(1,1); IRS_max2_p(1,1)'*IRS_max2_p(1,1)]./Var_RU1_95;
GDP_VD1_95=[IRS_max2_m(1,2)'*IRS_max2_m(1,2);  IRS_max2_y(1,2)'*IRS_max2_y(1,2); IRS_max2_f(1,2)'*IRS_max2_f(1,2); IRS_max2_mon(1,2)'*IRS_max2_mon(1,2); IRS_max2_p(1,2)'*IRS_max2_p(1,2)]./Var_GDP1_95;
FU_VD1_95=[IRS_max2_m(1,4)'*IRS_max2_m(1,4);  IRS_max2_y(1,4)'*IRS_max2_y(1,4); IRS_max2_f(1,4)'*IRS_max2_f(1,4); IRS_max2_mon(1,4)'*IRS_max2_mon(1,4); IRS_max2_p(1,4)'*IRS_max2_p(1,4)]./Var_FU1_95;
MP_VD1_95=[IRS_max2_m(1,5)'*IRS_max2_m(1,5);  IRS_max2_y(1,5)'*IRS_max2_y(1,5); IRS_max2_f(1,5)'*IRS_max2_f(1,5); IRS_max2_mon(1,5)'*IRS_max2_mon(1,5); IRS_max2_p(1,5)'*IRS_max2_p(1,5)]./Var_MP1_95;
inf_VD1_95=[IRS_max2_m(1,3)'*IRS_max2_m(1,3);  IRS_max2_y(1,3)'*IRS_max2_y(1,3); IRS_max2_f(1,3)'*IRS_max2_f(1,3); IRS_max2_mon(1,3)'*IRS_max2_mon(1,3); IRS_max2_p(1,3)'*IRS_max2_p(1,3)]./Var_inf1_95;

Var_RU1_05=IRS_min2_m(1,1)'*IRS_min2_m(1,1) + IRS_min2_y(1,1)'*IRS_min2_y(1,1) + IRS_min2_f(1,1)'*IRS_min2_f(1,1) + IRS_min2_mon(1,1)'*IRS_min2_mon(1,1) + IRS_min2_p(1,1)'*IRS_min2_p(1,1);
Var_GDP1_05=IRS_min2_m(1,2)'*IRS_min2_m(1,2) + IRS_min2_y(1,2)'*IRS_min2_y(1,2) + IRS_min2_f(1,2)'*IRS_min2_f(1,2) + IRS_min2_mon(1,2)'*IRS_min2_mon(1,2) + IRS_min2_p(1,2)'*IRS_min2_p(1,2);
Var_FU1_05=IRS_min2_m(1,4)'*IRS_min2_m(1,4) + IRS_min2_y(1,4)'*IRS_min2_y(1,4) + IRS_min2_f(1,4)'*IRS_min2_f(1,4) + IRS_min2_mon(1,4)'*IRS_min2_mon(1,4) + IRS_min2_p(1,4)'*IRS_min2_p(1,4);
Var_MP1_05=IRS_min2_m(1,5)'*IRS_min2_m(1,5) + IRS_min2_y(1,5)'*IRS_min2_y(1,5) + IRS_min2_f(1,5)'*IRS_min2_f(1,5) + IRS_min2_mon(1,5)'*IRS_min2_mon(1,5) + IRS_min2_p(1,5)'*IRS_min2_p(1,5);
Var_inf1_05=IRS_min2_m(1,3)'*IRS_min2_m(1,3) + IRS_min2_y(1,3)'*IRS_min2_y(1,3) + IRS_min2_f(1,3)'*IRS_min2_f(1,3) + IRS_min2_mon(1,3)'*IRS_min2_mon(1,3) + IRS_min2_p(1,3)'*IRS_min2_p(1,3);

RU_VD1_05=[IRS_min2_m(1,1)'*IRS_min2_m(1,1);  IRS_min2_y(1,1)'*IRS_min2_y(1,1); IRS_min2_f(1,1)'*IRS_min2_f(1,1); IRS_min2_mon(1,1)'*IRS_min2_mon(1,1); IRS_min2_p(1,1)'*IRS_min2_p(1,1)]./Var_RU1_05;
GDP_VD1_05=[IRS_min2_m(1,2)'*IRS_min2_m(1,2);  IRS_min2_y(1,2)'*IRS_min2_y(1,2); IRS_min2_f(1,2)'*IRS_min2_f(1,2); IRS_min2_mon(1,2)'*IRS_min2_mon(1,2); IRS_min2_p(1,2)'*IRS_min2_p(1,2)]./Var_GDP1_05;
FU_VD1_05=[IRS_min2_m(1,4)'*IRS_min2_m(1,4);  IRS_min2_y(1,4)'*IRS_min2_y(1,4); IRS_min2_f(1,4)'*IRS_min2_f(1,4); IRS_min2_mon(1,4)'*IRS_min2_mon(1,4); IRS_min2_p(1,4)'*IRS_min2_p(1,4)]./Var_FU1_05;
MP_VD1_05=[IRS_min2_m(1,5)'*IRS_min2_m(1,5);  IRS_min2_y(1,5)'*IRS_min2_y(1,5); IRS_min2_f(1,5)'*IRS_min2_f(1,5); IRS_min2_mon(1,5)'*IRS_min2_mon(1,5); IRS_min2_p(1,5)'*IRS_min2_p(1,5)]./Var_MP1_05;
inf_VD1_05=[IRS_min2_m(1,3)'*IRS_min2_m(1,3);  IRS_min2_y(1,3)'*IRS_min2_y(1,3); IRS_min2_f(1,3)'*IRS_min2_f(1,3); IRS_min2_mon(1,3)'*IRS_min2_mon(1,3); IRS_min2_p(1,3)'*IRS_min2_p(1,3)]./Var_inf1_05;

%% 2. 6-month ahead FEVD
Var_RU6_95=IRS_max2_m(1:6,1)'*IRS_max2_m(1:6,1) + IRS_max2_y(1:6,1)'*IRS_max2_y(1:6,1) + IRS_max2_f(1:6,1)'*IRS_max2_f(1:6,1) + IRS_max2_mon(1:6,1)'*IRS_max2_mon(1:6,1) + IRS_max2_p(1:6,1)'*IRS_max2_p(1:6,1);
Var_GDP6_95=IRS_max2_m(1:6,2)'*IRS_max2_m(1:6,2) + IRS_max2_y(1:6,2)'*IRS_max2_y(1:6,2) + IRS_max2_f(1:6,2)'*IRS_max2_f(1:6,2) + IRS_max2_mon(1:6,2)'*IRS_max2_mon(1:6,2) + IRS_max2_p(1:6,2)'*IRS_max2_p(1:6,2);
Var_FU6_95=IRS_max2_m(1:6,4)'*IRS_max2_m(1:6,4) + IRS_max2_y(1:6,4)'*IRS_max2_y(1:6,4) + IRS_max2_f(1:6,4)'*IRS_max2_f(1:6,4) + IRS_max2_mon(1:6,4)'*IRS_max2_mon(1:6,4) + IRS_max2_p(1:6,4)'*IRS_max2_p(1:6,4);
Var_MP6_95=IRS_max2_m(1:6,5)'*IRS_max2_m(1:6,5) + IRS_max2_y(1:6,5)'*IRS_max2_y(1:6,5) + IRS_max2_f(1:6,5)'*IRS_max2_f(1:6,5) + IRS_max2_mon(1:6,5)'*IRS_max2_mon(1:6,5) + IRS_max2_p(1:6,5)'*IRS_max2_p(1:6,5);
Var_inf6_95=IRS_max2_m(1:6,3)'*IRS_max2_m(1:6,3) + IRS_max2_y(1:6,3)'*IRS_max2_y(1:6,3) + IRS_max2_f(1:6,3)'*IRS_max2_f(1:6,3) + IRS_max2_mon(1:6,3)'*IRS_max2_mon(1:6,3) + IRS_max2_p(1:6,3)'*IRS_max2_p(1:6,3);

RU_VD6_95=[IRS_max2_m(1:6,1)'*IRS_max2_m(1:6,1);  IRS_max2_y(1:6,1)'*IRS_max2_y(1:6,1); IRS_max2_f(1:6,1)'*IRS_max2_f(1:6,1); IRS_max2_mon(1:6,1)'*IRS_max2_mon(1:6,1); IRS_max2_p(1:6,1)'*IRS_max2_p(1:6,1)]./Var_RU6_95;
GDP_VD6_95=[IRS_max2_m(1:6,2)'*IRS_max2_m(1:6,2);  IRS_max2_y(1:6,2)'*IRS_max2_y(1:6,2); IRS_max2_f(1:6,2)'*IRS_max2_f(1:6,2); IRS_max2_mon(1:6,2)'*IRS_max2_mon(1:6,2); IRS_max2_p(1:6,2)'*IRS_max2_p(1:6,2)]./Var_GDP6_95;
FU_VD6_95=[IRS_max2_m(1:6,4)'*IRS_max2_m(1:6,4);  IRS_max2_y(1:6,4)'*IRS_max2_y(1:6,4); IRS_max2_f(1:6,4)'*IRS_max2_f(1:6,4); IRS_max2_mon(1:6,4)'*IRS_max2_mon(1:6,4); IRS_max2_p(1:6,4)'*IRS_max2_p(1:6,4)]./Var_FU6_95;
MP_VD6_95=[IRS_max2_m(1:6,5)'*IRS_max2_m(1:6,5);  IRS_max2_y(1:6,5)'*IRS_max2_y(1:6,5); IRS_max2_f(1:6,5)'*IRS_max2_f(1:6,5); IRS_max2_mon(1:6,5)'*IRS_max2_mon(1:6,5); IRS_max2_p(1:6,5)'*IRS_max2_p(1:6,5)]./Var_MP6_95;
inf_VD6_95=[IRS_max2_m(1:6,3)'*IRS_max2_m(1:6,3);  IRS_max2_y(1:6,3)'*IRS_max2_y(1:6,3); IRS_max2_f(1:6,3)'*IRS_max2_f(1:6,3); IRS_max2_mon(1:6,3)'*IRS_max2_mon(1:6,3); IRS_max2_p(1:6,3)'*IRS_max2_p(1:6,3)]./Var_inf6_95;

Var_RU6_05=IRS_min2_m(1:6,1)'*IRS_min2_m(1:6,1) + IRS_min2_y(1:6,1)'*IRS_min2_y(1:6,1) + IRS_min2_f(1:6,1)'*IRS_min2_f(1:6,1) + IRS_min2_mon(1:6,1)'*IRS_min2_mon(1:6,1) + IRS_min2_p(1:6,1)'*IRS_min2_p(1:6,1);
Var_GDP6_05=IRS_min2_m(1:6,2)'*IRS_min2_m(1:6,2) + IRS_min2_y(1:6,2)'*IRS_min2_y(1:6,2) + IRS_min2_f(1:6,2)'*IRS_min2_f(1:6,2) + IRS_min2_mon(1:6,2)'*IRS_min2_mon(1:6,2) + IRS_min2_p(1:6,2)'*IRS_min2_p(1:6,2);
Var_FU6_05=IRS_min2_m(1:6,4)'*IRS_min2_m(1:6,4) + IRS_min2_y(1:6,4)'*IRS_min2_y(1:6,4) + IRS_min2_f(1:6,4)'*IRS_min2_f(1:6,4) + IRS_min2_mon(1:6,4)'*IRS_min2_mon(1:6,4) + IRS_min2_p(1:6,4)'*IRS_min2_p(1:6,4);
Var_MP6_05=IRS_min2_m(1:6,5)'*IRS_min2_m(1:6,5) + IRS_min2_y(1:6,5)'*IRS_min2_y(1:6,5) + IRS_min2_f(1:6,5)'*IRS_min2_f(1:6,5) + IRS_min2_mon(1:6,5)'*IRS_min2_mon(1:6,5) + IRS_min2_p(1:6,5)'*IRS_min2_p(1:6,5);
Var_inf6_05=IRS_min2_m(1:6,3)'*IRS_min2_m(1:6,3) + IRS_min2_y(1:6,3)'*IRS_min2_y(1:6,3) + IRS_min2_f(1:6,3)'*IRS_min2_f(1:6,3) + IRS_min2_mon(1:6,3)'*IRS_min2_mon(1:6,3) + IRS_min2_p(1:6,3)'*IRS_min2_p(1:6,3);

RU_VD6_05=[IRS_min2_m(1:6,1)'*IRS_min2_m(1:6,1);  IRS_min2_y(1:6,1)'*IRS_min2_y(1:6,1); IRS_min2_f(1:6,1)'*IRS_min2_f(1:6,1); IRS_min2_mon(1:6,1)'*IRS_min2_mon(1:6,1); IRS_min2_p(1:6,1)'*IRS_min2_p(1:6,1)]./Var_RU6_05;
GDP_VD6_05=[IRS_min2_m(1:6,2)'*IRS_min2_m(1:6,2);  IRS_min2_y(1:6,2)'*IRS_min2_y(1:6,2); IRS_min2_f(1:6,2)'*IRS_min2_f(1:6,2); IRS_min2_mon(1:6,2)'*IRS_min2_mon(1:6,2); IRS_min2_p(1:6,2)'*IRS_min2_p(1:6,2)]./Var_GDP6_05;
FU_VD6_05=[IRS_min2_m(1:6,4)'*IRS_min2_m(1:6,4);  IRS_min2_y(1:6,4)'*IRS_min2_y(1:6,4); IRS_min2_f(1:6,4)'*IRS_min2_f(1:6,4); IRS_min2_mon(1:6,4)'*IRS_min2_mon(1:6,4); IRS_min2_p(1:6,4)'*IRS_min2_p(1:6,4)]./Var_FU6_05;
MP_VD6_05=[IRS_min2_m(1:6,5)'*IRS_min2_m(1:6,5);  IRS_min2_y(1:6,5)'*IRS_min2_y(1:6,5); IRS_min2_f(1:6,5)'*IRS_min2_f(1:6,5); IRS_min2_mon(1:6,5)'*IRS_min2_mon(1:6,5); IRS_min2_p(1:6,5)'*IRS_min2_p(1:6,5)]./Var_MP6_05;
inf_VD6_05=[IRS_min2_m(1:6,3)'*IRS_min2_m(1:6,3);  IRS_min2_y(1:6,3)'*IRS_min2_y(1:6,3); IRS_min2_f(1:6,3)'*IRS_min2_f(1:6,3); IRS_min2_mon(1:6,3)'*IRS_min2_mon(1:6,3); IRS_min2_p(1:6,3)'*IRS_min2_p(1:6,3)]./Var_inf6_05;

%% 3. 12-month ahead FEVD
Var_RU12_95=IRS_max2_m(1:12,1)'*IRS_max2_m(1:12,1) + IRS_max2_y(1:12,1)'*IRS_max2_y(1:12,1) + IRS_max2_f(1:12,1)'*IRS_max2_f(1:12,1) + IRS_max2_mon(1:12,1)'*IRS_max2_mon(1:12,1) + IRS_max2_p(1:12,1)'*IRS_max2_p(1:12,1);
Var_GDP12_95=IRS_max2_m(1:12,2)'*IRS_max2_m(1:12,2) + IRS_max2_y(1:12,2)'*IRS_max2_y(1:12,2) + IRS_max2_f(1:12,2)'*IRS_max2_f(1:12,2) + IRS_max2_mon(1:12,2)'*IRS_max2_mon(1:12,2) + IRS_max2_p(1:12,2)'*IRS_max2_p(1:12,2);
Var_FU12_95=IRS_max2_m(1:12,4)'*IRS_max2_m(1:12,4) + IRS_max2_y(1:12,4)'*IRS_max2_y(1:12,4) + IRS_max2_f(1:12,4)'*IRS_max2_f(1:12,4) + IRS_max2_mon(1:12,4)'*IRS_max2_mon(1:12,4) + IRS_max2_p(1:12,4)'*IRS_max2_p(1:12,4);
Var_MP12_95=IRS_max2_m(1:12,5)'*IRS_max2_m(1:12,5) + IRS_max2_y(1:12,5)'*IRS_max2_y(1:12,5) + IRS_max2_f(1:12,5)'*IRS_max2_f(1:12,5) + IRS_max2_mon(1:12,5)'*IRS_max2_mon(1:12,5) + IRS_max2_p(1:12,5)'*IRS_max2_p(1:12,5);
Var_inf12_95=IRS_max2_m(1:12,3)'*IRS_max2_m(1:12,3) + IRS_max2_y(1:12,3)'*IRS_max2_y(1:12,3) + IRS_max2_f(1:12,3)'*IRS_max2_f(1:12,3) + IRS_max2_mon(1:12,3)'*IRS_max2_mon(1:12,3) + IRS_max2_p(1:12,3)'*IRS_max2_p(1:12,3);

RU_VD12_95=[IRS_max2_m(1:12,1)'*IRS_max2_m(1:12,1);  IRS_max2_y(1:12,1)'*IRS_max2_y(1:12,1); IRS_max2_f(1:12,1)'*IRS_max2_f(1:12,1); IRS_max2_mon(1:12,1)'*IRS_max2_mon(1:12,1); IRS_max2_p(1:12,1)'*IRS_max2_p(1:12,1)]./Var_RU12_95;
GDP_VD12_95=[IRS_max2_m(1:12,2)'*IRS_max2_m(1:12,2);  IRS_max2_y(1:12,2)'*IRS_max2_y(1:12,2); IRS_max2_f(1:12,2)'*IRS_max2_f(1:12,2); IRS_max2_mon(1:12,2)'*IRS_max2_mon(1:12,2); IRS_max2_p(1:12,2)'*IRS_max2_p(1:12,2)]./Var_GDP12_95;
FU_VD12_95=[IRS_max2_m(1:12,4)'*IRS_max2_m(1:12,4);  IRS_max2_y(1:12,4)'*IRS_max2_y(1:12,4); IRS_max2_f(1:12,4)'*IRS_max2_f(1:12,4); IRS_max2_mon(1:12,4)'*IRS_max2_mon(1:12,4); IRS_max2_p(1:12,4)'*IRS_max2_p(1:12,4)]./Var_FU12_95;
MP_VD12_95=[IRS_max2_m(1:12,5)'*IRS_max2_m(1:12,5);  IRS_max2_y(1:12,5)'*IRS_max2_y(1:12,5); IRS_max2_f(1:12,5)'*IRS_max2_f(1:12,5); IRS_max2_mon(1:12,5)'*IRS_max2_mon(1:12,5); IRS_max2_p(1:12,5)'*IRS_max2_p(1:12,5)]./Var_MP12_95;
inf_VD12_95=[IRS_max2_m(1:12,3)'*IRS_max2_m(1:12,3);  IRS_max2_y(1:12,3)'*IRS_max2_y(1:12,3); IRS_max2_f(1:12,3)'*IRS_max2_f(1:12,3); IRS_max2_mon(1:12,3)'*IRS_max2_mon(1:12,3); IRS_max2_p(1:12,3)'*IRS_max2_p(1:12,3)]./Var_inf12_95;

Var_RU12_05=IRS_min2_m(1:12,1)'*IRS_min2_m(1:12,1) + IRS_min2_y(1:12,1)'*IRS_min2_y(1:12,1) + IRS_min2_f(1:12,1)'*IRS_min2_f(1:12,1) + IRS_min2_mon(1:12,1)'*IRS_min2_mon(1:12,1) + IRS_min2_p(1:12,1)'*IRS_min2_p(1:12,1);
Var_GDP12_05=IRS_min2_m(1:12,2)'*IRS_min2_m(1:12,2) + IRS_min2_y(1:12,2)'*IRS_min2_y(1:12,2) + IRS_min2_f(1:12,2)'*IRS_min2_f(1:12,2) + IRS_min2_mon(1:12,2)'*IRS_min2_mon(1:12,2) + IRS_min2_p(1:12,2)'*IRS_min2_p(1:12,2);
Var_FU12_05=IRS_min2_m(1:12,4)'*IRS_min2_m(1:12,4) + IRS_min2_y(1:12,4)'*IRS_min2_y(1:12,4) + IRS_min2_f(1:12,4)'*IRS_min2_f(1:12,4) + IRS_min2_mon(1:12,4)'*IRS_min2_mon(1:12,4) + IRS_min2_p(1:12,4)'*IRS_min2_p(1:12,4);
Var_MP12_05=IRS_min2_m(1:12,5)'*IRS_min2_m(1:12,5) + IRS_min2_y(1:12,5)'*IRS_min2_y(1:12,5) + IRS_min2_f(1:12,5)'*IRS_min2_f(1:12,5) + IRS_min2_mon(1:12,5)'*IRS_min2_mon(1:12,5) + IRS_min2_p(1:12,5)'*IRS_min2_p(1:12,5);
Var_inf12_05=IRS_min2_m(1:12,3)'*IRS_min2_m(1:12,3) + IRS_min2_y(1:12,3)'*IRS_min2_y(1:12,3) + IRS_min2_f(1:12,3)'*IRS_min2_f(1:12,3) + IRS_min2_mon(1:12,3)'*IRS_min2_mon(1:12,3) + IRS_min2_p(1:12,3)'*IRS_min2_p(1:12,3);

RU_VD12_05=[IRS_min2_m(1:12,1)'*IRS_min2_m(1:12,1);  IRS_min2_y(1:12,1)'*IRS_min2_y(1:12,1); IRS_min2_f(1:12,1)'*IRS_min2_f(1:12,1); IRS_min2_mon(1:12,1)'*IRS_min2_mon(1:12,1); IRS_min2_p(1:12,1)'*IRS_min2_p(1:12,1)]./Var_RU12_05;
GDP_VD12_05=[IRS_min2_m(1:12,2)'*IRS_min2_m(1:12,2);  IRS_min2_y(1:12,2)'*IRS_min2_y(1:12,2); IRS_min2_f(1:12,2)'*IRS_min2_f(1:12,2); IRS_min2_mon(1:12,2)'*IRS_min2_mon(1:12,2); IRS_min2_p(1:12,2)'*IRS_min2_p(1:12,2)]./Var_GDP12_05;
FU_VD12_05=[IRS_min2_m(1:12,4)'*IRS_min2_m(1:12,4);  IRS_min2_y(1:12,4)'*IRS_min2_y(1:12,4); IRS_min2_f(1:12,4)'*IRS_min2_f(1:12,4); IRS_min2_mon(1:12,4)'*IRS_min2_mon(1:12,4); IRS_min2_p(1:12,4)'*IRS_min2_p(1:12,4)]./Var_FU12_05;
MP_VD12_05=[IRS_min2_m(1:12,5)'*IRS_min2_m(1:12,5);  IRS_min2_y(1:12,5)'*IRS_min2_y(1:12,5); IRS_min2_f(1:12,5)'*IRS_min2_f(1:12,5); IRS_min2_mon(1:12,5)'*IRS_min2_mon(1:12,5); IRS_min2_p(1:12,5)'*IRS_min2_p(1:12,5)]./Var_MP12_05;
inf_VD12_05=[IRS_min2_m(1:12,3)'*IRS_min2_m(1:12,3);  IRS_min2_y(1:12,3)'*IRS_min2_y(1:12,3); IRS_min2_f(1:12,3)'*IRS_min2_f(1:12,3); IRS_min2_mon(1:12,3)'*IRS_min2_mon(1:12,3); IRS_min2_p(1:12,3)'*IRS_min2_p(1:12,3)]./Var_inf12_05;

VD.RU_VD95=[RU_VD1_95'; RU_VD6_95'; RU_VD12_95';];
VD.GDP_VD95=[GDP_VD1_95'; GDP_VD6_95'; GDP_VD12_95';];
VD.FU_VD95=[FU_VD1_95'; FU_VD6_95'; FU_VD12_95';];
VD.MP_VD95=[MP_VD1_95'; MP_VD6_95'; MP_VD12_95';];
VD.inf_VD95=[inf_VD1_95'; inf_VD6_95'; inf_VD12_95';];

VD.RU_VD05=[RU_VD1_05'; RU_VD6_05'; RU_VD12_05';];
VD.GDP_VD05=[GDP_VD1_05'; GDP_VD6_05'; GDP_VD12_05';];
VD.FU_VD05=[FU_VD1_05'; FU_VD6_05'; FU_VD12_05';];
VD.MP_VD05=[MP_VD1_05'; MP_VD6_05'; MP_VD12_05';];
VD.inf_VD05=[inf_VD1_05'; inf_VD6_05'; inf_VD12_05';];

