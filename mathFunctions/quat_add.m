function [aa, bb, cc, dd] = quat_add(ap, bp, cp, dp, ag, bg, cg, dg)
%QUAT_ADD
%   Multiplies two quaternions together (p * g)

aa = (ap*ag) - (bp*bg) - (cp*cg) - (dp*dg);
bb = (bp*ag) + (ap*bg) - (dp*cg) + (cp*dg);
cc = (cp*ag) + (dp*bg) + (ap*cg) - (bp*dg);
dd = (dp*ag) - (cp*bg) + (bp*cg) + (ap*dg);

norm = sqrt((aa^2)+(bb^2)+(cc^2)+(dd^2));

aa = aa/norm;
bb = bb/norm;
cc = cc/norm;
dd = dd/norm;

end

