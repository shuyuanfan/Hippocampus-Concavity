function angle= angleforvector(v)
%% calculate the angles for 3D vector
% v should be 3D vector

psi = atan2(v(2),v(1));
theta = asin(-v(3)/sqrt(v'*v+eps));
angle = [theta;psi];
end