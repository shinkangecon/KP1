% reduced form regression

[Y X]      = lagmatrix(VAR.vars,VAR.p,0);

VAR.T = size(Y,1);
VAR.n = size(Y,2);

tt = 1:1:length(X);
tt2 = tt.^2;
tt = tt';
tt2 = tt2';

if trend == 0
    VAR.bet=[X ones(length(X),1)]\Y; 
    VAR.res = Y-[X ones(length(X),1)]*VAR.bet;
    VAR.Omega = (VAR.res'*VAR.res)/(VAR.T-VAR.n*VAR.p-1-1);
elseif trend == 1
    VAR.bet=[X ones(length(X),1) tt]\Y; 
    VAR.res = Y-[X ones(length(X),1) tt]*VAR.bet;
    VAR.Omega = (VAR.res'*VAR.res)/(VAR.T-VAR.n*VAR.p-1-2);
elseif trend == 2
    VAR.bet=[X ones(length(X),1) tt tt2]\Y; 
    VAR.res = Y-[X ones(length(X),1) tt tt2]*VAR.bet;
    VAR.Omega = (VAR.res'*VAR.res)/(VAR.T-VAR.n*VAR.p-1-3);
end

% Initialize B matrix

kk = 1;
b_c_crit_old = 0;
Pmat = chol(VAR.Omega,'lower');
B = Pmat;

stock = stock(VAR.p+1:end,1);
gold = gold(VAR.p+1:end,1);
monshock = monshock(VAR.p+1:end,1);

if bekaert == 1
    stock = stock(1:end-132,1);
    gold = gold(1:end-132,1);
    monshock = monshock(1:end-132,1);
end
