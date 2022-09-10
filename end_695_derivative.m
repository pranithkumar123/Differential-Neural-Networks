N1=1000;

x = linspace(a,b,N1);
%x=pi/2;
%input preprocessing parameters
mu = 2/(b-a);
beta = (a+b)/(a-b);

%output post-processing parameters
a1 = min(output);
b1 = max(output);
delta = (b1-a1)/2;
lambda = (b1+a1)/2;

%Calculating activations
x1= mu*x + beta*ones(size(x));
y = iw*x1 + ib*ones(size(x1));
p = tansig(dlarray(y));
q = ow*p + ob*ones(size(ow*p));
z1 = extractdata(tansig(q));
z = delta*z1+lambda*ones(size(z1));

%Calculating derivative

%input derivative
dx1_dx = mu;
id = dx1_dx;

%internal derivative
dq_dp = ow;
dp_dy = extractdata((ones(size(p))-p.*p));
dy_dx1 = iw';
ind= (dq_dp.*dy_dx1)*dp_dy;

%output derivative
dz1_dq = (ones(size(z1))-z1.*z1);
dz_dz1 = delta;
od = dz_dz1*dz1_dq;

%total derivative
dz_dx= id*ind.*od;

%plot
plot(x,z)
hold on
plot(x,dz_dx)