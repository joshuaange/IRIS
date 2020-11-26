function [terminalVelocity, podPoisson, podMaterialProp, dLdx, dLdy, surfaceArea, StartingKE, EndingKE] = I_main(mass,gravity,airDensity,surfaceArea,dragCoefficient,podYoungsMod,podModRigidity,L,velocityStart,diameter)
% Finds general conditions
%   Called by control.m
surfaceArea = (4*pi*(diameter/2)^2)/2; % frontal area

syms x y
terminalVelocity = sqrt((2*mass*gravity)/(airDensity*surfaceArea*dragCoefficient));
podPoisson = ((podYoungsMod)/(2*podModRigidity))-1;
podMaterialProp = (1-podPoisson^2)/(pi*podYoungsMod);
% Getting Partial Derivatives
dLdx = matlabFunction(diff(L,x),'Vars',[x y]);
dLdy = matlabFunction(diff(L,y),'Vars',[x y]);

StartingKE = 0.5*mass*(vec_mag(velocityStart))^2;
EndingKE = StartingKE;
end