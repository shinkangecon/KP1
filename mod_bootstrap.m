%% Moving block bootstrapping
l=200;  % length of the block

%% Obtaining CI
tmp_tt=linspace(1,l,l)';
tmp_tt2=tmp_tt.^2;
for j=1:VAR.T-l+1
    %tmp_X1=X1(j:j+l+6-1,:);
    %tmp_Y1=Y1(j:j+l+6-1,:);
    tmp_vars1=VAR.vars1(j:j+l+6-1,:);
    [tmp_Y1, tmp_X1]      = lagmatrix(tmp_vars1,VAR.p,0);
    
    tmp_bet1=[tmp_X1 ones(l,1) tmp_tt tmp_tt2]\tmp_Y1; 
    tmp_res1=tmp_Y1-[tmp_X1 ones(l,1) tmp_tt tmp_tt2]*tmp_bet1;
    tmp_omega1=(tmp_res1'*tmp_res1)/(l-VAR.n*VAR.p-1-3);
    
    tmp_b1=chol(tmp_omega1,'lower');
    
    irs_t_gdp1_resample(VAR.p+1,:) = tmp_b1*[1 0 0 0]';          % GDP shock if Y>RU>FU>MP
    irs_t_ru1_resample(VAR.p+1,:) =  tmp_b1*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    irs_t_fu1_resample(VAR.p+1,:) =  tmp_b1*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    irs_t_mp1_resample(VAR.p+1,:) =  tmp_b1*[0 0 0 1]';          % MP shock if Y>RU>FU>MP
    
    for jj=2:irhor
        lvars_gdp1_resample = (irs_t_gdp1_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_ru1_resample = (irs_t_ru1_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_fu1_resample = (irs_t_fu1_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_mp1_resample = (irs_t_mp1_resample(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp1_resample(VAR.p+jj,:) = lvars_gdp1_resample(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
        irs_t_ru1_resample(VAR.p+jj,:) = lvars_ru1_resample(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
        irs_t_fu1_resample(VAR.p+jj,:) = lvars_fu1_resample(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
        irs_t_mp1_resample(VAR.p+jj,:) = lvars_mp1_resample(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
    end
        
    VAR.irs_t_gdp1_bootstrp(:,:,j)=irs_t_gdp1_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru1_bootstrp(:,:,j)=irs_t_gdp1_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu1_bootstrp(:,:,j)=irs_t_gdp1_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp1_bootstrp(:,:,j)=irs_t_gdp1_resample(VAR.p+1:VAR.p+irhor,:);
    
    %tmp_X2=X2(j:j+l+6-1,:);
    %tmp_Y2=Y2(j:j+l+6-1,:);
    tmp_vars2=VAR.vars2(j:j+l+6-1,:);
    [tmp_Y2, tmp_X2]      = lagmatrix(tmp_vars2,VAR.p,0);
    
    tmp_bet2=[tmp_X2 ones(l,1) tmp_tt tmp_tt2]\tmp_Y2; 
    tmp_res2=tmp_Y2-[tmp_X2 ones(l,1) tmp_tt tmp_tt2]*tmp_bet2;
    tmp_omega1=(tmp_res2'*tmp_res2)/(l-VAR.n*VAR.p-1-3);
    
    tmp_b2=chol(tmp_omega1,'lower');
    
    irs_t_gdp2_resample(VAR.p+1,:) = tmp_b2*[1 0 0 0]';          % GDP shock if Y>FU>RU>MP
    irs_t_ru2_resample(VAR.p+1,:) =  tmp_b2*[0 0 1 0]';          % RU shock if Y>FU>RU>MP
    irs_t_fu2_resample(VAR.p+1,:) =  tmp_b2*[0 1 0 0]';          % FU shock if Y>FU>RU>MP
    irs_t_mp2_resample(VAR.p+1,:) =  tmp_b2*[0 0 0 1]';          % MP shock if Y>FU>RU>MP
    
    for jj=2:irhor
        lvars_gdp2_resample = (irs_t_gdp2_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_ru2_resample = (irs_t_ru2_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_fu2_resample = (irs_t_fu2_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_mp2_resample = (irs_t_mp2_resample(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp2_resample(VAR.p+jj,:) = lvars_gdp2_resample(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
        irs_t_ru2_resample(VAR.p+jj,:) = lvars_ru2_resample(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
        irs_t_fu2_resample(VAR.p+jj,:) = lvars_fu2_resample(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
        irs_t_mp2_resample(VAR.p+jj,:) = lvars_mp2_resample(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
    end
        
    VAR.irs_t_gdp2_bootstrp(:,:,j)=irs_t_gdp2_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru2_bootstrp(:,:,j)=irs_t_gdp2_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu2_bootstrp(:,:,j)=irs_t_gdp2_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp2_bootstrp(:,:,j)=irs_t_gdp2_resample(VAR.p+1:VAR.p+irhor,:);
    
    %tmp_X3=X3(j:j+l+6-1,:);
    %tmp_Y3=Y3(j:j+l+6-1,:);
    tmp_vars3=VAR.vars3(j:j+l+6-1,:);
    [tmp_Y3, tmp_X3]      = lagmatrix(tmp_vars3,VAR.p,0);
    
    tmp_bet3=[tmp_X3 ones(l,1) tmp_tt tmp_tt2]\tmp_Y3; 
    tmp_res3=tmp_Y3-[tmp_X3 ones(l,1) tmp_tt tmp_tt2]*tmp_bet3;
    tmp_omega1=(tmp_res3'*tmp_res3)/(l-VAR.n*VAR.p-1-3);
    
    tmp_b3=chol(tmp_omega1,'lower');
    
    irs_t_gdp3_resample(VAR.p+1,:) = tmp_b3*[0 0 1 0]';         % GDP shock if FU>RU>Y>MP
    irs_t_ru3_resample(VAR.p+1,:) =  tmp_b3*[0 1 0 0]';          % RU shock if FU>RU>Y>MP
    irs_t_fu3_resample(VAR.p+1,:) =  tmp_b3*[1 0 0 0]';          % FU shock if FU>RU>Y>MP
    irs_t_mp3_resample(VAR.p+1,:) =  tmp_b3*[0 0 0 1]';          % MP shock if FU>RU>Y>MP
    
    for jj=2:irhor
        lvars_gdp3_resample = (irs_t_gdp3_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_ru3_resample = (irs_t_ru3_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_fu3_resample = (irs_t_fu3_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_mp3_resample = (irs_t_mp3_resample(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp3_resample(VAR.p+jj,:) = lvars_gdp3_resample(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
        irs_t_ru3_resample(VAR.p+jj,:) = lvars_ru3_resample(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
        irs_t_fu3_resample(VAR.p+jj,:) = lvars_fu3_resample(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
        irs_t_mp3_resample(VAR.p+jj,:) = lvars_mp3_resample(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
    end
        
    VAR.irs_t_gdp3_bootstrp(:,:,j)=irs_t_gdp3_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru3_bootstrp(:,:,j)=irs_t_gdp3_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu3_bootstrp(:,:,j)=irs_t_gdp3_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp3_bootstrp(:,:,j)=irs_t_gdp3_resample(VAR.p+1:VAR.p+irhor,:);
    
    %tmp_X4=X4(j:j+l+6-1,:);
    %tmp_Y4=Y4(j:j+l+6-1,:);
    tmp_vars4=VAR.vars4(j:j+l+6-1,:);
    [tmp_Y4, tmp_X4]      = lagmatrix(tmp_vars4,VAR.p,0);
    
    tmp_bet4=[tmp_X4 ones(l,1) tmp_tt tmp_tt2]\tmp_Y4; 
    tmp_res4=tmp_Y4-[tmp_X4 ones(l,1) tmp_tt tmp_tt2]*tmp_bet4;
    tmp_omega1=(tmp_res4'*tmp_res4)/(l-VAR.n*VAR.p-1-4);
    
    tmp_b4=chol(tmp_omega1,'lower');
    
    irs_t_gdp4_resample(VAR.p+1,:) = tmp_b4*[0 0 1 0]';         % GDP shock if RU>FU>Y>MP
    irs_t_ru4_resample(VAR.p+1,:) =  tmp_b4*[1 0 0 0]';          % RU shock if RU>FU>Y>MP
    irs_t_fu4_resample(VAR.p+1,:) =  tmp_b4*[0 1 0 0]';          % FU shock if RU>FU>Y>MP
    irs_t_mp4_resample(VAR.p+1,:) =  tmp_b4*[0 0 0 1]';          % MP shock if RU>FU>Y>MP
    
    for jj=2:irhor
        lvars_gdp4_resample = (irs_t_gdp4_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_ru4_resample = (irs_t_ru4_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_fu4_resample = (irs_t_fu4_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_mp4_resample = (irs_t_mp4_resample(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp4_resample(VAR.p+jj,:) = lvars_gdp4_resample(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
        irs_t_ru4_resample(VAR.p+jj,:) = lvars_ru4_resample(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
        irs_t_fu4_resample(VAR.p+jj,:) = lvars_fu4_resample(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
        irs_t_mp4_resample(VAR.p+jj,:) = lvars_mp4_resample(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
    end
        
    VAR.irs_t_gdp4_bootstrp(:,:,j)=irs_t_gdp4_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru4_bootstrp(:,:,j)=irs_t_gdp4_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu4_bootstrp(:,:,j)=irs_t_gdp4_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp4_bootstrp(:,:,j)=irs_t_gdp4_resample(VAR.p+1:VAR.p+irhor,:);
    
    %tmp_X5=X5(j:j+l+6-1,:);
    %tmp_Y5=Y5(j:j+l+6-1,:);
    tmp_vars5=VAR.vars5(j:j+l+6-1,:);
    [tmp_Y5, tmp_X5]      = lagmatrix(tmp_vars5,VAR.p,0);
    
    tmp_bet5=[tmp_X5 ones(l,1) tmp_tt tmp_tt2]\tmp_Y5; 
    tmp_res5=tmp_Y5-[tmp_X5 ones(l,1) tmp_tt tmp_tt2]*tmp_bet5;
    tmp_omega1=(tmp_res5'*tmp_res5)/(l-VAR.n*VAR.p-1-5);
    
    tmp_b5=chol(tmp_omega1,'lower');
    
    irs_t_gdp5_resample(VAR.p+1,:) = tmp_b5*[1 0 0 0]';         % GDP shock if Y>MP>RU>FU
    irs_t_ru5_resample(VAR.p+1,:) =  tmp_b5*[0 0 1 0]';          % RU shock if Y>MP>RU>FU
    irs_t_fu5_resample(VAR.p+1,:) =  tmp_b5*[0 0 0 1]';          % FU shock if Y>MP>RU>FU
    irs_t_mp5_resample(VAR.p+1,:) =  tmp_b5*[0 1 0 0]';          % MP shock if Y>MP>RU>FU
    
    for jj=2:irhor
        lvars_gdp5_resample = (irs_t_gdp5_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_ru5_resample = (irs_t_ru5_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_fu5_resample = (irs_t_fu5_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_mp5_resample = (irs_t_mp5_resample(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp5_resample(VAR.p+jj,:) = lvars_gdp5_resample(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
        irs_t_ru5_resample(VAR.p+jj,:) = lvars_ru5_resample(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
        irs_t_fu5_resample(VAR.p+jj,:) = lvars_fu5_resample(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
        irs_t_mp5_resample(VAR.p+jj,:) = lvars_mp5_resample(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
    end
        
    VAR.irs_t_gdp5_bootstrp(:,:,j)=irs_t_gdp5_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru5_bootstrp(:,:,j)=irs_t_gdp5_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu5_bootstrp(:,:,j)=irs_t_gdp5_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp5_bootstrp(:,:,j)=irs_t_gdp5_resample(VAR.p+1:VAR.p+irhor,:);
    
    %tmp_X6=X6(j:j+l+6-1,:);
    %tmp_Y6=Y6(j:j+l+6-1,:);
    tmp_vars6=VAR.vars6(j:j+l+6-1,:);
    [tmp_Y6, tmp_X6]      = lagmatrix(tmp_vars6,VAR.p,0);
    
    tmp_bet6=[tmp_X6 ones(l,1) tmp_tt tmp_tt2]\tmp_Y6; 
    tmp_res6=tmp_Y6-[tmp_X6 ones(l,1) tmp_tt tmp_tt2]*tmp_bet6;
    tmp_omega1=(tmp_res6'*tmp_res6)/(l-VAR.n*VAR.p-1-6);
    
    tmp_b6=chol(tmp_omega1,'lower');
    
    irs_t_gdp6_resample(VAR.p+1,:) = tmp_b6*[1 0 0 0]';          % GDP shock if Y>MP>FU>RU
    irs_t_ru6_resample(VAR.p+1,:) =  tmp_b6*[0 0 0 1]';          % RU shock if Y>MP>FU>RU
    irs_t_fu6_resample(VAR.p+1,:) =  tmp_b6*[0 0 1 0]';          % FU shock if Y>MP>FU>RU
    irs_t_mp6_resample(VAR.p+1,:) =  tmp_b6*[0 1 0 0]';          % MP shock if Y>MP>FU>RU
    
    for jj=2:irhor
        lvars_gdp6_resample = (irs_t_gdp6_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_ru6_resample = (irs_t_ru6_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_fu6_resample = (irs_t_fu6_resample(VAR.p+jj-1:-1:jj,:))';
        lvars_mp6_resample = (irs_t_mp6_resample(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp6_resample(VAR.p+jj,:) = lvars_gdp6_resample(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
        irs_t_ru6_resample(VAR.p+jj,:) = lvars_ru6_resample(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
        irs_t_fu6_resample(VAR.p+jj,:) = lvars_fu6_resample(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
        irs_t_mp6_resample(VAR.p+jj,:) = lvars_mp6_resample(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
    end
        
    VAR.irs_t_gdp6_bootstrp(:,:,j)=irs_t_gdp6_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru6_bootstrp(:,:,j)=irs_t_gdp6_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu6_bootstrp(:,:,j)=irs_t_gdp6_resample(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp6_bootstrp(:,:,j)=irs_t_gdp6_resample(VAR.p+1:VAR.p+irhor,:);
    
    
    
    
end

% 95 percent CI
VAR.irs_t_gdp1_max=quantile(VAR.irs_t_gdp1_bootstrp,0.975,3);
VAR.irs_t_gdp1_min=quantile(VAR.irs_t_gdp1_bootstrp,0.025,3);
VAR.irs_t_ru1_max=quantile(VAR.irs_t_ru1_bootstrp,0.975,3);
VAR.irs_t_ru1_min=quantile(VAR.irs_t_ru1_bootstrp,0.025,3);
VAR.irs_t_fu1_max=quantile(VAR.irs_t_ru1_bootstrp,0.975,3);
VAR.irs_t_fu1_min=quantile(VAR.irs_t_ru1_bootstrp,0.025,3);
VAR.irs_t_mp1_max=quantile(VAR.irs_t_ru1_bootstrp,0.975,3);
VAR.irs_t_mp1_min=quantile(VAR.irs_t_ru1_bootstrp,0.025,3);

VAR.irs_t_gdp2_max=quantile(VAR.irs_t_gdp2_bootstrp,0.975,3);
VAR.irs_t_gdp2_min=quantile(VAR.irs_t_gdp2_bootstrp,0.025,3);
VAR.irs_t_ru2_max=quantile(VAR.irs_t_ru2_bootstrp,0.975,3);
VAR.irs_t_ru2_min=quantile(VAR.irs_t_ru2_bootstrp,0.025,3);
VAR.irs_t_fu2_max=quantile(VAR.irs_t_ru2_bootstrp,0.975,3);
VAR.irs_t_fu2_min=quantile(VAR.irs_t_ru2_bootstrp,0.025,3);
VAR.irs_t_mp2_max=quantile(VAR.irs_t_ru2_bootstrp,0.975,3);
VAR.irs_t_mp2_min=quantile(VAR.irs_t_ru2_bootstrp,0.025,3);

VAR.irs_t_gdp3_max=quantile(VAR.irs_t_gdp3_bootstrp,0.975,3);
VAR.irs_t_gdp3_min=quantile(VAR.irs_t_gdp3_bootstrp,0.025,3);
VAR.irs_t_ru3_max=quantile(VAR.irs_t_ru3_bootstrp,0.975,3);
VAR.irs_t_ru3_min=quantile(VAR.irs_t_ru3_bootstrp,0.025,3);
VAR.irs_t_fu3_max=quantile(VAR.irs_t_ru3_bootstrp,0.975,3);
VAR.irs_t_fu3_min=quantile(VAR.irs_t_ru3_bootstrp,0.025,3);
VAR.irs_t_mp3_max=quantile(VAR.irs_t_ru3_bootstrp,0.975,3);
VAR.irs_t_mp3_min=quantile(VAR.irs_t_ru3_bootstrp,0.025,3);

VAR.irs_t_gdp4_max=quantile(VAR.irs_t_gdp4_bootstrp,0.975,3);
VAR.irs_t_gdp4_min=quantile(VAR.irs_t_gdp4_bootstrp,0.025,3);
VAR.irs_t_ru4_max=quantile(VAR.irs_t_ru4_bootstrp,0.975,3);
VAR.irs_t_ru4_min=quantile(VAR.irs_t_ru4_bootstrp,0.025,3);
VAR.irs_t_fu4_max=quantile(VAR.irs_t_ru4_bootstrp,0.975,3);
VAR.irs_t_fu4_min=quantile(VAR.irs_t_ru4_bootstrp,0.025,3);
VAR.irs_t_mp4_max=quantile(VAR.irs_t_ru4_bootstrp,0.975,3);
VAR.irs_t_mp4_min=quantile(VAR.irs_t_ru4_bootstrp,0.025,3);

VAR.irs_t_gdp5_max=quantile(VAR.irs_t_gdp5_bootstrp,0.975,3);
VAR.irs_t_gdp5_min=quantile(VAR.irs_t_gdp5_bootstrp,0.025,3);
VAR.irs_t_ru5_max=quantile(VAR.irs_t_ru5_bootstrp,0.975,3);
VAR.irs_t_ru5_min=quantile(VAR.irs_t_ru5_bootstrp,0.025,3);
VAR.irs_t_fu5_max=quantile(VAR.irs_t_ru5_bootstrp,0.975,3);
VAR.irs_t_fu5_min=quantile(VAR.irs_t_ru5_bootstrp,0.025,3);
VAR.irs_t_mp5_max=quantile(VAR.irs_t_ru5_bootstrp,0.975,3);
VAR.irs_t_mp5_min=quantile(VAR.irs_t_ru5_bootstrp,0.025,3);

VAR.irs_t_gdp6_max=quantile(VAR.irs_t_gdp6_bootstrp,0.975,3);
VAR.irs_t_gdp6_min=quantile(VAR.irs_t_gdp6_bootstrp,0.025,3);
VAR.irs_t_ru6_max=quantile(VAR.irs_t_ru6_bootstrp,0.975,3);
VAR.irs_t_ru6_min=quantile(VAR.irs_t_ru6_bootstrp,0.025,3);
VAR.irs_t_fu6_max=quantile(VAR.irs_t_ru6_bootstrp,0.975,3);
VAR.irs_t_fu6_min=quantile(VAR.irs_t_ru6_bootstrp,0.025,3);
VAR.irs_t_mp6_max=quantile(VAR.irs_t_ru6_bootstrp,0.975,3);
VAR.irs_t_mp6_min=quantile(VAR.irs_t_ru6_bootstrp,0.025,3);

