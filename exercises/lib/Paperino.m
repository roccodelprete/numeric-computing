% script Paperino
% disegna il volto di Paperino a partire da due insiemi di punti.
% Utilizza curve parametriche interpolanti basate su spline naturali e
% basate su cubiche di Hermite a tratti.
%
x =[ 0.2231    0.2074    0.2013    0.1832    0.1542    0.1397    0.1457    0.1252    0.1131 ...
    0.1191    0.1385    0.1530    0.1252    0.1421    0.1663    0.1965    0.2243    0.2751 ...
    0.3077    0.3331    0.3924    0.4383    0.4722    0.4855    0.4940    0.4915    0.4407 ...
    0.3573    0.2993    0.2364    0.1844    0.2437    0.3041    0.3597    0.4528    0.4819 ...
    0.5218    0.5302    0.5496    0.5447    0.5580    0.5738    0.5568    0.5459    0.5617 ...
    0.5701    0.5810    0.5762    0.5750    0.5738    0.5653    0.5774    0.5919    0.6221 ...
    0.6378    0.6608    0.6669    0.6729    0.6632    0.6378    0.6076    0.5786    0.5484 ...
    0.5242    0.4976    0.4674    0.4347    0.4008    0.3742    0.3259    0.2739    0.2400]; 
y =[ 0.3869   0.4305    0.4824    0.5114    0.5135    0.4865    0.5488    0.5176    0.4990 ...
    0.5529    0.5778    0.5944    0.6836    0.7396    0.7811    0.8019    0.8039    0.7915 ...
    0.8807    0.9222    0.9761    0.9927    0.9367    0.8994    0.8620    0.8247    0.7770 ...
    0.7147    0.6774    0.6234    0.5571    0.5965    0.6442    0.6898    0.7459    0.7687 ...
    0.7790    0.8226    0.8724    0.7977    0.8039    0.8122    0.7832    0.7417    0.7023 ...
    0.6421    0.5716    0.5239    0.4824    0.4346    0.4098    0.3869    0.3662    0.3517 ...
    0.3517    0.3351    0.3039    0.2687    0.2396    0.2438    0.2645    0.2832    0.2873 ...
    0.2770    0.2624    0.2396    0.2147    0.2127    0.2396    0.2853    0.3185    0.3413];
x1 =[ 0.6620    0.6366    0.6149    0.6064    0.5895    0.5641    0.5484    0.5339    0.5012 ...
    0.4794    0.4637    0.4528    0.4274    0.4117    0.3888    0.3755    0.3380    0.2896 ...
    0.2570    0.2219    0.2013    0.1953    0.2037    0.2340    0.2509    0.2678    0.2860 ...
    0.3138    0.3452    0.3875    0.3960    0.4093    0.4250    0.4335    0.4347    0.4335 ...
    0.4311    0.4250    0.4141    0.4069    0.4045    0.4045    0.4033    0.4093    0.4166 ...
    0.4238    0.4287    0.4299    0.4311    0.4323    0.4262    0.4226    0.4129    0.4021 ...
    0.3851    0.3549    0.3392    0.3210    0.3053    0.3029    0.3114    0.3222    0.3392 ...
    0.3622    0.3839    0.3960    0.4105    0.4250    0.4456    0.4565    0.4770    0.5000 ...
    0.5109    0.5242    0.5314    0.5472    0.5544    0.5568    0.5580    0.5580    0.5532 ...
    0.5459    0.5399    0.5266    0.5181    0.5036    0.4927    0.4843    0.4782    0.4698 ...
    0.4686    0.4698    0.4710    0.4734    0.4807    0.4879    0.4988    0.5085    0.5109 ...
    0.5085    0.5012    0.4891    0.4843    0.4831    0.4831    0.4915    0.4964    0.5036 ...
    0.5133    0.5230    0.5314    0.5472    0.5593    0.5677    0.5738    0.5713    0.5653 ...
    0.5774    0.5883    0.6149    0.6125    0.6052    0.5979    0.5895    0.5822    0.5726 ...
    0.5677    0.5580    0.5387    0.5302    0.5242];
y1 =[0.2479    0.2438    0.2541    0.2666    0.2666    0.2624    0.2583    0.2500    0.2272 ...
    0.2002    0.1898    0.1753    0.1566    0.1566    0.1753    0.2023    0.2210    0.2500 ...
    0.2645    0.2687    0.2936    0.3330    0.3662    0.3766    0.3786    0.3786    0.3786 ...
    0.3703    0.3724    0.3766    0.3890    0.4077    0.4346    0.4678    0.5135    0.5342 ...
    0.5467    0.5591    0.5571    0.5550    0.5405    0.5322    0.5197    0.5073    0.4969 ...
    0.4969    0.5010    0.5197    0.5384    0.5695    0.6027    0.6276    0.6525    0.6629 ...
    0.6753    0.6732    0.6587    0.6380    0.5923    0.5301    0.5031    0.4678    0.4284 ...
    0.4015    0.3911    0.3890    0.4077    0.4367    0.4450    0.4554    0.4699    0.4782 ...
    0.4761    0.4782    0.4803    0.4927    0.5114    0.5405    0.5840    0.5985    0.6380 ...
    0.6691    0.6919    0.7106    0.7127    0.7147    0.7127    0.6961    0.6753    0.6483 ... 
    0.6255    0.6006    0.5778    0.5633    0.5488    0.5467    0.5467    0.5612    0.5757 ...
    0.5965    0.6027    0.6006    0.5820    0.5654    0.5446    0.5197    0.4969    0.4761 ...
    0.4741    0.4720    0.4637    0.4741    0.4699    0.4575    0.4450    0.4243    0.4098 ...
    0.3890    0.3766    0.3620    0.3620    0.3641    0.3620    0.3600    0.3600    0.3600 ...
    0.3537    0.3496    0.3371    0.3309    0.3205];
plot(x,y,'.',x1,y1,'.')
axis([0 1 0 1])
t=1:length(x); tt=linspace(1,t(end),1000);
t1=1:length(x1); tt1=linspace(1,t1(end),1000);
xspl=spline(t,x,tt);yspl=spline(t,y,tt);
xspl1=spline(t1,x1,tt1);yspl1=spline(t1,y1,tt1);
figure(1)
plot(x,y,'.',x1,y1,'.',xspl,yspl,'k',xspl1,yspl1,'k')
title('interpolazione con curve parametriche spline naturali')
xch=pchip(t,x,tt);ych=pchip(t,y,tt);
xch1=pchip(t1,x1,tt1);ych1=pchip(t1,y1,tt1);
figure(2)
plot(x,y,'.',x1,y1,'.',xch,ych,'b',xch1,ych1,'b')
title('interpolazione con curve parametriche cubiche di hermite')