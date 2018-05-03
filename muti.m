u1 = sum(sample1)/size(sample1,1);
u2 = sum(sample2)/size(sample2,1);
u3 = sum(sample3)/size(sample3,1);

s1 = 1/num_sample * (sample1 - ones(num_sample,1)*u1)'*(sample1 - ones(num_sample,1)*u1);
s2 = 1/num_sample * (sample2 - ones(num_sample,1)*u2)'*(sample2 - ones(num_sample,1)*u2);
s3 = 1/num_sample * (sample3 - ones(num_sample,1)*u3)'*(sample3 - ones(num_sample,1)*u3);

s1_i = s1^(-1);
s2_i = s2^(-1);
s3_i = s3^(-1);

p_w1 = 0.3;
p_w2 = 0.2;
p_w3 = 0.5;

[X,Y] = meshgrid(-12:0.1:12,-12:0.1:12);
f_w1 = 1/(2*pi*det(s1)^0.5)*exp(-1/2*((X-u1(1)).^2*s1_i(1,1) + (X-u1(1)).*(Y-u1(2))*s1_i(1,2)*2 +(Y-u1(2)).^2*s1_i(2,2)));
f_w2 = 1/(2*pi*det(s2)^0.5)*exp(-1/2*((X-u2(1)).^2*s2_i(1,1) + (X-u2(1)).*(Y-u2(2))*s2_i(1,2)*2 +(Y-u2(2)).^2*s2_i(2,2)));
f_w3 = 1/(2*pi*det(s3)^0.5)*exp(-1/2*((X-u3(1)).^2*s3_i(1,1) + (X-u3(1)).*(Y-u3(2))*s3_i(1,2)*2 +(Y-u3(2)).^2*s3_i(2,2)));

f_x = f_w1*p_w1 + f_w2*p_w2 + f_w3*p_w3;

% pic1 = mesh(X,Y,f_w1);hold on;
% pic2 = mesh(X,Y,f_w2);
% pic3 = mesh(X,Y,f_w3);

f_x_w1 = f_w1*p_w1./f_x;
f_x_w2 = f_w2*p_w2./f_x;
f_x_w3 = f_w3*p_w3./f_x;

% pic4 = mesh(X,Y,f_x_w1);hold on;
% pic5 = mesh(X,Y,f_x_w2);
% pic6 = mesh(X,Y,f_x_w3);
% set(pic1,'EdgeColor','r','FaceColor','r','MarkerEdgecolor','r','MarkerFacecolor','r')
% set(pic2,'EdgeColor','y','FaceColor','y','MarkerEdgecolor','y','MarkerFacecolor','y')
% set(pic3,'EdgeColor','b','FaceColor','b','MarkerEdgecolor','b','MarkerFacecolor','b')
cost_w1 = 2 * f_x_w2 + 3 * f_x_w3;
cost_w2 = 3 * f_x_w1 + 1 * f_x_w3;
cost_w3 = 2 * f_x_w2 + 3 * f_x_w2;
class = zeros(size(cost_w1));
for i = 1:size(cost_w1,1)*size(cost_w1,2)
    tmp = [cost_w1(i),cost_w2(i),cost_w3(i)];
    if min(tmp) == cost_w1(i)
        class(i) = 1;
    end
    if min(tmp) == cost_w2(i)
        class(i) = 2;
    end
    if min(tmp) == cost_w3(i)
        class(i) = 3;
    end
end
% set(pic4,'EdgeColor','r','FaceColor','r','MarkerEdgecolor','r','MarkerFacecolor','r')
% set(pic5,'EdgeColor','y','FaceColor','y','MarkerEdgecolor','y','MarkerFacecolor','y')
% set(pic6,'EdgeColor','b','FaceColor','b','MarkerEdgecolor','b','MarkerFacecolor','b')
mesh(X,Y,class)
