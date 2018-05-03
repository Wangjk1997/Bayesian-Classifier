x = -7:0.001:7;
p_w1 = 0.9;
p_w2 = 0.1;
f_x = 1/((2 * pi)^0.5 * parameter(1,2)) * exp(-(x - parameter(1,1)).*(x - parameter(1,1))/(2 * parameter(1,2)^2)) * p_w1 + 1/((2 * pi)^0.5 * parameter(2,2)) * exp(-(x - parameter(2,1)).*(x - parameter(2,1))/(2 * parameter(2,2)^2)) * p_w2;
f_w1 = 1/((2*pi)^0.5*sigma_1)*exp(-(x-u_1).*(x-u_1)/(2*sigma_1^2));
f_w2 = 1/((2*pi)^0.5*sigma_2)*exp(-(x-u_2).*(x-u_2)/(2*sigma_2^2));
f_x_w1 = f_w1*p_w1./f_x;
f_x_w2 = f_w2*p_w2./f_x;

% plot(x,f_w1);
% hold on;
% plot(x,f_w2);

plot(x,0.5*sign(f_x_w2-f_x_w1)+1.5);
% hold on;
% plot(x,f_x_w2);

