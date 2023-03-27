%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODEL FILE OF A MONETARY SHOCK FOR BERNANKE, GERTLER, AND GILCHRIST (1999) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
var y c ce i g n rk r q k x a h pi rn lev;

varexo en ern eg ea;

parameters cy cey iy gy nu theta epsi varphi alpha Omega eta kappa beta delta gamma RKN rho zeta rhoa rhog sa sg srn;


load BGGM_param;
set_param_value('cy',cy);
set_param_value('iy',iy);
set_param_value('gy',gy);
set_param_value('cey',cey);
set_param_value('nu',nu);
set_param_value('epsi',epsi);
set_param_value('theta',theta);
set_param_value('beta',beta);
set_param_value('varphi',varphi);
set_param_value('alpha',alpha);
set_param_value('Omega',Omega);
set_param_value('eta',eta);
set_param_value('kappa',kappa);
set_param_value('delta',delta);
set_param_value('gamma',gamma);
set_param_value('RKN',RKN);
set_param_value('rho',rho);
set_param_value('zeta',zeta);
set_param_value('rhoa',rhoa);
set_param_value('rhog',rhog);
set_param_value('sa',sa);
set_param_value('sg',sg);
set_param_value('srn',srn);



model(linear);

% 2.4.1 resource constraint

y = c*cy + ce*cey + i*iy + g*gy;

% 2.4.2 Euler equation

c = -r + c(+1);

% 2.4.3 entrepreneurial consumption

ce = n;

% 2.4.4 risk spread 

rk(+1) - r = -nu*(n-q-k);

% 2.4.5 marginal product of capital

rk = (1-epsi)*(y-k(-1)-x)+epsi*q-q(-1);

% 2.4.6 price of capital

q = varphi*(i-k(-1));

% 2.4.7 aggregate output

y = a + alpha*k(-1)+ (1-alpha)*Omega*h;

% 2.4.8 labor market equilibrium

y - h - x - c = eta^(-1)*h;

% 2.4.9 Phillips curve

pi = -kappa*x + beta*pi(+1);

% 2.4.10 evolution of capital

k = delta*i + (1-delta)*k(-1);

% 2.4.11 evolution of net worth

n = gamma*RKN*(rk - r(-1)) + r(-1) + n(-1) + en;

% 2.4.12 monetary policy rule

rn = rho*rn(-1) + zeta*pi(-1) + srn*ern;

% 2.4.13 government shock

g = rhog*g(-1) + sg*eg;

% 2.4.14 productivity shock

a = rhoa*a(-1) + sa*ea;

% (15) Fisher relationship

rn = r + pi(+1);

% (16) leverage
lev = q + k - n;


end;


shocks;
var ern = 1;
end;

stoch_simul(order=1,irf=200,ar=0,nocorr,nograph);
