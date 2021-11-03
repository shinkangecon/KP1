clc;clear;
load result_bootstrapped;

M=size(struc_e,3);        % M in the LMN
Rboot_num=1000;                   % R in the LMN. R numbers of bootstrap

time_length = size(struc_e,1);
var_length = size(struc_e,2);

% for smooth parallarization
%estar=zeros(size(struc_e,1),size(struc_e,2),Rboot_num);
%estar=zeros(size(struc_e,1),size(struc_e,2));
beta=VAR.bet;
num_lag=VAR.p;
sample_length=size(Y,1);
initial_condition=VAR.vars(1:num_lag,:);
terminal_condition=VAR.vars(VAR.T-num_lag:VAR.T,:);
intercept_iv=ones(size(stock,1)-1,1);

for m=1:M    
    ehat=struc_e(:,:,m);
    Bhat=Identified_B(:,:,m);
    
    % Plug in initial & terminal samples into the resampling    
    tmp_B_boot=zeros(size(B,1),size(B,2),Rboot_num);
    accept_boot=zeros(Rboot_num,1);
    
    for r=1:Rboot_num
        % resampling e* as in LMN
        estar=datasample(ehat,size(ehat,1));
   
        % plugging event shocks into resampled estar
        if bekaert == 0
            estar(t1,4) = ehat(t1,4);
            estar(t2,1) = ehat(t2,1);
            estar(t2,4) = ehat(t2,4);
            estar(t31:t32,2)=ehat(t31:t32,2);
            estar(t6,4)=ehat(t6,4);
            estar(t6+1,4)=ehat(t6+1,4);
            estar(t6,1)=ehat(t6,1);
            estar(t6+1,1)=ehat(t6+1,1);
            estar(end-t4:end-t5,5)=ehat(end-t4:end-t5,5);
        end      

        % Resampling for variables X and instrument variables
        vars_boot(num_lag+1:size(VAR.vars,1),:)=datasample(VAR.vars(num_lag+1:size(VAR.vars,1),:),size(VAR.vars,1)-num_lag);
        stock_resample=datasample(stock,size(stock,1));
        gold_resample=datasample(gold,size(gold,1));
        monshock_resample=datasample(monshock,size(monshock,1));
        real_proxy_resample=datasample(real_proxy,size(real_proxy,1));
        
        vars_boot(1:num_lag,:)=initial_condition;
        vars_boot(VAR.T-num_lag:VAR.T,:)=terminal_condition;
        vars_boot(:,5)=VAR.vars(:,5);
        vars_boot=VAR.vars;

        [YY, XX]=lagmatrix(vars_boot,num_lag,0);
        
        eta=estar*Bhat';
        YY_resample=zeros(size(VAR.vars,1),size(VAR.vars,2));
        
        if trend==0
            YY_resample(num_lag+1:size(VAR.vars,1),:)=[XX ones(length(XX),1)]*VAR.bet+eta;    
            YY_resample(1:num_lag,:)=VAR.vars(1:num_lag,:);
            [YY_boot,XX_boot]=lagmatrix(YY_resample,num_lag,0);
            bet1(:,:,r)=[XX_boot ones(length(XX_boot),1)]\YY_boot;
            res1 = YY-[XX ones(length(XX),1)]*bet1(:,:,r);
            Omega1 = (res1'*res1)/(VAR.T-VAR.n*VAR.p-1-2);
        elseif trend==1
            YY_resample(num_lag+1:size(VAR.vars,1),:)=[XX ones(length(XX),1) tt]*VAR.bet+eta;    
            YY_resample(1:num_lag,:)=VAR.vars(1:num_lag,:);
            [YY_boot,XX_boot]=lagmatrix(YY_resample,num_lag,0);
            bet1(:,:,r)=[XX_boot ones(length(XX_boot),1) tt]\YY_boot;
            res1 = YY_boot-[XX_boot ones(length(XX_boot),1) tt]*bet1(:,:,r);
            Omega1 = (res1'*res1)/(VAR.T-VAR.n*VAR.p-1-2);
        else
            %YY_resample(num_lag+1:size(VAR.vars,1),:)=[XX ones(length(XX),1) tt tt2]*VAR.bet+eta;    
            %YY_resample(1:num_lag,:)=VAR.vars(1:num_lag,:);
            %[YY_boot,XX_boot]=lagmatrix(YY_resample,num_lag,0);
            %bet1(:,:,r)=[XX_boot ones(length(XX_boot),1) tt tt2]\YY_boot;
            %res1 = YY_boot-[XX_boot ones(length(XX_boot),1) tt tt2]*bet1(:,:,r);
            %Omega1 = (res1'*res1)/(VAR.T-VAR.n*VAR.p-1-3); 
            bet1(:,:,r)=[XX ones(length(XX),1) tt tt2]\YY;
            res1 = YY-[XX ones(length(XX),1) tt tt2]*bet1(:,:,r);
            Omega1 = (res1'*res1)/(VAR.T-VAR.n*VAR.p-1-3); 
        end
            
        temp_m = rand(5,5);
        [Q, R] = qr(temp_m);
        
        if Q(1,1) < 0
            Q(:,1) = -1*Q(:,1);
        end
        if Q(2,2) < 0
            Q(:,2) = -1*Q(:,2);
        end
        if Q(3,3) < 0
            Q(:,3) = -1*Q(:,3);
        end
        if Q(4,4) < 0
            Q(:,4) = -1*Q(:,4);
        end
        if Q(5,5) < 0
            Q(:,5) = -1*Q(:,5);
        end
        
        % Evaluate \hat{eta}^{mr*}, \hat 
        Pmat = chol(Omega1,'lower');
        Bboot = Pmat*Q';        
        ehatstar = res1/Bboot';
        
        if bekaert == 0
            ehatstar(t1,4) = ehat(t1,4);
            ehatstar(t2,1) = ehat(t2,1);
            ehatstar(t2,4) = ehat(t2,4);
            ehatstar(t31:t32,2)=ehat(t31:t32,2);
            ehatstar(t6,4)=ehat(t6,4);
            ehatstar(t6+1,4)=ehat(t6+1,4);
            ehatstar(t6,1)=ehat(t6,1);
            ehatstar(t6+1,1)=ehat(t6+1,1);
        end   

        if bekaert == 0
            q_real_resample = zeros(151,1);
            for mm = 1:151
                for nn = 1:3
                    %q_real_resample(mm,1) = q_real_resample(mm,1) + ehatstar((mm-1)*3+nn+21-num_lag,2);
                    q_real_resample(mm,1) = q_real_resample(mm,1) + ehat((mm-1)*3+nn+21-num_lag,2);
                end
            end
        else
            q_real_resample = zeros(107,1);
            for mm = 1:107
                for nn = 1:3
                    %q_real_resample(mm,1) = q_real_resample(mm,1) + ehatstar((mm-1)*3+nn+21-num_lag,2);
                    q_real_resample(mm,1) = q_real_resample(mm,1) + ehatstar((mm-1)*3+nn+21-num_lag,2);
                end
            end
        end    
           
        % calculating correlations
        
        if bekaert == 0                  
            [ak,bk] = size(ehatstar);
            tt4 = ak-t4;
            tt5 = ak-t5;
        
            c_1f = corr(stock,ehatstar(:,4));                               % financial uncertainty and stock returns
            c_1r = corr(stock,ehatstar(:,1));                               % real uncertainty and stock returns
            c_2r = corr(gold,ehatstar(:,1));                                % real uncertainty and gold price
            c_2f = corr(gold,ehatstar(:,4));                                % financial uncertainty and gold price
            c_4m = corr(ehatstar(end-t4:end-t5,5),monshock(tt4:tt5,1));    % monetary policy shock instrument
            c_5y1 = corr(q_real_resample,real_proxy);
            c_5y2 = corr(q_real_resample(2:end,1),real_proxy(1:150,1));
            c_5y3 = corr(q_real_resample(1:150,1),real_proxy(2:151,1));
            c_5y = max([c_5y1, c_5y2, c_5y3]);  
            b_c = [c_1f c_1r c_2r c_2f c_4m c_5y]';                                       % overall corr    
        else                
            c_1f = corr(stock,ehatstar(:,4));                               % financial uncertainty and stock returns
            c_1r = corr(stock,ehatstar(:,1));                               % real uncertainty and stock returns
            c_2r = corr(gold,ehatstar(:,1));                                % real uncertainty and gold price
            c_2f = corr(gold,ehatstar(:,4));                                % financial uncertainty and gold price
            c_4m = corr(ehatstar(187-num_lag:end,5),monshock(187-num_lag:342-num_lag,1));
            c_5y1 = corr(q_real_resample,real_proxy(1:107,1));
            c_5y2 = corr(q_real_resample(2:end,1),real_proxy(1:106,1));
            c_5y3 = corr(q_real_resample(1:106,1),real_proxy(2:107,1));
            c_5y = max([c_5y1, c_5y2, c_5y3]);
            b_c = [c_1f c_1r c_2r c_2f c_4m c_5y]';
        end
        
        signal1 = 0;
        signal2 = 0;
        signal3 = 0;
            
        % event constraints
    
        if bekaert == 0                             % Lehman bros
            if ehatstar(t2,1) >= k2bar || ehatstar(t2,4) >= k3bar
                signal1 = 1;      
            end
        else
            signal1 = 1;        
        end
    
        if bekaert == 0                             % sum of GDP shock during GFC 
            if sum(ehatstar(t31:t32,2))<k_y
                signal2 = 1;
            end
        else
            signal2 = 1;
        end
    
        if bekaert == 0                             % debt ceiling
            if ehatstar(t6,4) >= k_4f1 && ehatstar(t6+1,4) >= k_4f2 && ehatstar(t6,1) >= k_4r1 && ehatstar(t6+1,1) >= k_4r2
                signal3 = 1;
            end
        else
            signal3 = 1;
        end     
          
        if (c_1f <= k_c1f && c_1r <= k_c1r && c_2r >= k_c2r && c_2f >= k_c2f && c_4m > k_c4 && c_5y > k_c5y) &&  (ehatstar(t1,4) > k1bar && signal1 == 1 && signal2 == 1 && signal3 == 1)     % correlation criteria
            tmp_B_boot(:,:,r)=Bboot;
            accept_boot(r)=1;
        end   
    end

    % Extracting identified solutions from the above bootstrapping
    num_passed_B_new=sum(accept_boot);
    if m==1
        num_passed_B=sum(accept_boot);
    end

    Identified_B_boot=zeros(nvar,nvar,num_passed_B_new);    

    j=1;
    for rr=1:Rboot_num
        if accept_boot(rr)==1
            Identified_B_boot(:,:,j)=tmp_B_boot(:,:,rr);
            Identified_bet(:,:,j)=bet1(:,:,rr);
            j=j+1;
        end
    end

    % 90% & 68% quantile
    IRS_stock_ci_m   = zeros(irhor,var_length,num_passed_B_new);
    IRS_stock_ci_y   = zeros(irhor,var_length,num_passed_B_new);
    IRS_stock_ci_p   = zeros(irhor,var_length,num_passed_B_new);
    IRS_stock_ci_f   = zeros(irhor,var_length,num_passed_B_new);
    IRS_stock_ci_mon = zeros(irhor,var_length,num_passed_B_new); 

    for iB=1:num_passed_B_new
        irs_t_ci_m(num_lag+1,:) = Identified_B_boot(:,:,iB)*[1 0 0 0 0]';
        irs_t_ci_y(num_lag+1,:) = Identified_B_boot(:,:,iB)*[0 1 0 0 0]';
        irs_t_ci_p(num_lag+1,:) = Identified_B_boot(:,:,iB)*[0 0 1 0 0]';
        irs_t_ci_f(num_lag+1,:) = Identified_B_boot(:,:,iB)*[0 0 0 1 0]';
        irs_t_ci_mon(num_lag+1,:) = Identified_B_boot(:,:,iB)*[0 0 0 0 1]';
        
        % _noendo -> shutting off contemporaneous feedbacks
        
        B_noendo_ci = Identified_B_boot(:,:,iB);
        B_noendo_ci(1,2:5) = [0 0 0 0];      % shut down responses of real uncertainty
        B_noendo_ci(4,1:3) = [0 0 0];        % shut down responses of financial uncertainty
        B_noendo_ci(4,5) = 0;
        
        % _noendeo_x -> shutting off contemporaneous responses of x
        % uncertainty
        B_noendo_ci_real=Identified_B_boot(:,:,iB); B_noendo_ci_financial=Identified_B_boot(:,:,iB);            
        B_noendo_ci_real(1,2:5)=[0 0 0 0];
        B_noendo_ci_financial(4,1:3) = [0 0 0];        
        B_noendo_ci_financial(4,5) = 0;
            
        irs_t_ci_m_noendo(num_lag+1,:) = B_noendo_ci*[1 0 0 0 0]';
        irs_t_ci_y_noendo(num_lag+1,:) = B_noendo_ci*[0 1 0 0 0]';
        irs_t_ci_p_noendo(num_lag+1,:) = B_noendo_ci*[0 0 1 0 0]';
        irs_t_ci_f_noendo(num_lag+1,:) = B_noendo_ci*[0 0 0 1 0]';
        irs_t_ci_mon_noendo(num_lag+1,:) = B_noendo_ci*[0 0 0 0 1]';
        
        irs_t_ci_m_noendo_real(num_lag+1,:) = B_noendo_ci_real*[1 0 0 0 0]';
        irs_t_ci_y_noendo_real(num_lag+1,:) = B_noendo_ci_real*[0 1 0 0 0]';
        irs_t_ci_p_noendo_real(num_lag+1,:) = B_noendo_ci_real*[0 0 1 0 0]';
        irs_t_ci_f_noendo_real(num_lag+1,:) = B_noendo_ci_real*[0 0 0 1 0]';
        irs_t_ci_mon_noendo_real(num_lag+1,:) = B_noendo_ci_real*[0 0 0 0 1]';
        
        irs_t_ci_m_noendo_financial(num_lag+1,:) = B_noendo_ci_financial*[1 0 0 0 0]';
        irs_t_ci_y_noendo_financial(num_lag+1,:) = B_noendo_ci_financial*[0 1 0 0 0]';
        irs_t_ci_p_noendo_financial(num_lag+1,:) = B_noendo_ci_financial*[0 0 1 0 0]';
        irs_t_ci_f_noendo_financial(num_lag+1,:) = B_noendo_ci_financial*[0 0 0 1 0]';
        irs_t_ci_mon_noendo_financial(num_lag+1,:) = B_noendo_ci_financial*[0 0 0 0 1]';
        
        boot_bet=Identified_bet(:,:,iB);
                
        for jj=2:irhor
            Ivars_ci_m = (irs_t_ci_m(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_y = (irs_t_ci_y(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_p = (irs_t_ci_p(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_f = (irs_t_ci_f(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_mon = (irs_t_ci_mon(num_lag+jj-1:-1:jj,:))';
            irs_t_ci_m(num_lag+jj,:) = Ivars_ci_m(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_y(num_lag+jj,:) = Ivars_ci_y(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_p(num_lag+jj,:) = Ivars_ci_p(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_f(num_lag+jj,:) = Ivars_ci_f(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_mon(num_lag+jj,:) = Ivars_ci_mon(:)'*boot_bet(1:num_lag*var_length,:);
            
            Ivars_ci_m_noendo = (irs_t_ci_m_noendo(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_y_noendo = (irs_t_ci_y_noendo(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_p_noendo = (irs_t_ci_p_noendo(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_f_noendo = (irs_t_ci_f_noendo(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_mon_noendo = (irs_t_ci_mon_noendo(num_lag+jj-1:-1:jj,:))';
            irs_t_ci_m_noendo(num_lag+jj,:) = Ivars_ci_m_noendo(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_y_noendo(num_lag+jj,:) = Ivars_ci_y_noendo(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_p_noendo(num_lag+jj,:) = Ivars_ci_p_noendo(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_f_noendo(num_lag+jj,:) = Ivars_ci_f_noendo(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_mon_noendo(num_lag+jj,:) = Ivars_ci_mon_noendo(:)'*boot_bet(1:num_lag*var_length,:);
            
            Ivars_ci_m_noendo_real = (irs_t_ci_m_noendo_real(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_y_noendo_real = (irs_t_ci_y_noendo_real(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_p_noendo_real = (irs_t_ci_p_noendo_real(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_f_noendo_real = (irs_t_ci_f_noendo_real(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_mon_noendo_real = (irs_t_ci_mon_noendo_real(num_lag+jj-1:-1:jj,:))';
            irs_t_ci_m_noendo_real(num_lag+jj,:) = Ivars_ci_m_noendo_real(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_y_noendo_real(num_lag+jj,:) = Ivars_ci_y_noendo_real(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_p_noendo_real(num_lag+jj,:) = Ivars_ci_p_noendo_real(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_f_noendo_real(num_lag+jj,:) = Ivars_ci_f_noendo_real(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_mon_noendo_real(num_lag+jj,:) = Ivars_ci_mon_noendo_real(:)'*boot_bet(1:num_lag*var_length,:);
            
            Ivars_ci_m_noendo_financial = (irs_t_ci_m_noendo_financial(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_y_noendo_financial = (irs_t_ci_y_noendo_financial(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_p_noendo_financial = (irs_t_ci_p_noendo_financial(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_f_noendo_financial = (irs_t_ci_f_noendo_financial(num_lag+jj-1:-1:jj,:))';
            Ivars_ci_mon_noendo_financial = (irs_t_ci_mon_noendo_financial(num_lag+jj-1:-1:jj,:))';
            irs_t_ci_m_noendo_financial(num_lag+jj,:) = Ivars_ci_m_noendo_financial(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_y_noendo_financial(num_lag+jj,:) = Ivars_ci_y_noendo_financial(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_p_noendo_financial(num_lag+jj,:) = Ivars_ci_p_noendo_financial(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_f_noendo_financial(num_lag+jj,:) = Ivars_ci_f_noendo_financial(:)'*boot_bet(1:num_lag*var_length,:);
            irs_t_ci_mon_noendo_financial(num_lag+jj,:) = Ivars_ci_mon_noendo_financial(:)'*boot_bet(1:num_lag*var_length,:);    
        end
    
        VAR.irs_t_ci_m   = irs_t_ci_m(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_y   = irs_t_ci_y(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_p   = irs_t_ci_p(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_f   = irs_t_ci_f(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_mon   = irs_t_ci_mon(num_lag+1:num_lag+irhor,:);
        
        VAR.irs_t_ci_m_noendo   = irs_t_ci_m_noendo(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_y_noendo   = irs_t_ci_y_noendo(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_p_noendo   = irs_t_ci_p_noendo(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_f_noendo   = irs_t_ci_f_noendo(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_mon_noendo   = irs_t_ci_mon_noendo(num_lag+1:num_lag+irhor,:);
        
        VAR.irs_t_ci_m_noendo_real   = irs_t_ci_m_noendo_real(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_y_noendo_real   = irs_t_ci_y_noendo_real(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_p_noendo_real   = irs_t_ci_p_noendo_real(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_f_noendo_real   = irs_t_ci_f_noendo_real(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_mon_noendo_real   = irs_t_ci_mon_noendo_real(num_lag+1:num_lag+irhor,:);
        
        VAR.irs_t_ci_m_noendo_financial   = irs_t_ci_m_noendo_financial(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_y_noendo_financial   = irs_t_ci_y_noendo_financial(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_p_noendo_financial   = irs_t_ci_p_noendo_financial(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_f_noendo_financial   = irs_t_ci_f_noendo_financial(num_lag+1:num_lag+irhor,:);
        VAR.irs_t_ci_mon_noendo_financial   = irs_t_ci_mon_noendo_financial(num_lag+1:num_lag+irhor,:);
        
        
        IRS_stock_ci_m(:,:,iB)   = VAR.irs_t_ci_m;
        IRS_stock_ci_y(:,:,iB)   = VAR.irs_t_ci_y;
        IRS_stock_ci_p(:,:,iB)   = VAR.irs_t_ci_p;
        IRS_stock_ci_f(:,:,iB)   = VAR.irs_t_ci_f;
        IRS_stock_ci_mon(:,:,iB) = VAR.irs_t_ci_mon;
    
        IRS_stock_ci_m_noendo  (:,:,iB) = VAR.irs_t_ci_m_noendo;
        IRS_stock_ci_y_noendo  (:,:,iB) = VAR.irs_t_ci_y_noendo;
        IRS_stock_ci_p_noendo  (:,:,iB) = VAR.irs_t_ci_p_noendo;
        IRS_stock_ci_f_noendo  (:,:,iB) = VAR.irs_t_ci_f_noendo;
        IRS_stock_ci_mon_noendo(:,:,iB) = VAR.irs_t_ci_mon_noendo;
        
        IRS_stock_ci_m_noendo_real(:,:,iB) = VAR.irs_t_ci_m_noendo_real;
        IRS_stock_ci_y_noendo_real(:,:,iB) = VAR.irs_t_ci_y_noendo_real;
        IRS_stock_ci_p_noendo_real(:,:,iB) = VAR.irs_t_ci_p_noendo_real;
        IRS_stock_ci_f_noendo_real(:,:,iB) = VAR.irs_t_ci_f_noendo_real;
        IRS_stock_ci_mon_noendo_real(:,:,iB) = VAR.irs_t_ci_mon_noendo_real;
        
        IRS_stock_ci_m_noendo_financial(:,:,iB) = VAR.irs_t_ci_m_noendo_financial;
        IRS_stock_ci_y_noendo_financial(:,:,iB) = VAR.irs_t_ci_y_noendo_financial;
        IRS_stock_ci_p_noendo_financial(:,:,iB) = VAR.irs_t_ci_p_noendo_financial;
        IRS_stock_ci_f_noendo_financial(:,:,iB) = VAR.irs_t_ci_f_noendo_financial;
        IRS_stock_ci_mon_noendo_financial(:,:,iB) = VAR.irs_t_ci_mon_noendo_financial;

        IRS_stock_ci_m_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_m(:,:,iB);  
        IRS_stock_ci_y_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_y(:,:,iB);  
        IRS_stock_ci_p_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_p(:,:,iB);  
        IRS_stock_ci_f_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_f(:,:,iB);  
        IRS_stock_ci_mon_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_mon(:,:,iB);
        
        IRS_stock_ci_m_noendo_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_m_noendo(:,:,iB)  ;
        IRS_stock_ci_y_noendo_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_y_noendo(:,:,iB)  ;
        IRS_stock_ci_p_noendo_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_p_noendo(:,:,iB)  ;
        IRS_stock_ci_f_noendo_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_f_noendo(:,:,iB)  ;
        IRS_stock_ci_mon_noendo_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_mon_noendo(:,:,iB);
        
        IRS_stock_ci_m_noendo_real_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_m_noendo_real(:,:,iB);
        IRS_stock_ci_y_noendo_real_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_y_noendo_real(:,:,iB);
        IRS_stock_ci_p_noendo_real_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_p_noendo_real(:,:,iB);
        IRS_stock_ci_f_noendo_real_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_f_noendo_real(:,:,iB);
        IRS_stock_ci_mon_noendo_real_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_mon_noendo_real(:,:,iB);
        
        IRS_stock_ci_m_noendo_financial_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_m_noendo_financial(:,:,iB);
        IRS_stock_ci_y_noendo_financial_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_y_noendo_financial(:,:,iB);
        IRS_stock_ci_p_noendo_financial_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_p_noendo_financial(:,:,iB);
        IRS_stock_ci_f_noendo_financial_set(:,:,(m-1)*num_passed_B+iB)   = IRS_stock_ci_f_noendo_financial(:,:,iB);
        IRS_stock_ci_mon_noendo_financial_set(:,:,(m-1)*num_passed_B+iB) = IRS_stock_ci_mon_noendo_financial(:,:,iB);

    end

    num_passed_B=sum(accept_boot);
    if num_passed_B==0
        disp('No Sample Passed!');
    else
        disp('Passed!');
    end
end

%% Taking quantiles
% 90% CI
IRS_stock_ci_m_max2 = quantile(IRS_stock_ci_m_set,1-ci_p/2,3);
IRS_stock_ci_m_min2 = quantile(IRS_stock_ci_m_set,ci_p/2,3);
IRS_stock_ci_y_max2 = quantile(IRS_stock_ci_y_set,1-ci_p/2,3);
IRS_stock_ci_y_min2 = quantile(IRS_stock_ci_y_set,ci_p/2,3);
IRS_stock_ci_p_max2 = quantile(IRS_stock_ci_p_set,1-ci_p/2,3);
IRS_stock_ci_p_min2 = quantile(IRS_stock_ci_p_set,ci_p/2,3);
IRS_stock_ci_f_max2 = quantile(IRS_stock_ci_f_set,1-ci_p/2,3);
IRS_stock_ci_f_min2 = quantile(IRS_stock_ci_f_set,ci_p/2,3);
IRS_stock_ci_mon_max2 = quantile(IRS_stock_ci_mon_set,1-ci_p/2,3);
IRS_stock_ci_mon_min2 = quantile(IRS_stock_ci_mon_set,ci_p/2,3);

IRS_stock_ci_m_noendo_max2 = quantile(IRS_stock_ci_m_noendo_set,1-ci_p/2,3);
IRS_stock_ci_m_noendo_min2 = quantile(IRS_stock_ci_m_noendo_set,ci_p/2,3);
IRS_stock_ci_y_noendo_max2 = quantile(IRS_stock_ci_y_noendo_set,1-ci_p/2,3);
IRS_stock_ci_y_noendo_min2 = quantile(IRS_stock_ci_y_noendo_set,ci_p/2,3);
IRS_stock_ci_p_noendo_max2 = quantile(IRS_stock_ci_p_noendo_set,1-ci_p/2,3);
IRS_stock_ci_p_noendo_min2 = quantile(IRS_stock_ci_p_noendo_set,ci_p/2,3);
IRS_stock_ci_f_noendo_max2 = quantile(IRS_stock_ci_f_noendo_set,1-ci_p/2,3);
IRS_stock_ci_f_noendo_min2 = quantile(IRS_stock_ci_f_noendo_set,ci_p/2,3);
IRS_stock_ci_mon_noendo_max2 = quantile(IRS_stock_ci_mon_noendo_set,1-ci_p/2,3);
IRS_stock_ci_mon_noendo_min2 = quantile(IRS_stock_ci_mon_noendo_set,ci_p/2,3);

IRS_stock_ci_m_noendo_real_max2 = quantile(IRS_stock_ci_m_noendo_real_set,1-ci_p/2,3);
IRS_stock_ci_m_noendo_real_min2 = quantile(IRS_stock_ci_m_noendo_real_set,ci_p/2,3);
IRS_stock_ci_y_noendo_real_max2 = quantile(IRS_stock_ci_y_noendo_real_set,1-ci_p/2,3);
IRS_stock_ci_y_noendo_real_min2 = quantile(IRS_stock_ci_y_noendo_real_set,ci_p/2,3);
IRS_stock_ci_p_noendo_real_max2 = quantile(IRS_stock_ci_p_noendo_real_set,1-ci_p/2,3);
IRS_stock_ci_p_noendo_real_min2 = quantile(IRS_stock_ci_p_noendo_real_set,ci_p/2,3);
IRS_stock_ci_f_noendo_real_max2 = quantile(IRS_stock_ci_f_noendo_real_set,1-ci_p/2,3);
IRS_stock_ci_f_noendo_real_min2 = quantile(IRS_stock_ci_f_noendo_real_set,ci_p/2,3);
IRS_stock_ci_mon_noendo_real_max2 = quantile(IRS_stock_ci_mon_noendo_real,1-ci_p/2,3);
IRS_stock_ci_mon_noendo_real_min2 = quantile(IRS_stock_ci_mon_noendo_real,ci_p/2,3);

IRS_stock_ci_m_noendo_financial_max2 = quantile(IRS_stock_ci_m_noendo_financial_set,1-ci_p/2,3);
IRS_stock_ci_m_noendo_financial_min2 = quantile(IRS_stock_ci_m_noendo_financial_set,ci_p/2,3);
IRS_stock_ci_y_noendo_financial_max2 = quantile(IRS_stock_ci_y_noendo_financial_set,1-ci_p/2,3);
IRS_stock_ci_y_noendo_financial_min2 = quantile(IRS_stock_ci_y_noendo_financial_set,ci_p/2,3);
IRS_stock_ci_p_noendo_financial_max2 = quantile(IRS_stock_ci_p_noendo_financial_set,1-ci_p/2,3);
IRS_stock_ci_p_noendo_financial_min2 = quantile(IRS_stock_ci_p_noendo_financial_set,ci_p/2,3);
IRS_stock_ci_f_noendo_financial_max2 = quantile(IRS_stock_ci_f_noendo_financial_set,1-ci_p/2,3);
IRS_stock_ci_f_noendo_financial_min2 = quantile(IRS_stock_ci_f_noendo_financial_set,ci_p/2,3);
IRS_stock_ci_mon_noendo_financial_max2 = quantile(IRS_stock_ci_mon_noendo_financial_set,1-ci_p/2,3);
IRS_stock_ci_mon_noendo_financial_min2 = quantile(IRS_stock_ci_mon_noendo_financial_set,ci_p/2,3);

%% 68% CI
IRS_stock_ci_m_max1 = quantile(IRS_stock_ci_m_set,1-ci_p1/2,3);
IRS_stock_ci_m_min1 = quantile(IRS_stock_ci_m_set,ci_p1/2,3);
IRS_stock_ci_y_max1 = quantile(IRS_stock_ci_y_set,1-ci_p1/2,3);
IRS_stock_ci_y_min1 = quantile(IRS_stock_ci_y_set,ci_p1/2,3);
IRS_stock_ci_p_max1 = quantile(IRS_stock_ci_p_set,1-ci_p1/2,3);
IRS_stock_ci_p_min1 = quantile(IRS_stock_ci_p_set,ci_p1/2,3);
IRS_stock_ci_f_max1 = quantile(IRS_stock_ci_f_set,1-ci_p1/2,3);
IRS_stock_ci_f_min1 = quantile(IRS_stock_ci_f_set,ci_p1/2,3);
IRS_stock_ci_mon_max1 = quantile(IRS_stock_ci_mon_set,1-ci_p1/2,3);
IRS_stock_ci_mon_min1 = quantile(IRS_stock_ci_mon_set,ci_p1/2,3);

IRS_stock_ci_m_noendo_max1 = quantile(IRS_stock_ci_m_noendo_set,1-ci_p1/2,3);
IRS_stock_ci_m_noendo_min1 = quantile(IRS_stock_ci_m_noendo_set,ci_p1/2,3);
IRS_stock_ci_y_noendo_max1 = quantile(IRS_stock_ci_y_noendo_set,1-ci_p1/2,3);
IRS_stock_ci_y_noendo_min1 = quantile(IRS_stock_ci_y_noendo_set,ci_p1/2,3);
IRS_stock_ci_p_noendo_max1 = quantile(IRS_stock_ci_p_noendo_set,1-ci_p1/2,3);
IRS_stock_ci_p_noendo_min1 = quantile(IRS_stock_ci_p_noendo_set,ci_p1/2,3);
IRS_stock_ci_f_noendo_max1 = quantile(IRS_stock_ci_f_noendo_set,1-ci_p1/2,3);
IRS_stock_ci_f_noendo_min1 = quantile(IRS_stock_ci_f_noendo_set,ci_p1/2,3);
IRS_stock_ci_mon_noendo_max1 = quantile(IRS_stock_ci_mon_noendo_set,1-ci_p1/2,3);
IRS_stock_ci_mon_noendo_min1 = quantile(IRS_stock_ci_mon_noendo_set,ci_p1/2,3);

IRS_stock_ci_m_noendo_real_max1 = quantile(IRS_stock_ci_m_noendo_real_set,1-ci_p1/2,3);
IRS_stock_ci_m_noendo_real_min1 = quantile(IRS_stock_ci_m_noendo_real_set,ci_p1/2,3);
IRS_stock_ci_y_noendo_real_max1 = quantile(IRS_stock_ci_y_noendo_real_set,1-ci_p1/2,3);
IRS_stock_ci_y_noendo_real_min1 = quantile(IRS_stock_ci_y_noendo_real_set,ci_p1/2,3);
IRS_stock_ci_p_noendo_real_max1 = quantile(IRS_stock_ci_p_noendo_real_set,1-ci_p1/2,3);
IRS_stock_ci_p_noendo_real_min1 = quantile(IRS_stock_ci_p_noendo_real_set,ci_p1/2,3);
IRS_stock_ci_f_noendo_real_max1 = quantile(IRS_stock_ci_f_noendo_real_set,1-ci_p1/2,3);
IRS_stock_ci_f_noendo_real_min1 = quantile(IRS_stock_ci_f_noendo_real_set,ci_p1/2,3);
IRS_stock_ci_mon_noendo_real_max1 = quantile(IRS_stock_ci_mon_noendo_real_set,1-ci_p1/2,3);
IRS_stock_ci_mon_noendo_real_min1 = quantile(IRS_stock_ci_mon_noendo_real_set,ci_p1/2,3);

IRS_stock_ci_m_noendo_financial_max1 = quantile(IRS_stock_ci_m_noendo_financial_set,1-ci_p1/2,3);
IRS_stock_ci_m_noendo_financial_min1 = quantile(IRS_stock_ci_m_noendo_financial_set,ci_p1/2,3);
IRS_stock_ci_y_noendo_financial_max1 = quantile(IRS_stock_ci_y_noendo_financial_set,1-ci_p1/2,3);
IRS_stock_ci_y_noendo_financial_min1 = quantile(IRS_stock_ci_y_noendo_financial_set,ci_p1/2,3);
IRS_stock_ci_p_noendo_financial_max1 = quantile(IRS_stock_ci_p_noendo_financial_set,1-ci_p1/2,3);
IRS_stock_ci_p_noendo_financial_min1 = quantile(IRS_stock_ci_p_noendo_financial_set,ci_p1/2,3);
IRS_stock_ci_f_noendo_financial_max1 = quantile(IRS_stock_ci_f_noendo_financial_set,1-ci_p1/2,3);
IRS_stock_ci_f_noendo_financial_min1 = quantile(IRS_stock_ci_f_noendo_financial_set,ci_p1/2,3);
IRS_stock_ci_mon_noendo_financial_max1 = quantile(IRS_stock_ci_mon_noendo_financial_set,1-ci_p1/2,3);
IRS_stock_ci_mon_noendo_financial_min1 = quantile(IRS_stock_ci_mon_noendo_financial_set,ci_p1/2,3);