%Author: Abhishek Raol
%Description: Calculator for 2DEH/2DHG density in 
%heterostructure junction with varied mole fractions
%
% Heterostructure
%----------------
%Al(x)Ga(1-x)N
%----------------
% Al(y)Ga(1-y)N 
%----------------

%###################################################
%USER INPUT HERE. set x and y:
%these are the mole fractions of the heterostrcutures
% Run this for the mole fractions and you can check 
% various parameters of the structure in command window
x = 0.3; %mole fraction of Al on X structure
y = 1;      %mole fraction of Al on Y structure
%###################################################
x_n = 1-x;
y_n = 1-y;

%constants:
a0_AlN = 3.112;
a0_GaN = 3.189;
e33_AlN = 1.55;
e33_GaN = 1;
e31_AlN = -0.60;
e31_GaN = -0.49;
c13_AlN = 120;
c13_GaN = 70;
c33_AlN = 395;
c33_GaN = 379;
Psp_AlN = -0.081;
Psp_GaN = -0.029;

%X structure
        a0_x = (x*a0_AlN) + (x_n*a0_GaN);
        a0_y = (y*a0_AlN) + (y_n*a0_GaN); %y structure a_0y needed
        e31_x = (x*e31_AlN) + (x_n*e31_GaN);
        e33_x = (x*e33_AlN) + (x_n*e33_GaN);
        c13_x = (x*c13_AlN) + (x_n*c13_GaN);
        c33_x = (x*c33_AlN) + (x_n*c33_GaN);
        %solve for piezoelectric and spontaneous polarization charge X
        %   a(from the fromula) is actually a0_y because the X structure
        %   has a mismatch of the lattice of the Y structure 
        Ppe_x = 2 * ((a0_y-a0_x)/a0_x) * ( e31_x - (e33_x*(c13_x/c33_x)) );
        Psp_x = (x*Psp_AlN) + (x_n*Psp_GaN);

%Y structure     
        e31_y = (y*e31_AlN) + (y_n*e31_GaN);
        e33_y = (y*e33_AlN) + (y_n*e33_GaN);
        c13_y = (y*c13_AlN) + (y_n*c13_GaN);
        c33_y = (y*c33_AlN) + (y_n*c33_GaN);
        %solve for piezoelectric and spontaneous polarization charge Y
        %Ppe_y = 2 * ((a0_x-a0_y)/a0_y) * ( e31_y - (e33_y*(c13_y/c33_y)) );
        Ppe_y = 0;
        Psp_y = (y*Psp_AlN) + (y_n*Psp_GaN);
        
 %charge seen at heterojunction interface
 interface_charge = Ppe_x + Psp_x - Ppe_y - Psp_y;
 %2DEG or 2DHG density
 TDEHG = (interface_charge/(1.6E-19))*(1E-4); %TDEHG: neg=2DEG, pos=2DHG
 
