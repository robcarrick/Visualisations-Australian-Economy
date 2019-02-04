% Regression of HHS and CR
% load data by calling upon the matching function

d = matching_func('HHS_CR_ASX',1,2);

% create dependent and independent variables
x1 = d(:,2); % Cash Rate (CR)
y = d(:,1); % HHS

X = [ones(size(x1)) x1];
% Generate array of; regression coefficients, CI, correlation coefficient, 
%   t statistic and p-value
[b,bint,r,rint,stats] = regress(y,X)

% Plot the data pairs first
scatter(x1,y,'filled')
hold on
% Create and plot the regression line
x1fit = min(x1):0.1:max(x1);
yfit = b(1) + b(2)*x1fit;
plot(x1fit,yfit)
grid on
title('Regression - CR with HHS Ratio')
xlabel('Cash Rate (%)')
ylabel('Household Savings Ratio')
%%% Change the font size
ax = gca;
ax.FontSize = 18;
