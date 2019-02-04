% Import Government bond yield data as a table
d = readtable('Final Yield Curve (Monthly).xlsx');
% Convert dates to numerical values
dates = d(:,1); dates = table2array(dates); datevals = datenum(dates);

% Import numerical yield data
Z = xlsread('Final Yield Curve (Monthly).xlsx',1);
Z = transpose(Z);
Year = [2,3,5,10];

% Plot the yield over time for each different Government Bond
for i = 1:4
    A = Z(i,:);
    subplot(2,2,i)
    plot(datevals,A)
    % Add dates to the x axis
    datetick('x','dd-mmm-yyyy')
    % Set the number of date ticks
    NumTicks = 15;
    L = get(gca,'XLim');
    set(gca,'XTick',linspace(L(1),L(2),NumTicks));
    
    % Change the font size
    ax = gca;
    ax.FontSize = 12;

    datetick('x','mmm yyyy','keeplimits', 'keepticks')
    xtickangle(45);
    grid on
    % Add axes labels
    YTM = Year(i);
    title(["Government bond yields (Jan-1995 to Mar-2018); Maturity =" num2str(YTM) 'years' ])
    xlabel('Date')
    ylabel('Yield (%)')

end