;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   05/06/2009
; @data término  
;
; @titulo        RAW's
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

; Leitor de RAW :P
;;raw *:*:echo 12 -s $numeric : $2-

;; Conectando..
raw 001:*:{
  set %pop.connected. $+ $cid 1
  .signal -n connect
}
;; Away
raw 301:*:set %whois.usr.away $3- | halt
raw 305:*: {
  fecho -s Você voltou do away.
  halt
}
raw 306:*: {
  unset %aw. [ $+ [ $cid ] ]

  if ($awaymsg) fecho -s Você está marcado como away:&cc2 $awaymsg
  else fecho -s Você está marcado como away

  halt
}


;; Info chan
raw 324:*: if ($me !ison $2) halt
raw 329:*: if ($me !ison $2) halt

;; Names
raw 353:*: {
  if (%join. [ $+ [ $+($cid,.,$3) ] ]) { halt } 
}
raw 366:*:{
  if (%join. [ $+ [ $+($cid,.,$2) ] ]) {
    if (%pop.info.censojoin) echo $color(info) -t $2 $infochan($2)
    if (%timetojoin. [ $+ [ $cid ] $+ ] . [ $+ [ $2 ] ]) { echo $color(notic) -t $2 * $calc(($ticks - %timetojoin. [ $+ [ $cid ] $+ ] . [ $+ [ $2 ] ] ) / 1000) segs para entrar }

    halt
  }
}
raw 367:*: if (%join. [ $+ [ $+($cid,.,$2) ] ]) { halt }
raw 368:*: if (%join. [ $+ [ $+($cid,.,$2) ] ]) { unset %join. [ $+ [ $+($cid,.,$2) ] ] | halt }

