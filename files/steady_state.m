function F = steady_state(x, p)
    c = x(1);
    k = x(2);
    a = x(3);

    F(1) = exp(c) + exp(k) - exp(a)*exp(k)^p.ALFA + exp(k)*(p.DELTA - 1);
    F(2) = 1/exp(c)^p.SIG - (p.BETTA*(p.ALFA*exp(a)*exp(k)^(p.ALFA - 1) - p.DELTA + 1))/exp(c)^p.SIG;
    F(3) = log(exp(a)) - p.RHO*log(exp(a));

    F = F(:);
end