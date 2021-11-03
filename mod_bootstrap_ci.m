%% Bootstrapping
nboot=100000;
u1=datasample(VAR.res1,VAR.T);

for i=1:nboot
    % model 1
    u1=datasample(VAR.res1,VAR.T);
    Y1_resample=[X1 ones(length(X1),1) tt tt2]*VAR.bet1+u1;
    tmp_bet1=[X1 ones(length(X1),1) tt tt2]\Y1_resample;
    tmp_res1=Y1_resample-[X1 ones(length(X1),1) tt tt2]*tmp_bet1;
    omega1_resample = (tmp_res1'*tmp_res1)/(VAR.T-VAR.n*VAR.p-1-3);
    tmp_B1 = chol(omega1_resample,'lower');
    
    bootirs_t_gdp1(VAR.p+1,:) = tmp_B1*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
    bootirs_t_ru1(VAR.p+1,:) = tmp_B1*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    bootirs_t_fu1(VAR.p+1,:) = tmp_B1*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    bootirs_t_mp1(VAR.p+1,:) = tmp_B1*[0 0 0 1]';          % MP shock if Y>RU>FU>MP
    
    for jj=2:irhor
        bootlvars_gdp1 = (bootirs_t_gdp1(VAR.p+jj-1:-1:jj,:))';
        bootlvars_ru1 = (bootirs_t_ru1(VAR.p+jj-1:-1:jj,:))';
        bootlvars_fu1 = (bootirs_t_fu1(VAR.p+jj-1:-1:jj,:))';
        bootlvars_mp1 = (bootirs_t_mp1(VAR.p+jj-1:-1:jj,:))';
        bootirs_t_gdp1(VAR.p+jj,:) = bootlvars_gdp1(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
        bootirs_t_ru1(VAR.p+jj,:) = bootlvars_ru1(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
        bootirs_t_fu1(VAR.p+jj,:) = bootlvars_fu1(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
        bootirs_t_mp1(VAR.p+jj,:) = bootlvars_mp1(:)'*tmp_bet1(1:VAR.p*VAR.n,:);
    end
    VAR.bootirs_t_gdp1(:,:,i)   = bootirs_t_gdp1(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_ru1(:,:,i)   = bootirs_t_ru1(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_fu1(:,:,i)   = bootirs_t_fu1(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_mp1(:,:,i)   = bootirs_t_mp1(VAR.p+1:VAR.p+irhor,:);
    
    % model 2
    u2=datasample(VAR.res2,VAR.T);
    Y2_resample=[X2 ones(length(X2),1) tt tt2]*VAR.bet2+u2;
    tmp_bet2=[X2 ones(length(X2),1) tt tt2]\Y2_resample;
    tmp_res2=Y2_resample-[X2 ones(length(X2),1) tt tt2]*tmp_bet2;
    omega2_resample = (tmp_res2'*tmp_res2)/(VAR.T-VAR.n*VAR.p-1-3);
    tmp_B2 = chol(omega2_resample,'lower');
    
    bootirs_t_gdp2(VAR.p+1,:) = tmp_B2*[1 0 0 0]';         	% GDP shock if Y>FU>RU>MP
    bootirs_t_ru2(VAR.p+1,:) = 	tmp_B2*[0 0 1 0]';          % RU shock if Y>FU>RU>MP
    bootirs_t_fu2(VAR.p+1,:) = 	tmp_B2*[0 1 0 0]';          % FU shock if Y>FU>RU>MP
    bootirs_t_mp2(VAR.p+1,:) = 	tmp_B2*[0 0 0 1]';          % MP shock if Y>FU>RU>MP    
    
    for jj=2:irhor
        bootlvars_gdp2 = (bootirs_t_gdp2(VAR.p+jj-1:-1:jj,:))';
        bootlvars_ru2 = (bootirs_t_ru2(VAR.p+jj-1:-1:jj,:))';
        bootlvars_fu2 = (bootirs_t_fu2(VAR.p+jj-1:-1:jj,:))';
        bootlvars_mp2 = (bootirs_t_mp2(VAR.p+jj-1:-1:jj,:))';
        bootirs_t_gdp2(VAR.p+jj,:) = bootlvars_gdp2(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
        bootirs_t_ru2(VAR.p+jj,:) = bootlvars_ru2(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
        bootirs_t_fu2(VAR.p+jj,:) = bootlvars_fu2(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
        bootirs_t_mp2(VAR.p+jj,:) = bootlvars_mp2(:)'*tmp_bet2(1:VAR.p*VAR.n,:);
    end
    VAR.bootirs_t_gdp2(:,:,i)   = bootirs_t_gdp2(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_ru2(:,:,i)   = bootirs_t_ru2(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_fu2(:,:,i)   = bootirs_t_fu2(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_mp2(:,:,i)   = bootirs_t_mp2(VAR.p+1:VAR.p+irhor,:);
    
    % model 3
    u3=datasample(VAR.res3,VAR.T);
    Y3_resample=[X3 ones(length(X3),1) tt tt2]*VAR.bet3+u3;
    tmp_bet3=[X3 ones(length(X3),1) tt tt2]\Y3_resample;
    tmp_res3=Y3_resample-[X3 ones(length(X3),1) tt tt2]*tmp_bet3;
    omega3_resample = (tmp_res3'*tmp_res3)/(VAR.T-VAR.n*VAR.p-1-3);
    tmp_B3 = chol(omega3_resample,'lower');
    
    bootirs_t_gdp3(VAR.p+1,:) = tmp_B3*[0 0 1 0]';          % GDP shock if FU>RU>Y>MP
    bootirs_t_ru3(VAR.p+1,:) = 	tmp_B3*[0 1 0 0]';          % RU shock if FU>RU>Y>MP
    bootirs_t_fu3(VAR.p+1,:) = 	tmp_B3*[1 0 0 0]';          % FU shock if FU>RU>Y>MP
    bootirs_t_mp3(VAR.p+1,:) = 	tmp_B3*[0 0 0 1]';          % MP shock if FU>RU>Y>MP
    
    for jj=2:irhor
        bootlvars_gdp3 = (bootirs_t_gdp3(VAR.p+jj-1:-1:jj,:))';
        bootlvars_ru3 = (bootirs_t_ru3(VAR.p+jj-1:-1:jj,:))';
        bootlvars_fu3 = (bootirs_t_fu3(VAR.p+jj-1:-1:jj,:))';
        bootlvars_mp3 = (bootirs_t_mp3(VAR.p+jj-1:-1:jj,:))';
        bootirs_t_gdp3(VAR.p+jj,:) = bootlvars_gdp3(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
        bootirs_t_ru3(VAR.p+jj,:) = bootlvars_ru3(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
        bootirs_t_fu3(VAR.p+jj,:) = bootlvars_fu3(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
        bootirs_t_mp3(VAR.p+jj,:) = bootlvars_mp3(:)'*tmp_bet3(1:VAR.p*VAR.n,:);
    end
    VAR.bootirs_t_gdp3(:,:,i)   = bootirs_t_gdp3(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_ru3(:,:,i)   = bootirs_t_ru3(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_fu3(:,:,i)   = bootirs_t_fu3(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_mp3(:,:,i)   = bootirs_t_mp3(VAR.p+1:VAR.p+irhor,:);
    
    % model 4
    u4=datasample(VAR.res4,VAR.T);
    Y4_resample=[X4 ones(length(X4),1) tt tt2]*VAR.bet4+u4;
    tmp_bet4=[X4 ones(length(X4),1) tt tt2]\Y4_resample;
    tmp_res4=Y4_resample-[X4 ones(length(X4),1) tt tt2]*tmp_bet4;
    omega4_resample = (tmp_res4'*tmp_res4)/(VAR.T-VAR.n*VAR.p-1-4);
    tmp_B4 = chol(omega4_resample,'lower');
    
    bootirs_t_gdp4(VAR.p+1,:) = tmp_B4*[0 0 1 0]';          % GDP shock if RU>FU>Y>MP
    bootirs_t_ru4(VAR.p+1,:) = 	tmp_B4*[1 0 0 0]';          % RU shock if RU>FU>Y>MP
    bootirs_t_fu4(VAR.p+1,:) = 	tmp_B4*[0 1 0 0]';          % FU shock if RU>FU>Y>MP
    bootirs_t_mp4(VAR.p+1,:) = 	tmp_B4*[0 0 0 1]';          % MP shock if RU>FU>Y>MP
    
    for jj=2:irhor
        bootlvars_gdp4 = (bootirs_t_gdp4(VAR.p+jj-1:-1:jj,:))';
        bootlvars_ru4 = (bootirs_t_ru4(VAR.p+jj-1:-1:jj,:))';
        bootlvars_fu4 = (bootirs_t_fu4(VAR.p+jj-1:-1:jj,:))';
        bootlvars_mp4 = (bootirs_t_mp4(VAR.p+jj-1:-1:jj,:))';
        bootirs_t_gdp4(VAR.p+jj,:) = bootlvars_gdp4(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
        bootirs_t_ru4(VAR.p+jj,:) = bootlvars_ru4(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
        bootirs_t_fu4(VAR.p+jj,:) = bootlvars_fu4(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
        bootirs_t_mp4(VAR.p+jj,:) = bootlvars_mp4(:)'*tmp_bet4(1:VAR.p*VAR.n,:);
    end
    VAR.bootirs_t_gdp4(:,:,i)   = bootirs_t_gdp4(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_ru4(:,:,i)   = bootirs_t_ru4(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_fu4(:,:,i)   = bootirs_t_fu4(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_mp4(:,:,i)   = bootirs_t_mp4(VAR.p+1:VAR.p+irhor,:);
    
    % model5
    u5=datasample(VAR.res5,VAR.T);
    Y5_resample=[X5 ones(length(X5),1) tt tt2]*VAR.bet5+u5;
    tmp_bet5=[X5 ones(length(X5),1) tt tt2]\Y5_resample;
    tmp_res5=Y5_resample-[X5 ones(length(X5),1) tt tt2]*tmp_bet5;
    omega5_resample = (tmp_res5'*tmp_res5)/(VAR.T-VAR.n*VAR.p-1-5);
    tmp_B5 = chol(omega5_resample,'lower');
    
    bootirs_t_gdp5(VAR.p+1,:) = tmp_B5*[1 0 0 0]';          % GDP shock if Y>MP>RU>FU
    bootirs_t_ru5(VAR.p+1,:) = 	tmp_B5*[0 0 1 0]';          % RU shock if Y>MP>RU>FU
    bootirs_t_fu5(VAR.p+1,:) = 	tmp_B5*[0 0 0 1]';          % FU shock if Y>MP>RU>FU
    bootirs_t_mp5(VAR.p+1,:) = 	tmp_B5*[0 1 0 0]';          % MP shock if Y>MP>RU>FU
    
    for jj=2:irhor
        bootlvars_gdp5 = (bootirs_t_gdp5(VAR.p+jj-1:-1:jj,:))';
        bootlvars_ru5 = (bootirs_t_ru5(VAR.p+jj-1:-1:jj,:))';
        bootlvars_fu5 = (bootirs_t_fu5(VAR.p+jj-1:-1:jj,:))';
        bootlvars_mp5 = (bootirs_t_mp5(VAR.p+jj-1:-1:jj,:))';
        bootirs_t_gdp5(VAR.p+jj,:) = bootlvars_gdp5(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
        bootirs_t_ru5(VAR.p+jj,:) = bootlvars_ru5(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
        bootirs_t_fu5(VAR.p+jj,:) = bootlvars_fu5(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
        bootirs_t_mp5(VAR.p+jj,:) = bootlvars_mp5(:)'*tmp_bet5(1:VAR.p*VAR.n,:);
    end
    VAR.bootirs_t_gdp5(:,:,i)   = bootirs_t_gdp5(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_ru5(:,:,i)   = bootirs_t_ru5(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_fu5(:,:,i)   = bootirs_t_fu5(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_mp5(:,:,i)   = bootirs_t_mp5(VAR.p+1:VAR.p+irhor,:);
    
    % model 6
    u6=datasample(VAR.res6,VAR.T);
    Y6_resample=[X6 ones(length(X6),1) tt tt2]*VAR.bet6+u6;
    tmp_bet6=[X6 ones(length(X6),1) tt tt2]\Y6_resample;
    tmp_res6=Y6_resample-[X6 ones(length(X6),1) tt tt2]*tmp_bet6;
    omega6_resample = (tmp_res6'*tmp_res6)/(VAR.T-VAR.n*VAR.p-1-6);
    tmp_B6 = chol(omega6_resample,'lower');
    
    bootirs_t_gdp6(VAR.p+1,:) = tmp_B6*[1 0 0 0]';          % GDP shock if Y>MP>FU>RU
    bootirs_t_ru6(VAR.p+1,:) = 	tmp_B6*[0 0 0 1]';          % RU shock if Y>MP>FU>RU
    bootirs_t_fu6(VAR.p+1,:) = 	tmp_B6*[0 0 1 0]';          % FU shock if Y>MP>FU>RU
    bootirs_t_mp6(VAR.p+1,:) = 	tmp_B6*[0 1 0 0]';          % MP shock if Y>MP>FU>RU
    
    for jj=2:irhor
        bootlvars_gdp6 = (bootirs_t_gdp6(VAR.p+jj-1:-1:jj,:))';
        bootlvars_ru6 = (bootirs_t_ru6(VAR.p+jj-1:-1:jj,:))';
        bootlvars_fu6 = (bootirs_t_fu6(VAR.p+jj-1:-1:jj,:))';
        bootlvars_mp6 = (bootirs_t_mp6(VAR.p+jj-1:-1:jj,:))';
        bootirs_t_gdp6(VAR.p+jj,:) = bootlvars_gdp6(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
        bootirs_t_ru6(VAR.p+jj,:) = bootlvars_ru6(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
        bootirs_t_fu6(VAR.p+jj,:) = bootlvars_fu6(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
        bootirs_t_mp6(VAR.p+jj,:) = bootlvars_mp6(:)'*tmp_bet6(1:VAR.p*VAR.n,:);
    end
    VAR.bootirs_t_gdp6(:,:,i)   = bootirs_t_gdp6(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_ru6(:,:,i)   = bootirs_t_ru6(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_fu6(:,:,i)   = bootirs_t_fu6(VAR.p+1:VAR.p+irhor,:);
    VAR.bootirs_t_mp6(:,:,i)   = bootirs_t_mp6(VAR.p+1:VAR.p+irhor,:);
end

VAR.bootirs_t_gdp1_max=quantile(VAR.bootirs_t_gdp1,0.975,3);
VAR.bootirs_t_gdp1_min=quantile(VAR.bootirs_t_gdp1,0.025,3);
VAR.bootirs_t_ru1_max=quantile(VAR.bootirs_t_ru1,0.975,3);
VAR.bootirs_t_ru1_min=quantile(VAR.bootirs_t_ru1,0.025,3);
VAR.bootirs_t_fu1_max=quantile(VAR.bootirs_t_fu1,0.975,3);
VAR.bootirs_t_fu1_min=quantile(VAR.bootirs_t_fu1,0.025,3);
VAR.bootirs_t_mp1_max=quantile(VAR.bootirs_t_mp1,0.975,3);
VAR.bootirs_t_mp1_min=quantile(VAR.bootirs_t_mp1,0.025,3);

VAR.bootirs_t_gdp2_max=quantile(VAR.bootirs_t_gdp2,0.975,3);
VAR.bootirs_t_gdp2_min=quantile(VAR.bootirs_t_gdp2,0.025,3);
VAR.bootirs_t_ru2_max=quantile(VAR.bootirs_t_ru2,0.975,3);
VAR.bootirs_t_ru2_min=quantile(VAR.bootirs_t_ru2,0.025,3);
VAR.bootirs_t_fu2_max=quantile(VAR.bootirs_t_fu2,0.975,3);
VAR.bootirs_t_fu2_min=quantile(VAR.bootirs_t_fu2,0.025,3);
VAR.bootirs_t_mp2_max=quantile(VAR.bootirs_t_mp2,0.975,3);
VAR.bootirs_t_mp2_min=quantile(VAR.bootirs_t_mp2,0.025,3);

VAR.bootirs_t_gdp3_max=quantile(VAR.bootirs_t_gdp3,0.975,3);
VAR.bootirs_t_gdp3_min=quantile(VAR.bootirs_t_gdp3,0.025,3);
VAR.bootirs_t_ru3_max=quantile(VAR.bootirs_t_ru3,0.975,3);
VAR.bootirs_t_ru3_min=quantile(VAR.bootirs_t_ru3,0.025,3);
VAR.bootirs_t_fu3_max=quantile(VAR.bootirs_t_fu3,0.975,3);
VAR.bootirs_t_fu3_min=quantile(VAR.bootirs_t_fu3,0.025,3);
VAR.bootirs_t_mp3_max=quantile(VAR.bootirs_t_mp3,0.975,3);
VAR.bootirs_t_mp3_min=quantile(VAR.bootirs_t_mp3,0.025,3);

VAR.bootirs_t_gdp4_max=quantile(VAR.bootirs_t_gdp4,0.975,3);
VAR.bootirs_t_gdp4_min=quantile(VAR.bootirs_t_gdp4,0.025,3);
VAR.bootirs_t_ru4_max=quantile(VAR.bootirs_t_ru4,0.975,3);
VAR.bootirs_t_ru4_min=quantile(VAR.bootirs_t_ru4,0.025,3);
VAR.bootirs_t_fu4_max=quantile(VAR.bootirs_t_fu4,0.975,3);
VAR.bootirs_t_fu4_min=quantile(VAR.bootirs_t_fu4,0.025,3);
VAR.bootirs_t_mp4_max=quantile(VAR.bootirs_t_mp4,0.975,3);
VAR.bootirs_t_mp4_min=quantile(VAR.bootirs_t_mp4,0.025,3);

VAR.bootirs_t_gdp5_max=quantile(VAR.bootirs_t_gdp5,0.975,3);
VAR.bootirs_t_gdp5_min=quantile(VAR.bootirs_t_gdp5,0.025,3);
VAR.bootirs_t_ru5_max=quantile(VAR.bootirs_t_ru5,0.975,3);
VAR.bootirs_t_ru5_min=quantile(VAR.bootirs_t_ru5,0.025,3);
VAR.bootirs_t_fu5_max=quantile(VAR.bootirs_t_fu5,0.975,3);
VAR.bootirs_t_fu5_min=quantile(VAR.bootirs_t_fu5,0.025,3);
VAR.bootirs_t_mp5_max=quantile(VAR.bootirs_t_mp5,0.975,3);
VAR.bootirs_t_mp5_min=quantile(VAR.bootirs_t_mp5,0.025,3);

VAR.bootirs_t_gdp6_max=quantile(VAR.bootirs_t_gdp6,0.975,3);
VAR.bootirs_t_gdp6_min=quantile(VAR.bootirs_t_gdp6,0.025,3);
VAR.bootirs_t_ru6_max=quantile(VAR.bootirs_t_ru6,0.975,3);
VAR.bootirs_t_ru6_min=quantile(VAR.bootirs_t_ru6,0.025,3);
VAR.bootirs_t_fu6_max=quantile(VAR.bootirs_t_fu6,0.975,3);
VAR.bootirs_t_fu6_min=quantile(VAR.bootirs_t_fu6,0.025,3);
VAR.bootirs_t_mp6_max=quantile(VAR.bootirs_t_mp6,0.975,3);
VAR.bootirs_t_mp6_min=quantile(VAR.bootirs_t_mp6,0.025,3);

    
    
