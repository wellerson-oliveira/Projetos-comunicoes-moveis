=============================================Experimento 2===============================================================
----------Disposi��es Iniciais---------------------------------------------------------
1. Este documento explica o funciionamento dos c�digos para o experimento 2.

2. O Experimento � composto por 3 arquivos .m: Main, IEEE802_11_model, Ray_model

3. O c�digo � capaz de gerar quatro tipos de gr�fico, definidos pelos par�metros de entrada do usu�rio:
	3.1 Gr�fico da PDP do sistema
	3.2 Gr�fico da resposta em frequ�ncia do sistema
	3.3 Gr�fico da respota em frequ�ncia com marca��o da banda de coer�ncia do sistema
	3.4 Gr�fico da respota em frequ�ncia com marca��o da banda escolhida pelo usu�rio

4. Cada gr�fico pode ser gerado para um dado delay spread, definido pelo usu�rio

5. H� tr�s par�metros que o usu�rio pode alterar. Em sequ�ncia s�o eles:
	5.1 dp: delay spread em nanosegundos
	5.2 plot_type: Vari�vel que varia de 1 a 4. Gera, respectivamente, os gr�ficos definidos no item 3
	5.3 banda: Banda que o usu�rio pode plotar no tipo de gr�fico 4 em MHz. Para os outros tr�s � irrelevante. 

-------Rodando o simulador---------------------------------------------------------------
-> Para gerar o gr�fico de PDP para um sistema com delay spread de 25 ns, utilize o c�digo:
	Main(25, 1, 5) 

-> Para gerar a resposta em frequ�ncia do sistema com delay spread de 50 ns, com marca��o de uma banda de 0.7 MHz
	Main(50, 4, 0.7)

.. � importante que o terceiro par�metro (banda) n�o seja zero, mesmo no caso que ele n�o seja usado
