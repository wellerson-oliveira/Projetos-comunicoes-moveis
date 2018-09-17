function Main(dp, plot_type, banda)
% plot_IEEE80211_model.m

%MIMO-OFDM Wireless Communications with MATLAB¢ç   Yong Soo Cho, Jaekwon Kim, Won Young Yang and Chung G. Kang
%2010 John Wiley & Sons (Asia) Pte Ltd
%Parametros a serem modificados -------------------------------------------
clc
scale=1e-9;          % nano
Ts=50*scale;         % Sampling time
t_rms=dp*scale;      % RMS delay spread
num_ch=10000;        % Number of channels
N=128;               % FFT size
%-------------------------------------------------------------------------
PDP=IEEE802_11_model(t_rms,Ts);  

for k=1:length(PDP)
    h(:,k) = Ray_model(num_ch).'*sqrt(PDP(k));
    avg_pow_h(k)= mean(h(:,k).*conj(h(:,k)));
end

H=fft(h(1,:),N);
g = 10*log10(H.*conj(H)); %Eixo y da respota em frequencia do canal

bd = (10e2)/(50*dp);

r = (-40:0.1:20);
ax1 = zeros(1, length(r)) + 4;
ax2 = zeros(1, length(r)) + bd + 4;
ax3 = zeros(1, length(r)) + banda + 4;


% Tipos de Plot para o simulado -------------------------------------------
%Tipo 1: Apenas a PDP do canal --------------------------------------------
if plot_type == 1
    stem([0:length(PDP)-1],PDP,'ko'), hold on,
    stem([0:length(PDP)-1],avg_pow_h,'k.');
    xlabel('channel tap index, p'), ylabel('Average Channel Power[linear]');
    title('IEEE 802.11 Model');
    legend('Ideal','Simulation');  axis([-1 7 0 1]);
%Tipo 2: Apenas a resposta em frequencia do canal--------------------------
elseif plot_type == 2
    plot([-N/2+1:N/2]/N/Ts/10^6,g,'k-');
    set(gca,'XTick',(-10:1:10))
    set(gca,'YTick',(-40:5:20))
    xlabel('Frequency[MHz]'), ylabel('Channel power[dB]')
    title('Frequency response');
%Tipo 3:resposta em frequencia do canal com marcação de banda de coerencia-
elseif plot_type == 3 
    plot([-N/2+1:N/2]/N/Ts/10^6,g,'k-', ax1, r, 'b-', ax2, r, 'b-');
    set(gca,'XTick',(-10:1:10))
    set(gca,'YTick',(-40:5:20))
    xlabel('Frequency[MHz]'), ylabel('Channel power[dB]')
    title('Frequency response');
%Tipo 4:resposta em frequencia do canal com marcação de definida pelo
%usuario-------------------------------------------------------------------
elseif plot_type == 4
    plot([-N/2+1:N/2]/N/Ts/10^6,g,'k-', ax1, r, 'b-', ax3, r, 'b-');
    set(gca,'XTick',(-10:1:10))
    set(gca,'YTick',(-40:5:20))
    xlabel('Frequency[MHz]'), ylabel('Channel power[dB]')
    title('Frequency response');
end



