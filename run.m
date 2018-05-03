readdata;
cal_parameter;
x = -7:0.01:7;
class = zeros(size(x));
i = 1;
for x= -7:0.01:7
    class(i)= judge(x,parameter);
    i = i+1;
end
x = -7:0.01:7;
plot(x,class);