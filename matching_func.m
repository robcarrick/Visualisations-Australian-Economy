% FUNCTION VERSION OF MATCHING HHS TO CR
% INPUT: x = excel spreadsheet
%        a = tab NUMBER with HHS data
%        b = tab NUMBER with CR data
% OUTPUT: matrix with HHS rate and CR data pairs ready for regression

function data = matching_func(x,a,b)
% Import data
HHS = xlsread(x,a);
CR = xlsread(x,b);

% Create 3rd col of HHS to add the CR values in
L = length(HHS); z = zeros(L,1); HHS(:,3) = z;
k = length(CR);

% Target To add values to is HHS(i,3)
for i = 1:L
    % get value of date in HHS Matrix
    d = HHS(i,1);
    for j = 1:k-1
        if (CR(j,1)<= d)&&(d<=CR(j+1,1))
            HHS(i,3) = CR(j,2);
        end
    end
    
% Replace the zeros with NaN
    if HHS(i,3) == 0
        HHS(i,3) = NaN;
    end
    
end
% Resulting Matrix of HHS to CR
data = HHS(:,2:3);
