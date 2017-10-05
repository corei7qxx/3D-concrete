function [tminus,tplus] = quadraticEquation(x,v,r,c)
% computes the coefficients p,q, for quadratic function
%
% x = coordinates for all gravel
% v = velocities for all gravel
% r = radii for all gravel
% c = combiantion matrix for all gravel

p = 0;
q = 0;
tplus = zeros(length(c),1);
tminus = zeros(length(c),1);
for i=1:length(c)
    % solving for time when gravelSets collide
    % http://geomalgorithms.com/a07-_distance.html#dist3D_Segment_to_Segment
    % https://en.wikipedia.org/wiki/Quadratic_equation
    wnull = x(c(i,1),:) - x(c(i,2),:);
    p = 2*wnull*(v(c(i,1),:) - v(c(i,2),:))'/norm(v(c(i,1),:) - v(c(i,2),:))^2;
    q = (wnull*wnull' - (r(c(i,1)) + r(c(i,2)))^2)/norm(v(c(i,1),:) - v(c(i,2),:))^2;
    
    if (p/2)^2 - q > 0
        tplus(i) = -p/2 + sqrt((p/2)^2 - q);
        tminus(i) = -p/2 - sqrt((p/2)^2 - q);
    end
end
end