%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXECUTION FILE OF A MONETARY SHOCK FOR BERNANKE, GERTLER, AND GILCHRIST (1999) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all

cy =  0.5;
iy = 0.18;
gy = 0.2;
cey = 1-cy-iy-gy;
nu = 0.2;
theta = 0.75;
beta = 0.99;
varphi = 0.25;
alpha = 0.35;
Omega = 0.99;
eta = 3;
kappa = ((1-theta)*(1-theta*beta))/theta;
delta = 0.025;
gamma = 0.9728;
RKN = beta^(-1)*2;
epsi = (1-delta)/(beta^(-1) + 0.005);
rho = 0.9;
zeta = 0.11;
rhoa = 1;
rhog = 0.95;
sa = 1;
sg = 1;
srn = 0.25/4;

save BGGM_param cy cey iy gy nu theta epsi varphi alpha Omega eta kappa beta delta gamma RKN rho zeta rhoa rhog sa sg srn

dynare BGGM noclearall nolog

spread_ern = rk_ern(2:13)-r_ern(1:12);

YY = [-y_ern(1:12) -i_ern(1:12) -4*rn_ern(1:12) -spread_ern -4*pi_ern(1:12) -q_ern(1:12) -n_ern(1:12) -k_ern(1:12) -lev_ern(1:12)];



nu=0;

save BGGM_param cy cey iy gy nu theta epsi varphi alpha Omega eta kappa beta delta gamma RKN rho zeta rhoa rhog sa sg srn

dynare BGGM noclearall nolog

spread_ern = rk_ern(2:13)-r_ern(1:12);


YY2 = [-y_ern(1:12) -i_ern(1:12) -4*rn_ern(1:12) -spread_ern -4*pi_ern(1:12) -q_ern(1:12) -n_ern(1:12) -k_ern(1:12) -lev_ern(1:12)];


T = size(YY,1);
t = 1:T;

%monetary shock
figure
subplot(2,2,1)
plot(t,YY(:,1),'-k',t,YY2(:,1),'--k','Linewidth',1.5)
title('Y')

subplot(2,2,2)
plot(t,YY(:,2),'-k',t,YY2(:,2),'--k','Linewidth',1.5)
title('I')

subplot(2,2,3)
plot(t,YY(:,3),'-k',t,YY2(:,3),'--k','Linewidth',1.5)
title('r^{n}')

subplot(2,2,4)
plot(t,YY(:,4),'-k',t,YY2(:,4),'--k','Linewidth',1.5)
title('rk-r')
