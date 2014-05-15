;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   10/06/2009
; @data término  10/06/2009
;
; @titulo        ALINHAR JANELAS, SERIALS, DIALOG EDITAR
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

alias alinhar winarr
alias winarr { __opendialog winarr winarr }
dialog winarr {
  title "Alinhar janelas"
  size -1 -1 132 112
  option dbu
  icon $aliveicon

  box "Alinhamentos", 2, 4 1 124 68
  radio "Cascata", 3, 26 14 33 9
  radio "Lado a lado", 6, 26 29 37 9
  radio "Híbrido:", 4, 26 44 29 9
  edit %winarr.hybnum, 16, 44 53 15 11, limit 1
  radio "Maximizado", 7, 87 14 37 9
  radio "Inflado", 5, 87 29 29 9
  radio "Nenhum", 20, 87 44 29 9
  icon 9, 7 27 15 12, $shortfn(scripts\img\wa-tile.png), 0, noborder
  icon 10, 68 12 15 12, $shortfn(scripts\img\wa-max.png), 0, noborder
  icon 11, 68 27 15 12, $shortfn(scripts\img\wa-infl.png), 0, noborder
  icon 12, 7 42 15 12, $shortfn(scripts\img\wa-hyb.png), 0, noborder
  icon 13, 7 12 15 12, $shortfn(scripts\img\wa-casc.png), 0, noborder
  text "1/", 14, 35 55 7 7
  box "Opções", 1, 4 69 124 24
  check "Auto-alinhar janelas", 17, 9 79 67 12
  button "OK", 8, 90 97 38 12, ok, default
  button "Cancelar", 15, 50 97 38 12, cancel
  text "by greeny nnscript.de", 18, 4 95 40 23, multi, disable
}
alias winarr.aplystart {
  if (%winarr == -c) { winarr.apply -c }
  elseif (%winarr == -s) { winarr.apply -s }
  elseif (%winarr == -i) { winarr.apply -i }
  elseif (%winarr == -t) { winarr.apply -t }
  elseif (%winarr == -m) { winarr.apply -m }
  else winarr.apply
}
on *:dialog:winarr:*:*:{
  if ($devent == init) {
    __mdx SetFont $dname 1,2 ANSI 13 700 Tahoma

    if (%winarr == -c) { did -c $dname 3 }
    elseif (%winarr == -s) { did -c $dname 4 }
    elseif (%winarr == -i) { did -c $dname 5 }
    elseif (%winarr == -t) { did -c $dname 6 }
    elseif (%winarr == -m) { did -c $dname 7 }
    else { did -c $dname 20 }
    if (%winarr.auto) { did -c $dname 17 }
  }
  elseif ($devent == sclick) {
    if ($did isnum 3-7) { did -e $dname 8 }
    elseif ($did isnum 9-13) {
      did -e $dname 8
      did -u $dname 3,4,5,6,7
      did -c $dname $replacex($did,13,3,12,4,11,5,10,7,9,6)
    }
    elseif ($did == 8) {
      if ($did(20).state) { winarr.apply }
      elseif ($did(3).state) { winarr.apply -c }
      elseif ($did(4).state) { winarr.apply -s }
      elseif ($did(5).state) { winarr.apply -i }
      elseif ($did(6).state) { winarr.apply -t }
      elseif ($did(7).state) { winarr.apply -m }
      set %winarr.auto $did(17).state

    }
  }
  elseif ($devent == edit) && ($did == 16) {
    did -u $dname 3,5,6,7
    did -c $dname 4
    did -e $dname 8
    set %winarr.hybnum $iif($int($did($did)) isnum 1-9,$v1,3)
  }
}
alias winarr.apply {
  if ($1) { set %winarr $1 }
  else { unset %winarr }

  if ($1 == -c) { winarr.arr.cascade }
  elseif ($1 == -i) { winarr.arr.inflate }
  elseif ($1 == -m) { winarr.arr.maximize }
  elseif ($1 == -t) { winarr.arr.tile }
  elseif ($1 == -s) { winarr.arr.hybrid }
}
alias winarr.arr.maximize { if ($window(Status Window).state != maximized) { !window -x "Status Window" } }
alias winarr.arr.tile { mdi -t }
alias winarr.arr.cascade { mdi -c }
alias winarr.arr.hybrid {
  var %x = $int($calc($window(-3).dh / %winarr.hybnum)),%i = $shortfn($mircini)
  .scon -a winarr.arr.hybrid.do %x

  .remini $shortfn($mircini) windows status
  .remini $shortfn($mircini) windows wdchannel
  .remini $shortfn($mircini) windows wdquery

  if (%winarr.auto) {
    writeini -n %i windows status 0, $+ $window(-3).dw $+ , $+ $calc($window(-3).dh - %x) $+ , $+ %x $+ ,0,1,0

    writeini -n %i windows wdchannel 0, $+ $window(-3).dw $+ ,0, $+ $calc($window(-3).dh - %x) $+ ,0,1,0
    writeini -n %i windows wdquery 0, $+ $window(-3).dw $+ ,0, $+ $calc($window(-3).dh - %x) $+ ,0,1,0
  }
}
alias winarr.arr.hybrid.pos { return 0 0 $window(-3).dw $calc($window(-3).dh - $int($calc($window(-3).dh / %winarr.hybnum))) }
alias winarr.arr.hybrid.do {
  var %i = $window(*,0),%z
  while (%i) {
    var %z = $window(*,%i)
    if ($window(%z).mdi) && (Get * !iswm %z) && (Send * !iswm %z) && (@Bar 2 != %z) && (@Bar 1 != %z) {
      if ($window(%z).state == maximized) { window -r $+(",%z,") }
      if (%z != Status Window) { 

        !window $+(",%z,") 0 0 $window(-3).dw $calc($window(-3).dh - $1) 

      }
    }
    dec %i
  }
  !window -r "Status Window" 0 $calc($window(-3).dh - $1) $window(-3).dw $1 - 20
}
alias winarr.arr.inflate {
  scon -a winarr.arr.inflate.do

  .remini $shortfn($mircini) windows status
  .remini $shortfn($mircini) windows wdchannel
  .remini $shortfn($mircini) windows wdquery

  if (%winarr.auto) {

    var %getwin = 0 0 $window(-3).dw $window(-3).dh

    writeini -n $shortfn($mircini) windows status 0, $+ $window(-3).dw $+ , $+ $gettok(%getwin,2,32) $+ , $+ $gettok(%getwin,4,32) $+ ,0,1,0
    writeini -n $shortfn($mircini) windows wdchannel 0, $+ $window(-3).dw $+ , $+ $gettok(%getwin,2,32) $+ , $+ $gettok(%getwin,4,32) $+ ,0,1,0
    writeini -n $shortfn($mircini) windows wdquery 0, $+ $window(-3).dw $+ , $+ $gettok(%getwin,2,32) $+ , $+ $gettok(%getwin,4,32) $+ ,0,1,0

    ;;writeini -n $shortfn($mircini) windows scripts -5,1028,-8,724,0,0,0
  }
}
alias winarr.arr.inflate.pos { return 0 0 $window(-3).dw $window(-3).dh }
alias winarr.arr.inflate.do {
  var %i = $window(*,0)
  while (%i) {
    var %z = $window(*,%i)
    if ($window(%z).mdi) && (Get * !iswm %z) && (Send * !iswm %z) {
      if ($window(%z).state == maximized) { window -r $+(",%z,") }

      !window $+(",%z,") 0 0 $window(-3).dw $window(-3).dh

    }
    dec %i
  }
}
on *:appactive:{
  if (%winarr.auto) && ($appactive) && (%winarr != -m) && ($appstate != minimized) && ($appstate != tray) { winarr.apply %winarr }
}
on *:active:*:{ 
  if (%winarr.auto) && (($active == Channels List) || ($active == URL List) || ($active == Finger Window) || ($active == Message Window)) { winarr.apply %winarr } 

  .scid $cid
  mytitlebar
}





