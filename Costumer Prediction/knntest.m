clear all;
close all;
clc;

data = xlsread('TEST1.xls');
species = xlsread('TEST2.xls');

inds= randperm(size(data,1));
training = data(inds(1:2500),:);
train_classes = species(inds(1:2500),1);
testing = data(inds(2501:end),:);
test_classes = species(inds(2501:end),1);

c = knnclassify(testing,training,train_classes);
cp = classperf(c,double(test_classes));
cp.CorrectRate