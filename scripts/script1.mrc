;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   05/06/2009
; @data término  
;
; @titulo        EVENTOS
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

on 1:input:#: {

  if (/* !iswm $1) {

    ;; Contador de texto
    inc %mc. $+ $cid | %mcl. [ $+ [ $cid ] ] = $calc(%mcl. [ $+ [ $cid ] ] + $len($strip($1-)))
    inc %mystats.l | %mystats.w = $calc(%mystats.w + $len($strip($1-)))

    ;; Comandos via mensagem
    if ($istok(+v -v +o -o +b -b +k,$1,32)) { 
      if ($me isop $chan) { 
        if ($1 == +k) k $chan $2 $iif($3,$3-,$read(docs\kicks.txt))
        else mode $chan $1 $iif($2,$2-,$me) 
      }
      else if ($netwservices) chanserv $replace($1,+o,op,-o,deop,+v,voice,-v,devoice) # $iif($2,$2-,$me) 
    }

    ;; Cancelar away ao teclar algo
    if (($gettok($readini(mirc.ini,options,n0),9,44) == 1) && ($away)) { back }

    ;; Clipboard

    if ($ctrlenter == $true && $inpaste == $false) { say $1- | halt }
    if ($inpaste == $true) { 

      if ($server != $null) { 
        if ($active == Status Window) { echo $colour(text norm) $1- | halt } 
        else { msg $chan $1- } 
      } 
      else { echo $colour(text norm) $1- } 
      halt 
    }

    ;; @locator @find !nick

    if ((($left($1,1) == !) || ($left($1,1) == @)) && (($mid($1-,2,1) isletter) || ($mid($1-,2,1) isnum))) { say $1- | halt }
    else if ($left($1,1) != /) && ($right($1,1) isin %ativadores) {

      %nc.msg = $1-
      %nc.who = $`fn(#,$left($1,$calc($len($1) - 1)),nc)

      if (%nc.who != $null) {
        say $replace($nickcompletion,$chr(160),$chr(32)) $autocor($2-)
        unset %nc.nickadd %nc.nick 
      }
      else { say $1- }

      unset %nc.who %nc.msg
      halt
    }

    ;; Emoticon..
    msg $chan $autocor($1-)
    halt

  }

}
alias netwservices {
  if ($status == connected) {
    if ($network isin %pop.networks.services) return $true
  }
  else return $false
}

on 1:input:?: {

  if (/* !iswm $1) {

    ;; Contador de texto
    inc %mc. $+ $cid | %mcl. [ $+ [ $cid ] ] = $calc(%mcl. [ $+ [ $cid ] ] + $len($strip($1-)))
    inc %mystats.l | %mystats.w = $calc(%mystats.w + $len($strip($1-)))

    ;; Cancelar away ao teclar algo
    if (($gettok($readini(mirc.ini,options,n0),9,44) == 1) && ($away)) { back }

    ;; Clipboard

    if ($ctrlenter == $true && $inpaste == $false) { say $1- | halt }
    if ($inpaste == $true) { 

      if ($server != $null) { say $1- | halt } 
      else { echo $colour(text norm) $1- } 
      halt 
    }

    ;; @Locator.. @Find.. !nick
    if ((($left($1,1) == !) || ($left($1,1) == @)) && (($mid($1-,2,1) isletter) || ($mid($1-,2,1) isnum))) { say $1- | halt }

    ;; Autocor/Emoticon..
    say $autocor($1-)
    halt
  }
}

on 1:input:=: {

  if (/* !iswm $1) {
    ;; Contador de texto
    inc %mc. $+ $cid | %mcl. [ $+ [ $cid ] ] = $calc(%mcl. [ $+ [ $cid ] ] + $len($strip($1-)))
    inc %mystats.l | %mystats.w = $calc(%mystats.w + $len($strip($1-)))
  }

  ;; Cancelar away ao teclar algo
  if (($gettok($readini(mirc.ini,options,n0),9,44) == 1) && ($away)) { back }

}


on *:text:*:#: {
  if ($me isin $strip($1-)) || ($dme isin $strip($1-)) {
    ;; bug
    if ($me !ison $chan) return

    ;; em away
    if (($away) && ($nick != $network)) {
      if (%away.resp. [ $+ [ $site ] ] >= 1) .timer 1 60 /unset %away.resp. [ $+ [ $site ] ]
      else { 
        inc %away.resp. [ $+ [ $site ] ] 
        if (%pop.away.page) .notice $nick Estou ausente desde %away. [ $+ [ $cid ] $+ ] .since $+ . Para deixar recado, digite: /ctcp $me page <sua mensagem>
        else .notice $nick Estou ausente desde %away. [ $+ [ $cid ] $+ ] .since $+ . Motivo: $awaymsg
      }
    }


    if (%pop.general.nickeditbox) {
      if ($editbox($chan) == $null) { editbox -p $chan $nick $+ ; }
    }

  }
}
on *:action:*:#: {
  if ($me isin $strip($1-)) || ($dme isin $strip($1-)) {
    ;; bug
    if ($me !ison $chan) return

    ;; em away
    if (($away) && ($nick != $network)) {
      if (%away.resp. [ $+ [ $site ] ] >= 1) .timer 1 60 /unset %away.resp. [ $+ [ $site ] ]
      else { 
        inc %away.resp. [ $+ [ $site ] ] 
        if (%pop.away.page) .notice $nick Estou ausente desde %away. [ $+ [ $cid ] $+ ] .since $+ . Para deixar recado, digite: /ctcp $me page <sua mensagem>
        else .notice $nick Estou ausente desde %away. [ $+ [ $cid ] $+ ] .since $+ . Motivo: $awaymsg
      }
    }

    if (%pop.general.nickeditbox) {
      if ($editbox($chan) == $null) { editbox -p $chan $nick $+ ; }
    }
  }
}



;; Nick
on ^*:nick:{

  if ($nick == $me) {

    ;; se trocar de nick, retira a identificado
    if ($newnick != $me) {
      unset %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ]
    }

    ;; aviso do away apenas depois que voltar ao nick antigo
    if (%away. [ $+ [ $cid ] $+ ] .nickaway) && (%away.true. [ $+ [ $cid ] ]) {

      if ($timer(away. [ $+ [ $cid ] ])) { .timeraway. [ $+ [ $cid ] ] off }
      if (%pop.away.warning == time) { 

        var %dur = $`duration(%away.tempo. [ $+ [ $cid ] ])
        var %re  = %away.msgback. [ $+ [ $cid ] ] $+ 
        showmsg_away $replace(%pop.away.msgback,<motivovolta>,%re,<desde>,%away. [ $+ [ $cid ] $+ ] .since,<page>,$iif(%pop.away.page,on,off),<tempo>,%dur,<script>,%alivescript,<campo1>,%pop.away.campo1,<campo2>,%pop.away.campo2,<campo3>,%pop.away.campo3)

      }
      unset %away. [ $+ [ $cid ] $+ ] .since
      unset %away.tempo. [ $+ [ $cid ] $+ ]

      unset %away.msgback. [ $+ [ $cid ] ]
      unset %away.true. [ $+ [ $cid ] ]
      unset %away.tempo. [ $+ [ $cid ] ]
      unset %away. [ $+ [ $cid ] $+ ] .since

      unset %away. [ $+ [ $cid ] $+ ] .nickaway
      unset %away. [ $+ [ $cid ] $+ ] .oldnick
    }
  }


  unset %e
  :P

  inc %e
  if ($comchan($newnick,%e) == $null) { goto end }
  if ($newnick isop $comchan($newnick,%e)) { .timer -m 1 100 onotice_routine $comchan($newnick,%e) $nick nick $newnick }

  goto P
  :end
  unset %e

}

;; Entrou
on *:join:#:if ($nick == $me) { set %join. [ $+ [ $+($cid,.,$chan) ] ] 1 }
on ^*:join:#: {
  if ($nick == $me) {
    ;; who
    !who #

    ;; canais recentes
    set %pop.list.recent.canais $__addrecent(%pop.list.recent.canais,#)

    halt 
  }

  ;; Entrou
  if ($query($nick)) && ($findtok(%pop.info.query,join,1,32)) { echo $color(join) -t $query($nick) * $nick entrou no $chan } 
}

;; Saiu
on ^*:part:#: {
  if ($nick isop $chan) && ($me != $nick) { .timer 1 0 onotice_routine $chan $nick $address }

  if ($query($nick)) && ($findtok(%pop.info.query,part,1,32)) { echo $color(par) -t $query($nick) * $nick saiu do $chan $iif($1-,( $+ $1- $+ )) }
}

;; Kick
on ^*:kick:#: { 
  if (($nick == $me) && ($knick == $me)) { 
    echo $color(kick) -sat * Você se kickou(hahahaha!) do $chan ( $+ $1- $+ )
    hop #
    haltdef 
  }
  ;; Historico
  if ($nick == $me) { .write -il1 configs\hist-kick.txt 1 + 0 0 0 $+($asctime(dd/mm/yy HH:mm:ss),	+ 0 0 0 $chan,	+ 0 0 0 $knick,	+ 0 0 0 $strip($1-)) }

  if ($query($knick)) && ($findtok(%pop.info.query,kick,1,32)) { echo $color(kic) -t $query($knick) * $knick foi kickado do $chan por $nick ( $+ $1- $+ ) }
  if ($knick isop $chan) { .timer 1 0 onotice_routine $chan $knick $remove($address($knick,0),*!) kick $nick }

}

;; Op
on ^*:op:#: { 
  .timer -m 1 100 onotice_routine $chan $opnick $remove($address($opnick,0),*!) op $nick
}

;; Deop
on ^*:deop:#: { 
  .timer -m 1 100 onotice_routine $chan $opnick $remove($address($opnick,0),*!) deop $nick
}

;; Serverop
on ^*:serverop:#: { 
  .timer 1 0 onotice_routine $chan $opnick $remove($address($opnick,0),*!) op $nick
}

;; Serverdeop
on ^*:serverdeop:#: {
  .timer 1 0 onotice_routine $chan $opnick $remove($address($opnick,0),*!) deop $nick
}

;; Voice
;;on ^*:voice:#: {
;;}

;; Devoice
;;on ^*:devoice:#: {
;;}

;; Quit
on ^*:quit: {
  if ($query($nick))  {
    if ($findtok(%pop.info.query,kick,1,32)) { echo $color(qu) -t $query($nick) * $nick desconectou: ( $+ $iif($1-,$1-,$chr(32)) $+ ) }
  }

  var %q = 0
  while ($chan(%q)) {
    inc %q 1
    if ($nick !ison $chan(%q)) { continue }
    else {
      if ($nick isop $chan(%q)) { .timer 1 0 onotice_routine $chan(%q) $nick $address quit $1- }
    }
  }

}

;; Topic
on ^*:topic:#: {
  if ($me isop $chan) { .timer 1 0 onotice_routine $chan }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NOTICES


;; Server notice
;on ^*:snotice:*: {
;  fecho -tsi2 4!01 $+ $nick $+ 4!05 $1-
;  halt
;}

;; NickServ / ChanServ / MemoServ
on ^*:notice:*:?:{
  if (($1 == DCC) && (($2 == SEND) || ($2 == CHAT) || ($2 == FSERVE) || ($2 == FSERV))) { halt }

  var %string = $strip($1-)

  ;; Auto identify
  if ($nick == NickServ) && ((*/msg nickserv identify* iswm %string) || (*/nickserv identify* iswm %string) || (*/ns identify* iswm %string) || (*is a registered nick*auth* iswm %string) || (*/identify* iswm %string)) {
    unset %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ]
    identificar $me $network
  }
  ;; Senha aceita
  if ($nick == NickServ) && (*Senha aceita* iswm %string) {
    set %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ] 1

    if (%pop.chanfav.typeident == identify) joinfavchan $network
  }
  ;; Senha incorreta
  if ($nick == NickServ) && (*Senha incorreta* iswm %string) {
    unset %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ]
  }

  ;;;;;;;;;;; NickServ
  if ($nick == NickServ) { 
    haltdef
    if (%pop.window.nickserv isin -s -a) { echo $colour(notice) $+(%pop.window.NickServ,t) - $+ $nick $+ - $1- }
    else {
      var %winopen = $+(@NickServ,/,$network,$chr(160),( $+ $cid $+ ))
      if ($window(%winopen)) { echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
      else { ns open | echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
    }
  }

  ;;;;;;;;;;;; ChanServ
  if ($nick == ChanServ) { 
    haltdef
    if (%pop.window.chanserv isin -s -a) { echo $colour(notice) $+(%pop.window.chanserv,t) - $+ $nick $+ - $1- }
    else {
      var %winopen = $+(@ChanServ,/,$network,$chr(160),( $+ $cid $+ ))
      if ($window(%winopen)) { echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
      else { cs open | echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
    }
  }

  ;;;;;;;;;;;; MemoServ
  if ($nick == MemoServ) { 
    haltdef
    if (%pop.window.memoserv isin -s -a) { echo $colour(notice) $+(%pop.window.memoserv,t) - $+ $nick $+ - $1- }
    else {
      var %winopen = $+(@MemoServ,/,$network,$chr(160),( $+ $cid $+ ))
      if ($window(%winopen)) { echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
      else { ms open | echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }

      if (*Para ler, digite:* iswm %string) && (!$editbox(%winopen)) { editbox -p %winopen READ }
      if (*Digite /MemoServ READ* iswm %string) && (!$editbox(%winopen)) { editbox -p %winopen READ }

    }
  }

  ;;;;;;;;;;;; BotServ
  if ($nick == BotServ) { 
    haltdef
    if (%pop.window.botserv isin -s -a) { echo $colour(notice) $+(%pop.window.botserv,t) - $+ $nick $+ - $1- }
    else {
      var %winopen = $+(@BotServ,/,$network,$chr(160),( $+ $cid $+ ))
      if ($window(%winopen)) { echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
      else { bs open | echo $colour(notice) -t %winopen - $+ $nick $+ - $1- }
    }
  }



  ;; Onotice
  unset %true
  var %wc = 1 
  while ($comchan($nick,%wc)) {
    if ($comchan($nick,%wc).op && $nick isop $comchan($nick,%wc)) { set %true $true }
    inc %wc 
  }

  if (%true) {
    if ($window(@Onotices  $+ $targetchan $+  ( $+ $network $+ / $+ $cid $+ )) == $null) { window -ankel13S @Onotices  $+ $targetchan $+  ( $+ $network $+ / $+ $cid $+ ) }
    echo $colour(normal t) -t @Onotices  $+ $targetchan $+  ( $+ $network $+ / $+ $cid $+ ) < $+ $nick $+ > $1-
    onotice_routine $targetchan
    unset %true
    halt
  }

}

alias -l targetchan {
  var %onchan = 1
  while ($comchan($nick,%onchan)) {
    if ($nick isop $comchan($nick,%onchan) && $me isop $comchan($nick,%onchan)) { return $comchan($nick,%onchan) }
    inc %onchan
  }
}

;; Onotice
on ^*:notice:*:#:{
  if (($left($target,1) == @) && ($me isop $chan)) && (($nick isop $chan) || (. isin $nick)) {
    if ($window(@Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) ) == $null) { window -ankel13S @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) }
    if (. isin $nick) {

      if (+b isin $strip($1-)) echo $colour(notice) -t @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) - $+ $nick $+ - $gettok($1-,1,32) não pôde entrar no $chan por que está banido
      else if (+i isin $strip($1-)) echo $colour(notice) -t @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) - $+ $nick $+ - $gettok($1-,1,32) não pôde entrar no $chan por que não foi convidado
      else if (+k isin $strip($1-)) echo $colour(notice) -t @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) - $+ $nick $+ - $gettok($1-,1,32) não pôde entrar no $chan por que não digitou a senha correta (" $+ $chan($chan).key $+ ")
      else if (+l isin $strip($1-)) echo $colour(notice) -t @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) - $+ $nick $+ - $gettok($1-,1,32) não pôde entrar no $chan por que o mesmo está com limite de usuários ( $+ $chan($chan).limit users $+ )

      window -g1 @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ )
    }
    else { echo $colour(normal t) -t @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) < $+ $nick $+ > $1- | window -g1 @Onotices  $+ $chan $+  ( $+ $network $+ / $+ $cid $+ ) }

    onotice_routine $chan

    halt
  }
}
on *:input:@Onotices*: { 

  ;; Cancelar away ao teclar algo
  if (($gettok($readini(mirc.ini,options,n0),9,44) == 1) && ($away)) { back }

  ;; Contador de texto
  inc %mc. $+ $cid | %mcl. [ $+ [ $cid ] ] = $calc(%mcl. [ $+ [ $cid ] ] + $len($strip($1-)))
  inc %mystats.l | %mystats.w = $calc(%mystats.w + $len($strip($1-)))

  if (/* !iswm $1) && ($right($1,1) !isin %ativadores) {
    if ($gettok($active,2,160) !ischan) { fecho -a Você não está no&cc2 $gettok($active,2,160) | halt }

    .onotice $gettok($active,2,160) $autocor($1-)
    halt 
  } 

  if ($right($1,1) isin %ativadores) {

    var %a = 0 
    while (%a != $line($active,0,1)) { 
      inc %a 
      if ($left($1,-1) isin $line($active,%a,1)) {
        %nc.who = $line($active,%a,1)
        .onotice $gettok($active,2,160) $replace($nickcompletion,$chr(160),$chr(32)) $autocor($2-)
        halt 
      } 
    }
    .onotice $gettok($active,2,160) $autocor($1-)
    halt
  }
}
alias onotice {
  if ($network == quakenet) { fecho -a Onotices não funcionam na Quakenet. | halt }

  if (!$1) { onoticewindow }
  else {

    if ($1 ischan) { var %chan.onotice = $1 | tokenize 32 $2- }
    else if ($active ischan) { var %chan.onotice = $active | tokenize 32 $1- }

    if ($me !isop %chan.onotice) { fecho -a Você não tem OP nesse canal:&cc2 %chan.onotice | halt }
    if ($nick(%chan.onotice,0,o) == 1) { fecho -a Só tem você de OP no canal&cc2 %chan.onotice $+ &cc1. É necessário ao menos 2 operadores para o Onotice funcionar. | halt }

    .notice @ $+ %chan.onotice $+(%myonotice.left,$iif(%myonotice.showchan,%chan.onotice),%myonotice.right,) $autocor($1-)

    var %ono.text = < $+ $me $+ > $+(%myonotice.left,$iif(%myonotice.showchan,%chan.onotice),%myonotice.right,) $autocor($1-)
    var %ono.window = @Onotices  $+ %chan.onotice $+  ( $+ $network $+ / $+ $cid $+ )

    if (!$window(%ono.window)) { window -akel16S %ono.window }
    if ($active != %ono.window) { window -a %ono.window }

    .timer 1 0 onotice_routine %chan.onotice
    fecho $color(normal t) -t %ono.window %ono.text

  }
}
alias onoticewindow {
  checkserver

  if ($active ischan) && ($me isop #) { 
    .timer 1 0 onotice_routine $active 
    var %windowono = @Onotices  $+ $active $+  ( $+ $network $+ / $+ $cid $+ ) 
    window -akel16S %windowono
  }
  else {
    if ($active !ischan) { fecho -a Use esse comando dentro de um canal. | return }
    if ($me !isop $active) { fecho -a Você não é OP desse canal. | return }
  }
}
alias onotice_routine {

  var %ono.tmpwindow = @Onotices  $+ $1 $+  ( $+ $network $+ / $+ $cid $+ )
  if ($window(%ono.tmpwindow) == $null) { halt }

  var %pop.total = 1
  while ($nick($1,%pop.total,o)) {

    if (!$fline(%ono.tmpwindow,[ @ [ $+ [ $nick($1,%pop.total,o) ] ] ],1,1)) {

      aline -l $nick($1,$nick($1,$nick($1,%pop.total,o))).colour %ono.tmpwindow @ $+ $nick($1,%pop.total,o) 
      if ($2) {
        if ($4 == op) { echo $color(join) -t %ono.tmpwindow * Entrou: $2 ( $+ $3 $+ ) (OP por $iif($5 = $2,Ele mesmo,$5) $+ ) }
        else if ($3 == nick) { 
          if ($2 == $me) { echo $color(nick) -t %ono.tmpwindow * Você mudou o nick para: $4 }
          else { echo $color(nick) -t %ono.tmpwindow * $2 mudou o nick para $4 }
        }
        else if ($4 == quit) { echo $color(quit) -t %ono.tmpwindow * Desconectou: $2 ( $+ $5- $+ ) }
        else if (!$4) || (!$3) { echo $color(jo) -t %ono.tmpwindow * Entrou: $2 ( $+ $3 $+ ) }
      }
    }

    if ($right($line(%ono.tmpwindow,%pop.total,1),-1) !isop $1) || ($right($line(%ono.tmpwindow,%pop.total,1),-1) !ison $1) {
      dline -l %ono.tmpwindow %pop.total 
      if ($2) {
        if ($4 == quit) { echo $color(quit) -t %ono.tmpwindow * Desconectou: $2 ( $+ $5- $+ ) }
        else if ($4 == deop) { echo $color(par) -t %ono.tmpwindow * Saiu: $2 (DeOP por $iif($5 = $2,Ele mesmo,$5) $+ ) }
        else if ($4 == kick) { echo $color(par) -t %ono.tmpwindow * Saiu: $2 (Kickado por $iif($5 = $2,Ele mesmo,$5) $+ ) }
        else if (!$4) || (!$3) { echo $color(par) -t %ono.tmpwindow * Saiu: $2 ( $+ $3 $+ ) }
      }
    }
    inc %pop.total
  }

  var %pop.total.w = 1
  while ($line(%ono.tmpwindow,%pop.total.w,1)) {
    if ($right($line(%ono.tmpwindow,%pop.total.w,1),-1) !ison $1 || $right($line(%ono.tmpwindow,%pop.total.w,1),-1) !isop $1) {
      dline -l %ono.tmpwindow %pop.total.w 
      if ($2) {
        if ($4 == quit) { echo $color(quit) -t %ono.tmpwindow * Desconectou: $2 ( $+ $5- $+ ) }
        else if ($4 == kick) { echo $color(par) -t %ono.tmpwindow * Saiu: $2 (Kickado por $iif($5 = $2,Ele mesmo,$5) $+ ) }
        else if (!$4) || (!$3) { echo $color(par) -t %ono.tmpwindow * Saiu: $2 ( $+ $3 $+ ) }
      }
    }
    inc %pop.total.w
  }

  unset %pop.total
  titlebar %ono.tmpwindow $iif($chan($1).mode != $null,( $+ $chan($1).mode $+ ):) $strip($chan($1).topic)
  unset %topico
}
menu @Onotices* {
  dclick:if $mouse.lb { query $right($sline($active, 1), -1) }
  -
  $iif($mouse.lb = $true && $left($sline($active, 1),1) = @, Whois):whois $right($sline($active, 1), -1)
  $iif($mouse.lb = $true && $left($sline($active, 1),1) = @, DeOP):mode $striP($gettok($active,2,160)) -o $right($sline($active, 1), -1)
  $iif($mouse.lb = $true && $left($sline($active, 1),1) = @, Query):query $right($sline($active, 1), -1)
  -
  $iif($mouse.lb = $true && $left($sline($active, 1),1) = @, Enviar Arquivo):dcc send $right($sline($active, 1), -1)
  -
  Fonte...:font
  Logar janela
  .Salvar buffer:var %log = $shortfn($logdir) $+ $replace($mkfn($active),$chr(160),$chr(32)) $+ .log | savebuf -a $active " $+ %log $+ " | fecho -a Buffer salvo:&cc2 $nopath(%log)
  .Salvar buffer && logar:var %log = $shortfn($logdir) $+ $replace($mkfn($active),$chr(160),$chr(32)) $+ .log | savebuf -a $active " $+ %log $+ " | .log on $active | fecho -a Buffer salvo:&cc2 $nopath(%log) $+ &cc1, logando..
  .-
  .Parar de logar:log off $active
  Atualizar lista:onotice_routine $gettok($active,2,160)
  -
  Fechar: window -c $active
}


;; Connect
on *:connect: {
  ;; Entra nos canais favoritos da rede
  if (%pop.chanfav.typeident == connect) joinfavchan $network

  ;; Away
  if (%pop.away.stay) && (%away. [ $+ [ $cid ] $+ ] .reason) { away %away. [ $+ [ $cid ] $+ ] .reason }

  ;; Mostra as news
  .timer 1 4 shownews

  ;; Contador de palavras
  unset %mcl. [ $+ [ $cid ] ]
  unset %mc. [ $+ [ $cid ] ]

  if (%pop.info.chan) && ($timer(chaninfo) == $null) .timerchaninfo 0 600 chaninfo

  ;; Detector de lag
  .timer 1 3 checarlag $cid
}

on *:signal:connect:{
  unset %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ]

  ;; servers recentes
  set %pop.list.recent.servers $__addrecent(%pop.list.recent.servers,$server $port)

  ;if (%gs.auth.auto) { gs.doauth }
  ;if (%x.auth.auto) { x.doauth }
  ;if (%q.auth.auto) { q.doauth }

  ;;echo CONECTADO!

  .pdcc on
  .fsend on
  .dcc packetsize 999999999
}


;; Disconnect
on *:disconnect:{
  .signal -n disconnect

}

on *:signal:disconnect:{
  unset %pop.connected. $+ $cid

  ;; Identificado
  unset %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ]

  if (%mensagemquit. [ $+ [ $cid ] ]) msgallwindow $color(quit) Você desconectou: ( $+ %mensagemquit. [ $+ [ $cid ] ] $+ )
  unset %mensagemquit. [ $+ [ $cid ] ]

  ;; Total de palavras
  if (%mc. [ $+ [ $cid ] ] != $null) {
    echo $colour(info2) -ts * Você escreveu um total de $+ $+(,$colour(notice)) $`ponto(%mc. [ $+ [ $cid ] ]) $+  $iif(%mc. [ $+ [ $cid ] ] > 1,linhas:,linha:) $+ $+(,$colour(notice)) $`ponto(%mcl. [ $+ [ $cid ] ]) caractéres
  }

  ;; Manter away
  if ((%pop.away.stay) && ($away)) { set %away. [ $+ [ $cid ] $+ ] .reason $awaymsg }

  unset %join. [ $+ [ $cid ] $+ ] .*
  if ($timer(away. [ $+ [ $cid ] ])) { .timeraway. [ $+ [ $cid ] ] off }

  ;; Para detector de lag
  .timerchecklag. [ $+ [ $cid ] ] off
  .timerchecklagdelay. [ $+ [ $cid ] ] off

}

;; CLOSE WINDOW
on *:close:@aliases:unset %active


;; Last input..
on *:input:*: {

  if ($left($1,1) != /) {
    ;; ChanServ
    if ($+(@ChanServ/,$network,*) iswm $active) { chanserv $1- | return }

    ;; NickServ
    if ($+(@NickServ/,$network,*) iswm $active) { nickserv $1- | return }

    ;; MemoServ
    if ($+(@MemoServ/,$network,*) iswm $active) { memoserv $1- | return }

    ;; BotServ
    if ($+(@BotServ/,$network,*) iswm $active) { botserv $1- | return }
  }

  ;; Comandos sem barra na janela de status
  if (($left($1,1) != /) && ($active == Status Window)) {
    if (%pop.general.cmdstatus) { $1- | halt }
    else echo $colour(norm) $1-

    ; pra quem adoora escrever topicos/aliases no status
    halt
  }
}

;; Texto no pvt
on ^*:text:*:?: {
  if ($nick == $me) { if ($1- == AIDLE) { haltdef } }

  ;; em away
  if (($away) && ($nick != $network)) {
    if (%away.resp. [ $+ [ $site ] ] >= 1) .timer 1 60 /unset %away.resp. [ $+ [ $site ] ]
    else { 
      inc %away.resp. [ $+ [ $site ] ] 
      if (%pop.away.page) .notice $nick Estou ausente desde %away. [ $+ [ $cid ] $+ ] .since $+ . Para deixar recado, digite: /ctcp $me page <sua mensagem>
      else .notice $nick Estou ausente desde %away. [ $+ [ $cid ] $+ ] .since $+ . Motivo: $awaymsg
    }
  }

}

on ^*:open:?:{
  if ($nick == $me) { if ($1- == AIDLE) { haltdef } }
}

on 1:open:?:{
  infoquery $nick
}


alias infoquery {

  if (!$findtok(%pop.info.query,pvtstats,1,32)) {
    if ($findtok(%pop.info.query,common,1,32)) { echo $colour(info2) -g $1 * Canais em comum: $`comchan($1) }
  }

  if ($findtok(%pop.info.query,pvtstats,1,32)) {
    tokenize 32 $remove($1,=)

    if ($ignore($1 $+ !*@*)) { echo 4 -g $nick * $1 $+ !*@* está na sua Ignore List }
    statsquery

    echo $colour(info2) -g $1 $str(_,52)
    echo $colour(info2) -g $1 * $+  $1  $+ $iif($gettok($address($1,0),2,33),( $+ $ifmatch $+ ))
    echo $colour(info2) -g $1 * $__asctime
    echo $colour(info2) -g $1 * Total queries: %query.all $+ , hoje: %query.today
    echo $colour(info2) -g $1 * Canais em comum: $`comchan($1) 
    echo $colour(info2) -g $1 $str(¯,52)

    echo $colour(join) -g $1 
  }
}
alias statsquery {
  if (%query.date != $date) {
    set %query.date $date
    set %query.today 0
  }
  inc %query.today
  inc %query.all
}

alias __asctime {
  var %recebe = $replace($gettok($asctime,1,32),sun,Domingo,Mon,Segunda,Tue,Terça,Wed,Quarta,Thu,Quinta,Fri,Sexta,Sat,Sábado) $+ $chr(44)
  var %recebe = %recebe $gettok($asctime,3,32) de $replace($gettok($asctime,2,32),Jan,Janeiro,Feb,Fevereiro,Mar,Março,Apr,Abril,may,Maio,Jun,Junho,jul,Julho,Aug,Agosto,Sep,Setembro,Oct,Outubro,nov,Novembro,dec,Dezembro) de $gettok($asctime,5,32)
  var %recebe = %recebe ( $+ $gettok($asctime,4,32) $+ )
  return %recebe
}

alias `comchan {
  var %cc = 1
  while $chan(%cc) {
    if ($1 ison $chan(%cc)) { var %ccc = $addtok(%ccc,$`checkmodes($1,$chan(%cc)),32) }
    inc %cc
  }
  if (%ccc) { return $replace(%ccc,$chr(32),$chr(44) $chr(32)) }
  else { return Nenhum }
}

alias `checkmodes {
  if ($1 isop $2) return @ $+ $2
  else if ($1 isvo $2) return + $+ $2
  else if ($1 ishop $2) return $chr(37) $+ $2

  else return $2
}

alias checkflood {
  ; $1 = qtd
  ; $2 = tempo de ignore
  ; $3 = tipo
  ; $4 = address

  if (!$1) { return }

  if (%flood. [ $+ [ $3 ] $+ ] . [ $+ [ $4 ] ] > $1) { .ignore -u10 $address | return }
  inc %flood. [ $+ [ $3 ] $+ ] . [ $+ [ $4 ] ]
  .timer 1 $2 .unset %flood. [ $+ [ $3 ] $+ ] . [ $+ [ $4 ] ]
}

;; CTCP
ctcp *:*:?:{

  if ($1-2 == DCC SEND) { 
    fecho $color(ctc) -ts ,----------------------------
    fecho $color(ctc) -ts $chr(124) DCC SEND de $nick ( $+ $address $+ )
    fecho $color(ctc) -ts $chr(124) Arquivo: $nopath($3) ( $+ $bytes($6,3).suf $+ ) 
    fecho $color(ctc) -ts $chr(124) IP: $longip($4) Porta: $5
    goto end
  }
  if ($1-2 == DCC CHAT) {
    fecho $color(ctc) -ts ,----------------------------
    fecho $color(ctc) -ts $chr(124) DCC CHAT de $nick ( $+ $address $+ )
    fecho $color(ctc) -ts $chr(124) IP: $longip($4) Porta: $5 
    goto end
  }
  if ($1-2 == DCC RESUME) { fecho $color(ctc) -s DCC RESUME: $nick [ $+ $address $+ ] | goto end }
  if ($1-2 == DCC ACCEPT) { fecho $color(ctc) -s DCC RESUME aceito por $nick | goto end }


  if ($1 == USERINFO) { checkflood 3 10 ctcp $address | .ctcpreply $nick USERINFO $decode(xaPuduugp6mufP50,m) %version - $decode($encode($eval(%site,2),m),m) }
  else if ($1 == CLIENTINFO) { checkflood 3 10 ctcp $address | .ctcpreply $nick CLIENTINFO $decode(xaPuduugp6mufP50,m) %version - $decode($encode($eval(%site,2),m),m) }
  else if ($1 == INFO) { checkflood 3 10 ctcp $address | .ctcpreply $nick INFO %alivescript }
  else if ($1 == ECHO) { checkflood 3 10 ctcp $address | .ctcpreply $nick $1 13 $+ $2- }
  else if ($1 == SCRIPT) { checkflood 3 10 ctcp $address | .ctcpreply $nick SCRIPT $decode(xaPuduugp6mufP50,m) %version - $decode($encode($eval(%site,2),m),m) }

  else if ($1 == PING && $nick != $me) {
    checkflood 2 10 ping $address
    .ctcpreply $nick PING $2-

    if ($query($nick)) { echo $color(ctc) -t $query($nick) -> [ $+ $nick PING] $iif(($2 !isnum) && ($2),$2-,$calc($ticks - $2)) }
    if (!$query($nick)) { echo $color(ct) -ta -> [ $+ $nick PING] $iif(($2 !isnum) && ($2),$2-,$calc($ticks - $2)) }
    halt
  }

  else if ($1 == PAGE) {
    checkflood 2 5 page $address
    if (%pop.away.page) && ($away) { 

      .notice $nick Olá, $nick $+ ! Estou ausente, mas seu chamado foi recebido com sucesso, obrigado. ( $+ $decode(xaPuduugp6mufP50,m) $+ )
      pagerlog $asctime(dd/mm/yy HH:mm:ss) $network $nick $2-

      ;;if $_ler(away,soundpage) != beep { .splay " $+ $shortfn($_ler(away,soundpage)) $+ " } 
      ;;else { beep }
    }
    else { 
      if ($away) { .ctcpreply $nick PAGE Meu PAGER está desligado! ( $+ $decode(xaPuduugp6mufP50,m) $+ ) }
      else { .ctcpreply $nick PAGE :: $decode(xaPuduugp6mufP50,m) %version $decode($encode($eval(%site,2),m),m) }
    }
    halt
  }

  else if ($1 == TIME) { checkflood 3 10 ctcp $address | .ctcpreply $nick TIME $fulldate }
  else if ($nick == $me) { .ctcpreply $nick $nick $nick }

  if ($query($nick)) { echo $color(ctcp) -t $query($nick) [ $+ $nick $1 $+ ] $2- }
  else { echo $color(ctc) -t $+ $iif($active ischan,a,s) [ $+ $nick $1 $+ ] $2- }

  halt
  :end
}
alias pagerlog {
  if (!$1-3) return

  .write -il1 configs\pagelog.txt $1-
}


;; Lag
on ^*:pong: {
  unset %s. [ $+ [ $cid ] $+ ] .delay
  if ($2 isnum) {
    %s. [ $+ [ $cid ] $+ ] .lag = $calc(($ticks - $2) / 1000) 
  }
  else { %s. [ $+ [ $cid ] $+ ] .lag = Não foi possível checar }

  if (%s. [ $+ [ $cid ] $+ ] .bash) { 
    fecho -a &cc2Lag:&cc1 $replace(%s. [ $+ [ $cid ] $+ ] .lag,.,$chr(44)) s
    unset %s. [ $+ [ $cid ] $+ ] .bash 
  }
  halt
}


;; CTCP PING
on *:ctcpreply:*: { 
  if (!$2) halt

  if ($1 == PING) && ($nick != $me) {
    if (%ping. [ $+ [ $nick ] ] == wait) { 

      if ($query($nick)) echo $colour(ctcp) -t $query($nick) <- [Reposta de PING de $nick $+ ]: $calc(($ticks - %reply. [ $+ [ $nick ] ] ) / 1000) segs
      else echo $colour(ctcp) -ta <- [Reposta de PING de $nick $+ ]: $calc(($ticks - %reply. [ $+ [ $nick ] ] ) / 1000) segs

      unset %reply. [ $+ [ $nick ] ] %ping. [ $+ [ $nick ] ]
    }
  }
  else {
    if ($query($nick)) echo $colour(ctcp) -t $query($nick) <- $chr(91) $+ Resposta de $1 vinda de $nick $+ ]: $2-
    else { echo $colour(ctcp) -ta <- $chr(91) $+ Resposta de $1 vinda de $nick $+ ]: $2- }
  }
  halt
}

on *:ban:#:{
  if ($nick == $me) {
    var %i = $ialchan($banmask,$chan,0), %b
    while (%i) {
      %b = %b $ialchan($banmask,$chan,%i).nick
      if ($len(%b) > 500) { %b = %b $+ ... | break }
      dec %i
    }
    .write -il1 configs\hist-ban.txt 1 + 0 0 0 $+($asctime(dd/mm/yy HH:mm:ss),	+ 0 0 0 $chan,	+ 0 0 0 $replace(%b, $chr(32), $chr(44) $+ $chr(32)),	+ 0 0 0 $banmask)
  }
}


;; USERMODE
on ^*:usermode: {
  if ($nick == $me) {

    ;modo +r é registrado por default nas redes, correto?
    if (*r* iswm $1-) {
      set %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ] 1
    } 
    else {
      unset %pop.identified. [ $+ [ $cid ] $+ ] . [ $+ [ $me ] ]
    }
  }

}


;; HOTLINKS

on ^1:HOTLINK:*ed2k?//*:*:{ }
on 1:HOTLINK:*ed2k?//*:*:{ run $1- }