; ------------------------------------
; Serials
; ------------------------------------
; Autor: Token
; Adaptado e modificado ao ALIVE por peerless (2007, eu acho..)

alias serials {
  if (!$serials.mdx) { fecho 2 -s * /serials: falha ao abrir "scripts\dlls\MDX.dll" | halt }
  if (!$dialog(serials)) { dialog -md serials serials  }
  else { dialog -ve serials serials }
  if ($1) {
    sockclose serials | unset %serials.* | set %serials.pesquisa $1-
    did -r serials 3,5 | sockopen serials www.serials.ws 80
  }
}

on *:sockopen:serials:{
  var %data = chto= $+ %serials.pesquisa
  sockwrite -n $sockname POST /index.php HTTP/1.0
  sockwrite -n $sockname User-Agent: Mozilla $rand(3,5) $+ . $+ $rand(0,9) (compatible ; Windows $iif($r(1,2),98,2000) ; MSIE $rand(5,7) $+ )
  sockwrite -tn $sockname Accept: text/html
  sockwrite -tn $sockname Content-Type: application/x-www-form-urlencoded
  sockwrite -tn $sockname Content-Length: $len(%data)
  sockwrite -n $sockname host: www.serials.ws
  sockwrite -n $sockname $crlf
  sockwrite -n $sockname %data
}

