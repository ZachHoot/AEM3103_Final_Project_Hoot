%% Final Project Main Document
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
    tspan = (to:0.06:tf);   %tspan is 101 iterations each time for consistancy

%% Case A
% Single Parameter Variation
    %Velocity min/max/nominal
	xo		=	[3.55;Gam;H;R];        %Nominal Case
	[ta1,xa1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[7.5;Gam;H;R];         %Max Case
	[ta1,xa2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[2.0;Gam;H;R];         %Low Case
	[ta1,xa3]	=	ode23('EqMotion',tspan,xo);
    figure;
    subplot(2,1,1);
    title('Change of Velocity (Case A)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xa1(:,4), xa1(:,3), 'k');
    plot(xa2(:,4), xa2(:,3),'g');
    plot(xa3(:,4), xa3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');
    %FLight angle min/max/nominal
	xo		=	[V;-0.18;H;R];       %Nominal Case
	[ta1,xa1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[V;0.4;H;R];         %Max Case
	[ta1,xa2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[V;-0.5;H;R];        %Low Case
	[ta1,xa3]	=	ode23('EqMotion',tspan,xo);
    subplot(2,1,2);
    title('Change of flight angle (Case A)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xa1(:,4), xa1(:,3), 'k');
    plot(xa2(:,4), xa2(:,3),'g');
    plot(xa3(:,4), xa3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');

% Monte Carlo Variation    
    randfa = zeros(100,1);
    randV = zeros(100,1);
    xaStoreR = zeros(101,100);
    xaStoreH = zeros(101,100);
    taStore = zeros(101,100);
    %function to generate random values for whole array
    for i = 1:100 
        randfa(i) = -0.5 + (0.9 * rand(1));
        randV(i) = 2 + (5.5 * rand(1));
    end
    figure;
    hold on;
    title('Monte Carlo Variation (Case A)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    for i = 1:100
	    xo		=	[randV(i);randfa(i);H;R];
	    [ta1,xa1]	=	ode23('EqMotion',tspan,xo);
        plot(xa1(:,4), xa1(:,3));
        xaStoreR(:,i) = xa1(:,4);
        xaStoreH(:,i) = xa1(:,3);
    end
    
% Concatenate 100 interations    
    xaR = concatenate(xaStoreR, ta1);
    xaH = concatenate(xaStoreH, ta1);
    figure;
    hold on;
    grid on;
    plot(xaR,xaH, 'r');
    title('Concatenation and polyfit (Case A)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    %Polynomial fit function
    p = polyfit(xaR, xaH, 5);    %chose 5 because it seemed to produce the most acurate result without being to 'Exact'
    y_fit = polyval(p, xaR);
    plot(xaR, y_fit, '--k'); %Dashed line for contrast
    
% Time derivative calculation and display
    dhdt = center_num_der(ta1, xaH);
    drdt = center_num_der(ta1, xaR);
    figure;
    subplot(2,1,1);
    plot(ta1, dhdt);
    grid on;
    title('dH/dt (case A)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    subplot(2,1,2);
    plot(ta1, drdt);
    grid on;
    title('dR/dt (case A)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Range (m)', 'FontSize', 12, 'FontWeight', 'bold');

%% Case B
% Single Parameter Variation
    %Velocity min/max/nominal
	xo		=	[V;0;H;R];           %Nominal Case
    [tb1,xb1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[7.5;0;H;R];         %Max Case
	[tb1,xb2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[2.0;0;H;R];         %Low Case
	[tb1,xb3]	=	ode23('EqMotion',tspan,xo);
    figure;
    subplot(2,1,1);
    title('Change of Velocity (Case B)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xb1(:,4), xb1(:,3), 'k');
    plot(xb2(:,4), xb2(:,3),'g');
    plot(xb3(:,4), xb3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');
    %Flight angle 0 for Case B
	xo		=	[V;0;H;R];         %Nominal Case
	[tb1,xb1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[V;0;H;R];         %Max Case
	[tb1,xb2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[V;0;H;R];         %Low Case
	[tb1,xb3]	=	ode23('EqMotion',tspan,xo);
    subplot(2,1,2);
    title('Change of flight angle (Case B)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xb1(:,4), xb1(:,3), 'k');
    plot(xb2(:,4), xb2(:,3),'g');
    plot(xb3(:,4), xb3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');

% Monte Carlo Variation
    xbStoreR = zeros(101,100);
    xbStoreH = zeros(101,100);
    tbStore = zeros(101,100);
    %function to generate random values for whole array
    for i = 1:100 
        randV(i) = 2 + (5.5 * rand(1));
    end
    figure;
    hold on;
    title('Monte Carlo Variation (Case B)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    for i = 1:100
	    xo		=	[randV(i);0;H;R];
	    [tb1,xb1]	=	ode23('EqMotion',tspan,xo);
        plot(xb1(:,4), xb1(:,3));
        xbStoreR(:,i) = xb1(:,4);
        xbStoreH(:,i) = xb1(:,3);
    end

% Concatenate 100 interations
    xbR = concatenate(xbStoreR, tb1);
    xbH = concatenate(xbStoreH, tb1);
    figure;
    hold on;
    grid on;
    plot(xbR,xbH, 'r');
    title('Concatenation and polyfit (Case B)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    %Polynomial fit function
    p = polyfit(xbR, xbH, 5);    %chose 5 because it seemed to produce the most acurate result without being to 'Exact'
    y_fit = polyval(p, xbR);
    plot(xbR, y_fit, '--k'); %Dashed line for contrast

% Time derivative calculation and display 
    dhdt = center_num_der(tb1, xbH);
    drdt = center_num_der(tb1, xbR);
    figure;
    subplot(2,1,1);
    plot(tb1, dhdt);
    grid on;
    title('dH/dt (Case B)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    subplot(2,1,2);
    plot(tb1, drdt);
    grid on;
    title('dR/dt (Case B)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Range (m)', 'FontSize', 12, 'FontWeight', 'bold');

%% Case C
% Single Parameter Variation
    %Velocity min/max/nominal *1.5 for Case C
	xo		=	[1.5*V;Gam;H;R];        %Nominal Case
	[tc1,xc1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[(1.5*7.5);Gam;H;R];         %Max Case
	[tc1,xc2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[(1.5*2.0);Gam;H;R];         %Low Case
	[tc1,xc3]	=	ode23('EqMotion',tspan,xo);
    figure;
    subplot(2,1,1);
    title('Change of Velocity (Case C)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xc1(:,4), xc1(:,3), 'k');
    plot(xc2(:,4), xc2(:,3),'g');
    plot(xc3(:,4), xc3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');
    %Flight Angle min/max/nominal
	xo		=	[1.5*V;-0.18;H;R];        %Nominal Case
	[tc1,xc1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[1.5*V;0.4;H;R];         %Max Case
	[tc1,xc2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[1.5*V;-0.5;H;R];         %Low Case
	[tc1,xc3]	=	ode23('EqMotion',tspan,xo);
    subplot(2,1,2);
    title('Change of flight angle (Case C)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xc1(:,4),xc1(:,3), 'k');
    plot(xc2(:,4), xc2(:,3),'g');
    plot(xc3(:,4), xc3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');

% Monte Carlo Variation
    xcStoreR = zeros(101,100);
    xcStoreH = zeros(101,100);
    tcStore = zeros(101,100);
    %function to generate random values for whole array
    for i = 1:100 
        randfa(i) = -0.5 + (0.9 * rand(1));
        randV(i) = 1.5*(2 + (5.5 * rand(1)));
    end
    figure;
    hold on;
    title('Monte Carlo Variation (Case C)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    for i = 1:100
	    xo		=	[randV(i);randfa(i);H;R];
	    [tc1,xc1]	=	ode23('EqMotion',tspan,xo);
        plot(xc1(:,4), xc1(:,3));
        xcStoreR(:,i) = xc1(:,4);
        xcStoreH(:,i) = xc1(:,3);
    end

% Concatenate 100 interations
    xcR = concatenate(xcStoreR, tc1);
    xcH = concatenate(xcStoreH, tc1);
    figure;
    hold on;
    grid on;
    plot(xcR,xcH, 'r');
    title('Concatenation and polyfit (Case C)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    %Polynomial fit function
    p = polyfit(xcR, xcH, 7);    %chose 7 to try and fit the initial spike
    y_fit = polyval(p, xcR);
    plot(xcR, y_fit, '--k'); %Dashed line for contrast

% Time derivative calculation and display
    dhdt = center_num_der(tc1, xcH);
    drdt = center_num_der(tc1, xcR);
    figure;
    subplot(2,1,1);
    plot(tc1, dhdt);
    grid on;
    title('dH/dt (case C)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    subplot(2,1,2);
    plot(tc1, drdt);
    grid on;
    title('dR/dt (case C)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Range (m)', 'FontSize', 12, 'FontWeight', 'bold');

%% Case D
% Single Parameter Variation
    %Velocity min/max/nominal *3 for Case D
	xo		=	[3*V;Gam;H;R];             %Nominal Case
	[td1,xd1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[(3*7.5);Gam;H;R];         %Max Case
	[td1,xd2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[(3*2.0);Gam;H;R];         %Low Case
	[td1,xd3]	=	ode23('EqMotion',tspan,xo);
    figure;
    subplot(2,1,1);
    title('Change of Velocity (Case D)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xd1(:,4), xd1(:,3), 'k');
    plot(xd2(:,4), xd2(:,3),'g');
    plot(xd3(:,4), xd3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');
    %Flight Angle min/max/nominal
	xo		=	[3*V;-0.18;H;R];       %Nominal Case
	[td1,xd1]	=	ode23('EqMotion',tspan,xo);
	xo		=	[3*V;0.4;H;R];         %Max Case
	[td1,xd2]	=	ode23('EqMotion',tspan,xo);
	xo		=	[3*V;-0.5;H;R];        %Low Case
	[td1,xd3]	=	ode23('EqMotion',tspan,xo);
    subplot(2,1,2);
    title('Change of flight angle (Case D)', 'FontSize', 18);
    ylabel('Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 12, 'FontWeight', 'bold');
    hold on;
    grid on;
    plot(xd1(:,4),xd1(:,3), 'k');
    plot(xd2(:,4), xd2(:,3),'g');
    plot(xd3(:,4), xd3(:,3),'r');
    legend('Nominal', 'Max case', 'Min case');   

% Monte Carlo Variation
    xdStoreR = zeros(101,100);
    xdStoreH = zeros(101,100);
    tdStore = zeros(101,100);
    %function to generate random values for whole array
    for i = 1:100 
        randfa(i) = -0.5 + (0.9 * rand(1));
        randV(i) = 3*(2 + (5.5 * rand(1)));
    end
    figure;
    hold on;
    title('Monte Carlo Variation (Case D)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    for i = 1:100
	    xo		=	[randV(i);randfa(i);H;R];
	    [td1,xd1]	=	ode23('EqMotion',tspan,xo);
        plot(xd1(:,4), xd1(:,3));
        xdStoreR(:,i) = xd1(:,4);
        xdStoreH(:,i) = xd1(:,3);
    end

% Concatenate 100 interations
    xdR = concatenate(xdStoreR, td1);
    xdH = concatenate(xdStoreH, td1);
    figure;
    hold on;
    grid on;
    plot(xdR,xdH, 'r');
    title('Concatenation and polyfit (Case D)', 'FontSize', 20);
    ylabel('Height (m)', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Range (m)', 'FontSize', 14, 'FontWeight', 'bold');
    %Polynomial fit function
    p = polyfit(xdR, xdH, 10);    %10 was chosen so that the loop would be accounted for
    y_fit = polyval(p, xdR);
    plot(xdR, y_fit, '--k'); %Dashed line for contrast

% Time derivative calculation and display
    dhdt = center_num_der(td1, xdH);
    drdt = center_num_der(td1, xdR);
    figure;
    subplot(2,1,1);
    plot(td1, dhdt);
    grid on;
    title('dH/dt (case D)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Height (m)', 'FontSize', 12, 'FontWeight', 'bold');
    subplot(2,1,2);
    plot(td1, drdt);
    grid on;
    title('dR/dt (case D)', 'FontSize', 18);
    xlabel('Time (sec)', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Change in Range (m)', 'FontSize', 12, 'FontWeight', 'bold');