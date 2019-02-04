% FUNCTION: MATCHING HHS TO CR data
% INPUT: x = excel spreadsheet
%        a = tab NUMBER with HHS data
%        b = tab NUMBER with CR data
%        c = tab NUMBER with ASX data
% OUTPUT: matrix with matched HHS rate and CR data ready for regression

function data = multi_match_func(x,a,b,c)

% Import data
HHS = xlsread(x,a);
CR = xlsread(x,b);
ASX = xlsread(x,c);

L = length(ASX); z = zeros(L,1);
ASX(:,3) = z; ASX(:,4) = z;

x = length(HHS); y = length(CR);
for i = 1:L
    d = ASX(i,1);
    % First target - HHS data
    for j = 1:x-1
        if (HHS(j,1)<= d)&&(d<=HHS(j+1,1))
            ASX(i,3) = HHS(j,2);
        end
    end
    % Second target - CR data
    for j = 1:y-1
        if (CR(j,1)<= d)&&(d<=CR(j+1,1))
            ASX(i,4) = CR(j,2);
        end
    end
    % Replace the zeros with NaN
    if ASX(i,3) == 0
        ASX(i,3) = NaN;
    end
    if ASX(i,4) == 0
        ASX(i,4) = NaN;
    end
end
data = ASX(:,2:4);