on *:sockread:serials:{
  var %temp | sockread 4096 %temp
  var %ba = a href=javascript:d
  if (%ba isin %temp) {
    var %bb = $token($gettok($replace($token(%temp,2-,58),</a></td><td>,$chr(9),</td><td>,$chr(9)),2,62),1,60)
    if ($count(%bb,$chr(9)) == 1) {
      var %bb = %bb $+ $chr(9) $+ unknown
    }
    var %bb = %bb $+ $chr(9) $+ $chr(163) $+ $remove($wildtok($token($token(%temp,2,58),1,62),$+($chr(40),*,$chr(41)),1,100),$chr(40),$chr(41))
    if ($chr(9) isin %bb) { 
      if ($dialog(serials)) { did -a $sockname 3 2 $replace(%bb,		£,	unknown	£) }
    }
  }
}

dialog -l serials {
  title "Serials & Keys"
  size -1 -1 210 140
  icon $aliveicon
  option dbu

  text "Software Desejado:", 1, 12 4 56 8, nowrap
  edit "", 2, 63 3 56 9, return autohs center
  button "Procurar!", 7, 132 2 37 11, default 
  list 3, 1 14 207 88, size
  text "Duplo clique no serial que deseja", 444, 1 103 210 8, nowrap CENTER
  text "Informação:", 4, 2 114 31 8, nowrap
  ;button "Ver serial!", 66, 2 112 31 11, default 
  edit "", 5, 34 114 174 23, read multi autovs vsbar

  button "Fechar", 6, 170 2 37 11, cancel
}

alias serials.mdx { 
  if ($exists(scripts\dlls\mdx.dll)) { return scripts\dlls\mdx.dll }
}
alias -l serials_tab {
  if (!$1) return $chr(9) | var %t,%w = 1
  while ($($+($,%w),2)) { %t = $instok(%t,$($+($,%w),2),0,9) | inc %w }
  return %t
}
alias isgex return $regex($$1-,([A-Z]|[a-z]|[0-9]|[!-@]))

on *:dialog:serials:*:*:{
  if ($devent == init) {
    var %pathmdx = $serials.mdx
    dll %pathmdx SetMircVersion $version
    dll %pathmdx MarkDialog $dname
    dll %pathmdx SetControlMDX 3 listview showsel rowselect infotip report extsel > $replace($serials.mdx,mdx.dll,views.mdx)
    did -i $dname 3 1 headerdims 257 74 69 -1
    did -i $dname 3 1 headertext $serials_tab(Nome do Software, Últimas, Aprovação, ID)
    dll %pathmdx SetBorderStyle 2 windowedge staticedge
    dll %pathmdx SetFont 444 ANSI 13 700 Tahoma
  }
  if ($devent == sclick) { 
    if ($did == 7) {
      if (!$did(2)) || (!$isgex($did(2))) { __aviso io Serials:Coloque algum software que procura no campo! | did -f $dname 2 | halt }
      did -r $dname 3 | did -b serials 2 | serials $did(2).text 
      dialog -t $dname Serials: Procurando (Aguarde) . . .
    }  
    if ($did == 66) {
      serial2 $token($$did(3).seltext,2,163) | did -f serials 5 
    }
  }
  if ($devent == dclick) {
    if ($did == 3) { serial2 $token($did(3).seltext,2,163) | did -f serials 5 }
  }
}

