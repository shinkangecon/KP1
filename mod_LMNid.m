%% Identifying structural shock: Shock restricted VAR by Luvigson, Ma and Ng

%% 1. Empirical distributions of c1,c2 and c4
tmp_c1r=zeros(num_draw,1);
tmp_c1f=zeros(num_draw,1);
tmp_c2r=zeros(num_draw,1);
tmp_c2f=zeros(num_draw,1);
tmp_c4=zeros(num_draw,1);
tmp_c5t1=zeros(num_draw,1);
tmp_c5t2=zeros(num_draw,1);
tmp_c5t3=zeros(num_draw,1);
tmp_c5=zeros(num_draw,1);
tmp_black=zeros(num_draw,1);
if bekaert == 0
    tmp_event1_r=zeros(num_draw,1);
    tmp_event1_f=zeros(num_draw,1);
    tmp_event2=zeros(num_draw,1);
    tmp_event4_r1=zeros(num_draw,1);
    tmp_event4_f1=zeros(num_draw,1);
    tmp_event4_r2=zeros(num_draw,1);
    tmp_event4_f2=zeros(num_draw,1);
end

% calculating all possible c1, c2 and c4
parfor i=1:num_draw
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
    
    B = Pmat*Q';
    
    struc_e = VAR.res/B';
    
    if bekaert == 0
        q_real = zeros(151,1);
        for mm = 1:151
            for nn = 1:3
                q_real(mm,1) = q_real(mm,1) + struc_e((mm-1)*3+nn+21-VAR.p,2);
            end
        end
    else
        q_real = zeros(107,1);
        for mm = 1:107
            for nn = 1:3
                q_real(mm,1) = q_real(mm,1) + struc_e((mm-1)*3+nn+21-VAR.p,2);
            end
        end
        
    end    
    
    [ak,bk] = size(struc_e);
    tt4 = ak-t4;
    tt5 = ak-t5;
        
    if bekaert == 0
        tmp_c1r(i) = corr(stock,struc_e(:,1));                              % real uncertainty and stock returns
        tmp_c1f(i) = corr(stock,struc_e(:,4));                              % financial uncertainty and stock returns    
        tmp_c2r(i) = corr(gold,struc_e(:,1));                               % real uncertainty and gold price
        tmp_c2f(i) = corr(gold,struc_e(:,4));                               % financial uncertainty and gold price
        tmp_c4(i) = corr(struc_e(end-t4:end-t5,5),monshock(tt4:tt5,1));     % monetary policy shock instrument
        tmp_c5t1(i) = corr(q_real,real_proxy);
        tmp_c5t2(i) = corr(q_real(2:end,1),real_proxy(1:150,1));
        tmp_c5t3(i) = corr(q_real(1:150,1),real_proxy(2:151,1));
        tmp_c5(i) = max([tmp_c5t1(i),tmp_c5t2(i),tmp_c5t3(i)]);
        
        tmp_event1_r(i) = struc_e(t2,1);
        tmp_event1_f(i) = struc_e(t2,4);
        tmp_event2(i) = sum(struc_e(t31:t32,2));
        tmp_event4_r1(i) = struc_e(t6,1);
        tmp_event4_f1(i) = struc_e(t6,4);
        tmp_event4_r2(i) = struc_e(t6+1,1);
        tmp_event4_f2(i) = struc_e(t6+1,4);
        tmp_black(i) = struc_e(t1,4);
    else
        tmp_c1r(i) = corr(stock,struc_e(:,1));                               % real uncertainty and stock returns
        tmp_c1f(i) = corr(stock,struc_e(:,4));                               % financial uncertainty and stock returns    
        tmp_c2r(i) = corr(gold,struc_e(:,1));                                % real uncertainty and gold price
        tmp_c2f(i) = corr(gold,struc_e(:,4));       
        tmp_c4(i) = corr(struc_e(187-VAR.p:end,5),monshock(187-VAR.p:342-VAR.p,1));
        tmp_c5t1(i) = corr(q_real,real_proxy(1:107,1));
        tmp_c5t2(i) = corr(q_real(2:end,1),real_proxy(1:106,1));
        tmp_c5t3(i) = corr(q_real(1:106,1),real_proxy(2:107,1));
        tmp_c5(i) = max([tmp_c5t1(i),tmp_c5t2(i),tmp_c5t3(i)]);
        tmp_black(i) = struc_e(t1,4);
    end
    
end


%% Distribution of c1, c2, c4 and c5
mod_dist_corrconstraint;

%k1bar = quantile(tmp_black,0.75);
%k2bar = quantile(tmp_event1_r,0.775);
%k3bar = quantile(tmp_event1_f,0.775);
%k_y   = quantile(tmp_event2,0.275);
%k_4f1 = quantile(tmp_event4_r1,0.75);
%k_4f2 = quantile(tmp_event4_f1,0.75);
%k_4r1 = quantile(tmp_event4_r2,0.75);
%k_4r2 = quantile(tmp_event4_f2,0.75);
%k_c1f = quantile(tmp_c1r,0.5);
%k_c1r = quantile(tmp_c1f,0.5);
%k_c2r = quantile(tmp_c2r,0.5);
%k_c2f = quantile(tmp_c2f,0.5);
%k_c4  = quantile(tmp_c4,0.75);
%k_c5y = quantile(tmp_c5,0.5);


