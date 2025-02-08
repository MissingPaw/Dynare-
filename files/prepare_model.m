%Create function f
f = [f1;f2;f3];

% Define the vector of controls, y, and states, x
x = [k a];
y = c;
xp = [kp ap];
yp = cp;

%Make f a function of the logarithm of the state and control vector
f = subs(f, [x,y,xp,yp], (exp([x,y,xp,yp])));

fx = jacobian(f,x);
fxp = jacobian(f,xp);
fy = jacobian(f,y);
fyp = jacobian(f,yp);