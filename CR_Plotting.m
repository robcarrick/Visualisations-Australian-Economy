% Import cash rate data and dates in a table
d = readtable('Cash rate data.xlsx');
dates = d(:,1); dates = table2array(dates); datevals = datenum(dates);

CR = xlsread('Cash rate data',1); % Import cash rate numerical values
plot(dates,CR(:,1))
title('Australian Cash Rate: Jan 1990 to Mar 2018')
xlabel('Date'); ylabel('Cash Rate (%)')
grid on
ax = gca;
ax.FontSize = 18; % Change font size

% Add the date labels on the x axis
NumTicks = 15;
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks));
datetick('x','mmm yyyy','keeplimits', 'keepticks')
xtickangle(45);
