           %%% First, run the multiple linear regression model %%%

% Prepare data for regression; call upon triplet matching function
d = multi_match_func('HHS_CR_ASX.xlsx',1,2,3);
% Create variable arrays
x1 = d(:,2); % HHS
x2 = d(:,3); % CR
y = d(:,1); % ASX

X = [ones(size(x1)) x1 x2];
[b,bint,r,rint,stats] = regress(y,X);
% Generate array of; regression coefficients, CI, correlation coefficient, 
%   f statistic and p-value
r_squared_multi = stats(1) % r^2 for the overall model
p_value_multi = stats(3) % p-value for the test of significant coefficients

% Plot the data triplets
sc = scatter3(x1,x2,y,'filled','MarkerEdgeColor','k');
hold on
% Now plot the regression plane as a mesh
x1fit = min(x1):0.01:max(x1);
x2fit = min(x2):0.1:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT;
h = mesh(X1FIT,X2FIT,YFIT); alpha(h,0.7);
title('Regression: Market index against HHS and CR')
xlabel('HHS Ratio'); ylabel('Cash Rate (%)'),zlabel('Market Index')
colormap (winter.^0.5)
% Change font size
ax = gca;
ax.FontSize = 18; 

%%% Now regress individual dependent variables against the Market index %%%

figure

% Run a simple linear regression for the market index against the HHS ratio

subplot(1,2,1)
X = [ones(size(x1)) x1];
[b,bint,r,rint,stats] = regress(y,X);
r_squared_HHS = stats(1) % r^2 for the HHS and cash rate regression
p_value_HHS = stats(3) % p-value: test significance of the HHS coefficient
% Plot the data pairs
scatter(x1,y,'filled'); 
hold on

% Plot the regression line
yfit = b(1) + b(2)*x1fit;
plot(x1fit,yfit)
title('Market Index and HHS Ratio')
xlabel('HHS Ratio'); ylabel('Market Index')
grid on
% Change font size
ax = gca;
ax.FontSize = 18;

% Run a simple linear regression of the market index against the cash rate

subplot(1,2,2)
X = [ones(size(x1)) x2];
[b,bint,r,rint,stats] = regress(y,X);
r_squared_CR = stats(1) % r^2 for the market index and cash rate regression
p_value_CR = stats(3) % p-value: test significance of the cash rate coefficient
% Plot the data pairs
scatter(x2,y,'filled'); 
hold on

% Plot the regression line
yfit = b(1) + b(2)*x2fit;
plot(x2fit,yfit)
title('Market Index and Cash Rate')
xlabel('Cash Rate (%)'); ylabel('Market Index')
grid on
% Change font size
ax = gca;
ax.FontSize = 18;

figure

                            %%% Plot residuals %%%
% Create the residuals array
yfit = b(1) + b(2)*x2;
resid = y - yfit;
scatter(x2,resid,'filled'); grid on % plot residuals
title('Residual Plot: Market Index against Cash Rate')
xlabel('Cash Rate (%)'); ylabel('Residual')
% Change font size
ax = gca;
ax.FontSize = 18;

%%% Make the x-axis "bold" %%%
hold on
x = linspace(0,9,100); y = x.*0;
plot(x,y,'k', 'LineWidth', 1)
xlim([0,9]); ylim([-4000,4000])

                      %%% Check normality of residuals %%
figure

histogram(resid,10) % histogram of residuals with 10 buckets
title('Histogram of Residuals')
xlabel('Residual'); ylabel('Frequency')
% Change font size
ax = gca;
ax.FontSize = 18;

