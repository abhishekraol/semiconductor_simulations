%Description: Plot of 2DEG density in heterostructure with varied mole
%fractions (EE222 HW4 PROBLEM 2)
%Author: Abhishek Raol
%Description: Calculator for 2DEH/2DHG density in 
%heterostructure junction with varied mole fractions
%
% Heterostructure:
%
%   ----------------
%   In(x)Al(1-x)N
%   ----------------
%   GaN 
%   ----------------
%
%###################################################
%###################################################
%USER INPUT HERE. set x and y:
%these are the mole fractions of the heterostrcutures
% Run this for the mole fractions and you can check 
% various parameters of the structure in command window
x = 0.18; %mole fraction of In on X structure
%###################################################
x_n = 1-x;

%constants:
a0_AlN = 3.112;
a0_GaN = 3.189;
a0_InN = 3.54;
e33_AlN = 1.55;
e33_GaN = 1;
e33_InN = 1.0629;
e31_AlN = -0.60;
e31_GaN = -0.49;
e31_InN = -0.57;
c13_AlN = 120;
c13_GaN = 70;
c13_InN = 121;
c33_AlN = 395;
c33_GaN = 379;
c33_InN = 182;
Psp_AlN = -0.081;
Psp_GaN = -0.029;
Psp_InN = -0.032;

       %X structure
        a0_x = (x*a0_InN) + (x_n*a0_AlN);
        e31_x = (x*e31_InN) + (x_n*e31_AlN);
        e33_x = (x*e33_InN) + (x_n*e33_AlN);
        c13_x = (x*c13_InN) + (x_n*c13_AlN);
        c33_x = (x*c33_InN) + (x_n*c33_AlN);
        
        %----setup 2DEG(or 2DHG) equation----
        %solve for piezoelectric and spontaneous polarization charge Y
        Ppe_y = 0;  %Ystruct is zero b/c the Ystruct is relaxed and Xstruct aligns.
        Psp_y = Psp_GaN;
        %solve for piezoelectric and spontaneous polarization charge X
        Ppe_x = 2 * ((a0_GaN-a0_x)/a0_x) * ( e31_x - (e33_x*(c13_x/c33_x)) );
        z = ((a0_GaN - a0_x)/a0_x);
        z2 = a0_GaN - a0_x;
        Psp_x = (x*Psp_InN) + (x_n*Psp_AlN);
        %charge seen at heterojunction interface
        interface_charge = Ppe_x + Psp_x - Ppe_y - Psp_y;
        %write to density function and barriel layer strain of X structure
        TDEHG = (interface_charge/(1.6E-19))*(1E-4); %TDEHG: neg=2DEG, pos=2DHG
        strainX = (a0_GaN-a0_x)/a0_x;

