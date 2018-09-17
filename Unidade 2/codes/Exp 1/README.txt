=============================================Experimento 1===============================================================

-----------Disposições Iniciais-------------------------------------------------------------------
1. Este documento explica o funcionamento dos códigos para o experimento 1.

2. O Experimento é composto por 4 arquivos .m: Main, Calcula_outage, Calcula_matriz_potencia_mc, 
   Calcula_matriz_potencia_ap. Os quatro devem estar na mesma pasta quando executado.

3. O código é capaz de gerar três tipos de gráficos: 
	3.1 Gráfico apenas com perda de percurso;
	3.2 Gráfico com perda de percurso e sombreamento;
	3.3 Gráfico para análise de outage. Um exemplo desse tipo de gráfico é mostrado na Figura 4 do relatório, assim
	    como a teoria para sua geração. A potência limite para o cálculo do outage é de -90dB.

4. Cada gráfico do item 3 pode ser gerado para um raio de célula definida pelo usuário. O usuário também define se
   há microcélulas no sistema.

5. Há quatro parâmetros que o usuário pode alterar para rodar o código. Em sequencia, são eles:
	5.1 raio: Raio da célula em metros
	5.2 enable_mc: Variável que assume 0 ou 1. Caso 0, não adiciona microcélulas, caso 1, adiciona. 
	5.3 enable_shad: Variável que assume 0 ou 1. Caso 0, não adiciona sombreamento, caso 1, adiciona. 
	5.4 plot_type: Variável que assume 0 ou 1. Caso 0, plota o gráfico de potencias convencional. Caso 1
	    plota o gráfico para análise de outage (Ver figura 4).

----------Rodando o simulador---------------------------------------------------------------
-> Para gerar gráfico de perda de percurso para uma célula com 2000 metros de raio, copie e cole no console:
	Main(2000, 0, 0, 0)

-> Para gerar o mesmo gráfico porém com análise de outage, utilize: 
	Main(2000, 0, 0, 1)

-> Para adicionar microcélulas:
	Main(2000, 1, 0, 1)

..Para todos os códigos, é mostrado na tela a taxa de outage do sistema simulado.











