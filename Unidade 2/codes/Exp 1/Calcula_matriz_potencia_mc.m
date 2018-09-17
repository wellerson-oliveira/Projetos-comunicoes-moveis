function M = Calcula_matriz_potencia_mc(D, p_antena, f, flag)
    
    path_loss = -65.9 + 38*log10(D) + (24.5 + (1.5*f/925))*log10(f);
    
    shad = 6*randn(size(D,1));
    
    if flag == 0
        M = p_antena - path_loss;
    else
        M = p_antena - path_loss - shad;
    end

end
   