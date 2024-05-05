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
    tspan = (to:0.06:tf);

%% Case A

% Single Parameter Variation
	xo		=	[3.55;Gam;H;R];        %Nominal Case
	[ta1,xa1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[7.5;Gam;H;R];         %Max Case
	[ta2,xa2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[2.0;Gam;H;R];         %Low Case
	[ta3,xa3]	=	ode23('EqMotion',tspan,xo);

    figure;
    subplot(2,1,1);
    title('Change of Velocity');
    ylabel('Height (m)');
    xlabel('Range (m)');
    hold on;
    grid on;
    plot(xa1(:,4),xa1(:,3), 'k');
    plot(xa2(:,4), xa2(:,3),'g');
    plot(xa3(:,4), xa3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');


    
	xo		=	[V;-0.18;H;R];        %Nominal Case
	[ta1,xa1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[V;0.4;H;R];         %Max Case
	[ta2,xa2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[V;-0.5;H;R];         %Low Case
	[ta3,xa3]	=	ode23('EqMotion',tspan,xo);

    subplot(2,1,2);
    title('Change of flight angle');
    ylabel('Height (m)');
    xlabel('Range (m)');
    hold on;
    grid on;
    plot(xa1(:,4),xa1(:,3), 'k');
    plot(xa2(:,4), xa2(:,3),'g');
    plot(xa3(:,4), xa3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');


    

% Monte Carlo Variation
randfa = zeros(100,1);
randV = zeros(100,1);

%function to generate random values for whole array
for i = 1:100 
    randfa(i) = -0.5 + (0.9 * rand(1));
    randV(i) = 2 + (5.5 * rand(1));
end
figure;
hold on;
for i = 1:100
	xo		=	[randV(i);randfa(i);H;R];
	[ta1,xa1]	=	ode23('EqMotion',tspan,xo);
    plot(xa1(:,4), xa1(:,3));
    disp(length(ta1));
end

% Time derivative calculation and display


%% Case B

% Single Parameter Variation
	xo		=	[V;0;H;R];


% Monte Carlo Variation


% Time derivative calculation and display



%% Case C

% Single Parameter Variation
	xo		=	[1.5*V;Gam;H;R];


% Monte Carlo Variation


% Time derivative calculation and display


%% Case D

% Single Parameter Variation
	xo		=	[3*V;Gam;H;R];


% Monte Carlo Variation


% Time derivative calculation and display


%% Display


