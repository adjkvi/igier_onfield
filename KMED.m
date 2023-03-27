clear all
close all

dynare KMMD noclearall nolog

k_irf = [0;k_ed(1:end-1)];
kg_irf = [0;kg_ed(1:end-1)];

figure

subplot(2,3,1)
plot(YY_ed,'-k','Linewidth',1.5)
title('Output')

subplot(2,3,2)
plot(k_irf,'-k','Linewidth',1.5)
title('k')

subplot(2,3,3)
plot(kg_irf,'-k','Linewidth',1.5)
title('k^{\prime}')

subplot(2,3,4)
plot(b_ed,'-k','Linewidth',1.5)
title('b')

subplot(2,3,5)
plot(q_ed,'-k','Linewidth',1.5)
title('q')
