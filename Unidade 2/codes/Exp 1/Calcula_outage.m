function outage = Calcula_outage(D, p_limiar)
    
   n = sum(D(:) <= p_limiar);
   outage = (n/(size(D,1))^2)*100;

end
   