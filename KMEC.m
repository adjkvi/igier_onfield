%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXECUTION FILE OF A PRODUCTIVITY SHOCK FOR KIYOTAKI AND MOORE (1997) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all

dynare KMMC noclearall nolog

k_irf = [0;k_ep(1:end-1)];
kg_irf = [0;kg_ep(1:end-1)];

figure

subplot(2,3,1)
plot(YY_ep,'-k','Linewidth',1.5)
title('Output')

subplot(2,3,2)
plot(k_irf,'-k','Linewidth',1.5)
title('k')

subplot(2,3,3)
plot(kg_irf,'-k','Linewidth',1.5)
title('k^{\prime}')

subplot(2,3,4)
plot(b_ep,'-k','Linewidth',1.5)
title('b')

subplot(2,3,5)
plot(q_ep,'-k','Linewidth',1.5)
title('q')
