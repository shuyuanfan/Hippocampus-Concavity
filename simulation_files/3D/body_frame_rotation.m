function R = body_frame_rotation(Phi)
phi = Phi(1); theta = Phi(2); psi = Phi(3);

R = [  cos(psi)*cos(theta)  cos(psi)*sin(theta)*sin(phi)-sin(psi)*cos(phi)  cos(psi)*cos(phi)*sin(theta)+sin(psi)*sin(phi) ;
    sin(psi)*cos(theta)  sin(psi)*sin(theta)*sin(phi)+cos(psi)*cos(phi)  sin(psi)*cos(phi)*sin(theta)-cos(psi)*sin(phi) ;
    -sin(theta)           cos(theta)*sin(phi)                             cos(theta)*cos(phi)                            ];
end