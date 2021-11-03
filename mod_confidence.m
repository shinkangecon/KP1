clear;
load result_bootstrapped;

nboot = 1000;
ci_p = 0.1;
ci_p1= 0.32;

num_trial = size(struc_e,3);
time_length = size(struc_e,1);
var_length = size(struc_e,2);

IRS_stock_m_ci = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_ci = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_ci = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_ci = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_ci = zeros(irhor,var_length,num_trial*nboot);

for ii = 1:num_trial
    
    res = struc_e(:,:,ii);
%     res = detrend(struc_e(:,:,ii),0);
    
    jj = 1;
    
    while jj<nboot+1
        %T x 1 -1 or 1 random numbers with prob 0.5-0.5
        rr = 1-2*(rand(time_length,1)>0.5);
        %T x n randomly choose the sign of the time T shocks (all)
        resb = (res.*(rr*ones(1,var_length)))';
        
        resb(:,t1) = res(t1,:)';
        if bekaert == 0
            resb(:,t2) = res(t2,:)';
            resb(:,t6) = res(t6,:)';
            resb(:,t6+1) = res(t6+1,:)';
            for kk = 1:19
                resb(:,t31-1+kk) = res(t31-1+kk,:)';
            end
        end
        
        varsb = zeros(VAR.p+time_length,var_length);
        
        % Initial values
        varsb(1:VAR.p,:)=VAR.vars(1:VAR.p,:);
        for j=VAR.p+1:VAR.p+time_length
            lvars = (varsb(j-1:-1:j-VAR.p,:))';
            if trend == 0
                varsb(j,:) = lvars(:)'*VAR.bet(1:VAR.p*var_length,:)+VAR.bet(VAR.p*var_length+1:end,:)+resb(:,j-VAR.p)';
            elseif trend == 1
                varsb(j,:) = lvars(:)'*VAR.bet(1:VAR.p*var_length,:)+[1 j]*VAR.bet(VAR.p*VAR.n+1:end,:)+resb(:,j-VAR.p)';
            elseif trend == 2
                varsb(j,:) = lvars(:)'*VAR.bet(1:VAR.p*var_length,:)+[1 j j^2]*VAR.bet(VAR.p*VAR.n+1:end,:)+resb(:,j-VAR.p)';
            end
        end 
        
        [YY XX]      = lagmatrix(varsb,VAR.p,0);

        if trend == 0
            VAR.bet1=[XX ones(length(XX),1)]\YY; 
            VAR.res1 = YY-[XX ones(length(XX),1)]*VAR.bet1;
            VAR.Omega1 = (VAR.res1'*VAR.res1)/(time_length-var_length*VAR.p-1-1);
        elseif trend == 1
            VAR.bet1=[XX ones(length(XX),1) tt]\YY; 
            VAR.res1 = YY-[XX ones(length(XX),1) tt]*VAR.bet1;
            VAR.Omega1 = (VAR.res1'*VAR.res1)/(time_length-var_length*VAR.p-1-2);
        elseif trend == 2
            VAR.bet1=[XX ones(length(XX),1) tt tt2]\YY; 
            VAR.res1 = YY-[XX ones(length(XX),1) tt tt2]*VAR.bet1;
            VAR.Omega1 = (VAR.res1'*VAR.res1)/(time_length-var_length*VAR.p-1-3);
        end

        irs_t_m_ci(VAR.p+1,:) = Identified_B(:,:,ii)*[1 0 0 0 0]';
        irs_t_y_ci(VAR.p+1,:) = Identified_B(:,:,ii)*[0 1 0 0 0]';
        irs_t_p_ci(VAR.p+1,:) = Identified_B(:,:,ii)*[0 0 1 0 0]';
        irs_t_f_ci(VAR.p+1,:) = Identified_B(:,:,ii)*[0 0 0 1 0]';
        irs_t_mon_ci(VAR.p+1,:) = Identified_B(:,:,ii)*[0 0 0 0 1]';
		
        for jjj=2:irhor
            lvars_m_ci = (irs_t_m_ci(VAR.p+jjj-1:-1:jjj,:))';
            lvars_y_ci = (irs_t_y_ci(VAR.p+jjj-1:-1:jjj,:))';
            lvars_p_ci = (irs_t_p_ci(VAR.p+jjj-1:-1:jjj,:))';
            lvars_f_ci = (irs_t_f_ci(VAR.p+jjj-1:-1:jjj,:))';
            lvars_mon_ci = (irs_t_mon_ci(VAR.p+jjj-1:-1:jjj,:))';
            irs_t_m_ci(VAR.p+jjj,:) = lvars_m_ci(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_y_ci(VAR.p+jjj,:) = lvars_y_ci(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_p_ci(VAR.p+jjj,:) = lvars_p_ci(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_f_ci(VAR.p+jjj,:) = lvars_f_ci(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_mon_ci(VAR.p+jjj,:) = lvars_mon_ci(:)'*VAR.bet1(1:VAR.p*VAR.n,:);    
        end

        VAR.irs_t_m_ci   = irs_t_m_ci(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_y_ci   = irs_t_y_ci(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_p_ci   = irs_t_p_ci(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_f_ci   = irs_t_f_ci(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_mon_ci   = irs_t_mon_ci(VAR.p+1:VAR.p+irhor,:);

        IRS_stock_m_ci(:,:,(ii-1)*nboot+jj) = VAR.irs_t_m_ci;
        IRS_stock_y_ci(:,:,(ii-1)*nboot+jj) = VAR.irs_t_y_ci;
        IRS_stock_p_ci(:,:,(ii-1)*nboot+jj) = VAR.irs_t_p_ci;
        IRS_stock_f_ci(:,:,(ii-1)*nboot+jj) = VAR.irs_t_f_ci;
        IRS_stock_mon_ci(:,:,(ii-1)*nboot+jj) = VAR.irs_t_mon_ci;

        jj=jj+1;   

    end
    
end

%% 90% CI
IRS_stock_m_ci_max2 = quantile(IRS_stock_m_ci,1-.5*ci_p,3);
IRS_stock_m_ci_min2 = quantile(IRS_stock_m_ci,.5*ci_p,3);
IRS_stock_y_ci_max2 = quantile(IRS_stock_y_ci,1-.5*ci_p,3);
IRS_stock_y_ci_min2 = quantile(IRS_stock_y_ci,.5*ci_p,3);
IRS_stock_p_ci_max2 = quantile(IRS_stock_p_ci,1-.5*ci_p,3);
IRS_stock_p_ci_min2 = quantile(IRS_stock_p_ci,.5*ci_p,3);
IRS_stock_f_ci_max2 = quantile(IRS_stock_f_ci,1-.5*ci_p,3);
IRS_stock_f_ci_min2 = quantile(IRS_stock_f_ci,.5*ci_p,3);
IRS_stock_mon_ci_max2 = quantile(IRS_stock_mon_ci,1-.5*ci_p,3);
IRS_stock_mon_ci_min2 = quantile(IRS_stock_mon_ci,.5*ci_p,3);

%% 68% CI
IRS_stock_m_ci_max1 = quantile(IRS_stock_m_ci,1-.5*ci_p1,3);
IRS_stock_m_ci_min1 = quantile(IRS_stock_m_ci,.5*ci_p1,3);
IRS_stock_y_ci_max1 = quantile(IRS_stock_y_ci,1-.5*ci_p1,3);
IRS_stock_y_ci_min1 = quantile(IRS_stock_y_ci,.5*ci_p1,3);
IRS_stock_p_ci_max1 = quantile(IRS_stock_p_ci,1-.5*ci_p1,3);
IRS_stock_p_ci_min1 = quantile(IRS_stock_p_ci,.5*ci_p1,3);
IRS_stock_f_ci_max1 = quantile(IRS_stock_f_ci,1-.5*ci_p1,3);
IRS_stock_f_ci_min1 = quantile(IRS_stock_f_ci,.5*ci_p1,3);
IRS_stock_mon_ci_max1 = quantile(IRS_stock_mon_ci,1-.5*ci_p1,3);
IRS_stock_mon_ci_min1 = quantile(IRS_stock_mon_ci,.5*ci_p1,3);

save result_bootstrapped;
