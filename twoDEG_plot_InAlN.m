%Description: Plot of 2DEG density in heterostructure with varied mole
%fractions (EE222 HW4 PROBLEM 2)
%Author: Abhishek Raol
%READ FIRST: not sure about the lattice constant (a) in the Ppe
%equation. should a the lattice constant of the interfacing semiconductor,
%or should it be the lattice constant of the semiconductor if it were
%relaxed. If so then do you use the lattice constant of GaN or AlN?
%NOTE: inefficient/repetitive use of indexing x in a for loop and again 
%in an array to plot the output 
%Last Update: 4/24/19 12:14am 
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

TDEHG = [0,0,0,0,0,0,0,0,0,0,0];    %define 2DEG or 2DHG density matrix 
strainX = [0,0,0,0,0,0,0,0,0,0,0];  %define matrix to hold Ppe_x

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
              
%Y structure
%     y = 0;
%     y_n = 1;
%     a0_y = (y(i)*a0_AlN) + (y_n(i)*a0_GaN); %y structure a_0y needed
%     e31_y = (y(i)*e31_AlN) + (y_n(i)*e31_GaN);
%     e33_y = (y(i)*e33_AlN) + (y_n(i)*e33_GaN);
%     c13_y = (y(i)*c13_AlN) + (y_n(i)*c13_GaN);
%     c33_y = (y(i)*c33_AlN) + (y_n(i)*c33_GaN);
        
    %for each y, sweep x structure 10 points
    x = 0;
    x_n = 1-x; %x complement
    for j = 1:1:11
       %X structure
        a0_x = (x*a0_InN) + (x_n*a0_GaN);
        e31_x = (x*e31_InN) + (x_n*e31_AlN);
        e33_x = (x*e33_InN) + (x_n*e33_AlN);
        c13_x = (x*c13_InN) + (x_n*c13_AlN);
        c33_x = (x*c33_InN) + (x_n*c33_AlN);
        
        %----setup 2DEG(or 2DHG) equation----
        %solve for piezoelectric and spontaneous polarization charge Y
        Ppe_y = 0;  %Ystruct is zero b/c the Ystruct is relaxed and Xstruct aligns.
        Psp_y = Psp_GaN;
        %solve for piezoelectric and spontaneous polarization charge X
        Ppe_x = 2 * ((a0_GaN-a0_x)/a0_x) * ( e31_x - (e33_x*(c13_x/c33_x)) ); %!!!!!
        Psp_x = (x*Psp_InN) + (x_n*Psp_AlN);
        %charge seen at heterojunction interface
        interface_charge = Ppe_x + Psp_x - Ppe_y - Psp_y;
        %write to density function and barriel layer strain of X structure
        TDEHG(j) = (interface_charge/(1.6E-19))*(1E-4); %TDEHG: neg=2DEG, pos=2DHG
        strainX(j) = (a0_y-a0_x)/a0_x;
        %prepare for next loop
        x= x + 0.1;   %increment x
        x_n = x_n - 0.1; %decrement x-1 term
    end

%setup of plot
X = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
Y0 = TDEHG;

%plot 2DEG / 2DHG as a function of x for various values of y
figure
subplot(2,1,1);
plot(X,Y0,'LineWidth',2.0);
grid on;
title({"Density of 2DEG or 2DHG as a function of X and Y in:","In(x)Al(1-x)N / GaN"});
xlabel({'x mole fraction', 'In(x)Al(1-x)N'});
ylabel({'Density of 2DEG or 2DHG (cm-2)','[ <- neg=2DEG, pos=2DHG -> ]'});

%Plot the strain of Al(x)Ga(1-x)N barrier layer
subplot(2,1,2)
plot(X,strainX(1,:),'LineWidth', 2.0);
grid on;
title({"Barrier layer strain"});
xlabel({'x mole fraction', 'In(x)Al(1-x)N'});
ylabel({'Strain','(due to lattice mismatch)'});
