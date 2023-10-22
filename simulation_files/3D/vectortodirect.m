function y = vectortodirect(v)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
v(1)=abs(v(1));
angle = angleforvector(v);
y = angletovector(angle);
end