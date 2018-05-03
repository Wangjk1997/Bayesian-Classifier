function class = judge(x,parameter)
    p_w1 = 0.9;
    p_w2 = 0.1;
    p_x = 1/((2 * pi)^0.5 * parameter(1,2)) * exp(-(x - parameter(1,1))^2/(2 * parameter(1,2)^2)) * p_w1 + 1/((2 * pi)^0.5 * parameter(2,2)) * exp(-(x - parameter(2,1))^2/(2 * parameter(2,2)^2)) * p_w2;
    p_w1_x = 1/((2 * pi)^0.5 * parameter(1,2)) * exp(-(x - parameter(1,1))^2/(2 * parameter(1,2)^2)) * p_w1/p_x;
    p_w2_x = 1/((2 * pi)^0.5 * parameter(2,2)) * exp(-(x - parameter(2,1))^2/(2 * parameter(2,2)^2)) * p_w2/p_x;
    cost_w1 = 0 * p_w1_x + 1 * p_w2_x;
    cost_w2 = 6 * p_w1_x + 0 * p_w2_x;
    if cost_w1 > cost_w2
        class = 2;
    else
        class = 1;
    end
end
