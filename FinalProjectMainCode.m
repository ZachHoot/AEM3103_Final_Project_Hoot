%% Final Project Document
% Written by Zach Hoot
% 4/22/24 - 5/6/24

%Variables
    S		=	0.017; %Reference area m^2
    AR		=	0.86; %Wing aspect ratio
    e		=	0.9; %Oswald efficiency factor
    m		=	0.003; %mass kg
    g		=	9.8; % gravity constant m/s^2
    rho		=	1.225; %Air density
    CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2)); %Cl function
    CDo		=	0.02; %Zero lift drag
    epsilon	=	1 / (3.141592 * e * AR); %k variable
    CL		=	sqrt(CDo / epsilon); %Cl for ideal lift to drag ratio
    CD		=	CDo + epsilon * CL^2; %Cd for ideal ld ratio
    LDmax	=	CL / CD; %cd ratio
    Gam		=	-atan(1 / LDmax); %associated flight path angle
    V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam)))); %velocity function
    Alpha	=	CL / CLa; %flight path angle
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
    tspan = [to tf];

%% Case A

% Single Parameter Variation


% Monte Carlo Variation


% Time derivative calculation and display


%% Case B

% Single Parameter Variation


% Monte Carlo Variation


% Time derivative calculation and display



%% Case C

% Single Parameter Variation


% Monte Carlo Variation


% Time derivative calculation and display


%% Case D

% Single Parameter Variation


% Monte Carlo Variation


% Time derivative calculation and display


%% Display


