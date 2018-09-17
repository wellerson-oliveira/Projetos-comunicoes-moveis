function Main(raio, enable_mc, enable_shad, plot_type)
clc
%Parametros da das células-------------------------------------------------
cel_size = raio; %Raio da celula
p_antena = 13; %Potencia das Antenas principais em dB
p_antena_mc = 6.9; %Potencia das antenas de microcélula
%--------------------------------------------------------------------------

%Define o Grid-------------------   ------------------------------------------
q = (6*cel_size/50); %quantidade de pontos em cada eixo do grid
re = 0:q;
im = 0:q;

[IMAG, REAL] = meshgrid(im, re);
IMAG = IMAG.* 1i;

POS = IMAG + REAL;
POS = POS - q/2 - (q/2)*1i;
%--------------------------------------------------------------------------

%Define os parametros da perda de percurso no modelo HATA COST 231 para
%antenas principais
f_p = 1900; %em MHz
hb_p = 30;  %em metros
hr_p = 1.5; %em metros

%Define os parametros da perda de percurso no modelo HATA COST 231 para
%antenas principais
f_mc = 1900; %em MHz
%hb_mc = 12.5;  em metros
%hr_mc = 1.5; em metros

%--------------------------------------------------------------------------
%vetor de posição de antenas
pos_antenas = zeros(1,13);
%--------------------------------------------------------------------------

%Define as posições das antenas principais---------------------------------
pos_antenas(1) = 0;
pos_antenas(2) = pos_antenas(1) + q/3;
pos_antenas(3) = pos_antenas(1) - q/3;
pos_antenas(4) = abs(pos_antenas(2) - pos_antenas(1))*exp(1i*1*1.0472);
pos_antenas(5) = abs(pos_antenas(2) - pos_antenas(1))*exp(1i*2*1.0472);
pos_antenas(6) = abs(pos_antenas(2) - pos_antenas(1))*exp(1i*4*1.0472);
pos_antenas(7) = abs(pos_antenas(2) - pos_antenas(1))*exp(1i*5*1.0472);

%Define a posição das antenas de microcelulas------------------------------
pos_antenas(8) =  abs(pos_antenas(1) + q/6)*exp(1i*1*(0.5236));
pos_antenas(9) =  round(abs(pos_antenas(8) - pos_antenas(1))*exp(1i*(0.5236 + 1*1.0472)));
pos_antenas(10) = round(abs(pos_antenas(8) - pos_antenas(1))*exp(1i*(0.5236 + 2*1.0472)));
pos_antenas(11) = round(abs(pos_antenas(8) - pos_antenas(1))*exp(1i*(0.5236 + 3*1.0472)));
pos_antenas(12) = round(abs(pos_antenas(8) - pos_antenas(1))*exp(1i*(0.5236 + 4*1.0472)));
pos_antenas(13) = round(abs(pos_antenas(8) - pos_antenas(1))*exp(1i*(0.5236 + 5*1.0472)));
%--------------------------------------------------------------------------

%Define uma matriz que vai armazenar todas as matrizes de potencia---------
if enable_mc == 1
    n_antenas = 13;
else
    n_antenas = 7;
end
P = zeros(q+1,q+1,n_antenas);
sample = 50;
outage_buff = zeros(1,sample);
temporary = zeros(q+1,q+1,sample);

for s = 1:sample
    for i = 1:n_antenas
        grid_temp = POS - pos_antenas(i);

        if i <= 7
            grid_temp = abs(grid_temp)./20; %Transformando para km (multiplica por 50, divide por 1000)
            grid_temp = Calcula_matriz_potencia_ap(grid_temp,p_antena,f_p,hb_p,hr_p,enable_shad);
        else 
            grid_temp = abs(grid_temp).*50; %Transformando para metros
            grid_temp = Calcula_matriz_potencia_mc(grid_temp,p_antena_mc,f_mc,enable_shad);
        end

        P(1:q+1,1:q+1,i) = grid_temp;  
    end
    temporary(1:q+1,1:q+1,s) = max(P,[],3);
    
    outage_buff(s) = Calcula_outage(max(P,[],3),-90);
end
%Comparando elemento a elementos quem é o maior
%O resultado é armazenado na matriz M
%A matriz M é a matriz com os maiores valores para
%cada elemtento das matrizes P_an'i'

M = mean(temporary, 3);
outage = mean(outage_buff);
fprintf('Taxa de outage: %d.\n',outage);

if plot_type == 1
 A = M <= -100;
 M(A) = -100;
end

%Plot the Grid-------------------------------------------------------------
pcolor(M)
set(gca,'XTick',((q/6):(q/6):q))
set(gca,'YTick',((q/6):(q/6):q))
set(gca,'XTickLabel',((q/120):(q/120):(q/20)))
set(gca,'YTickLabel',((q/120):(q/120):(q/20)))
title(['Path-loss for cell radius = ',num2str((cel_size/1000)),'km']);
xlabel('Distance (km)');
ylabel('Distance (km)');
shading interp 
colorbar
%--------------------------------------------------------------------------






