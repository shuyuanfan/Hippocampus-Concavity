function y= rootconcave(rho,para)
%This is the slider-like concave factor
k = para(1);
p1 = para(2);
p2 = para(3);
beta1 = para(4);
beta2 = para(5);
y=k*(rho^p1+beta1)/(rho^p2+beta2);
end
