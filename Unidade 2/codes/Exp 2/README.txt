=============================================Experimento 2===============================================================
----------Disposições Iniciais---------------------------------------------------------
1. Este documento explica o funciionamento dos códigos para o experimento 2.

2. O Experimento é composto por 3 arquivos .m: Main, IEEE802_11_model, Ray_model

3. O código é capaz de gerar quatro tipos de gráfico, definidos pelos parâmetros de entrada do usuário:
	3.1 Gráfico da PDP do sistema
	3.2 Gráfico da resposta em frequência do sistema
	3.3 Gráfico da respota em frequência com marcação da banda de coerência do sistema
	3.4 Gráfico da respota em frequência com marcação da banda escolhida pelo usuário

4. Cada gráfico pode ser gerado para um dado delay spread, definido pelo usuário

5. Há três parâmetros que o usuário pode alterar. Em sequência são eles:
	5.1 dp: delay spread em nanosegundos
	5.2 plot_type: Variável que varia de 1 a 4. Gera, respectivamente, os gráficos definidos no item 3
	5.3 banda: Banda que o usuário pode plotar no tipo de gráfico 4 em MHz. Para os outros três é irrelevante. 

-------Rodando o simulador---------------------------------------------------------------
-> Para gerar o gráfico de PDP para um sistema com delay spread de 25 ns, utilize o código:
	Main(25, 1, 5) 

-> Para gerar a resposta em frequência do sistema com delay spread de 50 ns, com marcação de uma banda de 0.7 MHz
	Main(50, 4, 0.7)

.. É importante que o terceiro parâmetro (banda) não seja zero, mesmo no caso que ele não seja usado
