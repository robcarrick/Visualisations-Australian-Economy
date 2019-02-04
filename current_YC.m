% Plot the yield curve as at March 2018 %

x = 1:4;
y = [1.99	2.10	2.35	2.72];
plot(x,y)
title('Treasury Yield Curve as at March 2018')
xlabel('Bond Maturity')
ylabel('Yield (%)')
grid on
xticks([1 2 3 4])
xticklabels({'2 Year','3 Year','5 Year','10 Year'})

% Edit the font size
ax = gca;
ax.FontSize = 18;