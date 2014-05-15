< Voltar ao menu principal >: {
  if ($menu == nicklist) { .load -pn scripts\popups.ini | halt }
  else { .load -pq scripts\popups.ini | halt }
}
-
$iif($menu != nicklist, Escritas)
.¦|¦|TEXTO|¦|¦	(Colorido):colorcomplex
.-
.Degradès
..Cores do BRASIL: degrade brasil
..-
..Azul: degrade azul
..Vermelha:degrade vermelha
..Verde:degrade verde
..Amarelo:degrade amarelo
..Violeta:degrade violeta
..Preto:degrade preto
.-
.Quadrados Coloridos:variascores
.Setas Coloridas:setascoloridas
.Flores:florestexto
.Coloração Sonora:coloracaosonora
.Ondas do Mar:ondasdomar
.-
.Anúncios em Blocos
..Bloco 1	/b1 <texto>:b1 $$input(Texto:,qe,Requisição)
..Bloco 2	/b2 <texto>:b2 $$input(Texto:,qe,Requisição)
..Bloco 3	/b3 <texto>:b3 $$input(Texto:,qe,Requisição)
..Bloco 4	/b4 <texto>:b4 $$input(Texto:,qe,Requisição)
..Bloco 5	/b5 <texto>:b5 $$input(Texto:,qe,Requisição)
..Bloco 6	/b6 <texto>:b6 $$input(Texto:,qe,Requisição)
..Bloco 7	/b7 <texto>:b7 $$input(Texto:,qe,Requisição)
..Bloco 8	/b8 <texto>:b8 $$input(Texto:,qe,Requisição)
..Bloco 9	/b9 <texto>:b9 $$input(Texto:,qe,Requisição)
..Bloco 10	/b10 <texto>:b10 $$input(Texto:,qe,Requisição)
.Escrever Invertido	/reverse:reverse $$input(Texto:,qe,Requisição)
-
$iif($menu != nicklist, Frases)
.$submenu($`frases($1))
$iif($menu != nicklist, Piadas)
.$submenu($`piadas($1))
-
Dizer "Te Adoro!":fmsg 4,1 €12€7€8€0€3€9€ 0 $1 13 T7E 0A11D8O4R10O7O9O15O8O13O0! 9€3€0€8€7€12€4 
$iif($menu == nicklist,Responde o PVT)
.Mensagem [1] (Rosa):fmsg 13 Psiu6 $1 $+ 13! 12vErIfIqUe sE TeM UmA JaNeLiNhA +oU- aSsIm:4 '[=?] $me $+ ' 13MiNiMiZaDa e eSqUeCiDa12 NuM CaNtO QuAlQuEr dA SuA TeLa, AbRa e rEsPoNdA MeU PvT, pOr fAvOr. 1,8:/
.Mensagem [2]:fmsg 9,1 $1  12ReSPoNDe o 4PVT12!!!
.-
.Responde o PVT (boy):fmsg 9,1 $1  12ô BiXu Fêi, ReSPoNDe o 4PVT12!!!
.Responde o PVT (girl):fmsg 9,1 $1  12ô MuiÉ, ReSPoNDe o 4PVT12!!!
-
Frases de Amor:fmsg 4(¯`´¯)13 $+ $1 $+ 4(¯`´¯)06 $read docs\frases\Frases_de_Amor.txt 5;4)
Enviar um Poema:fmsg 13 $+ $1 04 $+ $read docs\frases\poemas.txt
-
Ações de Amor
.Amor em Português:fmsg 13 $+ $1 $+ 4, Amour se diz em francês, Love se diz em inglês. Para mim dizer que te Amo digo mesmo em português.
.-
.Românticos
..Nunca Te Esquecerei	(01 linha):fmsg 12Se algum dia $1 $+ , você pensar por um momento que eu te esqueci, reze por mim pois esse dia eu morri.
..Morar Juntos	(05 linhas):morarjuntos
..Suspira	(01 linha):me suspira olhando para $1 ...
.Beijos
..Beijo	(01 linha):me beija $1 | fmsg 0,4 SMAAAACK! 
..Beijo colorido	(01 linha):fmsg : $+ $str(1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*,$r(3,5))
..Beijo colorido	(01 linha):me 4,1@3-3¬3}3¬3-3- 4@3-3¬3}3¬3-3- 13,1D4Á 4U3M 9B8E3I4J5I6N7H5O 9E8M 13 $$1 4@3-3¬3}3¬3-3- 4@3-3¬3}3¬3-3- 4@3-3¬3}3¬3-3- 4@3-3¬3}3¬3-3-8,1 
..Beijo de coelho	(05 linhas):fmsg ```````````13(Y) | fmsg ``````````13(°*°) | fmsg ````````9-13()9-13,9-13()9--4<@ | fmsg `````````13(_)-(_) | fmsg $me manda pra  $1  um beijo de coelho 0
.-
.Abraços
..$iif($menu = query,De nenêm):fmsg 12Dah 2uM aBra12Çu 7\o/ 6uP10a NeN6êiM 3=7)11~
..Forte:me dá um forte abraço em13 $1 
..Akele abraço:me dah akele abraço em13 $1 
..Abraçar colorido:me 1{2{3{4{5{6{7{8{9{10{11{12{13{14{1512 $1 1}2}3}4}5}6}7}8}9}10}11}12}13}14}15} 
..Faz mulher:me agarra13 $1 em seus braços e lhe faz mulher!!
..Faz homem:me agarra $1 em seus braços e lhe faz homem!
.Rosas
..10ª rosas:me oferece dez rosas para $1 4@3}5-- 4@3}5-- 4@3}5-- 4@3}5-- 4@3}5-- 4@3}5-- 4@3}5-- 4@3}5-- 4@3}5-- a última com toda certeza é VOCÊ.
..De joelhos:me se ajoelha e presenteia $$1 com uma rosa 4@>19}--,-`---- 
..Rosas:fmsg 5-,-'-,-3{4@5-,-'-,-3{4@ 5-,-'-,-3{4@ $$1 4@3}5-'-,-'- 4@3}5-'-,-'- 4@3}5- 
..Dúzia de  rosas:me trouxe para $$1 uma dúzia de rosas! 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 
..Flor:me oferece uma linda rosa 4@}3--'---,-- para uma flor chamada13 $$1
..Jogar 6 rosas:me joga 6 rosas para $1 .. 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9--- 4@9-3}9--3}9---
.-
.Apaixonantes
..Enfeitá-la	(05 linhas): {
  fmsg 4 * (¯`'·.¸(¯`'·.¸ _______________ 4¸.·'´¯)¸.·'´¯)  
  fmsg 4 * (¯`'·.¸(¯`'·.¸12 Ÿ8Ÿ9Ÿ10Ÿ11Ÿ12Ÿ13Ÿ4Ÿ12Ÿ7Ÿ4Ÿ13Ÿ8Ÿ15Ÿ12Ÿ 4¸.·'´¯)¸.·'´¯) 
  fmsg 3 ----==>>>>------>  14 $$1 3  <-------<<<<==---- 
  fmsg 4 * (_¸.·'´(_¸.·'´13 Ÿ8Ÿ9Ÿ10Ÿ11Ÿ12Ÿ13Ÿ4Ÿ9Ÿ7Ÿ10Ÿ11Ÿ12Ÿ13Ÿ15Ÿ 4`'·.¸_)`'·.¸_)  
  fmsg 4 * (_¸.·'´(_¸.·'´1 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯4 `'·.¸_)`'·.¸_) 0
}
..Chave do amor	(09 linhas): {
  fmsg 0,1©º°¨```¨°º©   
  fmsg 0,0S1,1o0,0u1,1 0,0A1,1p0,0e1,1n0,0a1,1s10,0 $$1 $+ , 
  fmsg 0,0P1,1r0,0i1,1s0,0i1,1o0,0n1,1e0,0r1,1o10,0 Você  
  fmsg 0,0D1,1o0,0 1,1A0,0m1,1o0,0r1,1 0,0.1,1.0,010,0Tem 
  fmsg  0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,10,01,1. 10 A 
  fmsg  0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,10,01,1. 10Chave??? 
  fmsg  0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,10,01,1.  
  fmsg  0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,1 0,0 1,10,01,1. 
  fmsg 0,1©º°¨```¨°º© 4 <= Clique aqui e segure!0,0.1,8:)0,0 
}
..Par de rosas	(07 linhas): {
  me 0------5*0----------------5* 
  me 0-----5_\0--------------5_\ 
  me 0---5(~2.5_2.5~)0----------5(~2.5_2.5~) 
  me 0----5(_1Y5_)0------------5(_1Y5_) 
  me 0-3--5()3-,-5()3-<--4@0---3--5()3-,-5()3-<--4@ 
  me 0---5(_)-(_)0----------5(_)-(_) 
  me 0-Um par de rosas para você $1 $+ !!! 0
}
..-
..Amo você 1:fmsg 4,1(¯`·´¯)9 $$1 4(¯`·´¯) 8- - - ---->>13 I love You!9 Ass:0 $me $+ .
..Amo você 2:fmsg 5,1-`--,-{4@ 9 $1 4(¯`·´¯) 8- - - ---->>13 I love You!9 Ass:0 $me $+ .
..-
..Te Amo escondido	(01 linha):fmsg 1,1T2,2E3,3 4,4A5,5M6,6O7,7 8,8D9,9E10,10M11,11A12,12I13,13S14,14 15,15:1,1)12 $$1 1,1T2,2E3,3 4,4A5,5M6,6O7,7 8,8D9,9E10,10M11,11A12,12I13,13S14,14 15,15:1,1) 
.-
.Cantadas: {
  if ($menu == query) fmsg 13 $read(docs\frases\Frases_de_Amor.txt)
  else fmsg 13 $+ $1 .. $read(docs\frases\Frases_de_Amor.txt)
}
-
Saudações
.Vinte tiro:me dá uns vinte tiro pro alto de xumbada, mata trêis pômbu e dois urubú, só pra saudá $1
.Peido:me bebe uma caixa inteira de púrrgante, faz um sapatiado e começa a peidá soh pra saudá $1
.Baladêra:me pega a baladêra e acerta dozi tiro na testa do pato prá saudá $1
.Bode:me acerta uma martelada nos bágo do bode pru bixu  miá só pra saudá $1
.Arroto:me bebe uma garrafa di coca-cola 2 litro e arrota bem altu só pra saudá $1
.Pentelho:me açôua o nariz, tira uma nháca, arranca 3 pentelhos e taca na parede soh para saudá $1
.Chocolate:me esfrega chocolate na cara de $1 soh para lhe saudá
.3 Janela:me pega 20 pedra pra acertá 10 janela........ sauda $1 com 1 janela kebrada..
.Tatuzinho:me faz um tatuzinho com a merreca do nariz e prega no teto só prá saudá $1
.Mãozada:me sauda $1 com uma mãozada na oreia..
.Oração:me reza 3 ave maria, 10 pai nosso, 7 santo cristo e bébe 3 dedo de pinga só pra saudá $1
.Catarro:me faz uma gangorra com catarro de 15 centímetru só pra saudá $1
.4 tapa:me dá 4 tapa e um cuspe na testa de $1 só pra lhe saudá..
-
Mandar Beijo $str(%str,3) /kiss:if ($menu == nicklist) fmsg $1 $kiss | else kiss
Eu adoro você!: {
  say 13(¯`·´¯) Eu adoro (¯`·´¯) vc $1 !
  say 1613 `·.·´ ...........`·.·´
}
-
Curativos
.Band-aid:fmsg 4(7::::12| BAND AID |7::::4)12 para4 $1
.Gelol:gelol_ $1
Horóscopo
.Áries:horoscopo aries $1
.Touro:horoscopo touro $1
.Gêmeos:horoscopo gemeos $1
.Cancêr:horoscopo cancer $1
.Leão:horoscopo leao $1
.Virgem:horoscopo virgem $1
.Libra:horoscopo libra $1
.Escorpião:horoscopo escorpiao $1
.Sagitário:horoscopo sagitario $1
.Capricórnio:horoscopo capricornio $1
.Aquário:horoscopo aquario $1
.Peixes:horoscopo peixes $1
$iif($menu == query,Desenhos)
.Feliz Aniversário	(05 linhas): happybirth 
.Ser um Beatle	(06 linhas) {
  fmsg 12O MAIS NOVO MEMBRO DOS BEATLES!
  fmsg 1////\\0...1//||\\0...1//\|\\0....1///||\0..3\|/0.3____0.3\|/ 
  fmsg 1/`O-O'0...1`0.1@0.1@\0...1//o0.1o//0.....1a0.1a0....3@~/0.1,.0.3\~@ 
  fmsg 0...1]0..sady..1>0......1)0.1|0.1(0.......1_)0...3/_(0.3\__/0.3)_\ 
  fmsg 0...1-0........1-0........1-0.........1~0.......3\__4U3_/ 
  fmsg 6- John -- Paul -- George -- Ringo --- $left( [ $$1 $+ !!!!!!!!! ] ,9) --- 
}
.Cartoon Network	(02 linhas): fmsg 0,1C1,0A0,1R1,0T0,1O1,0O0,1N | fmsg 1,0N0,1E1,0T0,1W1,0O0,1R1,0K
.-
.Ações
..Monumento	(07 linhas):Monument $1
..Nick entre cores	(03 linhas):n1ckcolor $1
..Jogar capoeira	(03 linhas):jogarcapoeira $1
..-
..Fumar charuto da paz	(04 linhas):charutodapaz $1
..Você me faz feliz!!	(03 linhas):vocemefazfeliz $1
..Ações de Amor
...Estrelas	(04 linhas):centrodomeuuniverso $1
...Fazer músicas juntos	(05 linhas):quarternotes $1
..-
..Expressões/Face
...Hmmm	(04 linhas): {
  fmsg 0 -----5vvv 
  fmsg 0 ----5(0~0) 
  fmsg 5 ooO--(_)--Ooo- 
  fmsg 12 Hmmmmmmmmmmmmm 
}
..-
..Vaso na Cabeça	(01 linhas):me joga um vaso na cabeça de6 $1 5 ¸.·´¯`·-1>                    1,14<<3,0¬5,0*                     1,15¶5,0:¬)     $$input(Motivo: (exemplo: ACORDA!!),129,Requisição)
Agressões
.Agressões (&1)
..Aquela Chupada {
  fmsg 7 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯4\¯)15 ~~° ~~° ~~°
  fmsg 7 (__)__)2 $1 14dê aquela chupada aqui
}
..Bate uma punheta pra mim {
  me bate punheta..
  fmsg 0187=w===4D
  fmsg 0187==w==4D
  fmsg 0187===w=4D
  fmsg 0187====w4D
  fmsg 0187====w4D11~~~~
  me e goza na cara de $1
}
..Feio demais:me porra $1 $+ , tuh eh tão feio q parece q tacaram fogo na sua cara e apagaram com um machado, oh... puta q pariu
..Dedada:me dah uma dedada em $$1
..Tijolo no nariz:me enfia um tijolo no nariz de $1
..Óleo quente:me derrama óleo quente no ouvido de $1 $+ ..
..Tapa na oreia:me desce um tapa na oreia de $1
..Pimenta no olho:me derrama pimenta no olho de $1 ..
..Feito à martelada:me acha que $1 foi feito à martelada pra ser tão feio assim,,.
..Atirar na Jaca:me dah um tiro bem na jaca de $1 .. POW! head shot
..Ácido nas veias:me injeta ácido sulfúrico nas veias de $$1 $+ ...
..Martelada na Joanete:me começa a dar martelada na joanete de $1
..Martelada na Testa:me pega um martelo e arremessa na testa de $1
..Anzol no olho:me pega um anzol, coloca no olho esquerdo de $1 e puxa de uma vez... $1 perde um olho.
.Agressões (&2)
..Cheira meu ovo:me ei, ei, ei.. EEEEEEEEEI $1 $+ .. chêra meu ovo!!
..Lambe meu ovo:me ei, ei, ei.. eeeeeeei $1 $+ .. lêmbe meu ovo esquerdo!!!
..Assar a cabeça:me assa a cabeça de $1 numa chapa de sanduíche.. tzzzz
..Choque no olho:me pega um fio descascado e começa a dar choque no olho de $1
..Gordo !:me ei $1 $+ , tuh eh tao gordo q pra tuh axar teu cu tem q olhar no mapa..
..Xícara de formiga:me derrama uma xícara de formiga no nariz de $1 ..;.,.,,./;\..,
..Filé da gengiva:me pega um estilete e faz filé da gengiva de $1
.._(_ morde:fmsg 12hey $1 $+ .. _(_ morde
.._)_ senta (na moral):fmsg 12hey $1 $+ .. _(_ senta ae na moral
.._|_ castiga vai:fmsg 12hey $1 $+ .. _(_ ...castiga ai, vai
.._)_ cavalga:fmsg 12hey $1 $+ .. _(_ cavalga
.-
.Nojeiras
..Passar bosta de cavalo:me passa bosta de cavalo em $1 $+ .. Hhhmm, ateh q tah cheirando melhor..
..Peidar na cara:me peida na cara de $$1
..Assoar nariz:me assoa o nariz e joga a meleca em $1
..Espirrar na cara:me espirra bem na cara de $$1 .. ATCHURR!
..Vomitar na cara:me pede pra $1 abrir a boca e vomita dentro dela.. 7BUUURRGH!
..Catarro na cara:me tosse e cospe o catarro na cara de $1 $+ ..
..Catarro no cabelo:me tosse e cospe o catarro no cabelo de $1
..Mijar na cara:me mija na cara de $1
..Derramar bosta:me derrama bosta mole de cachorro dentro do nariz de $1
.Xingar a mãe
..Em português:fmsg 07 $+ $1 $+ 12 $read sistema\docs\piadas\Xingar a mae.txt
..Em inglês:fmsg 07 $+ $1 $+ 12 $read sistema\docs\piadas\Xingar a mae (ingles).txt 
Hugs
.3D Moldura
..Moldura [1]:3dmoldure $1 2 12 14 15 6 13 3 9
..Moldura [2]:3dmoldure $1 2 12 15 0 5 4 11 10
..Moldura [3]:3dmoldure $1 8 9 0 15 7 8 3 12
..Moldura [4]:3dmoldure $1 12 2 15 14 13 6 9 3
..Moldura Aleatória:if ($$input(Pode ficar tosco... quer continuar ?,qy,Confirmação) == $true) 3dmoldure $1 $r(1,15) $r(1,15) $r(1,15) $r(1,15) $r(1,15) $r(1,15) $r(1,15) $r(1,15)
.-
.Flores	(5 linhas):fmsg 4 (¯`'·.¸(¯`'·.¸ ________________ ¸.·'´¯)¸.·'´¯) | fmsg 4  (¯`'·.¸(¯`'·.¸  ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ  ¸.·'´¯)¸.·'´¯) | fmsg 4     >----==>>>>------>3 $$1 4 --==>>>>------> | fmsg 4  (_¸.·'´(_¸.·'´ ŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸŸ `'·.¸_)`'·.¸_) | fmsg 4  (_¸.·'´(_¸.·'´ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ `'·.¸_)`'·.¸_) 0
.Flores 2	(4 linhas):fmsg 4,1(¯8,1`'·4,1.¸12,1(¯9,1`'·12,1.¸9,1 $$1 12,1¸.9,1·'´12,1¯)4,1¸.8,1·'´4,1¯) | fmsg 4,1(¯8,1`'·4,1.¸12,1(¯9,1`'·12,1.¸8,1 $$1 12,1¸.9,1·'´12,1¯)4,1¸.8,1·'´4,1¯) | fmsg 4,1(_8,1¸.·4,1'´12,1(_9,1¸.·12,1'´7,1 $$1 12,1`'9,1·.¸12,1_)4,1`'8,1·.¸4,1_) | fmsg 4,1(_8,1¸.·4,1'´12,1(_9,1¸.·12,1'´4,1 $$1 12,1`'9,1·.¸12,1_)4,1`'8,1·.¸4,1_) 0
.Smiles	(3 linhas):fmsg 0,1 :) 0,4 :) 0,12 :) 8,1 :)13 $$1 0,1 :) 0,4 :) 0,12 :) 8,1 :) 0 | fmsg 0,1 :) 0,4 :) 0,12 :) 8,1 :)13 $$1 0,1 :) 0,4 :) 0,12 :) 8,1 :) 0 | fmsg 0,1 :) 0,4 :) 0,12 :) 8,1 :)13 $$1 0,1 :) 0,4 :) 0,12 :) 8,1 :) 0
.2 Corações	(5 linhas):fmsg 4,1 .*"*. .*"*. 1,1...13,1 $$1 1,1.. 4,1.*"*. .*"*. | fmsg 4,1 * 1,1.. 4,1*1,1. . 4,1*1,1... 12,1 $$1 1,1.. 4,1* 1,1...4*1,1... 4,1* | fmsg 4,1 `*. 1,1. . 4,1.*' 1,1...11,1 $$1 1,1.. 4,1`*. 1,1... 4,1.*' | fmsg 1,1... 4,1*. .* 1,1......9,1 $$1 1,1..... 4,1*. .* 1,1.. | fmsg 1,1..... 4,1* 1,1........8,1 $$1 1,1....... 4,1* 1,1.... 0
.-
.Confetes	(1 linha):fmsg 2¤3°4·5.6·7°8¤9°10·11.12·13°14¤15°2·3.4·5°6¤4 $$1 2¤3°4·5.6·7°8¤9°10·11.12·13°14¤15°2·3.4·5°6
.Ponte	(1 linha):fmsg 7©º°¨¨°º©4©º°¨¨°º©10 $$1 13©º°¨¨°º©12©º°¨¨°º©
-
Baixar mais Aliases:run http://www.alivescript.net/
