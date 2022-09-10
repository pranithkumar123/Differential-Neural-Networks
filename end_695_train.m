clear all;
net = feedforwardnet(16,'trainlm');
net.layers{2}.transferFcn = 'tansig';
N=10000;
a=1;
b=10;

%input output
input = (b-a)*rand(N,1)+a*ones(N,1);

output = sin(input);

[net,tr] = train(net,input',output');
plotperform(tr);

%weights and biases
iw = net.IW{1,1};
ow = net.LW{2,1};
ib = net.b{1,1};
ob = net.b{2,1};