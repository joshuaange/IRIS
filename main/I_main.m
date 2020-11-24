function [terminalVelocity, podPoisson, podMaterialProp, dLdx, dLdy] = I_main(mass,gravity,airDensity,surfaceArea,dragCoefficient,podYoungsMod,podModRigidity,L)
% Finds general conditions
%   Called by control.m
syms x y
terminalVelocity = sqrt((2*mass*gravity)/(airDensity*surfaceArea*dragCoefficient));
podPoisson = ((podYoungsMod)/(2*podModRigidity))-1;
podMaterialProp = (1-podPoisson^2)/(pi*podYoungsMod);
% Getting Partial Derivatives
dLdx = matlabFunction(diff(L,x),'Vars',[x y]);
dLdy = matlabFunction(diff(L,y),'Vars',[x y]);
end