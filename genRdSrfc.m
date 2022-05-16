clc;
clear;
%function [out] = genRdSrfc();
%GENRDSRFC Summary of this function goes here
%   Detailed explanation goes here

% to add: function needs inputs for timestep and number of steps instead of end time
% also speed
speed = 60;
v = (1/3.6)*speed;
t = [0:0.001:(20-0.001)];
outvec = zeros(1, length(t));
L = 1.5;
wfund = (2*pi*v)/1.5;
amplvec = [10, 0.3, 0, 0, 1, 2];
amplvec = (1/1000)*amplvec;
stepvec = ones(1, length(t));
for i = 1:6
    tempvec = amplvec(i)*cos(i*wfund*t);
    outvec = outvec + tempvec;
end

for i = 1:10
    outvec(((2000*(i-1)) + 1):(2000*i)) = outvec(((2000*(i-1)) + 1):(2000*i)) + (2/100)*rand*stepvec(((2000*(i-1)) + 1):(2000*i)) ;
end
    outvec = outvec + 0.05*sin((3/10)*pi*t);

    outvec = [zeros(1,5000), outvec];
    t = t+5; 
    tstart = 0:0.001:(5-0.001);
    t = [tstart, t];

    plot(t, outvec);




%end

