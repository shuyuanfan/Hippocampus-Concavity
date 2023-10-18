function T = Jaco(angle)
% Construct velocity transformation tensor
phi = angle(1);
theta = angle(2);
psi = angle(3);
T = [ 1  sin(phi)*tan(theta)   cos(phi)*tan(theta) ;
    0  cos(phi)             -sin(phi)            ;
    0  sin(phi)/cos(theta)   cos(phi)/cos(theta) ];
end