%%Wireless Motion Capture System for Upper Limb Rehabilitation%%
%%A Low Cost Wearable Wireless Sensing System for Upper Limb Home Rehabilitation%%
%%Shoulder and Elbow Joint Angle Tracking With Inertial Sensors%%

H = 1.64; %altura da pessoa testada em metros

syms theta0; %chest
syms theta1; %chest
syms theta2; %shoulder
syms theta3; %shoulder
syms theta4; %shoulder
syms theta5; %elbow
syms theta6; %elbow

syms alfa0;
syms alfa1;
syms alfa2;
syms alfa3;
syms alfa4;
syms alfa5;
syms alfa6;

syms roll;
syms pitch;
syms yaw;

% theta0 = 0;
% theta1 = theta1 + 90;
% theta2 = theta2;
% theta3 = theta3 + 90;
% theta4 = theta4 + 90;
% theta5 = theta5 + 90;
% theta6 = theta6 + 180;

alfa0=0; %degrees chest
alfa1=90; %degrees chest
alfa2=0; %degrees shoulder
alfa3=90; %degrees shoulder
alfa4=90; %degrees shoulder
alfa5=90; %degrees elbow
alfa6=90; %degress elbow

a0=0; %chest
a1=0; %chest
a2=0; %shoulder
a3=0; %shoulder
a4=0; %shoulder
a5=0; %elbow
a6=0; %elbow

d0 = 0; %chest
d1 = 0; %chest
d2 = 0.129*H; %shoulder
d3 = 0; %shoulder
d4 = 0; %shoulder
d5 = -0.186*H; %elbow
d6 = 0; %elbow

%%%%%%%%%%%%%%%%%%%%%%%%%% Chest %%%%%%%%%%%%%%%%%%%%%%%%%%

T0l0=[cos(theta0), -sin(theta0)*cosd(alfa0), sin(theta0)*sind(alfa0), a1*cos(theta0); 
     sin(theta0), cos(theta0)*cosd(alfa0), -cos(theta0)*sind(alfa0), a1*sin(theta0); 
     0, sind(alfa0), cosd(alfa0), d0; 
     0, 0, 0, 1];

T01=[cos(theta1), -sin(theta1)*cosd(alfa1), sin(theta1)*sind(alfa1), a1*cos(theta1); 
     sin(theta1), cos(theta1)*cosd(alfa1), -cos(theta1)*sind(alfa1), a1*sin(theta1); 
     0, sind(alfa1), cosd(alfa1), d1; 
     0, 0, 0, 1];
 
T0l1=T0l0*T01;
 
R0l1=[T0l1(1:3,1:3)]

%%%%%%%%%%%%%%%%%%%%%%%%%% Shoulder %%%%%%%%%%%%%%%%%%%%%%%%%%

T12=[cos(theta2), -sin(theta2)*cosd(alfa2), sin(theta2)*sind(alfa2), a2*cos(theta2); 
     sin(theta2), cos(theta2)*cosd(alfa2), -cos(theta2)*sind(alfa2), a2*sin(theta2); 
     0, sind(alfa2), cosd(alfa2), d2; 
     0, 0, 0, 1];

T23=[cos(theta3), -sin(theta3)*cosd(alfa3), sin(theta3)*sind(alfa3), a3*cos(theta3); 
     sin(theta3), cos(theta3)*cosd(alfa3), -cos(theta3)*sind(alfa3), a3*sin(theta3); 
     0, sind(alfa3), cosd(alfa3), d3; 
     0, 0, 0, 1];

T34=[cos(theta4), -sin(theta4)*cosd(alfa4), sin(theta4)*sind(alfa4), a4*cos(theta4); 
     sin(theta4), cos(theta4)*cosd(alfa4), -cos(theta4)*sind(alfa4), a4*sin(theta4); 
     0, sind(alfa4), cosd(alfa4), d4; 
     0, 0, 0, 1];

 
T14=T12*T23*T34;
R14=[T14(1:3,1:3)]

%%%%%%%%%%%%%%%%%%%%%%%%%% Elbow %%%%%%%%%%%%%%%%%%%%%%%%%%

T45=[cos(theta5), -sin(theta5)*cosd(alfa5), sin(theta5)*sind(alfa5), a5*cos(theta5); 
     sin(theta5), cos(theta5)*cosd(alfa5), -cos(theta5)*sind(alfa5), a5*sin(theta5); 
     0, sind(alfa5), cosd(alfa5), d5; 
     0, 0, 0, 1];
 
T56=[cos(theta6), -sin(theta6)*cosd(alfa6), sin(theta6)*sind(alfa6), a6*cos(theta6); 
     sin(theta6), cos(theta6)*cosd(alfa6), -cos(theta6)*sind(alfa6), a6*sin(theta6); 
     0, sind(alfa6), cosd(alfa6), d6; 
     0, 0, 0, 1];
 
 
T46=T45*T56;
R46=[T46(1:3,1:3)]

%%%%%%%%%%% Rotation Matrix ZYX %%%%%%%%%%%

RZYX=[cos(yaw)*cos(pitch), cos(yaw)*sin(pitch)*sin(roll) - cos(roll)*sin(yaw), sin(yaw)*sin(roll) + cos(yaw)*cos(roll)*sin(pitch);
      cos(pitch)*sin(yaw), cos(yaw)*cos(roll) + sin(yaw)*sin(pitch)*sin(roll), cos(roll)*sin(yaw)*sin(pitch) - cos(yaw)*sin(roll);
      -sin(pitch), cos(pitch)*sin(roll), cos(pitch)*cos(roll)];
  
%%%%%%%%%%% Equaling each component of RZYX and R01 %%%%%%%%%%%
  
