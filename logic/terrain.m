% Save terrain values into variables
% Heightmap Reading - L (Terrain)
L_z = double((imread(strcat(folder,'\data\inputs\',file,'\Surface.png'))))*(L_max-L_min)/255 + L_min;
L_x = 0:(domain/size(L_z,2)):(domain-(domain/size(L_z,2)));
L_y = 0:(domain/size(L_z,1)):(domain-(domain/size(L_z,1)));
% Heightmap Reading - F (Coefficient of Friction)
F_z = double((imread(strcat(folder,'\data\inputs\',file,'\Friction.png'))))*(F_max-F_min)/255 + F_min;
F_x = 0:(domain/size(F_z,2)):(domain-(domain/size(F_z,2)));
F_y = 0:(domain/size(F_z,1)):(domain-(domain/size(F_z,1)));
% % Heightmap Reading - F_r (Coefficient of Rolling Friction)
% F_r_z = double((imread(strcat(folder,'\data\inputs\',file,'\RollingFriction.png'))))*(F_r_max-F_r_min)/255 + F_r_min;
% F_r_x = 0:(domain/size(F_r_z,2)):(domain-(domain/size(F_r_z,2)));
% F_r_y = 0:(domain/size(F_r_z,1)):(domain-(domain/size(F_r_z,1)));
% Heightmap Reading - K (Coefficient of Restitution)
K_z = double((imread(strcat(folder,'\data\inputs\',file,'\Restitution.png'))))*(K_max-K_min)/255 + K_min;
K_x = 0:(domain/size(K_z,2)):(domain-(domain/size(K_z,2)));
K_y = 0:(domain/size(K_z,1)):(domain-(domain/size(K_z,1)));
% Heightmap Reading - T_c (Thermal Conductivity)
T_c_z = double((imread(strcat(folder,'\data\inputs\',file,'\Conductivity.png'))))*(T_c_max-T_c_min)/255 + T_c_min;
T_c_x = 0:(domain/size(T_c_z,2)):(domain-(domain/size(T_c_z,2)));
T_c_y = 0:(domain/size(T_c_z,1)):(domain-(domain/size(T_c_z,1)));
% Heightmap Reading - G_l (Modulus of Rigidity)
G_l_z = double((imread(strcat(folder,'\data\inputs\',file,'\ModulusOfRigidity.png'))))*(G_l_max-G_l_min)/255 + G_l_min;
G_l_x = 0:(domain/size(G_l_z,2)):(domain-(domain/size(G_l_z,2)));
G_l_y = 0:(domain/size(G_l_z,1)):(domain-(domain/size(G_l_z,1)));
% Heightmap Reading - T_g (Ground Temperature)
T_g_z = double((imread(strcat(folder,'\data\inputs\',file,'\Temperature.png'))))*(T_g_max-T_g_min)/255 + T_g_min;
T_g_x = 0:(domain/size(T_g_z,2)):(domain-(domain/size(T_g_z,2)));
T_g_y = 0:(domain/size(T_g_z,1)):(domain-(domain/size(T_g_z,1)));
% Heightmap Reading - Y_l (Young's Modulus)
Y_l_z = double((imread(strcat(folder,'\data\inputs\',file,'\YoungsModulus.png'))))*(Y_l_max-Y_l_min)/255 + Y_l_min;
Y_l_x = 0:(domain/size(Y_l_z,2)):(domain-(domain/size(Y_l_z,2)));
Y_l_y = 0:(domain/size(Y_l_z,1)):(domain-(domain/size(Y_l_z,1)));