clear;
load result_bootstrapped;

nboot = 1000;
ci_p = 0.1;
ci_p1= 0.32;

num_trial = size(struc_e,3);
time_length = size(struc_e,1);
var_length = size(struc_e,2);

IRS_stock_m_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_ci_eventcorr = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_ci_event = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_noendo_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_noendo_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_noendo_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_noendo_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_noendo_ci_eventcorr = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_noendo_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_noendo_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_noendo_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_noendo_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_noendo_ci_event = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_noendo_real_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_noendo_real_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_noendo_real_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_noendo_real_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_noendo_real_ci_eventcorr = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_noendo_real_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_noendo_real_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_noendo_real_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_noendo_real_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_noendo_real_ci_event = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_noendo_financial_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_noendo_financial_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_noendo_financial_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_noendo_financial_ci_eventcorr   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_noendo_financial_ci_eventcorr = zeros(irhor,var_length,num_trial*nboot);

IRS_stock_m_noendo_financial_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_y_noendo_financial_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_p_noendo_financial_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_f_noendo_financial_ci_event   = zeros(irhor,var_length,num_trial*nboot);
IRS_stock_mon_noendo_financial_ci_event = zeros(irhor,var_length,num_trial*nboot);


for iboot=1:nboot
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

for ii = 1:num_trial
    
    res = struc_e(:,:,ii);
    %res = detrend(struc_e(:,:,ii),0);
    
    %% Bootstrapping on samples passed event constraint
    jj = 1;       


    Boot_B=Identified_B(:,:,ii);
    B_noendo_real=Boot_B; B_noendo_financial=Boot_B;            
    B_noendo_real(1,2:5)=[0 0 0 0];
    B_noendo_financial(4,1:3) = [0 0 0];        
    B_noendo_financial(4,5) = 0;

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

        %% Event constraint, already passed 
        irs_t_m_ci_event(VAR.p+1,:) = Boot_B*[1 0 0 0 0]';
        irs_t_y_ci_event(VAR.p+1,:) = Boot_B*[0 1 0 0 0]';
        irs_t_p_ci_event(VAR.p+1,:) = Boot_B*[0 0 1 0 0]';
        irs_t_f_ci_event(VAR.p+1,:) = Boot_B*[0 0 0 1 0]';
        irs_t_mon_ci_event(VAR.p+1,:) = Boot_B*[0 0 0 0 1]';

        irs_t_m_noendo_ci_event(VAR.p+1,:) = B_noendo*[1 0 0 0 0]';
        irs_t_y_noendo_ci_event(VAR.p+1,:) = B_noendo*[0 1 0 0 0]';
        irs_t_p_noendo_ci_event(VAR.p+1,:) = B_noendo*[0 0 1 0 0]';
        irs_t_f_noendo_ci_event(VAR.p+1,:) = B_noendo*[0 0 0 1 0]';
        irs_t_mon_noendo_ci_event(VAR.p+1,:) = B_noendo*[0 0 0 0 1]';
        
        irs_t_m_noendo_real_ci_event(VAR.p+1,:) = B_noendo_real*[1 0 0 0 0]';
        irs_t_y_noendo_real_ci_event(VAR.p+1,:) = B_noendo_real*[0 1 0 0 0]';
        irs_t_p_noendo_real_ci_event(VAR.p+1,:) = B_noendo_real*[0 0 1 0 0]';
        irs_t_f_noendo_real_ci_event(VAR.p+1,:) = B_noendo_real*[0 0 0 1 0]';
        irs_t_mon_noendo_real_ci_event(VAR.p+1,:) = B_noendo_real*[0 0 0 0 1]';
        
        irs_t_m_noendo_financial_ci_event(VAR.p+1,:) = B_noendo_financial*[1 0 0 0 0]';
        irs_t_y_noendo_financial_ci_event(VAR.p+1,:) = B_noendo_financial*[0 1 0 0 0]';
        irs_t_p_noendo_financial_ci_event(VAR.p+1,:) = B_noendo_financial*[0 0 1 0 0]';
        irs_t_f_noendo_financial_ci_event(VAR.p+1,:) = B_noendo_financial*[0 0 0 1 0]';
        irs_t_mon_noendo_financial_ci_event(VAR.p+1,:) = B_noendo_financial*[0 0 0 0 1]';
        
        for jjj=2:irhor
            lvars_m_ci_event = (irs_t_m_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_y_ci_event = (irs_t_y_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_p_ci_event = (irs_t_p_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_f_ci_event = (irs_t_f_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_mon_ci_event = (irs_t_mon_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            irs_t_m_ci_event(VAR.p+jjj,:) = lvars_m_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_y_ci_event(VAR.p+jjj,:) = lvars_y_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_p_ci_event(VAR.p+jjj,:) = lvars_p_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_f_ci_event(VAR.p+jjj,:) = lvars_f_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_mon_ci_event(VAR.p+jjj,:) = lvars_mon_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);    

            lvars_m_noendo_ci_event = (irs_t_m_noendo_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_y_noendo_ci_event = (irs_t_y_noendo_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_p_noendo_ci_event = (irs_t_p_noendo_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_f_noendo_ci_event = (irs_t_f_noendo_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_mon_noendo_ci_event = (irs_t_mon_noendo_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            irs_t_m_noendo_ci_event(VAR.p+jjj,:) = lvars_m_noendo_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_y_noendo_ci_event(VAR.p+jjj,:) = lvars_y_noendo_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_p_noendo_ci_event(VAR.p+jjj,:) = lvars_p_noendo_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_f_noendo_ci_event(VAR.p+jjj,:) = lvars_f_noendo_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_mon_noendo_ci_event(VAR.p+jjj,:) = lvars_mon_noendo_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);  

            lvars_m_noendo_real_ci_event = (irs_t_m_noendo_real_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_y_noendo_real_ci_event = (irs_t_y_noendo_real_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_p_noendo_real_ci_event = (irs_t_p_noendo_real_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_f_noendo_real_ci_event = (irs_t_f_noendo_real_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_mon_noendo_real_ci_event = (irs_t_mon_noendo_real_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            irs_t_m_noendo_real_ci_event(VAR.p+jjj,:) = lvars_m_noendo_real_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_y_noendo_real_ci_event(VAR.p+jjj,:) = lvars_y_noendo_real_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_p_noendo_real_ci_event(VAR.p+jjj,:) = lvars_p_noendo_real_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_f_noendo_real_ci_event(VAR.p+jjj,:) = lvars_f_noendo_real_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_mon_noendo_real_ci_event(VAR.p+jjj,:) = lvars_mon_noendo_real_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);

            lvars_m_noendo_financial_ci_event = (irs_t_m_noendo_financial_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_y_noendo_financial_ci_event = (irs_t_y_noendo_financial_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_p_noendo_financial_ci_event = (irs_t_p_noendo_financial_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_f_noendo_financial_ci_event = (irs_t_f_noendo_financial_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            lvars_mon_noendo_financial_ci_event = (irs_t_mon_noendo_financial_ci_event(VAR.p+jjj-1:-1:jjj,:))';
            irs_t_m_noendo_financial_ci_event(VAR.p+jjj,:) = lvars_m_noendo_financial_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_y_noendo_financial_ci_event(VAR.p+jjj,:) = lvars_y_noendo_financial_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_p_noendo_financial_ci_event(VAR.p+jjj,:) = lvars_p_noendo_financial_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_f_noendo_financial_ci_event(VAR.p+jjj,:) = lvars_f_noendo_financial_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            irs_t_mon_noendo_financial_ci_event(VAR.p+jjj,:) = lvars_mon_noendo_financial_ci_event(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
        end

        VAR.irs_t_m_ci_event   = irs_t_m_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_y_ci_event   = irs_t_y_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_p_ci_event   = irs_t_p_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_f_ci_event   = irs_t_f_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_mon_ci_event   = irs_t_mon_ci_event(VAR.p+1:VAR.p+irhor,:);

        VAR.irs_t_m_noendo_ci_event   = irs_t_m_noendo_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_y_noendo_ci_event   = irs_t_y_noendo_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_p_noendo_ci_event   = irs_t_p_noendo_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_f_noendo_ci_event   = irs_t_f_noendo_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_mon_noendo_ci_event   = irs_t_mon_noendo_ci_event(VAR.p+1:VAR.p+irhor,:);

        VAR.irs_t_m_noendo_real_ci_event   = irs_t_m_noendo_real_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_y_noendo_real_ci_event   = irs_t_y_noendo_real_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_p_noendo_real_ci_event   = irs_t_p_noendo_real_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_f_noendo_real_ci_event   = irs_t_f_noendo_real_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_mon_noendo_real_ci_event   = irs_t_mon_noendo_real_ci_event(VAR.p+1:VAR.p+irhor,:);

        VAR.irs_t_m_noendo_financial_ci_event   = irs_t_m_noendo_financial_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_y_noendo_financial_ci_event   = irs_t_y_noendo_financial_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_p_noendo_financial_ci_event   = irs_t_p_noendo_financial_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_f_noendo_financial_ci_event   = irs_t_f_noendo_financial_ci_event(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_mon_noendo_financial_ci_event   = irs_t_mon_noendo_financial_ci_event(VAR.p+1:VAR.p+irhor,:);

  
        IRS_stock_m_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_m_ci_event;
        IRS_stock_y_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_y_ci_event;
        IRS_stock_p_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_p_ci_event;
        IRS_stock_f_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_f_ci_event;
        IRS_stock_mon_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_mon_ci_event; 

        IRS_stock_m_noendo_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_m_noendo_ci_event;
        IRS_stock_y_noendo_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_y_noendo_ci_event;
        IRS_stock_p_noendo_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_p_noendo_ci_event;
        IRS_stock_f_noendo_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_f_noendo_ci_event;
        IRS_stock_mon_noendo_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_mon_noendo_ci_event;

        IRS_stock_m_noendo_real_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_m_noendo_real_ci_event;
        IRS_stock_y_noendo_real_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_y_noendo_real_ci_event;
        IRS_stock_p_noendo_real_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_p_noendo_real_ci_event;
        IRS_stock_f_noendo_real_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_f_noendo_real_ci_event;
        IRS_stock_mon_noendo_real_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_mon_noendo_real_ci_event;
        
        IRS_stock_m_noendo_financial_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_m_noendo_financial_ci_event;
        IRS_stock_y_noendo_financial_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_y_noendo_financial_ci_event;
        IRS_stock_p_noendo_financial_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_p_noendo_financial_ci_event;
        IRS_stock_f_noendo_financial_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_f_noendo_financial_ci_event;
        IRS_stock_mon_noendo_financial_ci_event(:,:,(ii-1)*nboot+jj) = VAR.irs_t_mon_noendo_financial_ci_event;
        
        jj=jj+1;
    end    

     %% Bootstrapping on samples passed event & correaltion constraint
    qqq=1;
    while qqq<nboot+1
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
        
        %% Correlation constraint: Event constraint is already passed        
        tmp_struc_e = VAR.res1*inv(Identified_B(:,:,ii)');

        if bekaert == 0
            tmp_q_real = zeros(151,1);
            for mm = 1:151
                for nn = 1:3
                    tmp_q_real(mm,1) = tmp_q_real(mm,1) + tmp_struc_e((mm-1)*3+nn+21-VAR.p,2);
                end
            end
        else
            tmp_q_real = zeros(107,1);
            for mm = 1:107
                for nn = 1:3
                    tmp_q_real(mm,1) = tmp_q_real(mm,1) + tmp_struc_e((mm-1)*3+nn+21-VAR.p,2);
                end
            end
        end  
        
        if bekaert == 0    
            [ak,bk] = size(tmp_struc_e);
            tt4 = ak-t4;
            tt5 = ak-t5;
        
            c_1f = corr(stock,tmp_struc_e(:,4));                               % financial uncertainty and stock returns
            c_1r = corr(stock,tmp_struc_e(:,1));                               % real uncertainty and stock returns
            c_2r = corr(gold,tmp_struc_e(:,1));                                % real uncertainty and gold price
            c_2f = corr(gold,tmp_struc_e(:,4));                                % financial uncertainty and gold price
            c_4m = corr(tmp_struc_e(end-t4:end-t5,5),monshock(tt4:tt5,1));     % monetary policy shock instrument
            c_5y1 = corr(tmp_q_real,real_proxy);
            c_5y2 = corr(tmp_q_real(2:end,1),real_proxy(1:150,1));
            c_5y3 = corr(tmp_q_real(1:150,1),real_proxy(2:151,1));
            c_5y = max([c_5y1, c_5y2, c_5y3]);  
            b_c = [c_1f c_1r c_2r c_2f c_4m c_5y]';                                       % overall corr    
        else                
            c_1f = corr(stock,tmp_struc_e(:,4));                               % financial uncertainty and stock returns
            c_1r = corr(stock,tmp_struc_e(:,1));                               % real uncertainty and stock returns
            c_2r = corr(gold,tmp_struc_e(:,1));                                % real uncertainty and gold price
            c_2f = corr(gold,tmp_struc_e(:,4));                                % financial uncertainty and gold price
            c_4m = corr(tmp_struc_e(187-VAR.p:end,5),monshock(187-VAR.p:342-VAR.p,1));
            c_5y1 = corr(tmp_q_real,real_proxy(1:107,1));
            c_5y2 = corr(tmp_q_real(2:end,1),real_proxy(1:106,1));
            c_5y3 = corr(tmp_q_real(1:106,1),real_proxy(2:107,1));
            c_5y = max([c_5y1, c_5y2, c_5y3]);
            b_c = [c_1f c_1r c_2r c_2f c_4m c_5y]';
        end        

        if c_1f <= k_c1f && c_1r <= k_c1r && c_2r >= k_c2r && c_2f >= k_c2f && c_4m > k_c4 && c_5y > k_c5y    % correlation criteria
            irs_t_m_ci_eventcorr(VAR.p+1,:) = Boot_B*[1 0 0 0 0]';
            irs_t_y_ci_eventcorr(VAR.p+1,:) = Boot_B*[0 1 0 0 0]';
            irs_t_p_ci_eventcorr(VAR.p+1,:) = Boot_B*[0 0 1 0 0]';
            irs_t_f_ci_eventcorr(VAR.p+1,:) = Boot_B*[0 0 0 1 0]';
            irs_t_mon_ci_eventcorr(VAR.p+1,:) = Boot_B*[0 0 0 0 1]';
    
            irs_t_m_noendo_ci_eventcorr(VAR.p+1,:) = B_noendo*[1 0 0 0 0]';
            irs_t_y_noendo_ci_eventcorr(VAR.p+1,:) = B_noendo*[0 1 0 0 0]';
            irs_t_p_noendo_ci_eventcorr(VAR.p+1,:) = B_noendo*[0 0 1 0 0]';
            irs_t_f_noendo_ci_eventcorr(VAR.p+1,:) = B_noendo*[0 0 0 1 0]';
            irs_t_mon_noendo_ci_eventcorr(VAR.p+1,:) = B_noendo*[0 0 0 0 1]';
            
            irs_t_m_noendo_real_ci_eventcorr(VAR.p+1,:) = B_noendo_real*[1 0 0 0 0]';
            irs_t_y_noendo_real_ci_eventcorr(VAR.p+1,:) = B_noendo_real*[0 1 0 0 0]';
            irs_t_p_noendo_real_ci_eventcorr(VAR.p+1,:) = B_noendo_real*[0 0 1 0 0]';
            irs_t_f_noendo_real_ci_eventcorr(VAR.p+1,:) = B_noendo_real*[0 0 0 1 0]';
            irs_t_mon_noendo_real_ci_eventcorr(VAR.p+1,:) = B_noendo_real*[0 0 0 0 1]';
            
            irs_t_m_noendo_financial_ci_eventcorr(VAR.p+1,:) = B_noendo_financial*[1 0 0 0 0]';
            irs_t_y_noendo_financial_ci_eventcorr(VAR.p+1,:) = B_noendo_financial*[0 1 0 0 0]';
            irs_t_p_noendo_financial_ci_eventcorr(VAR.p+1,:) = B_noendo_financial*[0 0 1 0 0]';
            irs_t_f_noendo_financial_ci_eventcorr(VAR.p+1,:) = B_noendo_financial*[0 0 0 1 0]';
            irs_t_mon_noendo_financial_ci_eventcorr(VAR.p+1,:) = B_noendo_financial*[0 0 0 0 1]';
        
            for jjj=2:irhor
                lvars_m_ci_eventcorr = (irs_t_m_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_y_ci_eventcorr = (irs_t_y_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_p_ci_eventcorr = (irs_t_p_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_f_ci_eventcorr = (irs_t_f_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_mon_ci_eventcorr = (irs_t_mon_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                irs_t_m_ci_eventcorr(VAR.p+jjj,:) = lvars_m_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_y_ci_eventcorr(VAR.p+jjj,:) = lvars_y_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_p_ci_eventcorr(VAR.p+jjj,:) = lvars_p_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_f_ci_eventcorr(VAR.p+jjj,:) = lvars_f_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_mon_ci_eventcorr(VAR.p+jjj,:) = lvars_mon_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);    
    
                lvars_m_noendo_ci_eventcorr = (irs_t_m_noendo_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_y_noendo_ci_eventcorr = (irs_t_y_noendo_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_p_noendo_ci_eventcorr = (irs_t_p_noendo_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_f_noendo_ci_eventcorr = (irs_t_f_noendo_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_mon_noendo_ci_eventcorr = (irs_t_mon_noendo_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                irs_t_m_noendo_ci_eventcorr(VAR.p+jjj,:) = lvars_m_noendo_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_y_noendo_ci_eventcorr(VAR.p+jjj,:) = lvars_y_noendo_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_p_noendo_ci_eventcorr(VAR.p+jjj,:) = lvars_p_noendo_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_f_noendo_ci_eventcorr(VAR.p+jjj,:) = lvars_f_noendo_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_mon_noendo_ci_eventcorr(VAR.p+jjj,:) = lvars_mon_noendo_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);  
    
                lvars_m_noendo_real_ci_eventcorr = (irs_t_m_noendo_real_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_y_noendo_real_ci_eventcorr = (irs_t_y_noendo_real_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_p_noendo_real_ci_eventcorr = (irs_t_p_noendo_real_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_f_noendo_real_ci_eventcorr = (irs_t_f_noendo_real_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_mon_noendo_real_ci_eventcorr = (irs_t_mon_noendo_real_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                irs_t_m_noendo_real_ci_eventcorr(VAR.p+jjj,:) = lvars_m_noendo_real_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_y_noendo_real_ci_eventcorr(VAR.p+jjj,:) = lvars_y_noendo_real_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_p_noendo_real_ci_eventcorr(VAR.p+jjj,:) = lvars_p_noendo_real_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_f_noendo_real_ci_eventcorr(VAR.p+jjj,:) = lvars_f_noendo_real_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_mon_noendo_real_ci_eventcorr(VAR.p+jjj,:) = lvars_mon_noendo_real_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
    
                lvars_m_noendo_financial_ci_eventcorr = (irs_t_m_noendo_financial_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_y_noendo_financial_ci_eventcorr = (irs_t_y_noendo_financial_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_p_noendo_financial_ci_eventcorr = (irs_t_p_noendo_financial_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_f_noendo_financial_ci_eventcorr = (irs_t_f_noendo_financial_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                lvars_mon_noendo_financial_ci_eventcorr = (irs_t_mon_noendo_financial_ci_eventcorr(VAR.p+jjj-1:-1:jjj,:))';
                irs_t_m_noendo_financial_ci_eventcorr(VAR.p+jjj,:) = lvars_m_noendo_financial_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_y_noendo_financial_ci_eventcorr(VAR.p+jjj,:) = lvars_y_noendo_financial_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_p_noendo_financial_ci_eventcorr(VAR.p+jjj,:) = lvars_p_noendo_financial_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_f_noendo_financial_ci_eventcorr(VAR.p+jjj,:) = lvars_f_noendo_financial_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
                irs_t_mon_noendo_financial_ci_eventcorr(VAR.p+jjj,:) = lvars_mon_noendo_financial_ci_eventcorr(:)'*VAR.bet1(1:VAR.p*VAR.n,:);
            end     

            VAR.irs_t_m_ci_eventcorr   = irs_t_m_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_y_ci_eventcorr   = irs_t_y_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_p_ci_eventcorr   = irs_t_p_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_f_ci_eventcorr   = irs_t_f_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_mon_ci_eventcorr   = irs_t_mon_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
    
            VAR.irs_t_m_noendo_ci_eventcorr   = irs_t_m_noendo_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_y_noendo_ci_eventcorr   = irs_t_y_noendo_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_p_noendo_ci_eventcorr   = irs_t_p_noendo_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_f_noendo_ci_eventcorr   = irs_t_f_noendo_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_mon_noendo_ci_eventcorr   = irs_t_mon_noendo_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
    
            VAR.irs_t_m_noendo_real_ci_eventcorr   = irs_t_m_noendo_real_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_y_noendo_real_ci_eventcorr   = irs_t_y_noendo_real_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_p_noendo_real_ci_eventcorr   = irs_t_p_noendo_real_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_f_noendo_real_ci_eventcorr   = irs_t_f_noendo_real_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_mon_noendo_real_ci_eventcorr   = irs_t_mon_noendo_real_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
    
            VAR.irs_t_m_noendo_financial_ci_eventcorr   = irs_t_m_noendo_financial_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_y_noendo_financial_ci_eventcorr   = irs_t_y_noendo_financial_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_p_noendo_financial_ci_eventcorr   = irs_t_p_noendo_financial_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_f_noendo_financial_ci_eventcorr   = irs_t_f_noendo_financial_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
            VAR.irs_t_mon_noendo_financial_ci_eventcorr   = irs_t_mon_noendo_financial_ci_eventcorr(VAR.p+1:VAR.p+irhor,:);
    
            IRS_stock_m_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_m_ci_eventcorr;
            IRS_stock_y_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_y_ci_eventcorr;
            IRS_stock_p_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_p_ci_eventcorr;
            IRS_stock_f_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_f_ci_eventcorr;
            IRS_stock_mon_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_mon_ci_eventcorr; 
    
            IRS_stock_m_noendo_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_m_noendo_ci_eventcorr;
            IRS_stock_y_noendo_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_y_noendo_ci_eventcorr;
            IRS_stock_p_noendo_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_p_noendo_ci_eventcorr;
            IRS_stock_f_noendo_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_f_noendo_ci_eventcorr;
            IRS_stock_mon_noendo_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_mon_noendo_ci_eventcorr;
    
            IRS_stock_m_noendo_financial_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_m_noendo_financial_ci_eventcorr;
            IRS_stock_y_noendo_financial_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_y_noendo_financial_ci_eventcorr;
            IRS_stock_p_noendo_financial_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_p_noendo_financial_ci_eventcorr;
            IRS_stock_f_noendo_financial_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_f_noendo_financial_ci_eventcorr;
            IRS_stock_mon_noendo_financial_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_mon_noendo_financial_ci_eventcorr;
            
            IRS_stock_m_noendo_real_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_m_noendo_real_ci_eventcorr;
            IRS_stock_y_noendo_real_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_y_noendo_real_ci_eventcorr;
            IRS_stock_p_noendo_real_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_p_noendo_real_ci_eventcorr;
            IRS_stock_f_noendo_real_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_f_noendo_real_ci_eventcorr;
            IRS_stock_mon_noendo_real_ci_eventcorr(:,:,(ii-1)*nboot+qqq) = VAR.irs_t_mon_noendo_real_ci_eventcorr;
            qqq=qqq+1;
            disp('passed')
        end
    end   
end


%% 90% CI
IRS_stock_m_ci_eventcorr_max2 = quantile(IRS_stock_m_ci_eventcorr,1-ci_p/2,3);
IRS_stock_m_ci_eventcorr_min2 = quantile(IRS_stock_m_ci_eventcorr,ci_p/2,3);
IRS_stock_y_ci_eventcorr_max2 = quantile(IRS_stock_y_ci_eventcorr,1-ci_p/2,3);
IRS_stock_y_ci_eventcorr_min2 = quantile(IRS_stock_y_ci_eventcorr,ci_p/2,3);
IRS_stock_p_ci_eventcorr_max2 = quantile(IRS_stock_p_ci_eventcorr,1-ci_p/2,3);
IRS_stock_p_ci_eventcorr_min2 = quantile(IRS_stock_p_ci_eventcorr,ci_p/2,3);
IRS_stock_f_ci_eventcorr_max2 = quantile(IRS_stock_f_ci_eventcorr,1-ci_p/2,3);
IRS_stock_f_ci_eventcorr_min2 = quantile(IRS_stock_f_ci_eventcorr,ci_p/2,3);
IRS_stock_mon_ci_eventcorr_max2 = quantile(IRS_stock_mon_ci_eventcorr,1-ci_p/2,3);
IRS_stock_mon_ci_eventcorr_min2 = quantile(IRS_stock_mon_ci_eventcorr,ci_p/2,3);

IRS_stock_m_ci_event_max2 = quantile(IRS_stock_m_ci_event,1-ci_p/2,3);
IRS_stock_m_ci_event_min2 = quantile(IRS_stock_m_ci_event,ci_p/2,3);
IRS_stock_y_ci_event_max2 = quantile(IRS_stock_y_ci_event,1-ci_p/2,3);
IRS_stock_y_ci_event_min2 = quantile(IRS_stock_y_ci_event,ci_p/2,3);
IRS_stock_p_ci_event_max2 = quantile(IRS_stock_p_ci_event,1-ci_p/2,3);
IRS_stock_p_ci_event_min2 = quantile(IRS_stock_p_ci_event,ci_p/2,3);
IRS_stock_f_ci_event_max2 = quantile(IRS_stock_f_ci_event,1-ci_p/2,3);
IRS_stock_f_ci_event_min2 = quantile(IRS_stock_f_ci_event,ci_p/2,3);
IRS_stock_mon_ci_event_max2 = quantile(IRS_stock_mon_ci_event,1-ci_p/2,3);
IRS_stock_mon_ci_event_min2 = quantile(IRS_stock_mon_ci_event,ci_p/2,3);

IRS_stock_m_noendo_ci_eventcorr_max2 = quantile(IRS_stock_m_noendo_ci_eventcorr,1-ci_p/2,3);
IRS_stock_m_noendo_ci_eventcorr_min2 = quantile(IRS_stock_m_noendo_ci_eventcorr,ci_p/2,3);
IRS_stock_y_noendo_ci_eventcorr_max2 = quantile(IRS_stock_y_noendo_ci_eventcorr,1-ci_p/2,3);
IRS_stock_y_noendo_ci_eventcorr_min2 = quantile(IRS_stock_y_noendo_ci_eventcorr,ci_p/2,3);
IRS_stock_p_noendo_ci_eventcorr_max2 = quantile(IRS_stock_p_noendo_ci_eventcorr,1-ci_p/2,3);
IRS_stock_p_noendo_ci_eventcorr_min2 = quantile(IRS_stock_p_noendo_ci_eventcorr,ci_p/2,3);
IRS_stock_f_noendo_ci_eventcorr_max2 = quantile(IRS_stock_f_noendo_ci_eventcorr,1-ci_p/2,3);
IRS_stock_f_noendo_ci_eventcorr_min2 = quantile(IRS_stock_f_noendo_ci_eventcorr,ci_p/2,3);
IRS_stock_mon_noendo_ci_eventcorr_max2 = quantile(IRS_stock_mon_noendo_ci_eventcorr,1-ci_p/2,3);
IRS_stock_mon_noendo_ci_eventcorr_min2 = quantile(IRS_stock_mon_noendo_ci_eventcorr,ci_p/2,3);

IRS_stock_m_noendo_ci_event_max2 = quantile(IRS_stock_m_noendo_ci_event,1-ci_p/2,3);
IRS_stock_m_noendo_ci_event_min2 = quantile(IRS_stock_m_noendo_ci_event,ci_p/2,3);
IRS_stock_y_noendo_ci_event_max2 = quantile(IRS_stock_y_noendo_ci_event,1-ci_p/2,3);
IRS_stock_y_noendo_ci_event_min2 = quantile(IRS_stock_y_noendo_ci_event,ci_p/2,3);
IRS_stock_p_noendo_ci_event_max2 = quantile(IRS_stock_p_noendo_ci_event,1-ci_p/2,3);
IRS_stock_p_noendo_ci_event_min2 = quantile(IRS_stock_p_noendo_ci_event,ci_p/2,3);
IRS_stock_f_noendo_ci_event_max2 = quantile(IRS_stock_f_noendo_ci_event,1-ci_p/2,3);
IRS_stock_f_noendo_ci_event_min2 = quantile(IRS_stock_f_noendo_ci_event,ci_p/2,3);
IRS_stock_mon_noendo_ci_event_max2 = quantile(IRS_stock_mon_noendo_ci_event,1-ci_p/2,3);
IRS_stock_mon_noendo_ci_event_min2 = quantile(IRS_stock_mon_noendo_ci_event,ci_p/2,3);

IRS_stock_m_noendo_real_ci_eventcorr_max2 = quantile(IRS_stock_m_noendo_real_ci_eventcorr,1-ci_p/2,3);
IRS_stock_m_noendo_real_ci_eventcorr_min2 = quantile(IRS_stock_m_noendo_real_ci_eventcorr,ci_p/2,3);
IRS_stock_y_noendo_real_ci_eventcorr_max2 = quantile(IRS_stock_y_noendo_real_ci_eventcorr,1-ci_p/2,3);
IRS_stock_y_noendo_real_ci_eventcorr_min2 = quantile(IRS_stock_y_noendo_real_ci_eventcorr,ci_p/2,3);
IRS_stock_p_noendo_real_ci_eventcorr_max2 = quantile(IRS_stock_p_noendo_real_ci_eventcorr,1-ci_p/2,3);
IRS_stock_p_noendo_real_ci_eventcorr_min2 = quantile(IRS_stock_p_noendo_real_ci_eventcorr,ci_p/2,3);
IRS_stock_f_noendo_real_ci_eventcorr_max2 = quantile(IRS_stock_f_noendo_real_ci_eventcorr,1-ci_p/2,3);
IRS_stock_f_noendo_real_ci_eventcorr_min2 = quantile(IRS_stock_f_noendo_real_ci_eventcorr,ci_p/2,3);
IRS_stock_mon_noendo_real_ci_eventcorr_max2 = quantile(IRS_stock_mon_noendo_real_ci_eventcorr,1-ci_p/2,3);
IRS_stock_mon_noendo_real_ci_eventcorr_min2 = quantile(IRS_stock_mon_noendo_real_ci_eventcorr,ci_p/2,3);

IRS_stock_m_noendo_real_ci_event_max2 = quantile(IRS_stock_m_noendo_real_ci_event,1-ci_p/2,3);
IRS_stock_m_noendo_real_ci_event_min2 = quantile(IRS_stock_m_noendo_real_ci_event,ci_p/2,3);
IRS_stock_y_noendo_real_ci_event_max2 = quantile(IRS_stock_y_noendo_real_ci_event,1-ci_p/2,3);
IRS_stock_y_noendo_real_ci_event_min2 = quantile(IRS_stock_y_noendo_real_ci_event,ci_p/2,3);
IRS_stock_p_noendo_real_ci_event_max2 = quantile(IRS_stock_p_noendo_real_ci_event,1-ci_p/2,3);
IRS_stock_p_noendo_real_ci_event_min2 = quantile(IRS_stock_p_noendo_real_ci_event,ci_p/2,3);
IRS_stock_f_noendo_real_ci_event_max2 = quantile(IRS_stock_f_noendo_real_ci_event,1-ci_p/2,3);
IRS_stock_f_noendo_real_ci_event_min2 = quantile(IRS_stock_f_noendo_real_ci_event,ci_p/2,3);
IRS_stock_mon_noendo_real_ci_event_max2 = quantile(IRS_stock_mon_noendo_real_ci_event,1-ci_p/2,3);
IRS_stock_mon_noendo_real_ci_event_min2 = quantile(IRS_stock_mon_noendo_real_ci_event,ci_p/2,3);

IRS_stock_m_noendo_financial_ci_eventcorr_max2 = quantile(IRS_stock_m_noendo_financial_ci_eventcorr,1-ci_p/2,3);
IRS_stock_m_noendo_financial_ci_eventcorr_min2 = quantile(IRS_stock_m_noendo_financial_ci_eventcorr,ci_p/2,3);
IRS_stock_y_noendo_financial_ci_eventcorr_max2 = quantile(IRS_stock_y_noendo_financial_ci_eventcorr,1-ci_p/2,3);
IRS_stock_y_noendo_financial_ci_eventcorr_min2 = quantile(IRS_stock_y_noendo_financial_ci_eventcorr,ci_p/2,3);
IRS_stock_p_noendo_financial_ci_eventcorr_max2 = quantile(IRS_stock_p_noendo_financial_ci_eventcorr,1-ci_p/2,3);
IRS_stock_p_noendo_financial_ci_eventcorr_min2 = quantile(IRS_stock_p_noendo_financial_ci_eventcorr,ci_p/2,3);
IRS_stock_f_noendo_financial_ci_eventcorr_max2 = quantile(IRS_stock_f_noendo_financial_ci_eventcorr,1-ci_p/2,3);
IRS_stock_f_noendo_financial_ci_eventcorr_min2 = quantile(IRS_stock_f_noendo_financial_ci_eventcorr,ci_p/2,3);
IRS_stock_mon_noendo_financial_ci_eventcorr_max2 = quantile(IRS_stock_mon_noendo_financial_ci_eventcorr,1-ci_p/2,3);
IRS_stock_mon_noendo_financial_ci_eventcorr_min2 = quantile(IRS_stock_mon_noendo_financial_ci_eventcorr,ci_p/2,3);

IRS_stock_m_noendo_financial_ci_event_max2 = quantile(IRS_stock_m_noendo_financial_ci_event,1-ci_p/2,3);
IRS_stock_m_noendo_financial_ci_event_min2 = quantile(IRS_stock_m_noendo_financial_ci_event,ci_p/2,3);
IRS_stock_y_noendo_financial_ci_event_max2 = quantile(IRS_stock_y_noendo_financial_ci_event,1-ci_p/2,3);
IRS_stock_y_noendo_financial_ci_event_min2 = quantile(IRS_stock_y_noendo_financial_ci_event,ci_p/2,3);
IRS_stock_p_noendo_financial_ci_event_max2 = quantile(IRS_stock_p_noendo_financial_ci_event,1-ci_p/2,3);
IRS_stock_p_noendo_financial_ci_event_min2 = quantile(IRS_stock_p_noendo_financial_ci_event,ci_p/2,3);
IRS_stock_f_noendo_financial_ci_event_max2 = quantile(IRS_stock_f_noendo_financial_ci_event,1-ci_p/2,3);
IRS_stock_f_noendo_financial_ci_event_min2 = quantile(IRS_stock_f_noendo_financial_ci_event,ci_p/2,3);
IRS_stock_mon_noendo_financial_ci_event_max2 = quantile(IRS_stock_mon_noendo_financial_ci_event,1-ci_p/2,3);
IRS_stock_mon_noendo_financial_ci_event_min2 = quantile(IRS_stock_mon_noendo_financial_ci_event,ci_p/2,3);

%% 68% CI
IRS_stock_m_ci_eventcorr_max1 = quantile(IRS_stock_m_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_m_ci_eventcorr_min1 = quantile(IRS_stock_m_ci_eventcorr,ci_p1/2,3);
IRS_stock_y_ci_eventcorr_max1 = quantile(IRS_stock_y_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_y_ci_eventcorr_min1 = quantile(IRS_stock_y_ci_eventcorr,ci_p1/2,3);
IRS_stock_p_ci_eventcorr_max1 = quantile(IRS_stock_p_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_p_ci_eventcorr_min1 = quantile(IRS_stock_p_ci_eventcorr,ci_p1/2,3);
IRS_stock_f_ci_eventcorr_max1 = quantile(IRS_stock_f_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_f_ci_eventcorr_min1 = quantile(IRS_stock_f_ci_eventcorr,ci_p1/2,3);
IRS_stock_mon_ci_eventcorr_max1 = quantile(IRS_stock_mon_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_mon_ci_eventcorr_min1 = quantile(IRS_stock_mon_ci_eventcorr,ci_p1/2,3);

IRS_stock_m_ci_event_max1 = quantile(IRS_stock_m_ci_event,1-ci_p1/2,3);
IRS_stock_m_ci_event_min1 = quantile(IRS_stock_m_ci_event,ci_p1/2,3);
IRS_stock_y_ci_event_max1 = quantile(IRS_stock_y_ci_event,1-ci_p1/2,3);
IRS_stock_y_ci_event_min1 = quantile(IRS_stock_y_ci_event,ci_p1/2,3);
IRS_stock_p_ci_event_max1 = quantile(IRS_stock_p_ci_event,1-ci_p1/2,3);
IRS_stock_p_ci_event_min1 = quantile(IRS_stock_p_ci_event,ci_p1/2,3);
IRS_stock_f_ci_event_max1 = quantile(IRS_stock_f_ci_event,1-ci_p1/2,3);
IRS_stock_f_ci_event_min1 = quantile(IRS_stock_f_ci_event,ci_p1/2,3);
IRS_stock_mon_ci_event_max1 = quantile(IRS_stock_mon_ci_event,1-ci_p1/2,3);
IRS_stock_mon_ci_event_min1 = quantile(IRS_stock_mon_ci_event,ci_p1/2,3);

IRS_stock_m_noendo_ci_eventcorr_max1 = quantile(IRS_stock_m_noendo_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_m_noendo_ci_eventcorr_min1 = quantile(IRS_stock_m_noendo_ci_eventcorr,ci_p1/2,3);
IRS_stock_y_noendo_ci_eventcorr_max1 = quantile(IRS_stock_y_noendo_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_y_noendo_ci_eventcorr_min1 = quantile(IRS_stock_y_noendo_ci_eventcorr,ci_p1/2,3);
IRS_stock_p_noendo_ci_eventcorr_max1 = quantile(IRS_stock_p_noendo_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_p_noendo_ci_eventcorr_min1 = quantile(IRS_stock_p_noendo_ci_eventcorr,ci_p1/2,3);
IRS_stock_f_noendo_ci_eventcorr_max1 = quantile(IRS_stock_f_noendo_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_f_noendo_ci_eventcorr_min1 = quantile(IRS_stock_f_noendo_ci_eventcorr,ci_p1/2,3);
IRS_stock_mon_noendo_ci_eventcorr_max1 = quantile(IRS_stock_mon_noendo_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_mon_noendo_ci_eventcorr_min1 = quantile(IRS_stock_mon_noendo_ci_eventcorr,ci_p1/2,3);

IRS_stock_m_noendo_ci_event_max1 = quantile(IRS_stock_m_noendo_ci_event,1-ci_p1/2,3);
IRS_stock_m_noendo_ci_event_min1 = quantile(IRS_stock_m_noendo_ci_event,ci_p1/2,3);
IRS_stock_y_noendo_ci_event_max1 = quantile(IRS_stock_y_noendo_ci_event,1-ci_p1/2,3);
IRS_stock_y_noendo_ci_event_min1 = quantile(IRS_stock_y_noendo_ci_event,ci_p1/2,3);
IRS_stock_p_noendo_ci_event_max1 = quantile(IRS_stock_p_noendo_ci_event,1-ci_p1/2,3);
IRS_stock_p_noendo_ci_event_min1 = quantile(IRS_stock_p_noendo_ci_event,ci_p1/2,3);
IRS_stock_f_noendo_ci_event_max1 = quantile(IRS_stock_f_noendo_ci_event,1-ci_p1/2,3);
IRS_stock_f_noendo_ci_event_min1 = quantile(IRS_stock_f_noendo_ci_event,ci_p1/2,3);
IRS_stock_mon_noendo_ci_event_max1 = quantile(IRS_stock_mon_noendo_ci_event,1-ci_p1/2,3);
IRS_stock_mon_noendo_ci_event_min1 = quantile(IRS_stock_mon_noendo_ci_event,ci_p1/2,3);

IRS_stock_m_noendo_real_ci_eventcorr_max1 = quantile(IRS_stock_m_noendo_real_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_m_noendo_real_ci_eventcorr_min1 = quantile(IRS_stock_m_noendo_real_ci_eventcorr,ci_p1/2,3);
IRS_stock_y_noendo_real_ci_eventcorr_max1 = quantile(IRS_stock_y_noendo_real_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_y_noendo_real_ci_eventcorr_min1 = quantile(IRS_stock_y_noendo_real_ci_eventcorr,ci_p1/2,3);
IRS_stock_p_noendo_real_ci_eventcorr_max1 = quantile(IRS_stock_p_noendo_real_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_p_noendo_real_ci_eventcorr_min1 = quantile(IRS_stock_p_noendo_real_ci_eventcorr,ci_p1/2,3);
IRS_stock_f_noendo_real_ci_eventcorr_max1 = quantile(IRS_stock_f_noendo_real_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_f_noendo_real_ci_eventcorr_min1 = quantile(IRS_stock_f_noendo_real_ci_eventcorr,ci_p1/2,3);
IRS_stock_mon_noendo_real_ci_eventcorr_max1 = quantile(IRS_stock_mon_noendo_real_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_mon_noendo_real_ci_eventcorr_min1 = quantile(IRS_stock_mon_noendo_real_ci_eventcorr,ci_p1/2,3);

IRS_stock_m_noendo_real_ci_event_max1 = quantile(IRS_stock_m_noendo_real_ci_event,1-ci_p1/2,3);
IRS_stock_m_noendo_real_ci_event_min1 = quantile(IRS_stock_m_noendo_real_ci_event,ci_p1/2,3);
IRS_stock_y_noendo_real_ci_event_max1 = quantile(IRS_stock_y_noendo_real_ci_event,1-ci_p1/2,3);
IRS_stock_y_noendo_real_ci_event_min1 = quantile(IRS_stock_y_noendo_real_ci_event,ci_p1/2,3);
IRS_stock_p_noendo_real_ci_event_max1 = quantile(IRS_stock_p_noendo_real_ci_event,1-ci_p1/2,3);
IRS_stock_p_noendo_real_ci_event_min1 = quantile(IRS_stock_p_noendo_real_ci_event,ci_p1/2,3);
IRS_stock_f_noendo_real_ci_event_max1 = quantile(IRS_stock_f_noendo_real_ci_event,1-ci_p1/2,3);
IRS_stock_f_noendo_real_ci_event_min1 = quantile(IRS_stock_f_noendo_real_ci_event,ci_p1/2,3);
IRS_stock_mon_noendo_real_ci_event_max1 = quantile(IRS_stock_mon_noendo_real_ci_event,1-ci_p1/2,3);
IRS_stock_mon_noendo_real_ci_event_min1 = quantile(IRS_stock_mon_noendo_real_ci_event,ci_p1/2,3);

IRS_stock_m_noendo_financial_ci_eventcorr_max1 = quantile(IRS_stock_m_noendo_financial_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_m_noendo_financial_ci_eventcorr_min1 = quantile(IRS_stock_m_noendo_financial_ci_eventcorr,ci_p1/2,3);
IRS_stock_y_noendo_financial_ci_eventcorr_max1 = quantile(IRS_stock_y_noendo_financial_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_y_noendo_financial_ci_eventcorr_min1 = quantile(IRS_stock_y_noendo_financial_ci_eventcorr,ci_p1/2,3);
IRS_stock_p_noendo_financial_ci_eventcorr_max1 = quantile(IRS_stock_p_noendo_financial_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_p_noendo_financial_ci_eventcorr_min1 = quantile(IRS_stock_p_noendo_financial_ci_eventcorr,ci_p1/2,3);
IRS_stock_f_noendo_financial_ci_eventcorr_max1 = quantile(IRS_stock_f_noendo_financial_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_f_noendo_financial_ci_eventcorr_min1 = quantile(IRS_stock_f_noendo_financial_ci_eventcorr,ci_p1/2,3);
IRS_stock_mon_noendo_financial_ci_eventcorr_max1 = quantile(IRS_stock_mon_noendo_financial_ci_eventcorr,1-ci_p1/2,3);
IRS_stock_mon_noendo_financial_ci_eventcorr_min1 = quantile(IRS_stock_mon_noendo_financial_ci_eventcorr,ci_p1/2,3);

IRS_stock_m_noendo_financial_ci_event_max1 = quantile(IRS_stock_m_noendo_financial_ci_event,1-ci_p1/2,3);
IRS_stock_m_noendo_financial_ci_event_min1 = quantile(IRS_stock_m_noendo_financial_ci_event,ci_p1/2,3);
IRS_stock_y_noendo_financial_ci_event_max1 = quantile(IRS_stock_y_noendo_financial_ci_event,1-ci_p1/2,3);
IRS_stock_y_noendo_financial_ci_event_min1 = quantile(IRS_stock_y_noendo_financial_ci_event,ci_p1/2,3);
IRS_stock_p_noendo_financial_ci_event_max1 = quantile(IRS_stock_p_noendo_financial_ci_event,1-ci_p1/2,3);
IRS_stock_p_noendo_financial_ci_event_min1 = quantile(IRS_stock_p_noendo_financial_ci_event,ci_p1/2,3);
IRS_stock_f_noendo_financial_ci_event_max1 = quantile(IRS_stock_f_noendo_financial_ci_event,1-ci_p1/2,3);
IRS_stock_f_noendo_financial_ci_event_min1 = quantile(IRS_stock_f_noendo_financial_ci_event,ci_p1/2,3);
IRS_stock_mon_noendo_financial_ci_event_max1 = quantile(IRS_stock_mon_noendo_financial_ci_event,1-ci_p1/2,3);
IRS_stock_mon_noendo_financial_ci_event_min1 = quantile(IRS_stock_mon_noendo_financial_ci_event,ci_p1/2,3);

