function Result=mod_Recursive(data,p,irhor,opt)
[Y, X]      = lagmatrix(data,p,0);

VAR.T = size(Y,1);
VAR.n = size(Y,2);
VAR.p=p;

tt = 1:1:length(X);
tt = tt';
tt2 = tt.^2;

% Reduced Form Regression
VAR.bet=[X ones(length(X),1) tt tt2]\Y; 
VAR.res = Y-[X ones(length(X),1) tt tt2]*VAR.bet;
VAR.Omega = (VAR.res'*VAR.res)/(VAR.T-VAR.n*VAR.p-1-3);
B = chol(VAR.Omega,'lower');

if opt==1    
    irs_t_gdp1(VAR.p+1,:) = B*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
    irs_t_ru1(VAR.p+1,:) = B*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    irs_t_fu1(VAR.p+1,:) = B*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    irs_t_mp1(VAR.p+1,:) = B*[0 0 0 1]';         % MP shock if Y>RU>FU>MP
    
    for jj=2:irhor
        lvars_gdp1 = (irs_t_gdp1(VAR.p+jj-1:-1:jj,:))';
        lvars_ru1 = (irs_t_ru1(VAR.p+jj-1:-1:jj,:))';
        lvars_fu1 = (irs_t_fu1(VAR.p+jj-1:-1:jj,:))';
        lvars_mp1 = (irs_t_mp1(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp1(VAR.p+jj,:) = lvars_gdp1(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_ru1(VAR.p+jj,:) = lvars_ru1(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_fu1(VAR.p+jj,:) = lvars_fu1(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_mp1(VAR.p+jj,:) = lvars_mp1(:)'*VAR.bet(1:VAR.p*VAR.n,:);
    end
    VAR.irs_t_gdp1   = irs_t_gdp1(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru1   = irs_t_ru1(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu1   = irs_t_fu1(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp1   = irs_t_mp1(VAR.p+1:VAR.p+irhor,:);
    
    Result=[VAR.irs_t_gdp1 VAR.irs_t_ru1 VAR.irs_t_fu1 VAR.irs_t_mp1];
elseif opt==2
    
        irs_t_gdp2(VAR.p+1,:) = B*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
        irs_t_ru2(VAR.p+1,:) = B*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
        irs_t_fu2(VAR.p+1,:) = B*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
        irs_t_mp2(VAR.p+1,:) = B*[0 0 0 1]';         % MP shock if Y>RU>FU>MP
     
        for jj=2:irhor
            lvars_gdp2 = (irs_t_gdp2(VAR.p+jj-1:-1:jj,:))';
            lvars_ru2 = (irs_t_ru2(VAR.p+jj-1:-1:jj,:))';
            lvars_fu2 = (irs_t_fu2(VAR.p+jj-1:-1:jj,:))';
            lvars_mp2 = (irs_t_mp2(VAR.p+jj-1:-1:jj,:))';
            irs_t_gdp2(VAR.p+jj,:) = lvars_gdp2(:)'*VAR.bet(1:VAR.p*VAR.n,:);
            irs_t_ru2(VAR.p+jj,:) = lvars_ru2(:)'*VAR.bet(1:VAR.p*VAR.n,:);
            irs_t_fu2(VAR.p+jj,:) = lvars_fu2(:)'*VAR.bet(1:VAR.p*VAR.n,:);
            irs_t_mp2(VAR.p+jj,:) = lvars_mp2(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        end
        
        VAR.irs_t_gdp2   = irs_t_gdp2(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_ru2   = irs_t_ru2(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_fu2   = irs_t_fu2(VAR.p+1:VAR.p+irhor,:);
        VAR.irs_t_mp2   = irs_t_mp2(VAR.p+1:VAR.p+irhor,:);
        
        Result=[VAR.irs_t_gdp2 VAR.irs_t_ru2 VAR.irs_t_fu2 VAR.irs_t_mp2];

elseif opt==3
    irs_t_gdp3(VAR.p+1,:) = B*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
    irs_t_ru3(VAR.p+1,:) = B*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    irs_t_fu3(VAR.p+1,:) = B*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    irs_t_mp3(VAR.p+1,:) = B*[0 0 0 1]';         % MP shock if Y>RU>FU>MP
     
    for jj=2:irhor
        lvars_gdp3 = (irs_t_gdp3(VAR.p+jj-1:-1:jj,:))';
        lvars_ru3 = (irs_t_ru3(VAR.p+jj-1:-1:jj,:))';
        lvars_fu3 = (irs_t_fu3(VAR.p+jj-1:-1:jj,:))';
        lvars_mp3 = (irs_t_mp3(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp3(VAR.p+jj,:) = lvars_gdp3(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_ru3(VAR.p+jj,:) = lvars_ru3(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_fu3(VAR.p+jj,:) = lvars_fu3(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_mp3(VAR.p+jj,:) = lvars_mp3(:)'*VAR.bet(1:VAR.p*VAR.n,:);
    end
    
    VAR.irs_t_gdp3   = irs_t_gdp3(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru3   = irs_t_ru3(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu3   = irs_t_fu3(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp3   = irs_t_mp3(VAR.p+1:VAR.p+irhor,:);
    
    Result=[VAR.irs_t_gdp3 VAR.irs_t_ru3 VAR.irs_t_fu3 VAR.irs_t_mp3];
    
elseif opt==4
    irs_t_gdp4(VAR.p+1,:) = B*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
    irs_t_ru4(VAR.p+1,:) = B*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    irs_t_fu4(VAR.p+1,:) = B*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    irs_t_mp4(VAR.p+1,:) = B*[0 0 0 1]';         % MP shock if Y>RU>FU>MP
     
    for jj=2:irhor
        lvars_gdp4 = (irs_t_gdp4(VAR.p+jj-1:-1:jj,:))';
        lvars_ru4 = (irs_t_ru4(VAR.p+jj-1:-1:jj,:))';
        lvars_fu4 = (irs_t_fu4(VAR.p+jj-1:-1:jj,:))';
        lvars_mp4 = (irs_t_mp4(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp4(VAR.p+jj,:) = lvars_gdp4(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_ru4(VAR.p+jj,:) = lvars_ru4(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_fu4(VAR.p+jj,:) = lvars_fu4(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_mp4(VAR.p+jj,:) = lvars_mp4(:)'*VAR.bet(1:VAR.p*VAR.n,:);
    end
    
    VAR.irs_t_gdp4   = irs_t_gdp4(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru4   = irs_t_ru4(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu4   = irs_t_fu4(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp4   = irs_t_mp4(VAR.p+1:VAR.p+irhor,:);

elseif opt==5
    irs_t_gdp5(VAR.p+1,:) = B*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
    irs_t_ru5(VAR.p+1,:) = B*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    irs_t_fu5(VAR.p+1,:) = B*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    irs_t_mp5(VAR.p+1,:) = B*[0 0 0 1]';         % MP shock if Y>RU>FU>MP
     
    for jj=2:irhor
        lvars_gdp5 = (irs_t_gdp5(VAR.p+jj-1:-1:jj,:))';
        lvars_ru5 = (irs_t_ru5(VAR.p+jj-1:-1:jj,:))';
        lvars_fu5 = (irs_t_fu5(VAR.p+jj-1:-1:jj,:))';
        lvars_mp5 = (irs_t_mp5(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp5(VAR.p+jj,:) = lvars_gdp5(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_ru5(VAR.p+jj,:) = lvars_ru5(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_fu5(VAR.p+jj,:) = lvars_fu5(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_mp5(VAR.p+jj,:) = lvars_mp5(:)'*VAR.bet(1:VAR.p*VAR.n,:);
    end      
    
    VAR.irs_t_gdp5   = irs_t_gdp5(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru5   = irs_t_ru5(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu5   = irs_t_fu5(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp5   = irs_t_mp5(VAR.p+1:VAR.p+irhor,:);

elseif opt==6
    irs_t_gdp6(VAR.p+1,:) = B*[1 0 0 0]';         % GDP shock if Y>RU>FU>MP
    irs_t_ru6(VAR.p+1,:) = B*[0 1 0 0]';          % RU shock if Y>RU>FU>MP
    irs_t_fu6(VAR.p+1,:) = B*[0 0 1 0]';          % FU shock if Y>RU>FU>MP
    irs_t_mp6(VAR.p+1,:) = B*[0 0 0 1]';         % MP shock if Y>RU>FU>MP
     
    for jj=2:irhor
        lvars_gdp6 = (irs_t_gdp6(VAR.p+jj-1:-1:jj,:))';
        lvars_ru6 = (irs_t_ru6(VAR.p+jj-1:-1:jj,:))';
        lvars_fu6 = (irs_t_fu6(VAR.p+jj-1:-1:jj,:))';
        lvars_mp6 = (irs_t_mp6(VAR.p+jj-1:-1:jj,:))';
        irs_t_gdp6(VAR.p+jj,:) = lvars_gdp6(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_ru6(VAR.p+jj,:) = lvars_ru6(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_fu6(VAR.p+jj,:) = lvars_fu6(:)'*VAR.bet(1:VAR.p*VAR.n,:);
        irs_t_mp6(VAR.p+jj,:) = lvars_mp6(:)'*VAR.bet(1:VAR.p*VAR.n,:);
    end  
    
    VAR.irs_t_gdp6   = irs_t_gdp6(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_ru6   = irs_t_ru6(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_fu6   = irs_t_fu6(VAR.p+1:VAR.p+irhor,:);
    VAR.irs_t_mp6   = irs_t_mp6(VAR.p+1:VAR.p+irhor,:);
    
end



end