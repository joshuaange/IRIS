function [TE_avg, TC_avg, heatFlux, heatTransfer, areaGround, cooling, TP_new, velocityEnd, FI, deltalKE, deltaKE, Y_avg, G_avg, landPoisson, landMaterialProp, deformation, deltarKE] = III_final(S_2, velocityHit, vec_VR, vec_VF, vec_VG, vec_VE, mass, T, Y, G, diameter, podMaterialProp, S, TE, TC, heatCapacity, TP, vec_rotVelocity, momentOfInertia, quatA_next, quatA_ground)
% Final equations
%   Called by control.m
% New Velocity
velocityEnd = [S_2(1) S_2(2) S_2(3); 0 0 0];
velocityEnd(2,1) = (velocityHit(2,1) + (vec_VR(2,1)) + vec_VF(2,1) + vec_VG(2,1) + vec_VE(2,1));
velocityEnd(2,2) = (velocityHit(2,2) + (vec_VR(2,2)) + vec_VF(2,2) + vec_VG(2,2) + vec_VE(2,2));
velocityEnd(2,3) = (velocityHit(2,3) + (vec_VR(2,3)) + vec_VF(2,3) + vec_VG(2,3) + vec_VE(2,3));
%velocityEnd(2,1) = (vec_rotVelocity(2,1) + velocityHit(2,1) + (vec_VR(2,1)) + vec_VF(2,1) + vec_VG(2,1) + vec_VE(2,1));
%velocityEnd(2,2) = (vec_rotVelocity(2,2) + velocityHit(2,2) + (vec_VR(2,2)) + vec_VF(2,2) + vec_VG(2,2) + vec_VE(2,2));
%velocityEnd(2,3) = (vec_rotVelocity(2,3) + velocityHit(2,3) + (vec_VR(2,3)) + vec_VF(2,3) + vec_VG(2,3) + vec_VE(2,3));

% Force of Impact
FI = mass*((vec_mag(velocityEnd) - vec_mag(velocityHit))/T);

% Kinetic Energy
deltalKE=0.5*mass*(vec_mag(velocityEnd)^2 - vec_mag(velocityHit)^2);
%deltarKE=0.5*momentOfInertia*((quatA_next/(2*pi))^2 - (quatA_ground/(2*pi))^2);
deltarKE = 0;
deltaKE = deltalKE+deltarKE;

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
if deformation == 0
    heatFlux = 0;
else
    heatFlux = ((TC_avg)*((TP-TE_avg))/(deformation));
end;
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