< Voltar ao menu principal >: {
  if ($active == Status Window) { .load -ps scripts\popups.ini | halt }
  else if ($active ischan) { .load -pc scripts\popups.ini | halt }
}
-
$style(2) Escolha uma categoria abaixo:.
-
Amor: __editaliases amor.txt
Risadas: __editaliases risadas.txt
Cumprimentos: __editaliases cumprimentos.txt
-
Ofensas: __editaliases ofensas.txt
Frases: __editaliases frases.txt
-
FUTEBOL
.$submenu($`myaliases_futebol($1))
.-
.Adicionar time:__addtimefut
.Remover time: {
  var %var = $$input(Remover que time da lista?,qe,Requisição)
  if ($$input(Confirma exclusão do time $upper(%var) $+ ?,qy,Confirmação)) {
    if ($exists($shortfn(docs\aliases\futebol\ $+ %var $+ .txt))) {
      if ($alias(%var $+ .txt)) { .unload -a %var $+ .txt }
      .remove $shortfn(docs\aliases\futebol\ $+ %var $+ .txt))
      fecho -a Removido&cc2 $upper(%var) &cc1com sucesso!
    }
    else fecho -a Erro: O time&cc2 $upper(%var) &cc1não existe. Verifique corretamente o nome e tente denovo!
  }
}
-
Meus /Aliases: __openaliases $+(/Meus Aliases,$chr(127),$+($shortfn($mircdirdocs\aliases\),diversos.txt))
-
$style(2) Escolha uma categoria acima:.
-
Baixas mais Aliases: url -an %pop.site