;; Who
raw 352:*: {
  if (%join. [ $+ [ $+($cid,.,$2) ] ]) {

    var %ul = $6 $+ ! $+ $3 $+ @ $+ $4
    if ($me !ison $2) { halt }

    ;  if ($level(%ul) == 3) { 
    ;    echo -s %cc2 $+ [ $+ %cc1 $+ BlackList/ $+ $2 $+ %cc2 $+ ]: $6 %cc3 $+ ( $+ %cc4 $+ $3 $+ %cc2 $+ @ $+ %cc4 $+ $4 $+ %cc3 $+ )
    ;    if ($_ler(setup,banblack) == on) { 
    ;      if $me isop $2 { 
    ;        raw -q kick $2 $6 : $+ $_msgsu(1,%ul, $6) $au.au 
    ;        raw -q mode $2 +b %ul 
    ;        if ($_ler(sons,kickban) == on) && ($exists($_ler(som,kick)) { splay " $+ $shortfn($_ler(som,kick)) $+ " }
    ;      } 
    ;    }
    ;  }
    ;  if ($level(%ul) == 10) && ($_ler(setup,proxyshow) == on) { lucia -s %cc2 $+ [Proxy( $+ %cc1 $+ nao-clone $+ %cc2 $+ ) $+ %cc3 $+ / $+ %cc4 $+ $2 $+ $+ %cc2 $+ ]: $+ %cc1 $6 }
    ;  if ($istok(%hugs,$6,44)) {
    ;    echo -s %cc2 $+ [ $+ %cc1 $+ HUG List/ $+ $2 $+ $+ %cc2 $+ ]: $6 %cc3 $+ ( $+ %cc4 $+ $3 $+ %cc2 $+ @ $+ %cc4 $+ $4 $+ %cc3 $+ )
    ;    if $_ler(hug,type) == list {
    ;      var %hugging = $read -l $+ $iif($_ler(hug,style) == aleatorio,$r(1,$lines(sistema\docs\hugs.txt)),$_ler(hug,style)) sistema\docs\hugs.txt 
    ;      msg $2 $replace(%hugging,cúzim,$6,cúzin2,$compakt($6)) 
    ;      if ($_ler(hug,double) == on) { 
    ;        msg $2 $replace(%hugging,cúzim,$6,cúzin2,$compakt($6)) 
    ;      }
    ;    }
    ;    if $_ler(hug,type) == edit { 
    ;      msg $2 $replace($_ler(hug,edit),&nick&,$6) 
    ;      if ($_ler(hug,double) == on) { msg $2 $replace($_ler(hug,edit),&nick&,$6) }
    ;    }
    ;    cline2 %pop.cores.hug $2 $6
    ;    halt
    ;  }
    ;  if %pop.cores.enabled == on {
    ;    if ($notify($6)) { cline2 $color(gra) $2 $6 }
    ;    if (* isin $7) { .cline2 %pop.cores.ircop $2 $6 }
    ;    if ($6 == $me) { cline %pop.cores.eu $2 $6 }
    ;  }
    ; if (%bug == $null) halt

    ;; if (G isin $7) { .timer 1 5 .ccline %color.away $2 $6 }

    halt
  }
}
alias ccline {
  if ($chan($2) == $null) halt
  if ($3 == $null) halt

  if ($1 isnum) { cline $1 $2 $3 }
}

;; End of Who
raw 315:*:{ 
  if (%join. [ $+ [ $+($cid,.,$2) ] ]) {
    var %i = 1
    while ($chan(%i)) {
      if ($chan(%i) == $2) { 
        echo $color(invite) -t $2 * Ready, monkey! $iif($r(0,1),$+(:,$chr(41)),$+(;,$chr(41))) 
        unset %timetojoin. [ $+ [ $cid ] $+ ] . [ $+ [ $2 ] ]

        break 
      }
      inc %i 1
    }
    halt
  }
}

;; WHOIS


;qnet
raw 330:*: { if ($network == quakenet) { %whois.usr.auth = $2 | halt } }
raw 338:*: { if ($network == quakenet) { %whois.usr.actually = $3- | halt } }
raw 396:*: { fecho -s Seu host escondido agora é: $2- | halt }

raw 379:*: { set %whois.usr.usermode $4- | halt }
raw 378:*: { set %whois.usr.userConn $4- | halt }

raw 311:*: {
  unset %whois.usr.* 

  set %whois.usr.nick $2 
  set %whois.usr.addr $+($3,@,$4)
  set %whois.usr.nome $6-

  if (%whois.usr.nick isnotify) { set %whois.usr.notify Sim $iif($notify($2).note," $+ $ifmatch $+ ") }
  if ($5 != *) { set %whois.usr.ip $5 }

  halt
}
raw 312:*: { set %whois.usr.server $3- | haltdef }

raw 313:*: {

  if (Coder isin $1-)             { set %whois.usr.flags $addtok(%whois.usr.flags,Coder,32) }
  if (network service isin $1-)   { set %whois.usr.flags $addtok(%whois.usr.flags,Services,32) }
  if (root isin $1-)              { set %whois.usr.flags $addtok(%whois.usr.flags,ServiceRoot,32) }
  if (services admin* iswm $1-)   { set %whois.usr.flags $addtok(%whois.usr.flags,SAdmin,32) }
  if (services operator isin $1-) { set %whois.usr.flags $addtok(%whois.usr.flags,SOper,32) }
  if (network admin isin $1-)     { set %whois.usr.flags $addtok(%whois.usr.flags,NetAdmin,32) }
  if (Tech isin $1-)              { set %whois.usr.flags $addtok(%whois.usr.flags,TechAdmin,32) }

  if (Co admin isin $1-) || (Co-admin isin $1-) || (CoAdmin isin $1-) { set %whois.usr.flags $addtok(%whois.usr.flags,CoAdmin,32) }
  if (server isin $1-) || (admin* iswm $1-) { set %whois.usr.flags $addtok(%whois.usr.flags,Admin,32) }

  if (global isin $1-) && (IRCop isin $1- || IRC Operator isin $1-) { set %whois.usr.flags $addtok(%whois.usr.flags,Ircop Global,32) }
  if (local !isin $1-) && (IRCop isin $1- || IRC Operator isin $1-) { set %whois.usr.flags $addtok(%whois.usr.flags,Ircop,32) }

  if (local isin $3-) || (locop isin $1-) { set %whois.usr.flags $addtok(%whois.usr.flags,Ircop,32) }
  halt
}
raw 310:*:%whois.usr.flags = $addtok(%whois.usr.flags,Ajudante,32) | halt
raw 317:*: { 
  set %whois.usr.idle $replace($duration($3),wks,S,days,d,hrs,h,mins,m,secs,s,wk,S,day,d,hr,h,min,m,sec,s)
  tokenize 32 $`asctime($asctime($4))
  set %whois.usr.date $1 $+ , $3 de $2 $5 às $4
  halt 
}
raw 319:*:set %whois.usr.channels $3- | halt
raw 278:*:set %whois.usr.ip $5 | halt
raw 307:*:set %whois.usr.regis desligado | halt
raw 318:*: {
  set %whois.usr.cn $2

  ;; Whois Result
  ;; Verifica se está ligado ou não nas opções do mIRC
  %w = $gettok($readini(mirc.ini,options,n2),26,44)
  if (%w == 1) %w = -a
  else %w = -s

  if (!%notfound) whoisresult

  unset %notfound %w %whois.usr.*
  halt
}


alias whoisresult {

  ;;var %fcor = 0 $+ , 0
  var %fcor = 02

  if ($strip($line($active,$line($active,0))) != $str(·,40)) echo %w _ ________________________________________ _

  echo %w ~ %whois.usr.nick %whois.usr.addr 
  echo %w ~ $+(,%fcor,%whois.usr.nick) nome $ansi2mirc(%whois.usr.nome)

  if (%whois.usr.regis) { echo %w ~ $+(,%fcor,%whois.usr.nick) está registrado e identificado }
  if (%whois.usr.auth) { echo %w ~ $+(,%fcor,%whois.usr.nick) está autenticado como %whois.usr.auth }

  echo %w ~ $+(,%fcor,%whois.usr.nick) canais $iif(%whois.usr.channels,%whois.usr.channels,$iif($`comchan(%whois.usr.nick) = Nenhum,nenhum encontrado,$`comchan(%whois.usr.nick)) )
  echo %w ~ $+(,%fcor,%whois.usr.nick) conectado em %whois.usr.server

  if (%whois.usr.notify) { echo %w ~ $+(,%fcor,%whois.usr.nick) está na sua notify list $iif($notify(%whois.usr.nick).note," $+ $ifmatch $+ ") }
  if (%whois.usr.idle != $null) { 
    echo %w ~ $+(,%fcor,%whois.usr.nick) inativo por %whois.usr.idle 
    echo %w ~ $+(,%fcor,%whois.usr.nick) conectou $lower(%whois.usr.date)
  }
  if (%whois.usr.ip != $null)    { echo %w ~ $+(,%fcor,%whois.usr.nick) ip real %whois.usr.ip }
  if (%whois.usr.flags != $null) { echo %w ~ $+(,%fcor,%whois.usr.nick) flags: $replace(%whois.usr.flags,$chr(32),+) }
  if (%whois.usr.away != $null)  { echo %w ~ $+(,%fcor,%whois.usr.nick) está away %whois.usr.away }

  if (%whois.usr.actually != $null) { echo %w ~ $+(,%fcor,%whois.usr.nick) é realmente %whois.usr.actually }

  ;; proxy
  if ($level($address(%whois.usr.cn,2)) == 10) goto p

  ;;if ($_ler(setup,whoisclone) == off) goto p 

  if ($ial($address(%whois.usr.cn,2),0) > 1) { 
    unset %clones 
    echo %w $+ i2 ~ $+(,%fcor,%whois.usr.nick) %cc2 $+ tem $+ %cc4 $`totalclone($address(%whois.usr.cn,2)).total $+ %cc2 clones: $`totalclone($address(%whois.usr.cn,2))
  }

  :p

  echo %w ¯ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ ¯

  unset %w %whois.usr.* %clones %whois.usr.away %recebewhois*
}
alias `getmode {
  if ($1 isop $2) return @ $+ $2
  else if ($1 isvo $2) return + $+ $2
  else if ($1 ishop $2) return $chr(37) $+ $2

  else return $2
}

alias `comchan {
  var %c = 1
  while ($chan(%c)) {
    if ($1 ison $chan(%c)) { var %cc = $addtok(%cc,$`getmode($1,$chan(%c)),32) }
    inc %c
  }
  if (%cc) return $replace(%cc,$chr(32),$chr(44) $chr(32))
  else return Nenhum
}

alias `totalclone {
  if ($hget(temp,clones) != $null) { .hdel temp clones }

  if ($prop == total) return $ial($1,0)

  unset %clones
  var %linha.clone 1
  while ($ial($1,%linha.clone)) {
    hadd -m temp clones $addtok($hget(temp,1).data,$gettok($ial($1,%linha.clone),1,33),127)
    inc %linha.clone 
  }

  unset %linha.clone

  return $replace($hget(temp,1).data,$chr(127),$chr(44) $chr(32))
  unset %clones
}

;; Ircop
raw 381:*:fecho -s Você agora é um Ircop | halt

;; Anothers..
raw 401:*: {
  fecho -a Nick não encontrado:&cc2 $2 
  set %notfound 1 

  unset %ping. $+ $2
  unset %reply. $+ $2

  halt
}
raw 403:*:fecho -a Canal inválido:&cc2 $2 | halt

raw 404:*:fecho $iif($chan($2),$2,-s) Você não pode enviar mensagem para o canal&cc2 $iif($7-,$7-) | halt 

;; Comando invalido
raw 421:*:{ 
  fecho -s &cc2 $+ $2 &cc1não é um comando válido nesse servidor.
  halt
}
