;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   05/06/2009
; @data término  
;
; @titulo        DCC, KICK/BAN HISTORICO, ASCII & MENU C/N/M/B Serv
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

on *:filercvd:*:{
  ;; mostra imagem no pvt
  if (($right($filename, 4) == .jpg) || ($right($filename, 4) == .bmp)) && ($query($nick)) && ($findtok(%pop.info.query,showpvtpic,1,32)) { .timer 1 0 background -dp $nick $shortfn($filename) }

  write -il1 configs\dcclog-get.txt 1 + 0 0 0 $+($get(-1).file,	+ 0 0 0 $bytes($get(-1).size,3).suf $iif($get(-1).resumed,resumido em $bytes($v1,3).suf),	+ 0 0 0 $get(-1),	+ 0 0 0 $time(dd/mm/yy @ HH:nn:ss),	+ 0 0 0 $bytes($get(-1).cps,3).suf,/s 	+ 0 0 0 $_duration($get(-1).secs),	+) 0 0 0 $get(-1).ip 	+ 0 0 0 $network
}
on *:filesent:*:{
  if ($server == $null) return

  write -il1 configs\dcclog-send.txt 1 + 0 0 0 $+($send(-1).file,	+ 0 0 0 $bytes($send(-1).size,3).suf $iif($send(-1).resumed,resumido em $bytes($v1,3).suf),	+ 0 0 0 $send(-1),	+ 0 0 0 $time(dd/mm/yy @ HH:nn:ss),	+ 0 0 0 $bytes($send(-1).cps,3).suf,/s	+ 0 0 0 $_duration($send(-1).secs),	+) 0 0 0 $send(-1).ip 	+ 0 0 0 $network
}

on *:sendfail:*.*: {
  ; fecho -a Erro ao enviar o arquivo:&cc2 $nopath($filename) 
  write -il1 configs\dcclog-incsend.txt 1 + 0 0 0 $+($send(-1).file,	+ 0 0 0 $bytes($send(-1).sent,3).suf,/,$bytes($send(-1).size,3).suf $send(-1).pc $+ % $iif($send(-1).resumed,resumido em $bytes($v1,3).suf),	+ 0 0 0 $send(-1),	+ 0 0 0 $time(dd/mm/yy @ HH:nn:ss),	+ 0 0 0 $bytes($send(-1).cps,3).suf,/s	+ 0 0 0 $_duration($send(-1).secs),	+) 0 0 0 $send(-1).ip 	+ 0 0 0 $network
  .close -g "Send $nick $nopath($filename) $+ " 
}
on *:getfail:*.*: {
  ; fecho -a Erro ao receber o arquivo:&cc2 $nopath($filename) 
  write -il1 configs\dcclog-incget.txt 1 + 0 0 0 $+($get(-1).file,	+ 0 0 0 $bytes($get(-1).rcvd,3).suf,/,$bytes($get(-1).size,3).suf $get(-1).pc $+ % $iif($get(-1).resumed,resumido em $bytes($v1,3).suf),	+ 0 0 0 $get(-1),	+ 0 0 0 $time(dd/mm/yy @ HH:nn:ss),	+ 0 0 0 $bytes($get(-1).cps,3).suf,/s	+ 0 0 0 $_duration($get(-1).secs),	+) 0 0 0 $get(-1).ip 	+ 0 0 0 $network
}

alias dcclog __opendialog dcclog

dialog dcclog {
  title "Histórico de DCCs"
  size -1 -1 587 290
  icon $mircexe, 9

  menu "Arquivo", 1
  item "Fechar", 2, 1
  menu "Opções", 3
  item "Atualizar Lista", 42, 3
  item "Apagar selecionado", 4, 3
  item break, 41
  menu "Limpar", 5, 3
  item "Recebidos", 12
  item "Enviados", 13
  item "Rec. Incompletos", 14
  item "Env. Incompletos", 15
  item "Limpar Tudo", 16, 3

  tab "Recebidos", 6, 5 5 575 254
  tab "Enviados", 7
  tab "Rec. Incompletos", 8
  tab "Env. Incompletos", 9
  button "Fechar", 11, 506 260 75 25,ok

  list 10, 12 33 564 219, size, tab 6
  list 20, 12 33 564 219, size, tab 7
  list 30, 12 33 564 219, size, tab 8
  list 40, 12 33 564 219, size, tab 9
}

