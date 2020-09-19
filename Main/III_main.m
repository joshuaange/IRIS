% Directional/Planar Setup
run('III_directions.m')
% Reaction Forces
run('III_reactions.m')
% Final Equations
run('III_final.m')
% Return (Y/N?)
return_equation = v_Vi_2(2,3)+S_2(3)-L((v_Vi_2(2,1)+S_2(1)),(v_Vi_2(2,2)+S_2(2))) == Ret;
Ret = vpasolve(return_equation, Ret);