alias -l serial2 { 
  if ($1) {
    sockclose serial2 | unset %serial2.*
    set %serial2.get $1 | did -r serials 5
    sockopen serial2 www.serials.ws 80
  }
}

on *:sockopen:serial2:{
  sockwrite -n $sockname GET /d.php?n= $+ %serial2.get HTTP/1.0
  sockwrite -n $sockname User-Agent: Mozilla $r(4,5) $+ . $+ $r(0,9) (compatible ; Windows $iif($r(1,2) == 1,2000,98) $+ ; MSIE 5) Dig Links
  sockwrite -n $sockname host: www.serials.ws
  sockwrite -n $sockname $crlf
}

on *:sockread:serial2:{
  var %get | sockread 4096 %get | tokenize 32 %get
  if (($left($1,4) == Dear) || ($left($1,5) == Hello)) {
    if ($dialog(serials)) { 
      did -a serials 5 $token($token(%get,14-,62),1,60) 
      dialog -t serials Você têm: $replace($6,first,1) requisitos de 10 permitidos por IP
    }
  }
  if (*Sorry*Only*serials*day* iswm %get) {
    if ($dialog(serials)) { did -a serials 5 $remove($2,<b>,</b>!) $+ $chr(44) é permitido $4 serials por dia. (tente reiniciar o modem e mudar o IP) }
  }
}

on *:sockclose:serial*:{ if ($dialog(serials)) { did -e serials 2,3 | if ($sockname != serial2) dialog -t $ifmatch Serials: Fim da procura! Fontes encontradas: $calc($did($ifmatch,3).lines -1)  } }


;;;;; Editar

alias myedit {
  if (!$1) return
  set %file.edit $1-
  __opendialog myedit
}

dialog myedit {
  title "Editar"
  size -1 -1 429 403
  option pixels
  icon $aliveicon

  list 1, 7 6 418 294, size

  button "PRÉVIA", 2, 7 301 416 40
  edit "", 3, 7 343 416 21, autohs

  button "Adicionar", 4, 6 369 70 25
  button "Remover", 5, 79 369 70 25
  button "Atualizar", 6, 152 369 70 25

  button "OK", 7, 269 369 75 25, ok
  button "Cancelar", 8, 347 369 75 25, cancel
}

on *:dialog:myedit:*:*: {
  if ($devent == close) {
    unset %file.edit
  }
  else if ($devent == init) {
    did -a $dname 3 Selecione acima
    __ppwin $dname 2
    mypreviewmulti $dname 2 myedit 3
    did -r $dname 3
    if (%file.edit) { .loadbuf -o $dname 1 $shortfn(%file.edit) }
  }
  else if ($devent == sclick) {
    if ($did == 1) { did -ra $dname 3 $did(1).seltext | mypreviewmulti $dname 2 myedit 3 }
    if ($did == 5) { if ($did(1).sel) did -d $dname 1 $did(1).sel }
    if ($did == 6) { if ($did(3)) { did -o $dname 1 $did(1).sel $did(3).text | did -r $dname 3 } }
    if ($did == 7) { if ($isfile(%file.edit)) { .write -c %file.edit | var %i = 1 | while (%i <= $did(1).lines) { write %file.edit $did($dname,1,%i) | inc %i } } }
  }
  else if ($devent == edit) {
    if ($did == 3) mypreviewmulti $dname 2 myedit 3
  }
}








;------------------------------------------------------------
; EOF
;------------------------------------------------------------
