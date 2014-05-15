;------------------------------------------------------------
; ALIVE 5 by Hafuk
; http://github.com/marlosirapuan/alivescript5/
;
; Aliases
;------------------------------------------------------------

/op /mode # +ooo $$1 $2 $3
/dop /mode # -ooo $$1 $2 $3
/j checkserver | /join #$$1 $2-
/p /part #
/n /names #$$1
/w /whois $$1
/q /query $$1
/send /dcc send $1 $2
/chat /dcc chat $1
/s /server $$1-
/join {
  checkserver 
  if ($$1) set %timetojoin. [ $+ [ $cid ] $+ ] . [ $+ [ $$1 ] ] $ticks
  /!join #$$1 $2-
}
/massmode {
  ;$1 = canal
  ;$2 = modo

  if (!$1) || (!$2) { return }

  var %i = 1, %o = 1 

  :volta

  var %nicks = $snick($1,%i), %count^ = $count(%add,$chr(32))
  if (%nicks == $null) { raw -q mode $1 $2 $+ $str($right($2,1),%count^) %add | halt }

  var %add = %add %nicks
  if ($count(%add,$chr(32)) == 5) { raw -q mode $1 $2 $+ $str($right($2,1),$ifmatch) %add | unset %add }

  inc %i 1 
  inc %o 1 

  goto volta
}

/query {
  var %n,%g
  if ($1 == -n) {
    %n = -n
    tokenize 32 $2-
  }
  if ($window($1,1).type != query) {

    ;if $1 == ChanServ { cs | halt }
    ;else if $1 == MemoServ { ms | halt }
    ;else if $1 == NickServ { ns | halt }

    !query %n $1

    if ($window($1,1).type == query) {
      infoquery $1 
      if ($2- != $null) { msg $1- }
    }
  }
  else { window -a $1 }
}

