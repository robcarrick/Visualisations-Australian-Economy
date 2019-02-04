%%% Goldfeld Quandt Test (two tailed F test) %%%

% Step 0: Import data and specify significance level of test
d = multi_match_func('HHS_CR_ASX.xlsx',1,2,3);
x = d(:,3); % CR
y = d(:,1); % ASX
alpha = 0.05 % level of significance

% Step 1: Order the data and partition the data in to equal parts
[x_ordered,order] = sort(x);
% must order y with respect to the new positions of the x values
y = y(order,:);
s = length(x_ordered); % happens to be even, can divide by 2
x_a = x_ordered(1:s/2); x_b = x_ordered(s/2 + 1:s);
y_a = y(1:s/2); y_b = y(s/2 + 1:s);
% find degrees of freedom for each subset
df_a = length(x_a) - 1
df_b = length(x_b) - 1

% Step 2: Run a regression on each subset
% Subset a
X_a = [ones(size(x_a)) x_a];
coef = regress(y_a,X_a);
y_fit_a = coef(1) + coef(2)*x_a;
% Subset b
X_b = [ones(size(x_b)) x_b];
coef = regress(y_b,X_b);
y_fit_b = coef(1) + coef(2)*x_b;

% Step 3: Calculate the RSS (Residual Sum of Squares) for each subset
% Subset a
resid_a = y_a - y_fit_a;
RSS_a = sum(resid_a.^2);
% Subset b
resid_b = y_b - y_fit_b;
RSS_b = sum(resid_b.^2);

% Step 4: Calculate the test statistic
test_stat = (RSS_a/df_a) / (RSS_b/df_b)

% Step 5: Calculate the critical values (quantiles of F distribution)
crit_upper = finv(1 - alpha/2,df_a,df_b)
crit_lower = finv(alpha/2,df_a,df_b)

% Step 6: Accept or reject the null hypothesis
% Decision rule
if test_stat < crit_lower
    Result = 'Reject null hypothesis: Evidence of heteroskedasticity in model'
elseif test_stat > crit_upper
    Result = 'Reject null hypothesis: Evidence of heteroskedasticity in model'
else
    Result = 'DNR null hypothesis: No evidence of heteroskedasticity in model'
end

