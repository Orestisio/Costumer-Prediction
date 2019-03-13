clear all;
close all;
clc;
data=xlsread('TEST1.xls');
species=xlsread('TEST2.xls');

y = species;

inds = randperm(size(data,1));
x_train = data(inds(1:2500),1:18)';  y_train = y(1:2500,1)';
x_test  = data(inds(2501:end),1:18)';  y_test  = y(2501:end,1)';

y2_train= species(inds(1:2500),1);

c = knnclassify(x_test',x_train',y2_train);
cp = classperf(c,y_test');
cp.CorrectRate

net= newff(x_train,y_train,[20 20]);
net = train(net,x_train,y_train);
y_net = net(x_test);
for i= 1:833
    if(y_net(i)<0.5)
        y_net(i)= 0;
    else
        y_net(i)=1;
    end
end
cp = classperf(y_test,y_net);
disp(['Classification Rate(%) = ' num2str(cp.CorrectRate*100)]);