dme return $`encript($me)

;; Fullname colorido
/nome if ($1) { fullname $1- } | else { else username }
/fullname {
  set %ALIVE $iif($1-, $1-, $decode(AzE1d3d3AzE0LgIDMUECAzJMSVZFAzE1c2NyaXB0Lm5ldA8=,m))
  echo $color(info) -s * Fullname: $iif($1-, $1-, $decode(AzE1d3d3AzE0LgIDMUECAzJMSVZFAzE1c2NyaXB0Lm5ldA8=,m))
  .username % $+ ALIVE
}

;------------------------------------------------------------
; NickServ ChanServ MemoServ Window
;------------------------------------------------------------

ns {
  if ($1 != $null) && ($1 != open) { nickserv $1- | halt }

  var %win = $+(@NickServ,/,$network,$chr(160),( $+ $cid $+ ))
  if (!$window(%win)) {
    window -Cekg1 $+ $iif($1,n) %win Arial 12
    titlebar %win - Clique com o botão direito para as opções
    echo $colour(notice) %win 2Clique com o botão direito do seu mouse dentro dessa janela para as opções do NickServ
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) -t %win -NickServ- Você pode digitar os comandos direto dessa janela se quiser, mas não use /nickserv ou /msg nickserv antes. Use, por exemplo: set email seu-email (direto do comando)
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) %win $chr(160)
  }
}
nickserv { 
  checkserver

  if ($network == Rizon) /!msg NickServ $1-
  else !nickserv $1-

  var %win = $+(@NickServ,/,$network,$chr(160),( $+ $cid $+ ))
  if ($window(%win)) {
    if ($1 == identify) { echo $colour(own) -t %win < $+ $me $+ > $1 $str(*,$len($2)) $3- | halt }
    else if ($1 == ghost) { echo $colour(own) -t %win < $+ $me $+ > $1 $2 $str(*,$len($3)) $4- | halt }
    else if ($1 == recover) { echo $colour(own) -t %win < $+ $me $+ > $1 $2 $str(*,$len($3)) $4- | halt }
    else if ($1 == release) { echo $colour(own) -t %win < $+ $me $+ > $1 $2 $str(*,$len($3)) $4- | halt }
    else if ($1 == set) && ($2 == password) { echo $colour(own) %win < $+ $me $+ > $1 $2 $str(*,$len($3)) $4- | halt }
    else { echo $colour(own) -t %win < $+ $me $+ > $1- }
  }
}


cs {
  if ($1 != $null) && ($1 != open) { chanserv $1- | halt }

  var %win = $+(@ChanServ,/,$network,$chr(160),( $+ $cid $+ ))
  if (!$window(%win)) {
    window -Cekg1 $+ $iif($1,n) %win Arial 12
    titlebar %win - Clique com o botão direito para as opções
    echo $colour(notice) %win 2Clique com o botão direito do seu mouse dentro dessa janela para as opções do ChanServ
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) -t %win -ChanServ- Você pode digitar os comandos direto dessa janela se quiser, mas não use /chanserv ou /msg chanserv antes. Use, por exemplo: access #canal add nick 10 (direto do comando)
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) %win $chr(160)
  }
}
chanserv {
  checkserver

  if ($network == Rizon) /!msg ChanServ $1-
  else !chanserv $1-

  var %win = $+(@ChanServ,/,$network,$chr(160),( $+ $cid $+ ))
  if ($window(%win)) { 
    if ($1 == register) { echo $colour(own) %win < $+ $me $+ > $1 $2 $str(*,$len($3)) $4- | halt }
    else if ($1 == set) && ($3 == password) { echo $colour(own) -t %win < $+ $me $+ > $1 $2 $3 $str(*,$len($4-)) | halt }
    else if ($1 == identify) { echo $colour(own) -t %win < $+ $me $+ > $1 $2 $str(*,$len($3)) | halt }
    else { echo $colour(own) -t %win < $+ $me $+ > $1- }
  }
}

ms {
  if ($1 != $null) && ($1 != open) { memoserv $1- | halt }

  var %win = $+(@MemoServ,/,$network,$chr(160),( $+ $cid $+ ))
  if (!$window(%win)) {
    window -Cekg1 $+ $iif($1,n) %win Arial 12
    titlebar %win - Clique com o botão direito para as opções
    echo $colour(notice) %win 2Clique com o botão direito do seu mouse dentro dessa janela para as opções do MemoServ
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) -t %win -MemoServ- Você pode digitar os comandos direto dessa janela se quiser, mas não use /memoserv ou /msg memoserv antes. Use, por exemplo: send nick mensagem (direto do comando)
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) %win $chr(160)
  }
}
memoserv {
  checkserver

  if ($network == Rizon) /!msg MemoServ $1-
  else !memoserv $1-

  var %win = $+(@MemoServ,/,$network,$chr(160),( $+ $cid $+ ))
  if ($window(%win)) { 
    echo $colour(own) -t %win < $+ $me $+ > $1-
  }
}

bs {
  if ($1 != $null) && ($1 != open) { botserv $1- | halt }

  var %win = $+(@BotServ,/,$network,$chr(160),( $+ $cid $+ ))
  if (!$window(%win)) {
    window -Cekg1 $+ $iif($1,n) %win Arial 12
    titlebar %win - Clique com o botão direito para as opções
    echo $colour(notice) %win 2Clique com o botão direito do seu mouse dentro dessa janela para as opções do BotServ
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) -t %win -BotServ- Você pode digitar os comandos direto dessa janela se quiser, mas não use /botserv ou /msg botserv antes. Use, por exemplo: assign #canal nick-bot (direto do comando)
    echo $colour(notice) %win $chr(160)
    echo $colour(notice) %win $chr(160)
  }
}
botserv {
  checkserver

  if ($network == Rizon) /!msg BotServ $1-
  else !botserv $1-

  var %win = $+(@BotServ,/,$network,$chr(160),( $+ $cid $+ ))
  if ($window(%win)) { 
    echo $colour(own) -t %win < $+ $me $+ > $1-
  }
}



;------------------------------------------------------------
; Atalhos Personalizado via config. script
;------------------------------------------------------------

F1 { if (%F1) { .timer 1 0 %F1 } }
F2 { if (%F2) { .timer 1 0 %F2 } }
F3 { if (%F3) { .timer 1 0 %F3 } }
F4 { if (%F4) { .timer 1 0 %F4 } }
F5 { if (%F5) { .timer 1 0 %F5 } }
F6 { if (%F6) { .timer 1 0 %F6 } }
F7 { if (%F7) { .timer 1 0 %F7 } }
F8 { if (%F8) { .timer 1 0 %F8 } }
F9 { if (%F9) { .timer 1 0 %F9 } }
F10 { if (%F10) { .timer 1 0 %F10 } }
F11 { if (%F11) { .timer 1 0 %F11 } }
F12 { if (%F12) { .timer 1 0 %F12 } }
sF1 { if (%sF1) { .timer 1 0 %sF1 } }
sF2 { if (%sF2) { .timer 1 0 %sF2 } }
sF3 { if (%sF3) { .timer 1 0 %sF3 } }
sF4 { if (%sF4) { .timer 1 0 %sF4 } }
sF5 { if (%sF5) { .timer 1 0 %sF5 } }
sF6 { if (%sF6) { .timer 1 0 %sF6 } }
sF7 { if (%sF7) { .timer 1 0 %sF7 } }
sF8 { if (%sF8) { .timer 1 0 %sF8 } }
sF9 { if (%sF9) { .timer 1 0 %sF9 } }
sF10 { if (%sF10) { .timer 1 0 %sF10 } }
sF11 { if (%sF11) { .timer 1 0 %sF11 } }
sF12 { if (%sF12) { .timer 1 0 %sF12 } }
cF1 { if (%cF1) { .timer 1 0 %cF1 } }
cF2 { if (%cF2) { .timer 1 0 %cF2 } }
cF3 { if (%cF3) { .timer 1 0 %cF3 } }
cF4 { if (%cF4) { .timer 1 0 %cF4 } }
cF5 { if (%cF5) { .timer 1 0 %cF5 } }
cF6 { if (%cF6) { .timer 1 0 %cF6 } }
cF6 { if (%cF6) { .timer 1 0 %cF6 } }
cF7 { if (%cF7) { .timer 1 0 %cF7 } }
cF8 { if (%cF8) { .timer 1 0 %cF8 } }
cF9 { if (%cF9) { .timer 1 0 %cF9 } }
cF10 { if (%cF10) { .timer 1 0 %cF10 } }

setup __opendialog configuracao

;------------------------------------------------------------
; Aliases: DLL MDX e DCX
;------------------------------------------------------------
__mdx {
  var %m = $dll($scriptdirdlls\mdx.dll,$1,$2-)
  if (ERROR * iswmcs %m) { fecho -a MDX warning %m }
}
__mdxfile { return $+($scriptdirdlls\,$1,.mdx) }

__dcx {
  if ($isid) return $dll($scriptdirdlls\dcx.dll,$1,$2-)
  else dll "scripts\dlls\dcx.dll" $1 $2-
}

;------------------------------------------------------------
; Aliases: DIALOG
;------------------------------------------------------------
__opendialog {
  if (!$dialog($1)) {
    ;;noop $dialog($1, $1, -4)
    dialog -m $1 $1
  }
}

;------------------------------------------------------------
; Inicializar
;------------------------------------------------------------
__start {
  ;; Carrega icone..
  __dcx WindowProps $window(-2).hwnd +i 0 $scriptdir $+ \img\alive.ico

  fecho Script inicializado

  __checkvar

  ; Remove variaveis temporarias
  __unset
  __removefiles

  inc %inc.updt
  if (%inc.updt >= 4) { checkdata | unset %inc.updt }

  .timermytitlebar -io 0 1 mytitlebar

  ;; Fullname colorido
  if (!%ALIVE) set %ALIVE $decode(AzE1d3d3AzE0LgIDMUECAzJMSVZFAzE1c2NyaXB0Lm5ldA8=,m)
  if (%pop.info.fullname) { .username % $+ ALIVE }

  ;; Recebe cor users em away
  ;var %c = 1 
  ;while (%c <= $cnick(0)) {
  ;  if ($cnick(%c).levels == AWAY) set %color.away $cnick(%c).color
  ;  %c = %c + 1
  ;}

  set %quit %alivescript $+($chr(3),12,,%pop.site,) 14 $read(docs\alive.txt)

  if ($gettok(%statusbar,1,32) == 1) statusbar on
  window -a "Status Window"

  /.remote on
  /.raw on

}
__checkvar {
  if (!%logo) set %logo 15(14ALIVE15):01
  if (!%banmask) set %banmask 8: nick!*user@*.host

  if (!%alivescript) set %alivescript 14.1A2LIVE15script
  if (!%logo) set %logo 14.1A2LIVE1:01
  if (!%site) set %site 15www14.1A2LIVE15script.net

  if ($gettok(%autocor.cnormal,0,32) != 6) set %autocor.cnormal 1616 XXXX XXXX XXXX XXXX XXXX
  if ($gettok(%pop.autocor.count.inc,0,32) < 2) set %pop.autocor.count.inc $+(0,$chr(127),14(15#<contar>14))
  if ($gettok(%autocor.noname,0,32) != 2) set %autocor.noname 1616 1616
  if ($gettok(%autocor.space,0,32) != 2) set %autocor.space 1602 1216
  if ($gettok(%autocor.that,0,32) != 2) set %autocor.space 1402 1516
  if ($gettok(%autocor.weak,0,32) < 3) set %autocor.weak 1401 1501 0001

}

__removefiles {
  if ($exists(preview.bmp)) .remove preview.bmp
}
__unset {
  unset %selecionado
  unset %pop.connected.*
  unset %mensagemquit.*
  unset %pop.identified.*
  unset %active %getdiraliases %getdiraliases_temp %pop.win.aliase %pop.file.aliase

  unset %w %whois.usr.* %clones %whois.usr.away %recebewhois* %notfound
  unset %nc.nick %nc.nickadd %nc.nick3

  unset %flood.* %timetojoin.*
  unset %mc. [ $+ [ $cid ] ] 
  unset %mcl. [ $+ [ $cid ] ]

  unset %join.* %away.* %aw.* %ping.* %reply.* %canal.* %canalbs.* %away.resp.* %mycolors

}

;------------------------------------------------------------
; Away
;------------------------------------------------------------

mytitlebar {
  .scid $cid
  .scon -a titlebar $d0608 $replace(%mytitle,$chr(124),$chr(166),<idle>,$`duration($idle),<away>,$iif($away,sim,nao),<data>,$date, $&
    <dia>,$__dia,<uptime>,$`duration($uptime(system,3)),<anime>,$myanime(1),<online>,$`duration($online),<mp3>,$iif($insong.fname,$insong.fname,<nenhum som>), $& 
    <mode>, $usermode, <server>, $server, <network>, $network, <status>, $status,<lag>,$iif(%s. [ $+ [ $cid ] $+ ] .lag,%s. [ $+ [ $cid ] $+ ] .lag s,0s))

  .scon -at1 checkidleaway
}

