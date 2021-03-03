% Pod Survivability
display("...Pod Survivability");
aa = (T_s_ij)/(T_max);
aaa = (T_f_ij)/(T_max);
bb = abs(T_f_ij-T_s_ij)/deltaT;
dd = (FI_ij/(SA_g_ij))/E_l;
ee = (((FI_ij/(SA_g_ij^2))/1000000)*(sqrt(SA_g_ij)))/K_c;
ff = (FI_ij/SA_g_ij)/FI_max;
gg = (FI_ij/(SA_g_ij))/F_tu;

S_pod = [aa,aaa,bb,dd,ee,ff,gg];
display(double(S_pod));

S_pod_ij = max(double(real(S_pod)));

% Contents Survivability
display("...Content Survivability");
hh = (FI_ij/SA_g_ij)/FI_max_c;
ii = (abs(D_ij))/d_shell;
jj = (T_s_ij)/(T_max_c);
jjj = (T_f_ij)/(T_max_c);
kk = mag(Q_ij)/omega_max_c;

S_contents = [hh,ii,jj,jjj,kk];
display(double(S_contents));

S_contents_ij = max(double(real(S_contents)));