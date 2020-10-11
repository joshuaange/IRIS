function [TE_avg, TC_avg, heatFlux, heatTransfer, areaGround, cooling, TP_new, velocityEnd, FI, deltalKE, deltaKE, Y_avg, G_avg, landPoisson, landMaterialProp, deformation] = III_final(S_2, velocityHit, vec_FR, vec_FF, vec_FG, vec_FE, mass, T, Y, G, diameter, podMaterialProp, S, TE, TC, heatCapacity, TP)
% Final equations
%   Called by control.m
% New Velocity
velocityEnd = [S_2(1) S_2(2) S_2(3); 0 0 0];
velocityEnd(2,1) = (T/mass)*(velocityHit(2,1) + (vec_FR(2,1)) + vec_FF(2,1) + vec_FG(2,1) + vec_FE(2,1));
velocityEnd(2,2) = (T/mass)*(velocityHit(2,2) + (vec_FR(2,2)) + vec_FF(2,2) + vec_FG(2,2) + vec_FE(2,2));
velocityEnd(2,3) = (T/mass)*(velocityHit(2,3) + (vec_FR(2,3)) + vec_FF(2,3) + vec_FG(2,3) + vec_FE(2,3));

% Force of Impact
FI = mass*((vec_mag(velocityEnd) - vec_mag(velocityHit))/T);

% Kinetic Energy
deltalKE=0.5*mass*(vec_mag(velocityEnd)^2 - vec_mag(velocityHit)^2);
deltaKE = deltalKE;

% Deformation
Y_avg = (Y(S(1),S(2))+Y(S_2(1),S_2(2)))/2;
G_avg = (G(S(1),S(2))+G(S_2(1),S_2(2)))/2;
landPoisson = (Y_avg)/(2*G_avg-1);
landMaterialProp = (1-landPoisson^2)/(pi*Y_avg);
deformation = ((((3*pi/2)^2/3)*(101.97*(-FI))^2/3*(landMaterialProp+podMaterialProp)^2/3*(1/(1000*diameter)))^1/3)/1000;

% Average values 
TE_avg = (TE(S(1),S(2))+TE(S_2(1),S_2(2)))/2;
TC_avg = (TC(S(1),S(2))+TC(S_2(1),S_2(2)))/2;
% Finding heat flux (W/m^2)
heatFlux = ((TC_avg)*((TP-TE_avg))/(deformation));
% Heat transfer coefficient (W/(m^2*K))
if TP == TE_avg
	heatTransfer = 0;
else
	heatTransfer = (heatFlux)/(TP-TE_avg);
end;
% Area of heat exchange (m^2)
areaGround = pi*((diameter/2)^2-((diameter/2)-deformation)^2);
% Cooling coefficient (1/s)
cooling = heatTransfer*(areaGround/heatCapacity);
% New Temperature (K)
TP_new = TE_avg+(TP-TE_avg)*exp(-cooling*T);
end