alias loaddcclog {
  if ($dialog(dcclog) != $null) {

    did -r dcclog 10,20,30,40
    if ($lines(configs\dcclog-get.txt)) { loadbuf -o dcclog 10 configs\dcclog-get.txt } | else { did -a dcclog 10 1 + 0 0 0 Nenhum log! }
    if ($lines(configs\dcclog-send.txt)) { loadbuf -o dcclog 20 configs\dcclog-send.txt } | else { did -a dcclog 20 1 + 0 0 0 Nenhum log! }
    if ($lines(configs\dcclog-incget.txt)) { loadbuf -o dcclog 30 configs\dcclog-incget.txt } | else { did -a dcclog 30 1 + 0 0 0 Nenhum log! }
    if ($lines(configs\dcclog-incsend.txt)) { loadbuf -o dcclog 40 configs\dcclog-incsend.txt } | else { did -a dcclog 40 1 + 0 0 0 Nenhum log! }
  }
}
;;;=-0-0000
on *:dialog:dcclog:*:*: {

  ;;;;;;;;;;;;;;;;;;;;;;;;;;; INIT

  if ($devent == init) {

    __mdx SetControlMDX $dname 10,20,30,40 ListView rowselect grid showsel single infotip labeltip report > $__mdxfile(views)

    did -i $dname 10,20,30,40 1 headerdims 190 90 110 120 60 80 100 70
    did -i $dname 10 1 headertext $+(Arquivo,$chr(9),Tamanho,$chr(9),De,$chr(9),Horário,$chr(9),Taxa,$chr(9),Duração,$chr(9),IP do usuário,$chr(9),Rede)
    did -i $dname 20 1 headertext $+(Arquivo,$chr(9),Tamanho,$chr(9),Para,$chr(9),Horário,$chr(9),Taxa,$chr(9),Duração,$chr(9),IP do usuário,$chr(9),Rede)
    did -i $dname 30 1 headertext $+(Arquivo,$chr(9),Recebido (%),$chr(9),De,$chr(9),Horário,$chr(9),Taxa,$chr(9),Duração,$chr(9),IP do usuário,$chr(9),Rede)
    did -i $dname 40 1 headertext $+(Arquivo,$chr(9),Enviado (%),$chr(9),De,$chr(9),Horário,$chr(9),Taxa,$chr(9),Duração,$chr(9),IP do usuário,$chr(9),Rede)

    loaddcclog
  }

  ;;;;;;;;;;;;;;;;;;;;;;;;;;; MENU

  elseif ($devent == menu) {

    if ($did == 42) loaddcclog
    if ($did == 2)  dialog -x dcclog dcclog
    if ($did == 16) .timer 1 0 cleardcclogs

    if ($did == 4) {
      if ($did(10).visible) && ($did(10).sel) { .write -dl $+ $calc($did(10).sel - 1) configs\dcclog-get.txt | did -d $dname 10 $did(10).sel }
      else if ($did(20).visible) && ($did(20).sel) { .write -dl $+ $calc($did(20).sel - 1) configs\dcclog-send.txt | did -d $dname 20 $did(10).sel }
      else if ($did(30).visible) && ($did(30).sel) { .write -dl $+ $calc($did(30).sel - 1) configs\dcclog-incget.txt | did -d $dname 30 $did(30).sel }
      else if ($did(40).visible) && ($did(40).sel) { .write -dl $+ $calc($did(40).sel - 1) configs\dcclog-incsend.txt | did -d $dname 40 $did(40).sel }
    }

    if ($did == 12) { .remove configs\dcclog-get.txt | loaddcclog }
    if ($did == 13) { .remove configs\dcclog-send.txt | loaddcclog }
    if ($did == 14) { .remove configs\dcclog-incget.txt | loaddcclog }
    if ($did == 15) { .remove configs\dcclog-incsend.txt | loaddcclog }
  }

}
alias cleardcclogs {
  if ($$input(Apagar mesmo todos os logs de DCC's?,qy,Confirmação)) {
    .remove configs\dcclog-get.txt
    .remove configs\dcclog-send.txt
    .remove configs\dcclog-incget.txt
    .remove configs\dcclog-incsend.txt
    loaddcclog
  }
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Kick/ban historico
alias kblog __opendialog logskb

dialog logskb {
  title "Histórico de Kick/ban"
  size -1 -1 461 297
  option pixels
  icon $aliveicon

  tab "Kicks", 14, 4 2 452 264
  list 16, 10 28 441 228, tab 14
  tab "Bans", 15
  list 17, 10 28 441 228, tab 15

  menu "Arquivo", 5
  item "Fechar", 10, 5
  menu "Opções", 9
  item "Atualizar", 11, 9
  item break, 12, 9
  item "Remover selecionado", 13, 9
  item "Limpar lista", 7, 9

  button "Fechar", 1, 380 266 75 25, ok
}
on *:dialog:logskb:*:*:{
  if ($devent == init) {
    dialog -t $dname $dialog($dname).title - Total: $logskb.total

    __mdx SetControlMDX $dname 16,17 ListView grid report showsel rowselect > $__mdxfile(views)
    did -i $dname 16,17 1 headerdims 100:1 80:2 80:3 170:4
    did -i $dname 16 1 headertext + 0 Data	+ 0 Canal	+ 0 Nick	+ 0 Motivo
    did -i $dname 17 1 headertext + 0 Data	+ 0 Canal	+ 0 Afetados	+ 0 Máscara
    logskb.refresh
  }
  elseif ($devent == menu) {
    if ($did == 7) { .timer 1 0 logskb.clear }
    if ($did == 11) { logskb.refresh }
    if ($did == 13) { logskb.del }
    if ($did == 10) { dialog -c $dname }
  }
}
alias logskb.clear {
  if (!$$input(Apagar todo o histórico de kicks e bans?, qy, Confirmação)) return

  write -c configs\hist-kick.txt
  write -c configs\hist-ban.txt

  logskb.refresh
}
alias logskb.refresh {
  if ($lines(configs\hist-kick.txt)) { loadbuf -ro logskb 16 configs\hist-kick.txt }
  else { did -ra logskb 16 1 + 0 0 0 Nenhum registro }

  if ($lines(configs\hist-ban.txt)) { loadbuf -ro logskb 17 configs\hist-ban.txt }
  else { did -ra logskb 17 1 + 0 0 0 Nenhum registro }
}
alias logskb.total { return $calc($lines(configs\hist-kick.txt) + $lines(configs\hist-ban.txt)) }
alias logskb.del {
  var %d = $dialog(logskb).tab
  if (%d == 14) { while ($did(logskb,2).sel) { did -d logskb 16 $v1 } }
  if (%d == 15) { while ($did(logskb,8).sel) { did -d logskb 18 $v1 } }

  if (%d == 14) { savebuf -o 2- $+ $did(logskb,16).lines logskb 16 configs\hist-kick.txt }
  if (%d == 15) { savebuf -o 2- $+ $did(logskb,17).lines logskb 17 configs\hist-ban.txt }

  logskb.refresh
}



;;;;;;;;;;;;;;;;;;;;;;;; MENU NICKSERV / MEMOSERV / CHANSERV
on *:close:@chanserv/*:unset %canal
on *:close:@botserv/*:unset %canalbs

menu @NickServ/* {
  dclick:whois nickserv
  Registro
  .Registrar
  ..Registrar $me:echo nickserv register $$input(Crie uma senha para $me $+ :,pqe,Requisição) $$input(Informe seu EMAIL corretamente:,qe,Requisição)
  ..-
  ..Ajuda:nickserv help register
  .Mudar senha
  ..Mudar Senha:nickserv set password $$input(Nova senha para $me $+ :,pqe,Requisição) 
  ..-
  ..Ajuda:nickserv help set password
  .Desregistrar " $+ $me $+ "
  ..Desregistrar:nickserv drop
  ..-
  ..Ajuda:nickserv help drop
  Identificação
  .Identificar-se: identificar
  .Automaticamente: .
  .-
  .Ajuda:nickserv help identify
  -
  Setar
  .E-mail
  ..Setar:nickserv set email $$input(Email:,qe,Requisição)
  ..-
  ..Ajuda:nickserv help set email
  .Url
  ..Url:nickserv set url $$input(URL: [ex: www.lovesite2000.com.br],qe,Requisição)
  ..Apagar Url:nickserv set url
  ..-
  ..Ajuda:nickserv help set url
  Informação
  .Informações
  ..Ver Info:nickserv info $$input(Nick:,qe,Requisição)
  ..-
  ..Ajuda:nickserv help info
  .Status
  ..Status:nickserv status $$input(Nick:,qe,Requisição)
  ..-
  ..Ajuda:nickserv help status
  -
  Recuperar nick
  .Ghost
  ..Kickar ghost: nickserv ghost $$input(Nick ghost para derrubar:,qe,Requisição) $$input(Senha do nick:,pqe,Requisição)
  ..-
  ..Ajuda:nickserv help ghost
  .Recover
  ..Recuperar nick:check.nickcover
  ..-
  ..Ajuda:nickserv help recover
  .Release
  ..Liberar:nickserv release $$input(Nick para liberar:,qe,Requisição) $$input(Senha do nick:,pqe,Requisição)
  ..-
  ..Ajuda:nickserv help release
  Seguranças
  .Kill
  ..Ligar kill 60 segundos:nickserv set kill on
  ..Ligar kill 20 segundos:nickserv set kill quick
  ..Desligar:nickserv set kill off
  ..-
  ..Ajuda:nickserv help set kill
  .Nick seguro
  ..Ligar:nickserv set secure on
  ..Desligar:nickserv set secure off
  ..-
  ..Ajuda:nickserv help set secure
  .Privado
  ..Ligar:nickserv set private on
  ..Desligar:nickserv set private off
  ..-
  ..Ajuda:nickserv help set private
  .-
  .Esconder
  ..E-mail
  ...Ligar:nickserv set hide email on
  ...Desligar:nickserv set hide email off
  ...-
  ...Ajuda:nickserv help set hide
  ..Sua máscara
  ...Ligar:nickserv set hide usermask on
  ...Desligar:nickserv set hide usermask off
  ...-
  ...Ajuda:nickserv help set hide
  ..Suas desconexões(Quits)
  ...Ligar:nickserv set hide quit on
  ...Desligar:nickserv set hide quit off
  ...-
  ...Ajuda:nickserv help set hide
  -
  Outros
  . Máscara
  ..Listar máscaras:nickserv access list
  ..Adicionar máscara:nickserv access add $$input(Digite a Máscara: $crlf $crlf $+ [Ex.: $address($me,3) $+ ],qe,Requisição)
  ..Apagar máscara:nickserv access del $$input(Digite a Máscara: $crlf $crlf $+ [Ex.: $address($me,3) $+ ],qe,Requisição)
  ..-
  ..Ajuda:nickserv help access
  $iif($status != connected, $style(2)) Ajuda
  .Ajuda:nickserv help
  .Específico ?:nickserv help $$input(Em qual comando você tem dúvida ? [Ex.: register, set]:,129,Requisição)
  -
  Fechar:window -c $active
}
alias chantroca {
  echo $colour(notice) -at -ChanServ- Canal padrão mudado para: $2
}
menu @Chanserv/* {
  dclick:whois chanserv
  Canal padrão $+ $chr(58) $iif(%canal. [ $+ [ $cid ] ],%canal. [ $+ [ $cid ] ],<nao setado>)
  .$chan(1) { set %canal. [ $+ [ $cid ] ] $chan(1) | chantroca $active $chan(1) }
  .$chan(2) { set %canal. [ $+ [ $cid ] ] $chan(2) | chantroca $active $chan(2) }
  .$chan(3) { set %canal. [ $+ [ $cid ] ] $chan(3) | chantroca $active $chan(3) }
  .$chan(4) { set %canal. [ $+ [ $cid ] ] $chan(4) | chantroca $active $chan(4) }
  .$chan(5) { set %canal. [ $+ [ $cid ] ] $chan(5) | chantroca $active $chan(5) }
  .$chan(6) { set %canal. [ $+ [ $cid ] ] $chan(6) | chantroca $active $chan(6) }
  .$chan(7) { set %canal. [ $+ [ $cid ] ] $chan(7) | chantroca $active $chan(7) }
  .$chan(8) { set %canal. [ $+ [ $cid ] ] $chan(8) | chantroca $active $chan(8) }
  .$chan(9) { set %canal. [ $+ [ $cid ] ] $chan(9) | chantroca $active $chan(9) }
  .$chan(10) { set %canal. [ $+ [ $cid ] ] $chan(10) | chantroca $active $chan(10) }
  .Escolher... { set %canal. [ $+ [ $cid ] ] #$$input(Digite o canal:,qe,Requisição) | chantroca $active %canal. [ $+ [ $cid ] ] }
  .-
  .Ajuda { 
    echo $colour(notice) -at -ChanServ- Ajuda: Essa opção serve para setar um canal padrão para todos os comandos/opções que você usar do Serviço. 
    echo $colour(notice) -at -ChanServ- Extremamente útil para você não ficar colocando sempre o canal quando você aplica algum comando.
    echo $colour(notice) -at -ChanServ- Você pode alterar a hora quiser a escolha do canal. 
  }
  -
  $iif(%canal. [ $+ [ $cid ] ],Info do canal):.chanserv info %canal. [ $+ [ $cid ] ]
  -
  $iif(%canal. [ $+ [ $cid ] ],Registro)
  .Registrar esse Canal
  ..Registrar:chanserv register %canal. [ $+ [ $cid ] ] $$input(Breve descrição do canal:,qe,Requisição)
  ..-
  ..Ajuda:chanserv help register
  .Mudar Senha
  ..Setar:chanserv set %canal. [ $+ [ $cid ] ] password $$input(Nova senha:,pqe,Requisição)
  ..-
  ..Ajuda:chanserv help set password
  -
  $iif(%canal. [ $+ [ $cid ] ],Comandos)
  .$iif(%canal. [ $+ [ $cid ] ],Pegar Op):.chanserv op %canal. [ $+ [ $cid ] ] $me
  .$iif($chan(0),Pegar Op em todos canais):{
    var %c = 1
    while ($chan(%c)) { .chanserv op $chan(%c) $me | inc %c }
  }
  .-
  .Dar Op
  ..$me:chanserv op %canal. [ $+ [ $cid ] ] $me
  ..Outro:chanserv op %canal. [ $+ [ $cid ] ] $$input(Nick:,qe,Requisição)
  ..-
  ..Ajuda:chanserv help op
  .Tirar Op
  ..$me:chanserv deop %canal. [ $+ [ $cid ] ] $me
  ..Outro:chanserv deop %canal. [ $+ [ $cid ] ] $$input(Nick:,qe,Requisição)
  ..-
  ..Ajuda:chanserv help deop
  .-
  .Dar Voice
  ..$me:chanserv voice %canal. [ $+ [ $cid ] ] $me
  ..Outro:chanserv voice %canal. [ $+ [ $cid ] ] $$input(Nick:,qe,Requisição)
  ..-
  ..Ajuda:chanserv help voice
  .Tirar Voice
  ..$me:chanserv devoice %canal. [ $+ [ $cid ] ] $me
  ..Outro:chanserv devoice %canal. [ $+ [ $cid ] ] $$input(Nick:,qe,Requisição)
  ..-
  ..Ajuda:chanserv help devoice
  .-
  .Invite
  ..Convidar:chanserv invite %canal. [ $+ [ $cid ] ]
  ..-
  ..Ajuda:chanserv help invite
  $iif(%canal. [ $+ [ $cid ] ],Apagar todos)
  .Modos:chanserv clear %canal. [ $+ [ $cid ] ] modes
  .Bans:chanserv clear %canal. [ $+ [ $cid ] ] bans
  .OPs:chanserv clear %canal. [ $+ [ $cid ] ] ops
  .Voices:chanserv clear %canal. [ $+ [ $cid ] ] voices
  .Usuários (kick):chanserv clear %canal. [ $+ [ $cid ] ] users
  .-
  .Ajuda:chanserv help clear
  .-
  .UnBan
  ..UnBan:chanserv unban %canal. [ $+ [ $cid ] ]
  ..-
  ..Ajuda:chanserv help unban
  -
  $iif(%canal. [ $+ [ $cid ] ],Setar)
  .Sucessor
  ..Setar:chanserv set %canal. [ $+ [ $cid ] ] successor $$input(Nick do novo sucessor:,qe,Requisição)
  ..-
  ..Ajuda:chanserv help set successor
  .-
  .Descrição
  ..Setar:chanserv set %canal. [ $+ [ $cid ] ] desc $$input(Nova descrição:,qe,Requisição)
  ..Ajuda:chanserv help set desc
  .URL
  ..Setar:chanserv set %canal. [ $+ [ $cid ] ] url $$input(URL do canal:,qe,Requisição)
  ..Apagar:chanserv set %canal. [ $+ [ $cid ] ] url
  ..-
  ..Ajuda:chanserv help set url
  .E-mail
  ..Setar:chanserv set %canal. [ $+ [ $cid ] ] email $$input(Email do %canal. [ $+ [ $cid ] ] $+ : [Pode ser de qualquer um]:,qe,Requisição)
  ..Apagar:chanserv set %canal. [ $+ [ $cid ] ] email
  ..-
  ..Ajuda:chanserv help set email
  .Mensagem de entrada
  ..Setar:chanserv set %canal. [ $+ [ $cid ] ] entrymsg $$input(Mensagem de boas vindas:,qe,Requisição)
  ..Apagar:chanserv unset %canal. [ $+ [ $cid ] ] entrymsg
  ..-
  ..Ajuda:chanserv help set entrymsg
  .-
  .Tópico
  ..Setar:chanserv topic %canal. [ $+ [ $cid ] ] $$input(Tópico:,qe,Requisição)
  ..Ajuda:chanserv help set topic
  .Manter tópico
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] keeptopic on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] keeptopic off
  ..-
  ..Ajuda:chanserv help set keeptopic
  .Trancar tópico
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] topiclock on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] topiclock off
  ..-
  ..Ajuda:chanserv help set topiclock
  .Trancar modos
  ..Modos...:chanserv set %canal. [ $+ [ $cid ] ] mlock $$input(Modos a trancar: $crlf $crlf $+ Apenas convidados (+i) $crlf $+ Limite de usuários (+l <limite_de_usuários>) $crlf $+ Privado (+p) $crlf $+ Secreto (+s) $crlf $+ Com Senha (+k <senha>) $crlf $+ Moderado (+m) $crlf $+ Sem mensagens externas (+n) $crlf $+ Só OPs mudam o tópico (+t) $crlf $crlf $+ Com '+' ativa e '-' desativa.,129,Trancar Modos do Canal,+nt-iklmps)
  ..Ajuda:chanserv help set mlock
  .-
  .Privado
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] private on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] private off
  .Acesso restrito
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] restricted on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] restricted off
  ..-
  ..Ajuda:chanserv help set restricted
  .Segurança
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] secure on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] secure off
  ..-
  ..Ajuda:chanserv help set secure
  .-
  .Segurança de OPs
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] secureops on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] secureops off
  ..-
  ..Ajuda:chanserv help set secureops
  .Deixar OPs
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] leaveops on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] leaveops off
  ..-
  ..Ajuda:chanserv help set leaveops
  .Notice em OP/DEOP
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] opnotice on
  ..Desligar:chanserv set %canal. [ $+ [ $cid ] ] opnotice off
  ..-
  ..Ajuda:chanserv help set opnotice
  .-
  .Enforce
  ..Ligar:chanserv set %canal. [ $+ [ $cid ] ] enforce on
  ..Desligar(padrão):chanserv set %canal. [ $+ [ $cid ] ] enforce off
  ..-
  ..Ajuda:chanserv help set enforce
  .Tipo de Ban
  ..&0 (*!user@host):chanserv set %canal. [ $+ [ $cid ] ] bantype 0
  ..&1 (*!*user@host):chanserv set %canal. [ $+ [ $cid ] ] bantype 1
  ..&2 (*!*@host):chanserv set %canal. [ $+ [ $cid ] ] bantype 2
  ..&3 (*!*user@*.domain):chanserv set %canal. [ $+ [ $cid ] ] bantype 3
  ..-
  ..Ajuda:chanserv help set bantype
  .-
  .Ajuda:chanserv help set
  -
  $iif(%canal. [ $+ [ $cid ] ],Lista de acesso)
  .Listar
  ..Todos:chanserv access %canal. [ $+ [ $cid ] ] list
  ..Nick/Número:chanserv access %canal. [ $+ [ $cid ] ] list $$input(Nick ou número de entrada à listar: $+ $crlf $crlf $+ Ex.: $+ $crlf $me [lista seu nick] $+ $crlf 2-5,6-8 [lista as entradas de 2 a 5 e 6 a 8]:,qe,Requisição)
  .-
  .Adicionar:chanserv access %canal. [ $+ [ $cid ] ] add $$input(Nick para adicionar na lista do %canal. [ $+ [ $cid ] ] $+ :,qe,Requisição) $$input(Nível entre -9999 a 9999 $+ $crlf $+ [Padrão: 3=Voice - 5=OP - 10=Master]:,qe,Requisição)
  .Remover:chanserv access %canal. [ $+ [ $cid ] ] del $$input(Nick ou número de entrada para remover da lista do %canal. [ $+ [ $cid ] ] $+ : $+ $crlf $crlf $+ Ex.: $+ $crlf $me [lista seu nick] $+ $crlf 2-5,6-8 [lista as entradas de 2 a 5 e 6 a 8],qe,Requisição)
  .-
  .Ajuda:chanserv help access
  $iif(%canal. [ $+ [ $cid ] ],Levels)
  .Descrições:chanserv help levels desc
  .Listar:chanserv levels %canal. [ $+ [ $cid ] ] list
  .Apagar (resetar):chanserv levels %canal. [ $+ [ $cid ] ] reset
  .-
  .Auto Op
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set autoop $$input(Nível de AUTOOP:,qe,Requisição)
  ..5 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set autoop 5
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set autoop reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable autoop
  .Auto DeOp
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set autodeop $$input(Nível de AUTODEOP:,qe,Requisição)
  ..-1 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set autodeop -1
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set autodeop reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable autodeop
  .Auto Voice
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set autovoice $$input(Nível de AUTOVOICE:,qe,Requisição)
  ..3 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set autovoice 3
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set autovoice reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable autovoice
  .-
  .Não Entrar
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set nojoin $$input(Nível de NOJOIN:,qe,Requisição)
  ..-1 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set nojoin -1
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set nojoin reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable nojoin
  .Invite
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set invite $$input(Nível de INVITE:,qe,Requisição)
  ..5 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set invite 5
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set invite reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] invite invite
  .-
  .Akick
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set akick $$input(Nível de AKICK:,qe,Requisição)
  ..10 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set akick 10
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set akick reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable akick
  .-
  .Set
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set set $$input(Nível de SET:,qe,Requisição)
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set set reset
  ..-
  ..Desligar (padrão):chanserv levels %canal. [ $+ [ $cid ] ] disable set
  .Clear
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set clear $$input(Nível de CLEAR:,qe,Requisição)
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set clear reset
  ..-
  ..Desligar (padrão):chanserv levels %canal. [ $+ [ $cid ] ] disable clear
  .Unban
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set unban $$input(Nível de UNBAN:,qe,Requisição)
  ..5 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set unban 5
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set unban reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable unban
  .-
  .Op/DeOp
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set opdeop $$input(Nível de OPDEOP:,qe,Requisição)
  ..5 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set opdeop 5
  ..Todos:chanserv levels %canal. [ $+ [ $cid ] ] set opdeop reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable opdeop
  .BotServ
  ..Badwords
  ...Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set badwords $$input(Nível de BADWORDS [ex: 10],qe,Requisição)
  ...10 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set badwords 10
  ..Fantasia
  ...Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set fantasia $$input(Nível de FANTASIA [ex: 3],qe,Requisição)
  ...3 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set fantasia 3
  ..NoKick
  ...Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set nokick $$input(Nível de NOKICK [ex: 1],qe,Requisição)
  ...1 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set nokick 1
  ..Say
  ...Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set say $$input(Nível de SAY [ex: 5],qe,Requisição)
  ...1 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set say 5
  .-
  .Acesso à lista
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set acc-list $$input(Nível de ACC-LIST,qe,Requisição)
  ..Todos (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set acc-list reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable acc-list
  .Mudar a lista
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set acc-change $$input(Nível de ACC-CHANGE,qe,Requisição)
  ..1 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set acc-change 1
  ..Todos (resetar):chanserv levels %canal. [ $+ [ $cid ] ] set acc-change reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable acc-change
  .-
  .Memo
  ..Escolher nível:chanserv levels %canal. [ $+ [ $cid ] ] set memo $$input(Nível de MEMO,qe,Requisição)
  ..10 (padrão):chanserv levels %canal. [ $+ [ $cid ] ] set memo 10
  ..Todos (resetar):chanserv levels %canal. [ $+ [ $cid ] ] set memo reset
  ..-
  ..Desligar:chanserv levels %canal. [ $+ [ $cid ] ] disable memo
  .-
  .Ajuda:chanserv help levels
  -
  $iif(%canal. [ $+ [ $cid ] ],Akick (Autokick))
  .Listar
  ..Todos:chanserv akick %canal. [ $+ [ $cid ] ] list
  ..Nick/Número/Máscara:chanserv akick %canal. [ $+ [ $cid ] ] list $$input(Nick $+ $chr(44) máscara ou número de entrada à listar: $+ $crlf $crlf $+ Ex.: $+ $crlf $me [lista seu nick] $+ $crlf 2-5 $+ $chr(44) 6-8 [lista as entradas de 2 a 5 e 6 a 8],qe,Requisição)
  .-
  .Adicionar:chanserv akick %canal. [ $+ [ $cid ] ] add $$input(Nick ou máscara para adicionar:,qe,Requisição) $input(Motivo: [opcional],qe,Requisição)
  .Remover:chanserv akick %canal. [ $+ [ $cid ] ] del $$input(Nick ou máscara para remove [pode colocar o número]:,qe,Requisição)
  .-
  .Ajuda:chanserv help akick
  -
  $iif($server,Ajuda)
  .Ajuda:chanserv help
  .Específico ?:chanserv help $$input(Em qual comando você tem dúvida ? [Ex.: set, levels]:,129,Requisição)
  -
  Fechar:unset %canal. [ $+ [ $cid ] ] | window -c $active
}

menu @MemoServ/* {
  dclick:whois memoserv
  Enviar
  .Nick:memoserv send $$input(Nick:,129,Requisição) $$input(Mensagem:,129,Requisição)
  .Canal:memoserv send #$$input(Canal:,129,Requisição) $$input(Mensagem:,129,Requisição)
  .-
  .Ajuda:memoserv help send
  Cancelar
  .Nick:memoserv cancel $$input(Nick:,129,Requisição)
  .-
  .Ajuda:memoserv help cancel
  -
  Listar
  .Todas mensagens:memoserv list
  .Escolher:memoserv list $$input(Listar mensagem de número: $+ $str($crlf,2) $+ Ex: $+ $crlf 1-4 $+ $chr(44) 5-8 (lista as mensagens de número 1 a 4 e 5 a 8),129,Requisição)
  .-
  .Canal
  ..Todas mensagens:memoserv list #$$input(Canal:,129,Requisição)
  ..Escolher:memoserv list # $$input(Listar mensagem de número: $+ $str($crlf,2) $+ Ex: $+ $crlf 1-4 $+ $chr(44) 5-8 (lista as mensagens de número 1 a 4 e 5 a 8),129,Requisição)
  .-
  .Ajuda:memoserv help list
  -
  Ler
  .Última:memoserv read last
  .Novas:memoserv read new
  .Escolher:memoserv read $$input(Ler mensagem de número: $+ $str($crlf,2) $+ Ex: $+ $crlf 1-4 $+ $chr(44) 5-8 (lista as mensagens de número 1 a 4 e 5 a 8),129,Requisição)
  .-
  .Canal
  ..Última:memoserv read #$$input(Canal:,129,Requisição) last
  ..Novas:memoserv read #$$input(Canal:,129,Requisição) new
  ..Escolher:memoserv read #$$input(Canal:,129,Requisição) $$input(Ler mensagem de número: $+ $str($crlf,2) $+ Ex: $+ $crlf 1-4 $+ $chr(44) 5-8 (lista as mensagens de número 1 a 4 e 5 a 8),129,Requisição)
  .-
  .Ajuda:memoserv help read
  Apagar
  .Número:memoserv del $$input(Apagar mensagem de número:,129,Requisição)
  .Escolher:memoserv del $$input(Apagar mensagem de número: $+ $str($crlf,2) $+ Ex: $+ $crlf 1-4 $+ $chr(44) 5-8 (apaga as mensagens de número 1 a 4 e 5 a 8),129,Requisição)
  .Todas:if ($$input(Tem certeza que quer apagar todas as suas mensagens no MemoServ?,qy,Confirmação)) { memoserv del all }
  .-
  .Canal
  ..Número:memoserv del #$$input(Canal:,129,Requisição) $$input(Apagar mensagem de número:,129,Requisição)
  ..Escolher:memoserv del #$$input(Canal:,129,Requisição) $$input(Apagar mensagem de número: $+ $str($crlf,2) $+ Ex: $+ $crlf 1-4 $+ $chr(44) 5-8 (apaga as mensagens de número 1 a 4 e 5 a 8),129,Requisição)
  ..-
  ..Todas:memoserv del #$$input(Canal:,129,Requisição) all
  .-
  .Ajuda:memoserv help del
  -
  Notificar memos
  .Sempre (padrão):memoserv set notify on
  .Ao conectar:memoserv set notify logon
  .Novas:memoserv set notify new
  .Não notificar:if ($$input(Tem certeza que não quer mais ser notificado por memos novos ?,qy,Confirmação)) { memoserv set notify off }
  .-
  .Ajuda:memoserv help set notify
  Limitar nº de memos
  .50 (padrão):memoserv set limit 50
  .Outro:memoserv set limit $$input(Limite: [máximo: 50],129,Requisição)
  .Trancar (0):memoserv set limit 0
  .-
  .Ajuda:memoserv help set limit
  -
  $iif($status != connected, $style(2)) Ajuda
  .Ajuda:memoserv help
  .Específico ?:memoserv help $$input(Em qual comando você tem dúvida ? [Ex.: set, read]:,129,Requisição)
  -
  Fechar:window -c $active
}


menu @BotServ/* {
  dclick:whois botserv
  Canal padrão $+ $chr(58) $iif(%canalbs. [ $+ [ $cid ] ],%canalbs. [ $+ [ $cid ] ],<nao setado>)
  .$chan(1) { set %canalbs. [ $+ [ $cid ] ] $chan(1) | chantroca $active $chan(1) }
  .$chan(2) { set %canalbs. [ $+ [ $cid ] ] $chan(2) | chantroca $active $chan(2) }
  .$chan(3) { set %canalbs. [ $+ [ $cid ] ] $chan(3) | chantroca $active $chan(3) }
  .$chan(4) { set %canalbs. [ $+ [ $cid ] ] $chan(4) | chantroca $active $chan(4) }
  .$chan(5) { set %canalbs. [ $+ [ $cid ] ] $chan(5) | chantroca $active $chan(5) }
  .$chan(6) { set %canalbs. [ $+ [ $cid ] ] $chan(6) | chantroca $active $chan(6) }
  .$chan(7) { set %canalbs. [ $+ [ $cid ] ] $chan(7) | chantroca $active $chan(7) }
  .$chan(8) { set %canalbs. [ $+ [ $cid ] ] $chan(8) | chantroca $active $chan(8) }
  .$chan(9) { set %canalbs. [ $+ [ $cid ] ] $chan(9) | chantroca $active $chan(9) }
  .$chan(10) { set %canalbs. [ $+ [ $cid ] ] $chan(10) | chantroca $active $chan(10) }
  .Escolher... { set %canalbs. [ $+ [ $cid ] ] #$$input(Canal:,129,Requisição) | chantroca $active %canalbs. [ $+ [ $cid ] ] }
  .-
  .Ajuda { 
    echo $colour(notice) -at -ChanServ- Ajuda: Essa opção serve para setar um canal padrão para todos os comandos/opções que você usar do Serviço. 
    echo $colour(notice) -at -ChanServ- Extremamente útil para você não ficar colocando sempre o canal quando você aplica algum comando.
    echo $colour(notice) -at -ChanServ- Você pode alterar a hora quiser a escolha do canal. 
  }
  -
  $iif($server,Info):botserv info %canalbs. [ $+ [ $cid ] ]
  $iif($server,Listar Bots):botserv BOT LIST
  -
  $iif(%canalbs. [ $+ [ $cid ] ],Associar Bot):botserv assign %canalbs. [ $+ [ $cid ] ] $$input(Nick do bot:,129,Requisição)
  $iif(%canalbs. [ $+ [ $cid ] ],Setar)
  .Não kickar
  ..Ops
  ...Ligar:botserv set %canalbs. [ $+ [ $cid ] ] DONTKICKOPS ON
  ...Desligar:botserv set %canalbs. [ $+ [ $cid ] ] DONTKICKOPS OFF
  ...-
  ...Ajuda:botserv help set DONTKICKOPS
  ..Voices
  ...Ligar:botserv set %canalbs. [ $+ [ $cid ] ] DONTKICKVOICES ON
  ...Desligar:botserv set %canalbs. [ $+ [ $cid ] ] DONTKICKVOICES OFF
  ...-
  ...Ajuda:botserv help set DONTKICKVOICES
  .FANTASIA
  ..Ligar:botserv set %canalbs. [ $+ [ $cid ] ] FANTASY ON
  ..Desligar:botserv set %canalbs. [ $+ [ $cid ] ] FANTASY OFF
  ..-
  ..Ajuda:botserv help set FANTASY
  .SYMBIOSIS
  ..Ligar:botserv set %canalbs. [ $+ [ $cid ] ] SYMBIOSIS ON
  ..Desligar:botserv set %canalbs. [ $+ [ $cid ] ] SYMBIOSIS OFF
  ..-
  ..Ajuda:botserv help set SYMBIOSIS
  $iif(%canalbs. [ $+ [ $cid ] ],Auto kick)
  .Palavrões
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] BADWORDS ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] BADWORDS OFF
  ..-
  ..Ajuda:botserv help kick BADWORDS
  .Cores
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] COLORS ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] COLORS OFF
  ..-
  ..Ajuda:botserv help kick COLORS
  .FLOOD
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] FLOOD ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição) $input(Depois de quantas linhas? Ex: 6,129,Requisição) $input(Em quantos segundos? Ex: 4,129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] FLOOD OFF
  ..-
  ..Ajuda:botserv help kick FLOOD
  .Repetição
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] REPEAT ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] REPEAT OFF
  ..-
  ..Limite de Linhas:botserv kick %canalbs. [ $+ [ $cid ] ] REPEAT ON 3 $$input(Limite de linahs Ex: 5,129,Requisição)
  ..-
  ..Ajuda:botserv help kick REPEAT
  .Negrito
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] BOLDS ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] BOLDS OFF
  ..-
  ..Ajuda:botserv help kick BOLDS
  .Reverso
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] REVERSES ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] REVERSES OFF
  ..-
  ..Ajuda:botserv help kick REVERSES
  .Sublinhado
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] UNDERLINES ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] UNDERLINES OFF
  ..-
  ..Ajuda:botserv help kick UNDERLINES
  .CAPS LOCK
  ..Ligar:botserv kick %canalbs. [ $+ [ $cid ] ] CAPS ON $input(Depois de quantos kicks é para banir? Ex: 3 [OPCIONAL],129,Requisição) $input(Conferir apenas quando a frase for maior que esse número de letras: [ex.: 10],129,Requisição) $input(Percentagem de caps pra banir. Se TODAS as letras forem maisúculas $+ $chr(44) será 100 e assim por diante. [ex.: 98],129,Requisição)
  ..Desligar:botserv kick %canalbs. [ $+ [ $cid ] ] CAPS OFF
  ..-
  ..Ajuda:botserv help kick CAPS
  -
  $iif(%canalbs. [ $+ [ $cid ] ],Palavrões)
  .Listar:botserv badwords %canalbs. [ $+ [ $cid ] ] list
  .-
  .Adicionar:botserv badwords %canalbs. [ $+ [ $cid ] ] add $$input(Palavrão para adiciona à lista: [ex: filho da puta],129,Requisição) $input(Digite o formato: SINGLE $+ $chr(44) START ou END. $+ $crlf $crlf $+ SINGLE: kicka se a palavra completa for escrita em qualquer parte da frase. $+ $crlf $+ START: a palavra deve estar no começo da frase. $+ $crlf $+ END: a palavra deve estar no fim da frase. $+ $crlf $crlf $+ Deixe esse campo em branco se conter wildcards[* ou ?])
  .Remover:botserv badwords %canalbs. [ $+ [ $cid ] ] del $input(Digite a palavra para remover da lista: [ex: filho da puta],129,Requisição)
  .Remover todos:botserv badwords %canalbs. [ $+ [ $cid ] ] clear
  .-
  .Ajuda:botserv HELP KICK BADWORDS
  -
  $iif(%canalbs. [ $+ [ $cid ] ],Avançado)
  .Comprar um Bot:echo $colour(notice) -at -BotServ- Para compra de BotServ, favor entrar no canal #Ajuda da sua Rede e se informar como adquirí-lo.
  .-
  .Info do Bot:botserv info $$input(Nick do bot ou #canal onde está o bot,129,Requisição)
  .Stats
  ..Ligar:botserv %canalbs. [ $+ [ $cid ] ] STATS on
  ..Desligar:botserv %canalbs. [ $+ [ $cid ] ] STATS off
  ..-
  ..Ajuda:botserv help stats
  .-
  .Say (/say):botserv say %canalbs. [ $+ [ $cid ] ] $$input(Texto:,129,Requisição)
  .Action (/me):botserv act %canalbs. [ $+ [ $cid ] ] $$input(Texto:,129,Requisição)
  .Desassociar Bot:botserv UNASSIGN %canalbs. [ $+ [ $cid ] ]
  $iif($server,Ajuda)
  .Ajuda:botserv help
  .Específico ?:botserv help $$input(Em qual comando você tem dúvida? [ex: assign],129,Requisição)
  -
  Fechar:unset %canalbs. [ $+ [ $cid ] ] | window -c $active
}
