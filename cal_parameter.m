u_1 = sum(w_1)/size(w_1, 2);
u_2 = sum(w_2)/size(w_2, 2);
% sigma_1 = std(w_1,1);
% sigma_2 = std(w_2,1);
sigma_1 = (1/size(w_1,2)*(w_1 - u_1)*(w_1 - u_1)')^0.5;
sigma_2 = (1/size(w_2,2)*(w_2 - u_2)*(w_2 - u_2)')^0.5;
parameter = [u_1, sigma_1; u_2, sigma_2];