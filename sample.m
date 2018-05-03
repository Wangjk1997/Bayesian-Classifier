w1 = [2,6];
w2 = [-6,5];
w3 = [7,-6];
sigma1 = [1.4,0.3;0.3,1.3];
sigma2 = [1.2,0;0,1];
sigma3 = [0.9,0.2;0.2,1.5];
% plot(w1(1),w1(2),'*');hold on;
% plot(w2(1),w2(2),'*');
% plot(w3(1),w3(2),'*');
num_sample =100;
sample1 = mvnrnd(w1,sigma1,num_sample);
sample2 = mvnrnd(w2,sigma2,num_sample);
sample3 = mvnrnd(w3,sigma3,num_sample);

plot(sample1(:,1),sample1(:,2),'*');hold on;
plot(sample2(:,1),sample2(:,2),'*');
plot(sample3(:,1),sample3(:,2),'*');
axis equal;
% for i=1:50
%     sample(i,1) = normrnd(w1(1), 1.5, m, n)
% end