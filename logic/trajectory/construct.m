% This script is automatically constructed by trajectory.m 
x_i(t) = (-10*Q(z_i(t)))/g(z_i(t)) * (1-exp((-g(z_i(t))*t)/Q(z_i(t)))) +100;
y_i(t) = (20*Q(z_i(t)))/g(z_i(t)) * (1-exp((-g(z_i(t))*t)/Q(z_i(t)))) +10;
z_i(t) = piecewise((0<=t<1000),(62.3858/7.3362) * ((50)+62.3858) * (1-exp((-7.3362*(t-0))/62.3858)) - (62.3858*(t-0)) +7371000, (1000<=t<2000),(62.9101/7.4601) * ((-62.3858)+62.9101) * (1-exp((-7.4601*(t-1000))/62.9101)) - (62.9101*(t-1000)) +7309569.9008, (2000<=t<3000),(63.4562/7.5901) * ((-62.9101)+63.4562) * (1-exp((-7.5901*(t-2000))/63.4562)) - (63.4562*(t-2000)) +7246664.222, (3000<=t<4000),(64.0167/7.7248) * ((-63.4562)+64.0167) * (1-exp((-7.7248*(t-3000))/64.0167)) - (64.0167*(t-3000)) +7183212.5876, (4000<=t<5000),(64.5923/7.8644) * ((-64.0167)+64.5923) * (1-exp((-7.8644*(t-4000))/64.5923)) - (64.5923*(t-4000)) +7119200.5037, (5000<=t<6000),(65.1837/8.009) * ((-64.5923)+65.1837) * (1-exp((-8.009*(t-5000))/65.1837)) - (65.1837*(t-5000)) +7054612.8977, (6000<=t<7000),(65.7916/8.1591) * ((-65.1837)+65.7916) * (1-exp((-8.1591*(t-6000))/65.7916)) - (65.7916*(t-6000)) +6989434.0102, (7000<=t<8000),(66.4167/8.3149) * ((-65.7916)+66.4167) * (1-exp((-8.3149*(t-7000))/66.4167)) - (66.4167*(t-7000)) +6923647.3507, (8000<=t<9000),(67.0599/8.4767) * ((-66.4167)+67.0599) * (1-exp((-8.4767*(t-8000))/67.0599)) - (67.0599*(t-8000)) +6857235.6492, (9000<=t<10000),(67.7222/8.645) * ((-67.0599)+67.7222) * (1-exp((-8.645*(t-9000))/67.7222)) - (67.7222*(t-9000)) +6790180.8033, (10000<=t<11000),(68.4044/8.82) * ((-67.7222)+68.4044) * (1-exp((-8.82*(t-10000))/68.4044)) - (68.4044*(t-10000)) +6722463.8217, (11000<=t<12000),(69.1075/9.0023) * ((-68.4044)+69.1075) * (1-exp((-9.0023*(t-11000))/69.1075)) - (69.1075*(t-11000)) +6654064.7615, (12000<=t<13000),(69.8327/9.1922) * ((-69.1075)+69.8327) * (1-exp((-9.1922*(t-12000))/69.8327)) - (69.8327*(t-12000)) +6584962.6603, (13000<=t<14000),(70.5812/9.3903) * ((-69.8327)+70.5812) * (1-exp((-9.3903*(t-13000))/70.5812)) - (70.5812*(t-13000)) +6515135.4618, (14000<=t<15000),(71.3541/9.5971) * ((-70.5812)+71.3541) * (1-exp((-9.5971*(t-14000))/71.3541)) - (71.3541*(t-14000)) +6444559.9342, (15000<=t<16000),(72.1529/9.8132) * ((-71.3541)+72.1529) * (1-exp((-9.8132*(t-15000))/72.1529)) - (72.1529*(t-15000)) +6373211.581);
