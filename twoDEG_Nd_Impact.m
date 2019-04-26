%Author: Khoa(primary), Abhishek(secondary)
%Description: For Si, plot the W at BV, BV, Ron,sp (in ?.cm2) 
%as a function of ND (1e14 to 1e20 in decades) (EE222 HW4 PROBLEM 2)

%###############################
%Si
dialectric_const_Si = 11.8; %AlN
mobility_Si = 1400;
Ec_Si = 3e5;

%Material dependent calculation
permit_Si = e0*dialectric_const_Si;
W_Si = permit_Si*Ec_Si./(1.6e-19.*Nd);
BV_Si = Ec_Si.*W_Si./2;
Ron_Si = W_Si./(1.6e-19*mobility_Si.*Nd);
BFOM_Si = BV_Si.^2./Ron_Si;

%###############################
Nd = logspace(14,20);   %sweep Nd from 1e14 to 1e20 in decades
%constants
e0 = 8.85e-14;

%AlN 
dialectric_const_AlN = 8.5; %AlN
mobility_AlN = 300;
Ec_AlN = 17e5;

%Material dependent calculation
permit_AlN = e0*dialectric_const_AlN;
W_AlN = permit_AlN*Ec_AlN./(1.6e-19.*Nd);
BV_AlN = Ec_AlN.*W_AlN./2;
Ron_AlN = W_AlN./(1.6e-19*mobility_AlN.*Nd);
BFOM_AlN = BV_AlN.^2./Ron_AlN;

%####PROBLEM 2#############
dialectric_const_SiC = 9.7; %SiC
mobility_SiC = 1000;
Ec_SiC = 25e5;
dialectric_const_GaN = 9; %GaN
mobility_GaN = 1250;
Ec_GaN = 33e5;
dialectric_const_Ga2O3 = 10; %Ga2O3
mobility_Ga2O3 = 300;
Ec_Ga2O3 = 80e5;
dialectric_const_Diamond = 5.5; %Diamond
mobility_Diamond = 2000;
Ec_Diamond = 100e5;

%Material dependent calculation: SiC
permit_SiC = e0*dialectric_const_SiC;
W_SiC = permit_SiC*Ec_SiC./(1.6e-19.*Nd);
BV_SiC = Ec_SiC.*W_SiC./2;
Ron_SiC = W_SiC./(1.6e-19*mobility_SiC.*Nd);
BFOM_SiC = BV_SiC.^2./Ron_SiC;
%Material dependent calculation: GaN
permit_GaN = e0*dialectric_const_GaN;
W_GaN = permit_GaN*Ec_GaN./(1.6e-19.*Nd);
BV_GaN = Ec_GaN.*W_GaN./2;
Ron_GaN = W_GaN./(1.6e-19*mobility_GaN.*Nd);
BFOM_GaN = BV_GaN.^2./Ron_GaN;
%Material dependent calculation: Ga2O3
permit_Ga2O3 = e0*dialectric_const_Ga2O3;
W_Ga2O3 = permit_Ga2O3*Ec_Ga2O3./(1.6e-19.*Nd);
BV_Ga2O3 = Ec_Ga2O3.*W_Ga2O3./2;
Ron_Ga2O3 = W_Ga2O3./(1.6e-19*mobility_Ga2O3.*Nd);
BFOM_Ga2O3 = BV_Ga2O3.^2./Ron_Ga2O3;
%Material dependent calculation: Diamond
permit_Diamond = e0*dialectric_const_Diamond;
W_Diamond = permit_Diamond*Ec_Diamond./(1.6e-19.*Nd);
BV_Diamond = Ec_Diamond.*W_Diamond./2;
Ron_Diamond = W_Diamond./(1.6e-19*mobility_Diamond.*Nd);
BFOM_Diamond = BV_Diamond.^2./Ron_Diamond;
%##########################
%set up plot
figure(1);
subplot(3,1,1);
%loglog(Nd, W_Si ,Nd,W_AlN, Nd, W_SiC, Nd, W_GaN, Nd, W_Ga2O3, Nd, W_Diamond,'LineWidth',1.5);
loglog(Nd, W_Si,'LineWidth',1.5);   %prob3.1
title('W at breakdown voltage vs Nd');
ylabel('W (cm)');
xlabel('Doping Concentration (cm^-^3)');
%legend('Si','AlN','SiC','GaN','Ga2O3','Diamond');
grid on;
subplot(3,1,2);
%loglog(Nd,BV_Si, Nd,BV_AlN./1000, Nd, BV_SiC./1000, Nd, BV_GaN./1000, Nd, BV_Ga2O3./1000, Nd, BV_Diamond./1000,'LineWidth',1.5);
loglog(Nd,BV_Si,'LineWidth',1.5);   %prob3.1
title('Breakdown Voltage vs Nd');
ylabel('Breakdown Voltage (kV)');
xlabel('Doping Concentration (cm^-^3)');
%legend('Si','AlN','SiC','GaN','Ga2O3','Diamond');
grid on;
subplot(3,1,3);
%loglog(Nd,Ron_Si, Nd,Ron_AlN, Nd,Ron_SiC, Nd,Ron_GaN, Nd,Ron_Ga2O3, Nd,Ron_Diamond,'LineWidth',1.5);
loglog(Nd,Ron_Si,'LineWidth',1.5);  %prob3.1
title('Ron(sp) vs Nd');
ylabel('Ron(sp) (\Omega.cm^2)');
xlabel('Doping Concentration (cm^-^3)');
%legend('Si','AlN','SiC','GaN','Ga2O3','Diamond');
grid on;