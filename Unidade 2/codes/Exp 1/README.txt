=============================================Experimento 1===============================================================

-----------Disposi��es Iniciais-------------------------------------------------------------------
1. Este documento explica o funcionamento dos c�digos para o experimento 1.

2. O Experimento � composto por 4 arquivos .m: Main, Calcula_outage, Calcula_matriz_potencia_mc, 
   Calcula_matriz_potencia_ap. Os quatro devem estar na mesma pasta quando executado.

3. O c�digo � capaz de gerar tr�s tipos de gr�ficos: 
	3.1 Gr�fico apenas com perda de percurso;
	3.2 Gr�fico com perda de percurso e sombreamento;
	3.3 Gr�fico para an�lise de outage. Um exemplo desse tipo de gr�fico � mostrado na Figura 4 do relat�rio, assim
	    como a teoria para sua gera��o. A pot�ncia limite para o c�lculo do outage � de -90dB.

4. Cada gr�fico do item 3 pode ser gerado para um raio de c�lula definida pelo usu�rio. O usu�rio tamb�m define se
   h� microc�lulas no sistema.

5. H� quatro par�metros que o usu�rio pode alterar para rodar o c�digo. Em sequencia, s�o eles:
	5.1 raio: Raio da c�lula em metros
	5.2 enable_mc: Vari�vel que assume 0 ou 1. Caso 0, n�o adiciona microc�lulas, caso 1, adiciona. 
	5.3 enable_shad: Vari�vel que assume 0 ou 1. Caso 0, n�o adiciona sombreamento, caso 1, adiciona. 
	5.4 plot_type: Vari�vel que assume 0 ou 1. Caso 0, plota o gr�fico de potencias convencional. Caso 1
	    plota o gr�fico para an�lise de outage (Ver figura 4).

----------Rodando o simulador---------------------------------------------------------------
-> Para gerar gr�fico de perda de percurso para uma c�lula com 2000 metros de raio, copie e cole no console:
	Main(2000, 0, 0, 0)

-> Para gerar o mesmo gr�fico por�m com an�lise de outage, utilize: 
	Main(2000, 0, 0, 1)

-> Para adicionar microc�lulas:
	Main(2000, 1, 0, 1)

..Para todos os c�digos, � mostrado na tela a taxa de outage do sistema simulado.