%% Identification using a shock restriction

rng('default')

parfor i = 1:num_draw
    
    % Rotating B matrix and building structural shocks
    
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
    
    B = Pmat*Q';
    
    struc_e = VAR.res/B';
    
    if bekaert == 0
        q_real = zeros(151,1);
        for mm = 1:151
            for nn = 1:3
                q_real(mm,1) = q_real(mm,1) + struc_e((mm-1)*3+nn+21-VAR.p,2);
            end
        end
    else
        q_real = zeros(107,1);
        for mm = 1:107
            for nn = 1:3
                q_real(mm,1) = q_real(mm,1) + struc_e((mm-1)*3+nn+21-VAR.p,2);
            end
        end
        
    end    
       
    % calculating correlations
    
    if bekaert == 0              
        [ak,bk] = size(struc_e);
        tt4 = ak-t4;
        tt5 = ak-t5;    
        c_1f = corr(stock,struc_e(:,4));                               % financial uncertainty and stock returns
        c_1r = corr(stock,struc_e(:,1));                               % real uncertainty and stock returns
        c_2r = corr(gold,struc_e(:,1));                                % real uncertainty and gold price
        c_2f = corr(gold,struc_e(:,4));                                % financial uncertainty and gold price
        c_4m = corr(struc_e(end-t4:end-t5,5),monshock(tt4:tt5,1));   % monetary policy shock instrument
        c_5y1 = corr(q_real,real_proxy);
        c_5y2 = corr(q_real(2:end,1),real_proxy(1:150,1));
        c_5y3 = corr(q_real(1:150,1),real_proxy(2:151,1));
        c_5y = max([c_5y1, c_5y2, c_5y3]);  
        b_c = [c_1f c_1r c_2r c_2f c_4m c_5y]';                                       % overall corr    
    else                
        c_1f = corr(stock,struc_e(:,4));                               % financial uncertainty and stock returns
        c_1r = corr(stock,struc_e(:,1));                               % real uncertainty and stock returns
        c_2r = corr(gold,struc_e(:,1));                                % real uncertainty and gold price
        c_2f = corr(gold,struc_e(:,4));                                % financial uncertainty and gold price
        c_4m = corr(struc_e(187-VAR.p:end,5),monshock(187-VAR.p:342-VAR.p,1));
        c_5y1 = corr(q_real,real_proxy(1:107,1));
        c_5y2 = corr(q_real(2:end,1),real_proxy(1:106,1));
        c_5y3 = corr(q_real(1:106,1),real_proxy(2:107,1));
        c_5y = max([c_5y1, c_5y2, c_5y3]);
        b_c = [c_1f c_1r c_2r c_2f c_4m c_5y]';
    end
    
    signal1 = 0;
    signal2 = 0;
    signal3 = 0;
        
    % event constraints

    if bekaert == 0                             % Lehman bros
        if struc_e(t2,1) >= k2bar || struc_e(t2,4) >= k3bar
            signal1 = 1;            
        else
            %disp('continue1')
            continue
        end
    else
        signal1 = 1;
    
    end

    if bekaert == 0                             % sum of GDP shock during GFC 
        if sum(struc_e(t31:t32,2))<k_y
            signal2 = 1;
        else
            %disp('continue2')
            continue
        end
    else
        signal2 = 1;
    end

    if bekaert == 0                             % debt ceiling
        if struc_e(t6,4) >= k_4f1 && struc_e(t6+1,4) >= k_4f2 && struc_e(t6,1) >= k_4r1 && struc_e(t6+1,1) >= k_4r2
            signal3 = 1;
        else
            %disp('continue3')
            continue
        end
    else
        signal3 = 1;
    end
    
    if (c_1f <= k_c1f && c_1r <= k_c1r && c_2r >= k_c2r && c_2f >= k_c2f && c_4m > k_c4 && c_5y > k_c5y) &&  (struc_e(t1,4) > k1bar && signal1 == 1 && signal2 == 1 && signal3 == 1)     % correlation criteria
        tmp_B(:,:,i)=B;
        tmp_b_c(:,:,i)=b_c;
        accept(i)=1;
    end      
end

num_B=sum(accept);
Identified_B=zeros(nvar,nvar,num_B);
identified_b_c=zeros(6,1,num_B);

j=1;
for i=1:num_draw    
    if accept(i)==1
        Identified_B(:,:,j)=tmp_B(:,:,i);
        identified_b_c(:,:,j)=tmp_b_c(:,:,i);
        struc_e(:,:,j)=VAR.res/tmp_B(:,:,i)';
        j=j+1;
    end
end

clear tmp_B;
clear tmp_b_c;