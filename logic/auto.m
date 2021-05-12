clc
clear all
close all
% Load Input .mat here
display("Reading input .mat file");
global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
folder = pwd;
file = 'SchrodingerBasin';
load(strcat(folder,'\data\inputs\',file,'.mat'))
T = 0.1;
j_max = 1016;
s_min = 300;
k_H = 6.571;
r_edge = 7.5;
Bi_Int = 3*286.7585;
m = 8352;
M_range = 300;
run(strcat(folder,'\logic\start.m'));

clc
clear all
close all
% Load Input .mat here
display("Reading input .mat file");
global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
folder = pwd;
file = 'LinneCrater';
load(strcat(folder,'\data\inputs\',file,'.mat'))
T = 0.01;
j_max = 1016;
s_min = 5;
k_H = 6.571;
r_edge = 7500;
Bi_Int = 50;
M_range = 300;
m = 8352;
q_i = 	[-546398.5-233, 510.5, 100000.0; 0.0, 0.0, 0.0];
u_i = 	[-546398.5-233, 510.5, 100000.0; 1603.1721844193914, 0.0, 0.0];
run(strcat(folder,'\logic\start.m'));

clc
clear all
close all
% Load Input .mat here
display("Reading input .mat file");
global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
folder = pwd;
file = 'FarsideCrater';
load(strcat(folder,'\data\inputs\',file,'.mat'))
rho = 0.02;
T = 0.5;
j_max = 1016;
s_min = 0.2;
k_H = 6.571;
r_edge = 7.5;
Bi_Int = 600;
m = 8352;
run(strcat(folder,'\logic\start.m'));

% % clc
% % clear all
% % close all
% % % Load Input .mat here
% % display("Reading input .mat file");
% % global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% % folder = pwd;
% % file = 'LacrosseProjectileMotion';
% % run(strcat(folder,'\logic\start.m'));
% % 
% % clc
% % clear all
% % close all
% % % Load Input .mat here
% % display("Reading input .mat file");
% % global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% % folder = pwd;
% % file = 'FrictionlessRacquetballOne';
% % run(strcat(folder,'\logic\start.m'));
% % 
% % clc
% % clear all
% % close all
% % % Load Input .mat here
% % display("Reading input .mat file");
% % global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% % folder = pwd;
% % file = 'FrictionlessRacquetballTwo';
% % run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'PingPongOne';
% run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'PingPongTwo';
% run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'PingPongThree';
% run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'PingPongFour';
% run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'PingPongFive';
% run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'CycloidPOne';
% run(strcat(folder,'\logic\start.m'));
% 
% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'CycloidPFour';
% run(strcat(folder,'\logic\start.m'));