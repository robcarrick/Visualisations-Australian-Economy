%%% This function interpolates monthly inflation data from quarterly data %%%
%%% written for one particular data set from December 1994 to December 2017

% The interpolation extends the quarterly values to 
%       that of the monthly values
% Example: Quarter 1 value = x will lead to the values for all three months
%       in that quarter being x
% Result will look similar to a step function

% INPUT: x = name of excel spread sheet
%        a = tab number with the data
% OUTPUT: Interpolated monthly inflation data array: infl

function infl = inflation_func(x,a)

Z = xlsread(x,a);
L = length(Z);

colvec = zeros(L,1);
j = 0;
for i = 1:L
    colvec(i) = j + 1;
    j = j+1;
end
Z = [colvec,Z];

L = length(Z);
Z1 = zeros(L*3,2);
j = 0;
for i = 1:L*3
    Z1(i,1)= j + 1;
    j = j+1;
end
Z1;
j = 1;
for i = 1:L
    Z1(j:j+2,2) = Z(i,2);
    j = j+3;
end
% get rid of Dec 1994
L = length(Z1); Z1 = Z1(2:L,:); 

% Add the inflation figure for Mar 2018 (same as Feb 2018)
Z1(L,1) = Z1(L-1,1); Z1(L,2) = Z1(L-1,2);
Z1;
% Final Output
infl = Z1(:,2);