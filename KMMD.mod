%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODEL FILE OF A DELEVERAGING SHOCK FOR KIYOTAKI AND MOORE (1997) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var q k kg b bg x xg YY;

varexo ed;

parameters m Kbar beta betag a c alpha z;

m = 0.5;
Kbar = 1;
betag = 0.99;
beta = 0.98;
a = 0.7;
c = 0.3;
alpha = 1/3;
z = 0.01;


model;

% Farmers' flow-of-funds constraint

q*(k-k(-1)) + b(-1)/betag + x - c*k(-1) = a*k(-1) + b;

% Non-tradeable output

x = c*k(-1);

% Farmers' borrowing constraint 

b = (1-ed)*betag*q(+1)*k;

% Gatherers' Euler equation

q = betag*(alpha*(z + kg)^(alpha-1) + q(+1));

% Aggregate resource constraint

x + m*xg = (a+c)*k(-1) + m*(z+kg(-1))^alpha;

% Land clearing condition

k + m*kg = Kbar;

% Credit market clearing condition

b + m*bg = 0;

% Output

YY = x + m*xg;

end;


initval;
kg = ((a/betag)/alpha)^(1/(alpha-1))-z;
k = Kbar - kg*m;
x = c*k;
q = (a/(betag*(1-ed)))/(betag^(-1)-1);
b = (a*k)/(betag^(-1)-1);
xg = (1/m)*(a*k + m*(z + kg)^(alpha));
end;


steady;

shocks;
var ed = 0.0001;
end;

stoch_simul(order = 1,ar=0, irf = 12);

