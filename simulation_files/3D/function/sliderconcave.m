function y= sliderconcave(rho,para)
%This is the slider-like concave factor
kmin = para(1);
kmax = para(2);
beta = para(3);
eta = para(4);
y= (beta*kmin*rho+eta*kmax)/(beta*rho+eta);
end


