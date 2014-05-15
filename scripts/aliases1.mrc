;------------------------------------------------------------
; ALIVE 5 by Hafuk
; http://github.com/marlosirapuan/alivescript5/
;
; Aliases :: Retornos
;------------------------------------------------------------


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuracao
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Data
__dia {
  if $day == monday { return Segunda-Feira } 
  if $day == tuesday { return Terça-Feira } 
  if $day == wednesday { return Quarta-Feira } 
  if $day == thursday { return Quinta-Feira } 
  if $day == friday { return Sexta-Feira } 
  if $day == saturday { return Sábado } 
  if $day == sunday { return Domingo } 
}

;; Icone
aliveicon {
  if ($exists($+($scriptdir,img\,alive.ico))) return $+($scriptdir,img\,alive.ico)
  else return $mircexe
}

;;; Retorna as redes cadastradas no arquivo servers.ini

`networks {
  var %ini = 0
  while ($readini(servers.ini,networks,n [ $+ [ %ini ] ]) != $null) {
    var %getRedes = $addtok(%getRedes,$readini(servers.ini,networks,n [ $+ [ %ini ] ]),127)
    %ini = %ini + 1
  }

  return %getRedes
  unset %getRedes
}


;; Lista nas dialogos que o chamam e as preenche

__listnetworks {
  if ($1-2) {
    did -r $1 $2

    var %ini = 1
    while ($gettok($`networks,%ini,127)) {
      var %string.network = $gettok($`networks,%ini,127)

      did -a $1 $2 %string.network 
      %ini = %ini + 1
    }
  }
}


;; Lista dados numa dialog
__list {
  ; 1 = variavel com os dados
  ; 2 = dialog
  ; 3 = did

  var %variavel = $gettok($1-,1,127)
  var %dialog   = $gettok($1-,2,127)
  var %did      = $gettok($1-,3,127)

  if ($1) {
    var %ini = 1
    while ($gettok(%variavel,%ini,44)) {
      did -a %dialog %did $gettok(%variavel,%ini,44)
      %ini = %ini + 1
    }
  }
}




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Serviços da Rede :: NickServ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Identifica-se na Rede

identificar {
  checkserver

  ; $1 = nickname
  if ($1) var %nickname.auth = $1
  else var %nickname.auth = $me

  ; $2 = rede
  if ($2) var %nickname.netw = $2
  else var %nickname.netw = $network


  ;; QuakeNet

  ;; UnderNet

  ;; GameSurge

  ;; NickServ

  if ($readini($+($shortfn($mircdirconfigs\netw),%nickname.netw,.ini),%nickname.auth,pass)) {
    var %getpass          = $readini($+($shortfn($mircdirconfigs\netw),%nickname.netw,.ini),%nickname.auth,pass)
    var %comand.identify  = $readini($+($shortfn($mircdirconfigs\netw),%nickname.netw,.ini),%nickname.auth,cmdidentify)

    ;;fecho -s Identificando-se na Rede...
    $replace(%comand.identify,<senha>,$decode(%getpass,m))

    %achou = 1
  }

  if (%achou) unset %achou
  else { 
    var %me = $me
    if ($netwservices) nickserv identify $$input( $+ %me não está cadastrado para identificação automática $+ $chr(44) digite a senha:,pqev,Requisição)
  }
}


;; Lista nicks registrados (NickServ)

__listnicksidentify {
  ; $1 = dialog
  ; $2 = did

  if (!$1) return

  did -r $1 $2

  var %ini = 1
  while ($findfile($shortfn($mircdirconfigs\netw),*.ini,%ini)) {

    var %arquivo.rede = $nopath($findfile($shortfn($mircdirconfigs\netw),*.ini,%ini))

    ; Busca por nicks cadastrados no arquivo
    var %c = 1
    while ($ini($+($shortfn($mircdirconfigs\netw),%arquivo.rede),%c)) {

      %rede           = $mid(%arquivo.rede, 1, -4)
      %nickname       = $ini($+($shortfn($mircdirconfigs\netw),%arquivo.rede),%c)
      %nickname.away  = $readini($+($shortfn($mircdirconfigs\netw),%arquivo.rede),%nickname,nickname_away)

      did -a $1 $2 $+(%nickname,$chr(9),%nickname.away,$chr(9),%rede)

      %c = %c + 1
    }
    if (%c > 0) did -e $1 370,382,371,372,167,168,373,374,375,377,378,379,380

    %ini = %ini + 1

    unset %nickname %nickname.away %rede
  }
}


;; Adiciona nickname, senha, rede e [nickname away] para identificacao

__addnicktoidentify {
  ; $1 = Rede

  ; $2 = nickname
  ; $3 = senha

  ; $4 = cmd identify
  ; $5 = antighost

  ; $6 = nickname away

  if ($1-3) {
    ; Procura se existe registro..
    if ($ini($+($shortfn($mircdirconfigs\netw),$1,.ini),$2)) && (%noquestion != true) {
      if (!$$input(Já existe um registro com esse nickname. Deseja substituir?, qy, NickServ)) return

      var %refresh = true
    }
    if (%noquestion == true) var %refresh = true
    unset %noquestion

    ; Adiciona o registro
    .writeini $+($shortfn($mircdirconfigs\netw),$1,.ini) $2 pass $encode($3,m)
    if ($6 == <none>) .remini $+($shortfn($mircdirconfigs\netw),$1,.ini) $2 nickname_away
    else .writeini $+($shortfn($mircdirconfigs\netw),$1,.ini) $2 nickname_away $6

    ; Comando identify
    .writeini $+($shortfn($mircdirconfigs\netw),$1,.ini) $2 cmdidentify $iif($4 == type1,/!.NickServ Identify <senha>,/!.Msg NickServ Identify <senha>)
    ; Ghost
    .writeini $+($shortfn($mircdirconfigs\netw),$1,.ini) $2 antighost $5

    ; Adiciona na dialog de configuracao
    if ($dialog(configuracao)) {
      if (%refresh) {
        did -r configuracao 375
        did -r configuracao 382,372,168
        __listnicksidentify configuracao 375

        return
      }

      did -a configuracao 375 $+($2,$chr(9),$6,$chr(9),$1)
      did -r configuracao 382,372,168
    }
  } 
  else {
    fecho Faltam parametros!
  }
}

;; Edita nickname da identificação
__editnicktoidentify {
  ; $1 = dialog

  ; $2 = rede
  ; $3 = nickname

  if ($1-3) {
    var %retorno.nickname      = $3
    var %retorno.rede          = $2
    var %retorno.passw         = $decode($readini($+($shortfn($mircdirconfigs\netw),$2,.ini),$3,pass),m)
    var %retorno.nickname.away = $readini($+($shortfn($mircdirconfigs\netw),$2,.ini),$3,nickname_away)

    var %retorno.cmd.identify  = $readini($+($shortfn($mircdirconfigs\netw),$2,.ini),$3,cmdidentify)
    if (!%retorno.cmd.identify) .writeini $+($shortfn($mircdirconfigs\netw),$2,.ini) $3 cmdidentify /!.NickServ Identify <senha>

    var %retorno.antigghost    = $readini($+($shortfn($mircdirconfigs\netw),$2,.ini),$3,antighost)

    did -ra $1 382 %retorno.nickname
    did -ra $1 372 %retorno.passw
    did -ra $1 168 %retorno.nickname.away
    did -c $1 381 $didwm($1,381,$2,0)

    if (%retorno.cmd.identify == /!.NickServ Identify <senha>) { did -u $1 379 | did -c $1 378 }
    else { did -u $1 378 | did -c $1 379 }
    if (%retorno.antigghost == 1) did -c $1 380

    did -e $1 370,382,371,372,167,168,373,374,375,377,378,379,380

  }
  else return

}

;; Remove nickname da identificação

__delnickfromidentify {
  ; $1 = Rede
  ; $2 = Nickname

  if ($1-2) {
    var %redefile = $+($1,.ini)
    if ($ini($+($shortfn($mircdirconfigs\netw),%redefile),$2)) {
      .remini $+($shortfn($mircdirconfigs\netw),%redefile) $2
    }
  }
}


;; Adiciona canal favoritos
__addchantofav {
  tokenize 58 $1-

  ; $1 = rede
  ; $2 = canal
  ; $3 = descricao

  if ($1-2) {
    ; Procura se existe registro..
    if ($ini($+($shortfn($mircdirconfigs\chanfav),$1,.ini),$gettok($2,1,32))) && (%noquestion != true) {
      if (!$$input(Já existe um registro com esse canal. Deseja substituir?, qy, Canais Favoritos)) return

      var %refresh = true
    }
    if (%noquestion == true) var %refresh = true
    unset %noquestion

    ; Adiciona o registro
    .writeini $+($shortfn($mircdirconfigs\chanfav),$1,.ini) $2 canal $2
    if ($3) .writeini $+($shortfn($mircdirconfigs\chanfav),$1,.ini) $2 descricao $3

    ; Adiciona na dialog de configuracao
    if ($dialog(configuracao)) {
      if (%refresh) {
        did -r configuracao 339
        did -r configuracao 343,352
        __listchanfav configuracao 339

        return
      }

      did -a configuracao 339 $+($2,$chr(9),$1,$chr(9),$3)
      did -r configuracao 343,352
    }
  } 
  else {
    fecho Faltam parametros!
  }
}

;; Lista canais favoritos

__listchanfav {
  ; $1 = dialog
  ; $2 = did

  if (!$1) return

  did -r $1 $2

  var %ini = 1
  while ($findfile($shortfn($mircdirconfigs\chanfav),*.ini,%ini)) {

    var %arquivo.rede = $nopath($findfile($shortfn($mircdirconfigs\chanfav),*.ini,%ini))

    ; Busca por canais cadastrados no arquivo
    var %c = 1
    while ($ini($+($shortfn($mircdirconfigs\chanfav),%arquivo.rede),%c)) {

      var %read   = $ini($+($shortfn($mircdirconfigs\chanfav),%arquivo.rede),%c)

      %rede       = $mid(%arquivo.rede, 1, -4)
      %canal      = $readini($+($shortfn($mircdirconfigs\chanfav),%arquivo.rede),%read,canal)
      %descricao  = $readini($+($shortfn($mircdirconfigs\chanfav),%arquivo.rede),%read,descricao)

      did -a $1 $2 $+(%canal,$chr(9),%rede,$chr(9),%descricao)

      %c = %c + 1
    }
    ;; if (%c > 0) did -e $1 370,382,371,372,167,168,373,374,375,377,378,379,380

    %ini = %ini + 1

    unset %canal %rede %descricao
  }
}

;; Edita canal favorito

__editchanfav {
  tokenize 127 $1-

  ; $1 = dialog

  ; $2 = canal [senha]
  ; $3 = rede
  ; $4 = descricao

  if ($1-4) {
    var %retorno.canal         = $2
    var %retorno.rede          = $3
    var %retorno.descricao     = $4

    did -ra $1 343 %retorno.canal
    did -ra $1 352 %retorno.descricao
    did -c $1 344 $didwm($1,344,$3,0)

  }
  else return

}

;; Remove canal favorito

__delchanfav {
  tokenize 127 $1-
  ; $1 = Canal
  ; $2 = Rede

  if ($1-2) {
    var %redefile = $+($2,.ini)
    if ($ini($+($shortfn($mircdirconfigs\chanfav),%redefile),$gettok($1,1,32))) {
      .remini $+($shortfn($mircdirconfigs\chanfav),%redefile) $gettok($1,1,32)
    }
  }
}








;; Janelas de Avisos
__aviso {
  var %prop  = $1
  var %title = $gettok($2-,1,58)
  var %msg   = $gettok($2-,2,58)

  var %input = $$input(%msg,%prop,%title)
}

;; CloneScan
clones { 
  checkserver

  if (!$1) && ($active ischan) { .timer 1 0 clonescan $active | return }
  if ($me !ison #$$1) { fech -a Você não está no&cc2 #$$1 | return }
  else { .timer 1 0 clonescan #$$1 }
}

clonescan {
  var %ticks = $ticks
  var %i = 1

  ;se existir a hash clones,, ele libera com o hfree
  if ($hget(clones) != $null) { .hfree clones }

  ;faz um loop em todos os nicks do canal$1..
  while ($nick($1,%i)) {

    ;; recebe mask dos nicks listados
    var %mask = $address($nick($1,%i),2)

    if ($hfind(clones,%mask,0) == 0) {

      ;pega a %mask, verifica se ja nao existe no hash.. se nao tiver ele continua a rotina
      if ($ialchan(%mask,$1,0) > 1) { 
        var %n = 1 

        ;no loop ele adiciona os nicks com %masks iguais na hash.. -m; se n existir a hash, ele cria

        :volta
        hadd -m clones %mask $hget(clones,%mask) $ialchan(%mask,$1,%n).nick

        %n = %n + 1

        ; enquanto não efetivar a condição, volta pro loop
        if (%n <= $ialchan(%mask,$1,0)) { goto volta }

      }
    }
    inc %i
  }

  ;; monta window
  window -kalC -t17 @CloneScan 60 50 650 320 Arial 12
  titlebar @CloneScan

  aline $color(ctc) @CloneScan Procurando clones no $+ $chr(9) $+  $+ $1
  aline $color(info2) @CloneScan Endereço $+ $chr(9) $+ Nicks
  aline $color(info2) @CloneScan $chr(160)
  var %i = 1
  while ($hget(clones,%i).data) { 

    ;; level 10=proxy
    if ($level($hget(clones,%i).item) != 10) {

      ;; hosts
      var %hosts = $hget(clones,%i).item

      ;; nicks
      var %nicks = $hget(clones,%i).data

      aline @CloneScan %hosts $+ $chr(9) $+  $+ $color(notif) $+ $replace(%nicks,$chr(32), $+ $chr(44) $+ $chr(32) $+ $+(,$colour(notify)),$me,$+(,$me,)) 
      %calc = $calc(%calc + $gettok($hget(clones,%i).data,0,32))
    }
    inc %i
  }

  aline $color(info2) @CloneScan $chr(160)

  aline $color(info2) @CloneScan Scan completado em $+ $chr(9) $+ $calc(($ticks - %ticks) / 1000) segundo(s)
  aline $color(info) @CloneScan Porcentagem $+ $chr(9) $+ $int($calc((%calc / $nick($1,0,a))*100)) $+ % - total de $iif(%calc,%calc,0) clones
  aline $color(ct) @CloneScan Fim da procura no $+ $chr(9) $+  $+ $1

  unset %calc
  window -afklbC @CloneScan
}


;; Maskscan
maskscan { 
  checkserver
  if ($active !ischan) { fecho -a Use esse comando dentro de um canal. | halt }

  if ($1 == $null) { set %mascara $$input(Máscara para procurar: (Ex: *alive*),qe,Requisição) }
  else { set %mascara $1 }

  .timer 1 0 searchmask
}
searchmask {

  if ($window(@MaskScan)) clear @MaskScan

  var %t = $ticks

  window -kalC -t15 @MaskScan -1 -1 650 320 Arial 12
  titlebar @MaskScan - Procura pela a máscara: %mascara
  aline $color(ctc) @MaskScan Procurando máscara no $+ $chr(9) $+  $+ $chan
  aline $color(info2) @MaskScan Nicks $+ $chr(9) $+ Endereços

  %o = 1 
  %n = 0

  :inicio

  set %tmp.nick $nick($chan,%o) 

  if (%tmp.nick == $null) { goto fim }

  %tmp.nick   = $address(%tmp.nick,5)
  %tmp.nick2  = $nick($chan,%o)

  if (%mascara == %tmp.nick)   { goto end }
  if (%mascara isin %tmp.nick) { goto end }
  if (%mascara iswm %tmp.nick) { goto end }

  inc %o 
  goto inicio

  :end

  inc %n 
  aline @MaskScan %n $+ . %tmp.nick2 $chr(9) $+  $+ $color(notif) $+ $replace(%tmp.nick,%mascara,$+(, %mascara ,))
  inc %o 

  goto inicio

  :fim

  aline $color(info2) @MaskScan Scan completado em $+ $chr(9) $+ $calc(($ticks - %t) / 1000) segundo(s)
  aline $color(info) @MaskScan Porcentagem $+ $chr(9) $+ $int($calc((%n / $nick($chan,0,a)) * 100)) $+ %
  aline $color(ct) @MaskScan Fim da procura no $+ $chr(9) $+  $+ $chan

  unset %o %n %tmp.nick* %mascara
  window -afklbC @MaskScan
}


;; Auto join
cjoin joinfavchan $iif($1,$1,$network)
ajoin cjoin

joinfavchan {

  if (!$server) fecho -a Não conectado ao servidor. Digite &cc2/server %default.server &ccopara conectar.

  ; $1 = network

  if (!$1) return

  var %i = 1
  while ($ini($+($shortfn($mircdirconfigs\chanfav\),$1,.ini),%i)) { var %chan = $ifmatch | !join $iif(%pop.chanfav.minimized,-n) %chan
    %i = %i + 1 
  }
}

;; ASC time BR
`asctime return $replace($1-,sun,Domingo,mon,Segunda-Feira,tue,Terça-Feira,wed,Quarta-Feira,thu,Quinta-Feira,fri,Sexta-Feira,sat,Sábado,Jan,Janeiro,Feb,Fevereiro,Mar,Março,Apr,Abril,May,Maio,Jun,Junho,Jul,Julho,Aug,Agosto,Sep,Setembro,Oct,Outubro,Nov,Novembro,Dec,Dezembro)


;; Programas favoritos
__program {
  if ($isid) {
    if ($gettok(%program. [ $+ [ $1 ] ],2,127)) return $gettok(%program. [ $+ [ $1 ] ],2,127) ( $nopath($gettok(%program. [ $+ [ $1 ] ],1,127)) )
    else return <vazio>
  }
  else {
    if ($exists($gettok(%program. [ $+ [ $1 ] ],1,127))) { fecho -s Abrindo:&cc2 $gettok(%program. [ $+ [ $1 ] ],2,127) &cco... | .run $gettok(%program. [ $+ [ $1 ] ],1,127) }
    else { 
      set %program. [ $+ [ $1 ] ] $$dir="Escolha um programa favorito:" *.exe $+ $chr(127) $+ $$input(Nome do programa (nº $1 $+ ):,129,Requisição)
      fecho Programa favorito nº $1 escolhido: $gettok(%program. [ $+ [ $1 ] ],2,127)
    }
  }
}
__changeprogam {
  %nnprogam = $1
  set %program. [ $+ [ %nnprogam ] ] $$dir="Escolha um program. Atual: $gettok(%program. [ $+ [ %nnprogam ] ],2,127) ( $nopath($gettok(%program. [ $+ [ %nnprogam ] ],1,127)) ) " *.exe $+ $chr(127) $+ $$input(Nome do programa (nº %nnprogam $+ ):,129,Requisição)
  fecho Programa favorito nº %nnprogam editado para: $gettok(%program. [ $+ [ %nnprogam ] ],2,127)
}



;; Dados padrões
mymenu {

  if (!$1) return
  if (!$2) return

  var %o = 1
  while ($var(%default.d [ $+ [ $2 ] $+ ] .netw.*,%o)) {
    var %mrede = %default.d [ $+ [ $2 ] $+ ] .netw. [ $+ [ %o ] ]
    var %mchan = %default.d [ $+ [ $2 ] $+ ] .chan. [ $+ [ %o ] ]

    if ($1 == %mrede) { return %mchan | halt }

    %o = %o + 1
  }
}

;; Outros
`duration { 
  return $replace($duration($1-),days,d,day,d,weeks,w,week,w,hrs,h,hr,h,mins,m,min,m,secs,s,sec,s) 
}


;; Preview na dialog
;;preview cara 8 76 30 $cara³($iif($1,$1,: $+ $chr(41)),crows¹)

mypreview { 
  if ($1-5) {

    ; $1 = dialog
    ; $2 = did da preview
    ; $3 = width
    ; $4 = height
    ; $5 = msg

    window -ph +b @preview -1 -1 $3 $4 
    .remove preview.bmp 

    if ($window(@preview)) { clear @preview }

    drawtext -pbc @preview $colour(own) $colour(background) " $+ $window(Status Window).font $+ " $window(Status Window).fontsize 0 1 $3 17 $chr(160) $+ $5-
    drawsave @preview preview.bmp 
    window -c @preview 

    did -g $1 $2 preview.bmp 
    .remove preview.bmp
  }
  else return
}

;; preview na dialog (multiplas linhas)
mypreviewmulti { 
  ;$1 = dialog
  ;$2 = did do preview
  ;$3 = tipo
  ;$4 = mensagem

  var %i = 0
  var %w = $+(@preview.,$1,.,$2)
  var %y = 1

  ;;var %t = $__doittxt($1,$4)
  if ($3 == away) var %t = * $iif($me,$me,seunick) $replace($__doittxt($1,$4),<me>,$iif($me,$me,seu_nick),<desde>,$time(HH:nn),<motivo>,já volto!,<motivovolta>,pronto!,<page>,$iif(%pop.away.page,on,off),<campo1>,$iif(%pop.away.campo1,%pop.away.campo1,none),<campo2>,$iif(%pop.away.campo2,%pop.away.campo2,none),<campo3>,$iif(%pop.away.campo3,%pop.away.campo3,none),<tempo>,$+($r(1,3),h 40m),<script>,%alivescript)
  else if ($3 == edit) var %t = $replace($__doittxt($1,$4),<site>,%site,<script>,%alivescript,<logo>,%logo,<mensagem>,mensagem de quit,<tempo>,$`duration($r(200,300)),<motivo>,motivo..,<contador>,#000 $+ $r(10,20) $+ )
  else if ($3 == myedit) var %t = $__doittxt($1,$4)


  var %f = $window(Status Window).font
  var %s = $window(Status Window).fontsize
  var %h = $calc($height(%t,%f,%s) +1)

  drawrect -nf %w $color(back) 1 0 0 $window(%w).w $window(%w).h
  if (%t != $null) {
    while (%y < $window(%w).h) {
      if ($3 == away) { drawtext -npb %w $color(action) $color(back) $qt(%f) %s $calc(2-(%i *($window(%w).w -6))) %y %t }
      else drawtext -npb %w $color(norm) $color(back) $qt(%f) %s $calc(2-(%i *($window(%w).w -6))) %y %t

      inc %y %h
      inc %i
    }
    drawrect -n %w $color(back) 2 0 0 $calc($window(%w).w -2) $calc($window(%w).h -2)
  }
  drawdot %w
}

__ppwin {
  __mdx SetControlMDX $1-2 Window > $__mdxfile(dialog)
  var %w = $+(@preview.,$1,.,$2)
  window -phf %w -1 -1 $window(-1).w $window(-1).h
  did -a $1-2 grab $window(%w).hwnd %w
}

__doittxt {
  if $hget(tmp,txt) != $null { .hdel tmp txt }
  var %i = $did($1,$2).lines,%r
  while (%i) {
    hadd -m tmp txt $did($1,$2,%i) $+ $hget(tmp,txt)
    dec %i
  }
  return $hget(tmp,txt)
}


;; Nick completion
nickcompletion { 

  if ($1) { var %nc.who = $encriptNC($iif($me,$me,Nick)) }
  else { var %nc.who = $encriptNC(%nc.who) }

  if ($len(%nc.who) isnum 1-2) {
    if (%pop.nc.mode) {
      if (%nc.who isop $chan) { var %nc.return = @ $+ %nc.who } 
      if (%nc.who isvo $chan) { var %nc.return = + $+ %nc.who }
      if (%nc.who !isvo $chan && %nc.who !isop $chan) { var %nc.return = %nc.who }
    }
    else { var %nc.return = %nc.who }

    var %mync.len = 0, %mync.lens = 0, %mync.rr = 0
  }

  if ($len(%nc.who) == 3) { var %mync.len = 2, %mync.lens = 2, %mync.rr = 1 }
  if ($len(%nc.who) == 4) { var %mync.len = 2, %mync.lens = 2, %mync.rr = 1 }
  if ($len(%nc.who) == 5) { var %mync.len = 2, %mync.lens = 2, %mync.rr = 1 }
  if ($len(%nc.who) == 6) { var %mync.len = 3, %mync.lens = 4, %mync.rr = 2 }
  if ($len(%nc.who) == 7) { var %mync.len = 3, %mync.lens = 4, %mync.rr = 2 }
  if ($len(%nc.who) >= 8) { var %mync.len = 4, %mync.lens = 6, %mync.rr = 3 }

  if (%pop.nc.mode) {
    if (%nc.who isop $chan) { var %nc.return = @ $+ %nc.who } 
    if (%nc.who isvo $chan) { var %nc.return = + $+ %nc.who }
    if (%nc.who !isvo $chan && %nc.who !isop $chan) { var %nc.return = %nc.who }
  }
  else { var %nc.return = %nc.who }

  var %nc.return.l = $left(%nc.return,%mync.rr), %nc.return.r = $right(%nc.return,%mync.rr), %nc.return.d = $mid(%nc.return,%mync.len,$calc($len(%nc.return ) - %mync.lens))

  if ($2) {
    if ($dialog(nc.edit)) { return $did(nc.edit,6) $+  $+ $iif(%pop.nc.mode,@) $+ %nc.return.l $+  $+ $did(nc.edit,8) $+  $+ %nc.return.d $+  $+ $did(nc.edit,17) $+  $+ %nc.return.r $+  $+ $did(nc.edit,10) $+  }
    if ($dialog(configuracao)) {
      var %var = $2- 
      if (%var == ((7Cores))) { return $besteiradespace($_sevencolor($iif(%pop.nc.mode,@) $+ %nc.who)) $+  }
      else if (%var == ((Pro-Cool))) { return $cool($iif(%pop.nc.mode,@) $+ %nc.who) $+  }
      else if (%var == ((Fraco-Forte))) { return $besteiradespace2($bimbim($iif(%pop.nc.mode,@) $+ %nc.who)) $+  }
      else return $`cinvNC($readini(configs\nc.ini,%var,inicio)) $+  $+ $iif(%pop.nc.mode,@) $+ %nc.return.l $+  $+ $`cinvNC($readini(configs\nc.ini,%var,meio)) $+  $+ %nc.return.d $+  $+ $`cinvNC($readini(configs\nc.ini,%var,meio1)) $+  $+ %nc.return.r $+  $+ $`cinvNC($readini(configs\nc.ini,%var,fim)) $+ 

    }
  }
  else {
    var %var = $ini(configs\nc2.ini,usar,$r(1,$ini(configs\nc2.ini,usar,0))) 
    if %var == ((7Cores)) { return $besteiradespace($_sevencolor(%nc.who)) $+  }
    else if %var == ((Pro-Cool)) { return $cool(%nc.who) $+  }
    else if %var == ((Fraco-Forte)) { return $besteiradespace2($bimbim(%nc.who)) $+  }
    else return $`cinvNC($readini(configs\nc.ini,%var,inicio)) $+  $+ %nc.return.l $+  $+ $`cinvNC($readini(configs\nc.ini,%var,meio)) $+  $+ %nc.return.d $+  $+ $`cinvNC($readini(configs\nc.ini,%var,meio1)) $+  $+ %nc.return.r $+  $+ $`cinvNC($readini(configs\nc.ini,%var,fim)) $+  
  }
  unset %nc.who %nc.return* %mync.len* %mync.rr
}
encriptNC return $iif(%pop.nc.encript,$replacecs($1-,a,å,A,Å,b,ß,c,©,D,Ð,e,ë,i,î,n,ñ,N,Ñ,o,ø,p,þ,r,®,S,§,u,ü,x,×),$1-)
dencriptNC return $iif(%pop.nc.encript,$replacecs($1-,å,a,Å,A,ß,b,©,c,Ð,D,ë,e,î,i,ñ,n,Ñ,N,ø,o,þ,p,®,r,§,S,ü,u,×,x),$1-)

`cooltext return $replace($strip($1-),ã,12ã,a,2a,b,14B,c,4C,d,10D,e,6e,k,12k,f,4F,g,5G,h,3H,i,10i,j,6J,l,14L,m,2M,n,14N,o,3o,p,12P,q,14Q,r,6R,s,2S,t,4T,u,12u,v,1V,x,13X,y,4Y,z,10Z,:,4:)
`cinvNC return $replace($1-,*%&k,,*%&b,,*%&u,,*%&o,,*%&r,,@§,[,§@,])
`invcNC return $replace($1-,,*%&k,,*%&b,,*%&u,,*%&o,,*%&r,[,@§,],§@)

;; Info chan 10 10 min
chaninfo {
  if ($1) goto go
  if (!%pop.info.chan) { .timerchaninfo off | return }

  :go

  var %scon = 1
  while ($scon(%scon)) {
    .scon -at1 /showinfochan
    %scon = %scon + 1
  }

}
showinfochan {
  if ($chan(0)) && ($status == connected) {
    var %y = 1
    while ($chan(%y)) { 
      tokenize 32 $chan(%y) 
      echo $color(info) -t $1 $infochan($1)
      inc %y 
    }
  }
}

;; Info chan
infochan {
  if ($nick($1,0,h) != 0) { 
    return * Info do $+ $color(notice) $1 $+  $+ $color(norm) $+ : (Operadores: $infcpercent($1,o) $+ , HalfOps: $infcpercent($1,h) $+ , Voices: $infcpercent($1,v) $+ , Normais: $infcpercent($1,r) $+ , Total: $nick($1,0) $+ )
  }
  else { 
    return * Info do $+ $color(notice) $1 $+  $+ $color(normal) $+ : (Operadores: $infcpercent($1,o) $+ , Voices: $infcpercent($1,v) $+ , Normais: $infcpercent($1,r) $+ , Total: $nick($1,0) $+ )
  }
}
infcpercent {
  return $+(,$nick($1,0,$2),) $+ / $+ $int($calc(($nick($1,0,$2)/$nick($1,0,a))*100)) $+ %
}

clear {
  if (@Aliases* iswm $active) { halt } 
  else !clear $1-
}
;; Atalhos personalizados

__defaultbindings {
  set %F1 /run mirc.chm
  set %F2 /setup
  set %F3 /onotice
  set %F4 /nickcompletion
  set %F5 
  set %F6
  set %F7
  set %F8 /server
  set %F9
  set %F10 /autokicks
  set %F11 /away $$ $+ input(Motivo do away:,qe,Requisição)
  set %F12 /clear
  set %sF1
  set %sF2
  set %sF3
  set %sF4
  set %sF5
  set %sF6
  set %sF7
  set %sF8
  set %sF9
  set %sF10 
  set %sF11
  set %sF12
  set %sF1
  set %sF2
  set %sF3
  set %sF4
  set %sF5
  set %sF6
  set %sF7
  set %sF8
  set %sF9
  set %sF10
  set %sF11
  set %sF12

  __listbindings
}

__listbindings {
  did -r configuracao 312
  var %c 1, %k = F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 cF1 cF2 cF3 cF4 cF5 cF6 cF7 cF8 cF9 cF10 sF1 sF2 sF3 sF4 sF5 sF6 sF7 sF8 sF9 sF10 sF11 sF12
  while ($gettok(%k,%c,32)) {
    var %cmd   = % $+ $gettok(%k,%c,32)
    var %gvar  = $var(%cmd,1).value

    var %value = % [ $+ [ $v1 ] ]
    var %key   = $replace($v1,c,Ctrl+,s,Shift+)

    did -a configuracao 312 $+(%key,$chr(9),%value)
    %c = %c + 1
  }
}
__delmyeditAway {
  if (!$1) return

  noop $read(configs\edit-away.txt,w,$+($1-,:nome))
  write -dl $+ $readn $shortfn(configs\edit-away.txt)

  noop $read(configs\edit-away.txt,w,$+($1-,:away*))
  write -dl $+ $readn $shortfn(configs\edit-away.txt)

  noop $read(configs\edit-away.txt,w,$+($1-,:back*))
  write -dl $+ $readn $shortfn(configs\edit-away.txt)
}
__readmyeditAway {
  if (!$1) return

  var %l = $read(configs\edit-away.txt,w,$+($1-,:*))
  var %m = $readn

  var %raway = $gettok($gettok($read(configs\edit-away.txt,$calc(%m + 1)),2-,58),2-,32)
  did -ra configuracao 68 %raway
  set %pop.away.msgaway %raway

  var %rback = $gettok($gettok($read(configs\edit-away.txt,$calc(%m + 2)),2-,58),2-,32)
  did -ra configuracao 72 %rback
  set %pop.away.msgback %rback

  mypreviewmulti configuracao 73 away 68
}
__listmyeditAway {
  ;$1 = dialog
  ;$2 = did
  if (!$1) return

  did -r $1 $2
  var %w = 1
  while (%w <= $lines(configs\edit-away.txt)) {
    var %string = $read(configs\edit-away.txt,%w)
    did -a $1 $2 $gettok(%string,1,58)
    %w = %w + 3
  }
}


;; Ponto
`ponto return $replace($bytes($1,b),$chr(44),.)

;; Info nicks canal
`fninfo return $nick($chan,0,$1) ( $+ $round($calc(($nick($chan,0,$1) / $nick($chan,0)) * 100),1) $+ % $+ )

;------------------------------------------------------------
; EOF
;------------------------------------------------------------
