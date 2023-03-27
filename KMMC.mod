var q k kg b bg x xg YY;

varexo ep;

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

q*(k-k(-1)) + b(-1)/betag + x - (1-ep)*c*k(-1) = (1-ep)*a*k(-1) + b;

% Non-tradeable output

x = c*k(-1);

% Farmers' borrowing constraint 

b = betag*q(+1)*k;

% Gatherers' Euler equation

q = betag*((1-ep(+1))*alpha*(z + kg)^(alpha-1) + q(+1));

% Aggregate resource constraint

x + m*xg = (1-ep)*(a+c)*k(-1) + (1-ep)*m*(z+kg(-1))^alpha;

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
q = (a/betag)/(betag^(-1)-1);
b = (a*k)/(betag^(-1)-1);
xg = (1/m)*(a*k + m*(z + kg)^(alpha));
end;


steady;

shocks;
var ep = 0.0011^2;
end;

stoch_simul(order = 1,ar=0, irf = 12);

