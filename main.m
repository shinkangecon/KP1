clear;
clc;

tic;
%% Initial Setup

rng('default')
bekaert = 0;        % 0 = full sample, 1 = ~ 2007:12
mod_initialsetup;


%% Main Body
% Reduced Form VAR estimation (OLS)
mod_reducedformVAR;

% Identifying structural shock: Shock restricted VAR by Luvigson, Ma and Ng
mod_LMNid;

% acceptance rate
fprintf('Accpetance rate: %d percent \n', 100*sum(accept)/num_draw);
fprintf('Number of draws accepted: %d', sum(accept));
disp('')

% impulse response function
mod_IRF;

% Computing quantiles
mod_quantile;

% saving results
if bekaert == 1
    save 'result_bekaert';
else
    save 'result_bootstrapped';
end

%% Plot
%mod_plot_irf_m;         % plot impulse response functions
mod_plot_irf_m_bootstrap;

if bekaert == 0
    mod_plot_shock;       % plot structural shocks
end

%% Variance Decomposition
if bekaert == 0
    mod_VD;        % variance decomposition
end
toc;