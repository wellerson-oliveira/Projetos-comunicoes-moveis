function M = Calcula_matriz_potencia_ap(D, p_antena, f, hb, hr, flag)
    
    
    a = (1.1 * log10(f) - 0.7) * hr - (1.56*log10(f) - 0.8);
   
    path_loss = 46.3 + 33.9*log10(f) - 13.82*log(hb) - a + (44.9 - 6.55*log(hb)).*log10(D);
    shad = 10*randn(size(D,1));
    
    if flag == 0
        M = p_antena - path_loss;
    else
        M = p_antena - path_loss - shad;
    end

end
   