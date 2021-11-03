%% Impulse Responses
% generating IRFs w/wo endogeneity
b_c_crit_old=0;                                                        % for max-C solution

for i=1:num_B	
    
	irs_t_m(VAR.p+1,:) = Identified_B(:,:,i)*[1 0 0 0 0]';
	irs_t_y(VAR.p+1,:) = Identified_B(:,:,i)*[0 1 0 0 0]';
	irs_t_p(VAR.p+1,:) = Identified_B(:,:,i)*[0 0 1 0 0]';
    irs_t_f(VAR.p+1,:) = Identified_B(:,:,i)*[0 0 0 1 0]';
	irs_t_mon(VAR.p+1,:) = Identified_B(:,:,i)*[0 0 0 0 1]';
	
	% _noendo -> shutting off contemporaneous feedbacks
	
	B_noendo = Identified_B(:,:,i);
	B_noendo(1,2:5) = [0 0 0 0];      % shut down responses of real uncertainty
	B_noendo(4,1:3) = [0 0 0];        % shut down responses of financial uncertainty
	B_noendo(4,5) = 0;
	
	% _noendeo_x -> shutting off contemporaneous responses of x
	% uncertainty
	B_noendo_real=Identified_B(:,:,i); B_noendo_financial=Identified_B(:,:,i);            
	B_noendo_real(1,2:5)=[0 0 0 0];
	B_noendo_financial(4,1:3) = [0 0 0];        
	B_noendo_financial(4,5) = 0;
		
	irs_t_m_noendo(VAR.p+1,:) = B_noendo*[1 0 0 0 0]';
	irs_t_y_noendo(VAR.p+1,:) = B_noendo*[0 1 0 0 0]';
    irs_t_p_noendo(VAR.p+1,:) = B_noendo*[0 0 1 0 0]';
	irs_t_f_noendo(VAR.p+1,:) = B_noendo*[0 0 0 1 0]';
	irs_t_mon_noendo(VAR.p+1,:) = B_noendo*[0 0 0 0 1]';
	
	irs_t_m_noendo_real(VAR.p+1,:) = B_noendo_real*[1 0 0 0 0]';
	irs_t_y_noendo_real(VAR.p+1,:) = B_noendo_real*[0 1 0 0 0]';
    irs_t_p_noendo_real(VAR.p+1,:) = B_noendo_real*[0 0 1 0 0]';
	irs_t_f_noendo_real(VAR.p+1,:) = B_noendo_real*[0 0 0 1 0]';
	irs_t_mon_noendo_real(VAR.p+1,:) = B_noendo_real*[0 0 0 0 1]';
	
	irs_t_m_noendo_financial(VAR.p+1,:) = B_noendo_financial*[1 0 0 0 0]';
	irs_t_y_noendo_financial(VAR.p+1,:) = B_noendo_financial*[0 1 0 0 0]';
    irs_t_p_noendo_financial(VAR.p+1,:) = B_noendo_financial*[0 0 1 0 0]';
	irs_t_f_noendo_financial(VAR.p+1,:) = B_noendo_financial*[0 0 0 1 0]';
	irs_t_mon_noendo_financial(VAR.p+1,:) = B_noendo_financial*[0 0 0 0 1]';
	
	VAR.bet_noendo = VAR.bet;
	VAR.bet_noendo_real = VAR.bet;
	VAR.bet_noendo_financial = VAR.bet;
	
	for jj=2:irhor
	    lvars_m = (irs_t_m(VAR.p+jj-1:-1:jj,:))';
	    lvars_y = (irs_t_y(VAR.p+jj-1:-1:jj,:))';
        lvars_p = (irs_t_p(VAR.p+jj-1:-1:jj,:))';
	    lvars_f = (irs_t_f(VAR.p+jj-1:-1:jj,:))';
	    lvars_mon = (irs_t_mon(VAR.p+jj-1:-1:jj,:))';
	    irs_t_m(VAR.p+jj,:) = lvars_m(:)'*VAR.bet(1:VAR.p*VAR.n,:);
	    irs_t_y(VAR.p+jj,:) = lvars_y(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_p(VAR.p+jj,:) = lvars_p(:)'*VAR.bet(1:VAR.p*VAR.n,:);
	    irs_t_f(VAR.p+jj,:) = lvars_f(:)'*VAR.bet(1:VAR.p*VAR.n,:);
	    irs_t_mon(VAR.p+jj,:) = lvars_mon(:)'*VAR.bet(1:VAR.p*VAR.n,:);
	    
	    lvars_m_noendo = (irs_t_m_noendo(VAR.p+jj-1:-1:jj,:))';
	    lvars_y_noendo = (irs_t_y_noendo(VAR.p+jj-1:-1:jj,:))';
        lvars_p_noendo = (irs_t_p_noendo(VAR.p+jj-1:-1:jj,:))';
	    lvars_f_noendo = (irs_t_f_noendo(VAR.p+jj-1:-1:jj,:))';
	    lvars_mon_noendo = (irs_t_mon_noendo(VAR.p+jj-1:-1:jj,:))';
	    irs_t_m_noendo(VAR.p+jj,:) = lvars_m_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
	    irs_t_y_noendo(VAR.p+jj,:) = lvars_y_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
        irs_t_p_noendo(VAR.p+jj,:) = lvars_p_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
	    irs_t_f_noendo(VAR.p+jj,:) = lvars_f_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
	    irs_t_mon_noendo(VAR.p+jj,:) = lvars_mon_noendo(:)'*VAR.bet_noendo(1:VAR.p*VAR.n,:);
	    
	    lvars_m_noendo_real = (irs_t_m_noendo_real(VAR.p+jj-1:-1:jj,:))';
	    lvars_y_noendo_real = (irs_t_y_noendo_real(VAR.p+jj-1:-1:jj,:))';
        lvars_p_noendo_real = (irs_t_p_noendo_real(VAR.p+jj-1:-1:jj,:))';
	    lvars_f_noendo_real = (irs_t_f_noendo_real(VAR.p+jj-1:-1:jj,:))';
	    lvars_mon_noendo_real = (irs_t_mon_noendo_real(VAR.p+jj-1:-1:jj,:))';
	    irs_t_m_noendo_real(VAR.p+jj,:) = lvars_m_noendo_real(:)'*VAR.bet_noendo_real(1:VAR.p*VAR.n,:);
	    irs_t_y_noendo_real(VAR.p+jj,:) = lvars_y_noendo_real(:)'*VAR.bet_noendo_real(1:VAR.p*VAR.n,:);
        irs_t_p_noendo_real(VAR.p+jj,:) = lvars_p_noendo_real(:)'*VAR.bet_noendo_real(1:VAR.p*VAR.n,:);
	    irs_t_f_noendo_real(VAR.p+jj,:) = lvars_f_noendo_real(:)'*VAR.bet_noendo_real(1:VAR.p*VAR.n,:);
	    irs_t_mon_noendo_real(VAR.p+jj,:) = lvars_mon_noendo_real(:)'*VAR.bet_noendo_real(1:VAR.p*VAR.n,:);
	    
	    lvars_m_noendo_financial = (irs_t_m_noendo_financial(VAR.p+jj-1:-1:jj,:))';
	    lvars_y_noendo_financial = (irs_t_y_noendo_financial(VAR.p+jj-1:-1:jj,:))';
        lvars_p_noendo_financial = (irs_t_p_noendo_financial(VAR.p+jj-1:-1:jj,:))';
	    lvars_f_noendo_financial = (irs_t_f_noendo_financial(VAR.p+jj-1:-1:jj,:))';
	    lvars_mon_noendo_financial = (irs_t_mon_noendo_financial(VAR.p+jj-1:-1:jj,:))';
	    irs_t_m_noendo_financial(VAR.p+jj,:) = lvars_m_noendo_financial(:)'*VAR.bet_noendo_financial(1:VAR.p*VAR.n,:);
	    irs_t_y_noendo_financial(VAR.p+jj,:) = lvars_y_noendo_financial(:)'*VAR.bet_noendo_financial(1:VAR.p*VAR.n,:);
        irs_t_p_noendo_financial(VAR.p+jj,:) = lvars_p_noendo_financial(:)'*VAR.bet_noendo_financial(1:VAR.p*VAR.n,:);
	    irs_t_f_noendo_financial(VAR.p+jj,:) = lvars_f_noendo_financial(:)'*VAR.bet_noendo_financial(1:VAR.p*VAR.n,:);
	    irs_t_mon_noendo_financial(VAR.p+jj,:) = lvars_mon_noendo_financial(:)'*VAR.bet_noendo_financial(1:VAR.p*VAR.n,:);    
	end

	VAR.irs_t_m   = irs_t_m(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_y   = irs_t_y(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_p   = irs_t_p(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_f   = irs_t_f(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_mon   = irs_t_mon(VAR.p+1:VAR.p+irhor,:);
	
	VAR.irs_t_m_noendo   = irs_t_m_noendo(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_y_noendo   = irs_t_y_noendo(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_p_noendo   = irs_t_p_noendo(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_f_noendo   = irs_t_f_noendo(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_mon_noendo   = irs_t_mon_noendo(VAR.p+1:VAR.p+irhor,:);
	
	VAR.irs_t_m_noendo_real   = irs_t_m_noendo_real(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_y_noendo_real   = irs_t_y_noendo_real(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_p_noendo_real   = irs_t_p_noendo_real(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_f_noendo_real   = irs_t_f_noendo_real(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_mon_noendo_real   = irs_t_mon_noendo_real(VAR.p+1:VAR.p+irhor,:);
	
	VAR.irs_t_m_noendo_financial   = irs_t_m_noendo_financial(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_y_noendo_financial   = irs_t_y_noendo_financial(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_p_noendo_financial   = irs_t_p_noendo_financial(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_f_noendo_financial   = irs_t_f_noendo_financial(VAR.p+1:VAR.p+irhor,:);
	VAR.irs_t_mon_noendo_financial   = irs_t_mon_noendo_financial(VAR.p+1:VAR.p+irhor,:);
	
	
	IRS_stock_m(:,:,i) = VAR.irs_t_m;
	IRS_stock_y(:,:,i) = VAR.irs_t_y;
    IRS_stock_p(:,:,i) = VAR.irs_t_p;
	IRS_stock_f(:,:,i) = VAR.irs_t_f;
	IRS_stock_mon(:,:,i) = VAR.irs_t_mon;

	IRS_stock_m_noendo(:,:,i) = VAR.irs_t_m_noendo;
	IRS_stock_y_noendo(:,:,i) = VAR.irs_t_y_noendo;
    IRS_stock_p_noendo(:,:,i) = VAR.irs_t_p_noendo;
	IRS_stock_f_noendo(:,:,i) = VAR.irs_t_f_noendo;
	IRS_stock_mon_noendo(:,:,i) = VAR.irs_t_mon_noendo;
	
	IRS_stock_m_noendo_real(:,:,i) = VAR.irs_t_m_noendo_real;
	IRS_stock_y_noendo_real(:,:,i) = VAR.irs_t_y_noendo_real;
    IRS_stock_p_noendo_real(:,:,i) = VAR.irs_t_p_noendo_real;
	IRS_stock_f_noendo_real(:,:,i) = VAR.irs_t_f_noendo_real;
	IRS_stock_mon_noendo_real(:,:,i) = VAR.irs_t_mon_noendo_real;
	
	IRS_stock_m_noendo_financial(:,:,i) = VAR.irs_t_m_noendo_financial;
	IRS_stock_y_noendo_financial(:,:,i) = VAR.irs_t_y_noendo_financial;
    IRS_stock_p_noendo_financial(:,:,i) = VAR.irs_t_p_noendo_financial;
	IRS_stock_f_noendo_financial(:,:,i) = VAR.irs_t_f_noendo_financial;
	IRS_stock_mon_noendo_financial(:,:,i) = VAR.irs_t_mon_noendo_financial;
	
	% Computing multipliers
	
	bench_mon(1,i) = sum(VAR.irs_t_mon(1:20,2))/sum(VAR.irs_t_mon(1:20,5));
	noendo_mon(1,i) = sum(VAR.irs_t_mon_noendo(1:20,2))/sum(VAR.irs_t_mon_noendo(1:20,5));
	noendo_real_mon(1,i) = sum(VAR.irs_t_mon_noendo_real(1:20,2))/sum(VAR.irs_t_mon_noendo_real(1:20,5));
	noendo_financial_mon(1,i) = sum(VAR.irs_t_mon_noendo_financial(1:20,2))/sum(VAR.irs_t_mon_noendo_financial(1:20,5));
	diff_mon(1,i) = noendo_mon(1,i)-bench_mon(1,i);
	diff_mon_real(1,i) = noendo_real_mon(1,i)-bench_mon(1,i);
	diff_mon_financial(1,i) = noendo_financial_mon(1,i)-bench_mon(1,i);
	
	% Searching max-C
    
    b_c = identified_b_c(:,:,i);

	if sqrt(b_c'*b_c) > b_c_crit_old
	    B_max = Identified_B(:,:,i);
	    VAR.irs_t_m_max = VAR.irs_t_m;
	    VAR.irs_t_y_max = VAR.irs_t_y;
        VAR.irs_t_p_max = VAR.irs_t_p;
	    VAR.irs_t_f_max = VAR.irs_t_f;
	    VAR.irs_t_mon_max = VAR.irs_t_mon;    
	    struc_e_max = struc_e(:,:,i);
	    b_c_crit_old = sqrt(b_c'*b_c);
	    
	    VAR.irs_t_m_max_noendo = VAR.irs_t_m_noendo;
	    VAR.irs_t_y_max_noendo = VAR.irs_t_y_noendo;
        VAR.irs_t_p_max_noendo = VAR.irs_t_p_noendo;
	    VAR.irs_t_f_max_noendo = VAR.irs_t_f_noendo;
	    VAR.irs_t_mon_max_noendo = VAR.irs_t_mon_noendo;
	    
	    VAR.irs_t_m_max_noendo_real = VAR.irs_t_m_noendo_real;
	    VAR.irs_t_y_max_noendo_real = VAR.irs_t_y_noendo_real;
        VAR.irs_t_p_max_noendo_real = VAR.irs_t_p_noendo_real;
	    VAR.irs_t_f_max_noendo_real = VAR.irs_t_f_noendo_real;
	    VAR.irs_t_mon_max_noendo_real = VAR.irs_t_mon_noendo_real;
	    
	    VAR.irs_t_m_max_noendo_financial = VAR.irs_t_m_noendo_financial;
	    VAR.irs_t_y_max_noendo_financial = VAR.irs_t_y_noendo_financial;
        VAR.irs_t_p_max_noendo_financial = VAR.irs_t_p_noendo_financial;
	    VAR.irs_t_f_max_noendo_financial = VAR.irs_t_f_noendo_financial;
	    VAR.irs_t_mon_max_noendo_financial = VAR.irs_t_mon_noendo_financial;                
	    
	    bench_mon_maxC = bench_mon(1,i);
	    noendo_mon_maxC = noendo_mon(1,i);
	    noendo_real_mon_maxC = noendo_real_mon(1,i);
	    noendo_financial_mon_maxC = noendo_financial_mon(1,i);
	end
end            