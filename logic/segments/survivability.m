% Pod Survivability
display("...Pod Survivability");
aa = (T_s_ij)/(T_max); % Maximum service temperature
aaa = (T_f_ij)/(T_max); % Maximum service temperature
bb = abs(T_f_ij-T_s_ij)/deltaT; % Maximum rate of temperature change
dd = ((abs(FI_ij))/(HalfArea))/E_l; % Elastic limit
ee = ((((abs(FI_ij))/(HalfArea^2))/1000000)*(sqrt(SA_g_ij)))/K_c; % Fracture toughness
ff = ((abs(FI_ij))/HalfArea)/FI_max; % Maximum force
gg = ((abs(FI_ij))/(HalfArea))/F_tu; % Tensile strength

S_pod = [aa,aaa,bb,dd,ee,ff,gg];
display(double(S_pod));

S_pod_ij = max(double(real(S_pod)));

% Contents Survivability
display("...Content Survivability");
hh = ((abs(FI_ij))/(HalfArea))/FI_max_c; % Maximum froce
ii = (abs(D_ij))/d_shell; % Shell thickness
jj = (T_s_ij)/(T_max_c); % Maximum service temperature
jjj = (T_f_ij)/(T_max_c); % Maximum service temperature
kk = mag(Q_ij)/omega_max_c; % Maximum angular acceleration

S_contents = [hh,ii,jj,jjj,kk];
display(double(S_contents));

S_contents_ij = max(double(real(S_contents)));