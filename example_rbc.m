clear,clc
addpath('files');

%Define parameters
syms 	SIG DELTA ALFA BETTA RHO
sympara = [SIG,DELTA,ALFA,BETTA,RHO];

%Define variables 
syms c cp k kp a ap 
symvara = [c,k,a];

%Define model
f1 = c + kp - (1-DELTA) * k - a * k^ALFA;
f2 = c^(-SIG) - BETTA * cp^(-SIG) * (ap * ALFA * kp^(ALFA-1) + 1 - DELTA);
f3 = log(ap) - RHO * log(a);
prepare_model;

%Calibration
BETTA=0.95; 
DELTA=1; 
ALFA=0.3; 
RHO=0.9; 
SIG=2; 

%Initial Values
c =0.5;
k = 1;
a = 1;
Get_Steady_State;

cp = c;
kp = k;
ap = a;

%Solve model by first-order perturbation
Solve_model;

T = 100;
shocks = zeros(size(x,2),T);
shocks(2,:) = randn(1,T);
x_simul  = zeros(2,T);
y_simul = zeros(1,T);
for i = 2:T
    x_simul(:,i) = hx*x_simul(:,i-1) + shocks(:,i);
    y_simul(:,i) = gx*x_simul(:,i);
end
 simul = [y_simul;x_simul];
 for i = 1:size(simul,1)
     plot(simul(i,:))
     hold on
 end
