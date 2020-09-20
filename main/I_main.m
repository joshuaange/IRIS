function [terminalVelocity, podPoisson, podMaterialProp] = I_main(mass,gravity,airDensity,surfaceArea,dragCoefficient,podYoungsMod,podModRigidity)
% Finds general conditions
%   Called by control.m
terminalVelocity = sqrt((2*mass*gravity)/(airDensity*surfaceArea*dragCoefficient));
podPoisson = (podYoungsMod)/(2*podModRigidity-1);
podMaterialProp = (1-podPoisson^2)/(pi*podYoungsMod);
end

