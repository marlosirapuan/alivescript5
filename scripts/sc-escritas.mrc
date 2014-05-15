< Voltar ao menu principal >: {
  if ($active == Status Window) { .load -ps scripts\popups.ini | halt }
  else if ($active ischan) { .load -pc scripts\popups.ini | halt }
}
-
$style(2) Escolha uma escrita abaixo:.
-
¦|¦|TEXTO|¦|¦	(Colorido):colorcomplex
-
Degradès
.Cores do BRASIL: degrade brasil
.-
.Azul: degrade azul
.Vermelha:degrade vermelha
.Verde:degrade verde
.Amarelo:degrade amarelo
.Violeta:degrade violeta
.Preto:degrade preto
-
Quadrados Coloridos:variascores
Setas Coloridas:setascoloridas
Flores:florestexto
Coloração Sonora:coloracaosonora
Ondas do Mar:ondasdomar
-
Anúncios em Blocos
.Bloco 1	/b1 <texto>:b1 $$input(Texto:,qe,Requisição)
.Bloco 2	/b2 <texto>:b2 $$input(Texto:,qe,Requisição)
.Bloco 3	/b3 <texto>:b3 $$input(Texto:,qe,Requisição)
.Bloco 4	/b4 <texto>:b4 $$input(Texto:,qe,Requisição)
.Bloco 5	/b5 <texto>:b5 $$input(Texto:,qe,Requisição)
.Bloco 6	/b6 <texto>:b6 $$input(Texto:,qe,Requisição)
.Bloco 7	/b7 <texto>:b7 $$input(Texto:,qe,Requisição)
.Bloco 8	/b8 <texto>:b8 $$input(Texto:,qe,Requisição)
.Bloco 9	/b9 <texto>:b9 $$input(Texto:,qe,Requisição)
.Bloco 10	/b10 <texto>:b10 $$input(Texto:,qe,Requisição)
Escrever Invertido	/reverse:reverse $$input(Texto:,qe,Requisição)
-
$style(2) Escolha uma escrita acima:.
-
Quit:.
