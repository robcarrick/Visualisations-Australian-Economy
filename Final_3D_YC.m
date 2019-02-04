%%% Three Dimensional Yield Curve %%%

%%% Import Yield Curve values as a table and extract the dates
d = readtable('Final Yield Curve (Monthly).xlsx');
dates = d(:,1); dates = table2array(dates); datevals = datenum(dates);
% Now the dates are in a numerical form and in an array
y = 1:4; [X,Y] = meshgrid(dates,y);

%%% Import the data (purely numerical)
Z = xlsread('Final Yield Curve (Monthly).xlsx',1);
Z = transpose(Z); % transposed to make axes follow the 'right hand rule'

%%% Code segment below is only to be used if adjusting for inflation %%%
% infl = inflation_func('Inflation.xlsx',1);
% infl = transpose(infl);
% for i = 1:4
%     Z(i,:) = Z(i,:) - infl;
% end

g = surf(X,Y,Z); % Assign a hangle to the surface plot
alpha(g,0.9) % make the surface plot slightly transparent 

%%% Label the axes
title('3D Yield Curve, Australia (Jan-1995 to Mar-2018)')
% Title below is only for inflation adjusting
%title('Inflation Adjusted 3D Yield Curve, Australia (Jan-1995 to Mar-2018)') 
xlabel('Date')
ylabel('Government Bond Maturity')
zlabel('Bond Yield (%)')

%%% Specify the number of x axis ticks
NumTicks = 15;
L = get(gca,'XLim');
set(gca,'XTick',linspace(L(1),L(2),NumTicks));

%%% Now add the dates to the x axis
datetick('x','mmm yyyy','keeplimits', 'keepticks') % date format
xtickangle(45);

%%% Y axis ticks
yticks([1 2 3 4])
yticklabels({'2 Year','3 Year','5 Year','10 Year'})

%%% Change the font size
ax = gca;
ax.FontSize = 18;

%%% Change the aspect ratio
pbaspect([8 4 3])

%%% build custom colormap for the surface plot
w = flip(winter); 
% flipped since I want lighter colours to denote lower rates
colormap(w.^0.7);

%%% Different views - to illuminate all information from the 3-D YC %%%

view(55,6) % General 3-D View
% view(0,0) % view spread of yields over time
% view(2) % view the change in rates over time (through colour)
% view(90,0) % bond and yield

%%% Use the colorbar below if using view(2)
% h = colorbar; title(h,'Yield (%)') % colour denotes yield(%)