checkidleaway {

  ;; Anti idle
  if (!%pop.general.aidle.time) set %pop.general.aidle.time 15
  if (%pop.general.aidle) && ($idle >= %pop.general.aidle.time) {
    .scon -at1 .resetidle 
    resetidle_all
  }

  ;; Idle away
  if (%pop.away.idle) {
    if (($idle > $calc(%pop.away.idletime * 60)) && (!$away) && (!%aw. [ $+ [ $cid ] ])) { 
      set %aw. [ $+ [ $cid ] ] 1
      away Inativo por mais de %pop.away.idletime minutos 
    }
  }
}
resetidle_all {
  var %i = $scon(0)
  while (%i) {
    .scid $scon(%i)
    if ($status == connected) { .raw -q PRIVMSG $me :AIDLE }
    dec %i
  }
}

myanime {
  if (!$1) return

  if (!%mytitle.anime) { set %mytitle.anime 1 | return \ }
  if (%mytitle.anime == 1) { set %mytitle.anime 2 | return $chr(166) }
  if (%mytitle.anime == 2) { set %mytitle.anime 3 | return / }
  if (%mytitle.anime == 3) { set %mytitle.anime 4 | return - }
  if (%mytitle.anime == 4) { set %mytitle.anime 5 | return \ }
  if (%mytitle.anime == 5) { set %mytitle.anime 6 | return $chr(166) }
  if (%mytitle.anime == 6) { set %mytitle.anime 7 | return / }
  if (%mytitle.anime == 7) { unset %mytitle.anime | return - }

}
;------------------------------------------------------------
; Away
;------------------------------------------------------------

