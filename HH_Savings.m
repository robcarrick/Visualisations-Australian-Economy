%%% Plot the Australian Household Savings Ratio %%%

% Get dates from excel spreadsheet
d = readtable('HH Savings2.xlsx');
dates = d(:,1); dates = table2array(dates); dateval = datenum(dates);
% dates are now stored as numerical values

s = xlsread('HH Savings2'); % HH savings rates as numerical values

% Plot the unsmoothed data
plot(dateval,s)
datetick('x','dd-mmm-yyyy'); % insert dates on the x axis
grid on
title('Australia, Household Savings Ratio: Mar 1981 to Dec 2017')
xlabel('Date'); ylabel('Savings Ratio (Net savings / Income)')
figure

% Plot the smoothed data
smoothed = smooth(dateval,s,0.15,'loess'); % use a quadratic fit
plot(dateval,smoothed)
datetick('x','dd-mmm-yyyy'); % insert dates on the x axis
grid on
title('Australia, Household Savings Ratio (Smoothed): Mar 1981 to Dec 2017')
xlabel('Date'); ylabel('Savings Ratio (Net savings / Income)')
% Change the font size
ax = gca;
ax.FontSize = 18;
