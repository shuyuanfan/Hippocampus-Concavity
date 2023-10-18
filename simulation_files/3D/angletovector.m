function Gmma = angletovector(angle)
%angle:2
%vector:3
theta = angle(1);
psi = angle(2);
Gmma =[cos(theta)*cos(psi);...
        cos(theta)*sin(psi);...
        -sin(theta)];
end