away {
  checkserver

  if ($away) { back $1- | halt }

  if ($1) { .raw away : $+ $autocor($1-) }
  else { .raw away : $+ Ausente }

  ;; Manter away
  ;; if (%pop.away.stay) {

  set %away. [ $+ [ $cid ] $+ ] .reason $iif($1,$1-,Ausente)
  if ($readini(configs\netw\ $+ $network $+ .ini,$me,nickname_away)) { 
    set %away. [ $+ [ $cid ] $+ ] .nickaway $ifmatch 
    set %away. [ $+ [ $cid ] $+ ] .oldnick $me
  }

  if (%pop.away.delay == $null) set %pop.away.delay 5
  if (%pop.away.delay < 5) set %pop.away.delay 5
  if (%pop.away.warning == $null) set %pop.away.warning time

  set %away. [ $+ [ $cid ] $+ ] .since $time(HH:nn)

  if (%pop.away.warning == time) {
    var %reason = $1-
    .timeraway. [ $+ [ $cid ] ] 0 $calc(%pop.away.delay * 60) showmsg_away $replace(%pop.away.msgaway,<motivo>,$autocor($1-) $+ ,<desde>,%away. [ $+ [ $cid ] $+ ] .since,<page>,$iif(%pop.away.page,on,off),<script>,%alivescript,<campo1>,%pop.away.campo1,<campo2>,%pop.away.campo2,<campo3>,%pop.away.campo3)
    showmsg_away $replace(%pop.away.msgaway,<motivo>,$autocor($1-) $+ ,<desde>,%away. [ $+ [ $cid ] $+ ] .since,<page>,$iif(%pop.away.page,on,off),<script>,%alivescript,<campo1>,%pop.away.campo1,<campo2>,%pop.away.campo2,<campo3>,%pop.away.campo3)
  }

  ;; Muda de nick
  if (%away. [ $+ [ $cid ] $+ ] .nickaway) nick %away. [ $+ [ $cid ] $+ ] .nickaway

}
back {
  checkserver

  if (!$away) { fecho -a Você não está away | halt }

  ;; Pega tempo em away
  set %away.tempo. [ $+ [ $cid ] ] $awaytime

  .raw away

  if (!%away. [ $+ [ $cid ] $+ ] .nickaway) { 
    var %dur = $`duration(%away.tempo. [ $+ [ $cid ] ])
    var %re  = $autocor($1-) $+ 
    showmsg_away $replace(%pop.away.msgback,<motivovolta>,%re,<desde>,%away. [ $+ [ $cid ] $+ ] .since,<page>,$iif(%pop.away.page,on,off),<tempo>,%dur,<script>,%alivescript,<campo1>,%pop.away.campo1,<campo2>,%pop.away.campo2,<campo3>,%pop.away.campo3)

    unset %away. [ $+ [ $cid ] $+ ] .since
    unset %away.tempo. [ $+ [ $cid ] $+ ]

    unset %away.msgback. [ $+ [ $cid ] ]
    unset %away.true. [ $+ [ $cid ] ]
    unset %away.tempo. [ $+ [ $cid ] ]
    unset %away. [ $+ [ $cid ] $+ ] .since

    unset %away. [ $+ [ $cid ] $+ ] .nickaway
    unset %away. [ $+ [ $cid ] $+ ] .oldnick
  }
  else { 
    if ($1) { set %away.msgback. [ $+ [ $cid ] ] $1- }
    set %away.true. [ $+ [ $cid ] ] 1 
    nick %away. [ $+ [ $cid ] $+ ] .oldnick 
  }

  if ($timer(away. [ $+ [ $cid ] ])) { .timeraway. [ $+ [ $cid ] ] off }

  ;; limpa
  unset %away. [ $+ [ $cid ] $+ ] .reason

}

showmsg_away {

  ;; todos os canais
  if (%pop.away.sendallchan) { 

    if (%pop.away.nomsgtochan) {
      var %o = 1
      while ($chan(%o)) {
        if (!$findtok(%pop.away.listchannomsg,$chan(%o),1,44)) { describe $chan(%o) $1- }
        %o = %o + 1
      }
    }
    else {
      ame $1- 
    }
  }

  ;; aviso apenas no canal ativo
  else if (%pop.away.onlychanactive) && ($active ischan) { describe $active $1- }

  ;; outros
  else {
    ame $1-
  }

  ;; mensagem para todos os pvts abertos
  if (%pop.away.sendallpvt) {
    var %q = 1
    while ($query(%q)) {
      describe $query(%q) $1-
      %q = %q + 1  
    }
  }
}

;------------------------------------------------------------
; Checa servidor
;------------------------------------------------------------
checkserver {
  if ($status != connected) { 
    if ($1-) fecho -ai2 $+(&cc2, $1-,&cc1,:) Não conectado ao servidor. Digite /server %default.server para conectar
    else fecho -ai2 Nao conectado ao servidor. Digite /server %default.server para conectar 

    halt
  }
}

;------------------------------------------------------------
; Comandos
;------------------------------------------------------------

server {
  if ($left($1,1) == -) { var %serverparms = $1 | tokenize 32 $2- }
  if (: isin $1) { var %serverport = $gettok($1,2,58) | tokenize 32 $gettok($1,1,58) $2- }

  tokenize 32 $__serversbasic($1) $2-
  if (!$server) || (%serverparms) { !server %serverparms $1 %serverport $2- }
  else {
    var %servernew = $input(Abrir nova janela ?,176,Novo servidor)
    if (%servernew == $yes) { !server -m $1 %serverport $2- }
    elseif (%servernew == $no) {

      if ($1 == $server) || ($gettok($1, 2, 46) = $gettok($server, 1, 46)) || (!$1) { raw -q quit :02Reconectando: 1[10 $+ $server $+ 1] }
      else { raw -q quit :02Trocando de servidor: 1[10 $+ $server $+ 1] 02-> 1[04 $+ $gettok($1,1,58) $+ 1] }

      !server $1 %serverport $2-
    }
  }
}
__serversbasic {
  if (!$1) return

  if ($1 == virtualife) return irc.virtualife.com.br
  if ($1 == quakenet) return irc.quakenet.org
  if ($1 == dalnet) return irc.dal.net
  if ($1 == undernet) return irc.undernet.org
  if ($1 == alivescript) || ($1 == alive) return irc.alivescript.net

  return $iif((. isin $1) || ($1 == localhost),$1,$+(irc.,$1,.com.br))
}


;; Findnick
`findnick {
  if ($2 ison $1) { return $2 | halt }
  if ($nick($1,0)) {
    var %i = 1
    while ($nick($1,%i)) {
      var %nick = $nick($1,%i)
      if ($2 isin %nick) { return %nick | halt }
      inc %i 1
    }
    if ($2 !isin %nick) { fecho -a Não existe esse nick:&cc2 $2 | halt }
  }
  else { return }
}

`fn {
  unset %nc.chan %nc.nickadd
  if $2 ison $1 { return $2 | halt }
  if ($nick($1,0)) {
    var %i = 1
    while ($nick($1,%i)) {
      var %nc.nick = $nick($1,%i)
      if ($2 isin %nc.nick) { %nc.nickadd = %nc.nickadd %nc.nick }
      inc %i 1
    }
    if ($2 !isin %nc.nickadd && $3 != nc) { fecho -a Não existe esse nick:&cc2 $2 | halt }
    else if ($gettok(%nc.nickadd,0,32) > 1) { set %nc.chan $chan | set %nc.nick3 $2 | __chooseNC return NICK2$$ | halt }
    else if ($gettok(%nc.nickadd,0,32) == 1) { return %nc.nickadd }

    else {
      msg $chan $autocor(%nc.msg)
      unset %nc.msg 
      halt 
    }
  }
  else { return }
}

;; Contador de kicks, kills
countkick {
  if ($1) { return  1# $+ $fillrep($base($r(10,16),10,10,5)) $+  }
  else {
    inc %count.kick
    return  1# $+ $fillrep($base(%count.kick,10,10,5)) $+ 
  }
}
fillrep {
  var %number = $1 
  if ($len($1) == 1) { return $+(,$1,) }
  else if ($len($1) >= 2) { return $mid($1,1,$calc($len($1) - 1)) $+  $+ $right($1,1) $+  }
}

;; Kill
kill { 
  checkserver

  if (!$1) { fecho -a Use &cc2/kill nick [motivo] | return }

  var %msgkill = $replace(%myedit.kill,<logo>,%logo,<motivo>,$iif(!$2,$read(docs\kicks.txt),$2-),<contador>,$countkick,<nick>,$$1)
  kill $$1 %msgkill
}

;; Kick nervoso
k {
  checkserver

  if (!$1) { fecho -a Use &cc2/k nick&cc1 ou &cc2/k nick motivo | return }

  if ($left($1,1) != $chr(35)) {
    if ($me !isop $active) { fecho -a &cc3/k: &cc1Você não é operador do&cc2 $active | return }

    if ($2 == $null) { var %reason = $read(docs\kicks.txt) }
    else { var %reason = $2- }

    var %nick = $`findnick(#,$1)
    if ($protect(%nick)) && ($istok($protect(%nick).type,#,44)) { 
      if ($$input('' $+ %nick $+ '' está na sua lista de protegidos (protect list) nos canais: $protect(%nick).type ! $crlf $crlf $+ Quer mesmo assim kickar ele?,$calc(128+8),Confirmação) == $false) { halt } 
    }

    var %msgkick = $replace(%myedit.kick,<logo>,%logo,<motivo>,%reason,<contador>,$countkick,<nick>,%nick)
    raw -q kick # $`findnick(#,$1) : $+ %msgkick
  }
  else {
    if ($2 == $null) { fecho -a Use &cc2/k nick [motivo] &cc1dentro de um canal ou &cc2/k #canal nick [motivo] | return }

    var %chan = $1, %nick = $`findnick(%chan,$remove($2,*!*,<,>,@,+))

    if ($3 == $null) { var %reason = $read(docs\kicks.txt) }
    else { var %reason = $3- }

    if ($protect(%nick)) && ($istok($protect(%nick).type,%chan,44)) { 
      if ($$input('' $+ %nick $+ '' está na sua lista de protegidos (protect list) nos canais: $protect(%nick).type ! $crlf $crlf $+ Quer mesmo assim kickar ele?,$calc(128+8),Confirmação) == $false) { halt } 
    }

    var %msgkick = $replace(%myedit.kick,<logo>,%logo,<motivo>,%reason,<contador>,$countkick,<nick>,%nick)
    raw -q kick %chan %nick : $+ %msgkick
  }
  unset %reason
}

kb {
  checkserver

  if (!$1) { fecho -a Use &cc2/k nick&cc1 ou &cc2/k nick motivo | return }

  if ($left($1,1) != $chr(35)) {
    if ($2 == $null) { var %reason = $read(docs\kicks.txt) }
    else { var %reason = $2- }

    var %nick = $`findnick(#,$1)
    if ($protect(%nick)) && ($istok($protect(%nick).type,#,44)) { 
      if ($$input('' $+ %nick $+ '' está na sua lista de protegidos (protect list) nos canais: $protect(%nick).type ! $crlf $crlf $+ Quer mesmo assim kickar ele?,$calc(128+8),Confirmação) == $false) { halt } 
    }

    var %msgkick = $replace(%myedit.kick,<logo>,%logo,<motivo>,%reason,<contador>,$countkick,<nick>,%nick) %myedit.banned

    raw -q kick # $`findnick(#,$1) : $+ %msgkick
    raw -q mode # +b $address(%nick,$gettok(%banmask,1,58))
    .ignore -u2 %nick
  }
  else {
    if ($2 == $null) { fecho -a Use &cc2/k nick [motivo] &cc1dentro de um canal ou &cc2/k #canal nick [motivo] | return }

    var %chan = $1, %nick = $`findnick(%chan,$remove($2,*!*,<,>,@,+))

    if ($3 == $null) { var %reason = $read(docs\kicks.txt) }
    else { var %reason = $3- }

    if ($protect(%nick)) && ($istok($protect(%nick).type,%chan,44)) { 
      if ($$input('' $+ %nick $+ '' está na sua lista de protegidos (protect list) nos canais: $protect(%nick).type ! $crlf $crlf $+ Quer mesmo assim kickar ele?,$calc(128+8),Confirmação) == $false) { halt } 
    }

    var %msgkick = $replace(%myedit.kick,<logo>,%logo,<motivo>,%reason,<contador>,$countkick,<nick>,%nick) %myedit.banned
    raw -q kick %chan %nick : $+ %msgkick
    raw -q mode $1 +b $address(%nick,$gettok(%banmask,1,58))
    .ignore -u2 %nick
  }
  unset %reason
}

kbt { 
  checkserver

  if (!$1) { tokenize 32 $$input(Nick:,129,Requisição) }

  var %nick = $`findnick(#,$1), %msg = $2-, %i = 1 
  while ($chan(%i)) {
    if ($me isop $chan(%i) || $me ishop $chan(%i)) {

      var %reason = $iif(%msg,%msg,$read(docs\kicks.txt))
      var %msgkick = $replace(%myedit.kick,<logo>,%logo,<motivo>,%reason,<contador>,$countkick,<nick>,%nick) %myedit.banned

      if (%nick isop $chan(%i)) { mode $chan(%i) -o %nick }
      if (%nick ison $chan(%i)) { raw -q kick $chan(%i) %nick : $+ %msgkick }

      raw -q mode $chan(%i) +b $address(%nick,$gettok(%banmask,1,58))
    }
    inc %i
  }
}


ame {
  if (!$1) { fecho -s &cc3Erro: &cc1Use /ame <mensagem> | return }

  if ($isid) { halt }
  if (($status != connected) && ($active == Status Window)) { fecho $color(actio) * $me $1- }
  else if ($status == connected) { 
    var %a = 1 
    while ($chan(%a)) { 
      if (m isincs $chan($chan(%a)).mode && $me !isop $chan(%a) && $me !isvo $chan(%a)) && ($1) { }
      else {

        if (C isincs $chan($chan(%a)).mode && $me !isop $chan(%a) && $me !isvo $chan(%a)) && (%join. [ $+ [ $+($cid,.,$chan(%a)) ] ]) { msg $chan(%a) $strip($1-) }
        else if (c isincs $chan($chan(%a)).mode && $me !isop $chan(%a) && $me !isvo $chan(%a))  && (%join. [ $+ [ $+($cid,.,$chan(%a)) ] ]) { describe $chan(%a) $strip($1-,c) }
        else {
          if (%join. [ $+ [ $+($cid,.,$chan(%a)) ] ]) { describe $chan(%a) $1- }
        }

      }

      inc %a 
    } 
  }
  else if ($active == Status Window) { fecho $color(actio) * $me $1- }
}

amsg {
  if (!$1) { fecho -s &cc3Erro: &cc1Use /amsg <mensagem> | return }

  if ($isid) { halt }
  if (($status != connected) && ($active == Status Window)) { fecho $color(normal) $1- }
  else if ($status == connected) { 
    var %a = 1 
    while ($chan(%a)) { 
      if (m isincs $chan($chan(%a)).mode && $me !isop $chan(%a) && $me !isvo $chan(%a)) && ($1) { }
      else {

        if (C isincs $chan($chan(%a)).mode && $me !isop $chan(%a) && $me !isvo $chan(%a)) && (%join. [ $+ [ $+($cid,.,$chan(%a)) ] ]) { msg $chan(%a) $strip($1-) }
        else if (c isincs $chan($chan(%a)).mode && $me !isop $chan(%a) && $me !isvo $chan(%a)) && (%join. [ $+ [ $+($cid,.,$chan(%a)) ] ]) { msg $chan(%a) $strip($1-,c) }
        else {
          if (%join. [ $+ [ $+($cid,.,$chan(%a)) ] ]) { msg $chan(%a) $1- }
        }

      }

      inc %a 
    } 
  }
  else if ($active == Status Window) { fecho $color(normal) $1- }
}


fecho {
  if (!$1) return

  echo $replace($1-,&ccb,,&ccu,,&cco,,&cc1,01,&cc2,05,&cc3,02,&cc4,14)
}

nick {
  if (!$1) { !nick $__stripnick($$input(Novo nick:,129,Requisição)) }
  else !nick $__stripnick($$1)

  set %pop.list.recent.nicks $__addrecent(%pop.list.recent.nicks,$__stripnick($$1))
}
__stripnick return $strip($remove($replace($1-,$chr(32),_,ç,c,~,_,.,_,$ch(44),_),´,/,$,%,&¨,@,!,$chr(35),¨,$chr(40),$chr(41),',;,:,ã,ô,ê,î,á,à,é,è,í,ì,ú,ù,<,>))


quit {
  if ($1-) {
    %mensagemquit. [ $+ [ $cid ] ] = %logo $iif(%pop.general.colorquit, $autocor($1-), $1-)
    !quit %mensagemquit. [ $+ [ $cid ] ] $+ 
  }
}

msgallwindow {
  if ($2-) {
    ; Status Window
    ; echo $1 -st $2-

    ; Canais
    var %c = 1
    while ($chan(%c)) {
      echo $1 -t $chan(%c) $2-
      %c = %c + 1
    }

    ; Pvts
    var %c = 1
    while ($query(%c)) {
      echo $1 -t $query(%c) $2-
      %c = %c + 1
    }

  }
}

;; Nicks, canais e servers recentes..

__recent return $gettok(%pop.list.recent. [ $+ [ $1 ] ] , $2,127)
__addrecent {
  var %list = $1 
  set -u2 %t $2

  if (%t == $null) return %list
  if ($istok(%list,%t,127)) { 
    %list = $deltok(%list,$findtok(%list,%t,1,127),127) 
    %list = $instok(%list,%t,1,127) 
    return %list 
  }

  %list = $deltok(%list,6-,127)
  %list = $instok(%list,%t,1,127)

  return %list
}

;; msg
fmsg {
  if ($status == connected) || (= isin $active) {
    if ($active == Status Window) fecho $1-
    if ($active != Status Window) say $1-
  } 
  if ($status != connected) fecho $1-

}

;; IP
sayip if ($ip) { !say $ip } | else { fecho -a Não foi possivel achar seu IP. }

;; Ping
ping {
  checkserver

  if ($1) tokenize 32 $1
  else tokenize 32  $$input(Nick:,129,Requisição)

  if ($1 != $me) {
    ctcp $1 ping
    .set %ping. [ $+ [ $1 ] ] wait
    .set %reply. [ $+ [ $1 ] ] $ticks
  }
  else lag
}

lag {
  checkserver

  set %s. [ $+ [ $cid ] $+ ] .bash yes 
  fecho -a Checando lag, aguardando resposta...
  checarlag 

}

checarlag {
  if ($status == connected) {
    if ($1) .timerchecklag. [ $+ [ $cid ] ] 0 10 /checarlag
    .raw -q ping : $+ $ticks
  }
}

;atalho p/ quando o patrao chegar e você quiser minimizar o script pra que ele não veja
/chefe /showmirc -t

;------------------------------------------------------------
; EOF
;------------------------------------------------------------
