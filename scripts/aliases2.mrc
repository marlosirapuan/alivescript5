;------------------------------------------------------------
; ALIVE 5 by Hafuk
; http://github.com/marlosirapuan/alivescript5/
;
; Aliases :: Textos / Escritas
;------------------------------------------------------------


;; Autocor
autocor {
  if ($isid) { 
    if (%pop.autocor.count) && (%pop.util.autocor) {
      var %conta = $gettok(%pop.autocor.count.inc, 1, 127) 
      if (%conta !isnum) set %conta 0
      %conta = %conta + 1
      set %pop.autocor.count.inc $puttok(%pop.autocor.count.inc, %conta, 1, 127)
    }

    if (%pop.util.autocor) return $iif(%pop.util.autocor, $mycolors($1-), $1-) 
    else return $`myface($1-)
  }
  else {
    echo -> autocor
  }
}

mycolors {
  if (%pop.autocor.count) return $acprefixo $+ $iif(%autocor.upper,$upper($acroutine($1-)),$acroutine($1-)) $+  $+ $acsufixo  $+ $replace($gettok(%pop.autocor.count.inc,2-,127),<contar>,$gettok(%pop.autocor.count.inc,1,127))
  else return $acprefixo $+ $iif(%autocor.upper,$upper($acroutine($1-)),$acroutine($1-)) $+  $+ $acsufixo
}

acroutine {

  ;; Cor normal
  if (%autocor.estilo == 1) { return $colour£faceC($variascores($1-)) }
  else if (%autocor.estilo == 2) { return $colour£face($cnoname($txtencript($txtnumb($vogalmin($left($1-,3200)))))) }
  else if (%autocor.estilo == 3) { return $colour£face($cspace($txtencript($txtnumb($vogalmin($left($1-,3200)))))) }
  else if (%autocor.estilo == 4) { return $colour£face($cthat($txtencript($txtnumb($vogalmin($left($1-,3200)))))) }
  else if (%autocor.estilo == 5) { return $colour£face($cweak($txtencript($txtnumb($vogalmin($left($1-,3100)))))) }

}

;; Varias cores
variascores {

  var %addc, %repcolor

  ;; string
  if (%autocor.charspace) && (%autocor.charspace != $chr(32)) var %string = $replace($1-,$chr(32),%autocor.charspace,0,0), %addc
  else var %string = $replace($1-,0,0, $chr(32), $chr(160)), %addc

  ;; recebe cores
  var %getc1 = $gettok(%autocor.cnormal,1,32)
  var %getc2 = $gettok(%autocor.cnormal,2,32)
  var %getc3 = $gettok(%autocor.cnormal,3,32)
  var %getc4 = $gettok(%autocor.cnormal,4,32)
  var %getc5 = $gettok(%autocor.cnormal,5,32)
  var %getc6 = $gettok(%autocor.cnormal,6,32)

  if (%getc1 == XXXX) %getc1 = 1616
  if (%getc2 == XXXX) %getc2 = 1616
  if (%getc3 == XXXX) %getc3 = 1616
  if (%getc4 == XXXX) %getc4 = 1616
  if (%getc5 == XXXX) %getc5 = 1616
  if (%getc6 == XXXX) %getc6 = 1616

  if (%getc1 != 1616) { inc %act | var %ctype1 1 | %addc = %addc %getc1 }
  if (%getc2 != 1616) { inc %act | var %ctype2 1 | %addc = %addc %getc2 }
  if (%getc3 != 1616) { inc %act | var %ctype3 1 | %addc = %addc %getc3 }
  if (%getc4 != 1616) { inc %act | var %ctype4 1 | %addc = %addc %getc4 }
  if (%getc5 != 1616) { inc %act | var %ctype5 1 | %addc = %addc %getc5 }
  if (%getc6 != 1616) { inc %act | var %ctype6 1 | %addc = %addc %getc6 }

  if (!%autocor.cnormal) set %autocor.cnormal 1616 XXXX XXXX XXXX XXXX XXXX



  ;; SEM CORES
  if ($gettok(%autocor.cnormal,1,32) !isnum || $gettok(%autocor.cnormal,1,32) == 1616) { 
    unset %act
    return %autocor.ns $+ %repcolor $+ $colour£face($txtencript($txtnumb($cfogoio($vogalmin($calt(%string)))))) 
  }


  ;; UMA COR..
  if ((%ctype1) && (!%ctype2) && (!%ctype3) && (!%ctype4) && (!%ctype5) && (!%ctype6)) {

    ;; string
    if (%autocor.charspace) var %string = $replace($1-,$chr(32),%autocor.charspace,0,0), %addc
    else var %string = $replace($1-,0,0), %addc

    var %repcolor = $iif($left(%getc1,2) != 16 && $left(%getc1,2) != XX,$chr(3) $+ $left(%getc1,2)) $+ $iif($right(%getc1,2) != 16 && $right(%getc1,2) != XX,$chr(44) $+ $right(%getc1,2))

    unset %act
    return %autocor.ns $+ %repcolor $+ $txtencript($txtnumb($cfogoio($vogalmin($calt(%string))))))
  }


  ;; VARIAS CORES

  var %s = 1, %a, %b = 1, %c = 1
  while (%s <= $len(%string)) {

    var %letter   = $mid(%string,%s,1)

    if ($gettok(%addc,%c,32)) { var %getcolor = $gettok(%addc,%c,32) }
    else { set %c 1 | var %getcolor = $gettok(%addc,%c,32) }

    %repcolor = $iif($left(%getcolor,2) != 16 && $left(%getcolor,2) != XX,$chr(3) $+ $left(%getcolor,2)) $+ $iif($right(%getcolor,2) != 16 && $right(%getcolor,2) != XX,$iif($left(%getcolor,2) != 16 && $left(%getcolor,2) != XX,$chr(44),$chr(3)) $+ $right(%getcolor,2))

    %a = %a $+ %repcolor $+ %letter

    inc %s
    inc %b
    inc %c
  }

  return %autocor.ns $+ $txtencript($txtnumb($vogalmin(%a)))

}

;; Trata carinha colorida
colour£faceC {
  if (%autocor.charspace == $null) %autocor.charspace = $chr(32)
  var %m = 1
  while ($gettok($1-,%m,$asc(%autocor.charspace))) {
    if $left($strip($gettok($1-,%m,$asc(%autocor.charspace))),2) isincs %list.carinhas && $len($strip($gettok($1-,%m,$asc(%autocor.charspace)))) >= 2 {
      var %v1 = %v1 $+ %autocor.charspace $+ $`myface($strip($gettok($1-,%m,$asc(%autocor.charspace))))
    }
    else { var %v1 = %v1 $+ %autocor.charspace $+ $gettok($1-,%m,$asc(%autocor.charspace)) }
    inc %m
  }
  return %v1
}

colour£face {
  var %m = 1
  while ($gettok($1-,%m,32)) {
    if $left($strip($gettok($1-,%m,32)),2) isincs %list.carinhas && $len($strip($gettok($1-,%m,32))) >= 2 {
      var %v1 = %v1 $`myface($strip($gettok($1-,%m,32)))
    }
    else { var %v1 = %v1 $gettok($1-,%m,32) }
    inc %m
  }
  return %v1
}


;; Cor Fraco e Forte
cweak {
  var %i = 1, %s
  while ($replace($gettok($1-,%i,32),0,X)) { 
    var %s = %s $docolorweak($gettok($1,%i,32)) 
    inc %i 
  }
  return %s
}
docolorweak {
  var %getc1 = $gettok(%autocor.weak,1,32)
  if (%getc1 == XXXX) %getc1 = 1616

  var %getc2 = $gettok(%autocor.weak,2,32)
  if (%getc2 == XXXX) %getc1 = 1616

  var %getc3 = $gettok(%autocor.weak,3,32)
  if (%getc3 == XXXX) %getc1 = 1616

  var %cw1 = $iif($left(%getc1,2) != 16 && $left(%getc1,2) != XX,$chr(3) $+ $left(%getc1,2)) $+ $iif($right(%getc1,2) != 16 && $right(%getc1,2) != XX,$iif($left(%getc1,2) != 16 && $left(%getc1,2) != XX,$chr(44),$chr(3)) $+ $right(%getc1,2))
  var %cw2 = $iif($left(%getc2,2) != 16 && $left(%getc2,2) != XX,$chr(3) $+ $left(%getc2,2)) $+ $iif($right(%getc2,2) != 16 && $right(%getc2,2) != XX,$iif($left(%getc2,2) != 16 && $left(%getc2,2) != XX,$chr(44),$chr(3)) $+ $right(%getc2,2))
  var %cw3 = $iif($left(%getc3,2) != 16 && $left(%getc3,2) != XX,$chr(3) $+ $left(%getc3,2)) $+ $iif($right(%getc3,2) != 16 && $right(%getc3,2) != XX,$iif($left(%getc3,2) != 16 && $left(%getc3,2) != XX,$chr(44),$chr(3)) $+ $right(%getc3,2))

  if ($left($1,1) == $chr(15)) { return $1 }
  else if ($len($1) == 1) { return %cw1 $+ $1 }
  else if ($len($1) == 2) { return %cw2 $+ $mid($1,1,1) $+ %cw3 $+ $right($1,1) }
  else if ($len($1) isnum 3-4) {
    if (left isin %autocor.weak) return $chr(3) $+ %cw1 $+ $left($1,1) $+ %cw2 $+ $mid($1,2,1) $+ %cw3 $+ $mid($1,3)
    else { return $chr(3) $+ %cw1 $+ $mid($1,1,1) $+ %cw2 $+ $mid($1,2,$calc($len($1) - 2)) $+ %cw1 $+ $right($1,1) } 
  }
  else if ($len($1) >= 5) {
    if (left isin %autocor.weak) return $chr(3) $+ %cw1 $+ $left($1,1) $+ %cw2 $+ $mid($1,2,1) $+ %cw3 $+ $mid($1,3)
    else { return %cw1 $+ $mid($1,0,1) $+ %cw2 $+ $mid($1,2,1) $+ %cw3 $+ $mid($1,3,$calc($len($1) - 4)) $+ %cw2 $+ $mid($right($1,2),0,1) $+ %cw1 $+ $right($1,1) }
  }

}



;; Cor assim e tal
cthat {
  var %n = 1, %g, %s = $replace($1-,0,0)
  while ($gettok(%s,%n,32)) {
    %g = %g $docolorcthat($gettok(%s,%n,32))
    %n = %n + 1
  }
  return %g
}
docolorcthat {

  tokenize 32 $replace($1,0,0) ;; bug filho da puta

  var %c1  = $right($gettok(%autocor.that,1,32),2)
  var %c1b = $left($gettok(%autocor.that,1,32),2)

  var %c2  = $left($gettok(%autocor.that,2,32),2)
  var %c2b = $right($gettok(%autocor.that,2,32),2)

  if (%c1 == XX)  var %c1  = 16
  if (%c1b == XX) var %c1b = 16

  if (%c2 == XX)  var %c2  = 16
  if (%c2b == XX) var %c2b = 16

  if ($len($1) == 1) return $iif(%autocor.that.i,%autocor.that.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $1 $+ 
  else if ($len($1) == 2) return $iif(%autocor.that.i,%autocor.that.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $left($1,1) $+  $+ $iif(%autocor.that.e,%autocor.that.e) $+ $iif(%c2 != 16 && %c2 != XX,$chr(3) $+ %c2) $+ $iif(%c2b != 16 && %c2b != XX,$chr(44) $+ %c2b) $+ $right($1,1) $+ 
  else return $iif(%autocor.that.i,%autocor.that.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $left($1,1) $+  $+ $iif(%autocor.that.e,%autocor.that.e) $+ $iif(%c2 != 16 && %c2 != XX,$chr(3) $+ %c2) $+ $iif(%c2b != 16 && %c2b != XX,$chr(44) $+ %c2b) $+ $mid($1,2) $+ 

}


;; Cor no espaço
cspace {
  var %n = 1, %g, %s = $replace($1-,0,0)
  while ($gettok(%s,%n,32)) {
    %g = %g $docolorcspace($iif($calc(%n % 2),i,p),$gettok(%s,%n,32))
    %n = %n + 1
  }
  return %g
}
docolorcspace {
  tokenize 32 $replace($1-,0,0) ;; bug filho da puta

  var %c1  = $right($gettok(%autocor.space,1,32),2)
  var %c1b = $left($gettok(%autocor.space,1,32),2)

  var %c2  = $left($gettok(%autocor.space,2,32),2)
  var %c2b = $right($gettok(%autocor.space,2,32),2)

  if (%c1 == XX) || (!%c1) var %c1  = 16
  if (%c1b == XX) || (!%c1b) var %c1b = 16

  if (%c2 == XX) || (!%c2) var %c2  = 16
  if (%c2b == XX) || (!%c2b) var %c2b = 16

  if ($1 == i) return $iif(%autocor.space.i,%autocor.space.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $2 $+ 
  else return $iif(%autocor.space.e,%autocor.space.e) $+ $iif(%c2 != 16 && %c2 != XX,$chr(3) $+ %c2) $+ $iif(%c2b != 16 && %c2b != XX,$chr(44) $+ %c2b) $+ $2 $+ 
}

;; Cor sem nome
cnoname {
  var %n = 1, %g, %s = $replace($1-,0,0)

  while ($gettok(%s,%n,32)) {
    %g = %g $docolorcnoname($gettok(%s,%n,32))
    %n = %n + 1
  }
  return %g
}
docolorcnoname {

  tokenize 32 $replace($1,0,0) ;; bug filho da puta

  var %c1  = $right($gettok(%autocor.noname,1,32),2)
  var %c1b = $left($gettok(%autocor.noname,1,32),2)

  var %c2  = $left($gettok(%autocor.noname,2,32),2)
  var %c2b = $right($gettok(%autocor.noname,2,32),2)

  if (%c1 == XX)  var %c1  = 16
  if (%c1b == XX) var %c1b = 16

  if (%c2 == XX)  var %c2  = 16
  if (%c2b == XX) var %c2b = 16

  if ($len($1) == 1) return $iif(%autocor.noname.i,%autocor.noname.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $1 $+ 
  else if ($len($1) == 2) return $iif(%autocor.noname.i,%autocor.noname.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $left($1,1) $+  $+ $iif(%autocor.noname.e,%autocor.noname.e) $+ $iif(%c2 != 16 && %c2 != XX,$chr(3) $+ %c2) $+ $iif(%c2b != 16 && %c2b != XX,$chr(44) $+ %c2b) $+ $right($1,1) $+ 
  else return $iif(%autocor.noname.i,%autocor.noname.i) $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $left($1,1) $+  $+ $iif(%autocor.noname.e,%autocor.noname.e) $+ $iif(%c2 != 16 && %c2 != XX,$chr(3) $+ %c2) $+ $iif(%c2b != 16 && %c2b != XX,$chr(44) $+ %c2b) $+ $mid($1,2,$calc($len($1) - 2)) $+  $+ $iif(%c1 != 16 && %c1 != XX,$chr(3) $+ %c1) $+ $iif(%c1b != 16 && %c1b != XX,$chr(44) $+ %c1b) $+ $right($1,1) $+ 

}



;; Prefixo/Sufixo
acprefixo {
  if (pre isin %autocor.presuf) { return $read(docs\prefixos.txt) }
  else if (%autocor.pre) return %autocor.pre
  else return
}
acsufixo {
  if (suf isin %autocor.presuf) { return $read(docs\sufixos.txt) }
  else if (%autocor.suf) return %autocor.suf
  else return
}


;; Alternar..
calt {
  if (!%autocor.alt) return $1-
  else {
    var %astring = $replace($1-,$chr(32),$chr(160)), %u = 1, %ad
    while (%u <= $len(%astring)) {
      var %aword = $mid(%astring,%u,1)

      if ($r(0,2) == 0) %ad = %ad $+ $iif( isin %autocor.alt.nsr,) $+ %aword
      else if ($r(0,2) == 1) %ad = %ad $+ $iif( isin %autocor.alt.nsr,) $+ %aword
      else %ad = %ad $+ $iif( isin %autocor.alt.nsr,) $+ %aword

      %u = %u + 1
    }
    return %ad
  }
}

;; Fogoió, em homenagem ao Armim haha
cfogoio {
  if (%autocor.fogoio) {
    var %o = $replace($1-,$chr(32),$chr(160)), %i = 1

    while (%i <= $len(%o)) {
      var %r = %r $+ %autocor.fogoio.ns $+ $mid(%o,%i,1)
      inc %i
    }
    return %r
  }
  else return $1-
}

;; Txt numero
txtnumb {
  if (!%autocor.txtnumb) return $1-
  else return $replace($1-,a,4,e,3,i,1,o,0,s,5)
}
;; Vogal maiuscula
vogalmin {
  if (!%autocor.vogalmin) return $1-
  else {
    var %s = $upper($1-) 
    return $replace(%s,a,a,e,e,i,i,o,o,u,u,á,á,ã,ã,â,â,à,à,ä,ä,é,é,ê,ê,è,è,í,í,î,î,ì,ì,ó,ó,ô,ô,ò,ò,õ,õ,ú,ú,û,û,ù,ù,ü,ü)
  }
}
;; Txt Encriptado
txtencript {
  if (%autocor.txtencrip) return $replacecs($1-,a,å,A,Å,b,ß,x,×,?,¿,!,¡,b,ß,c,©,D,Ð,e,ë,i,î,l,£,n,ñ,N,Ñ,o,ð,p,þ,r,®,S,§,u,ü,Y,¥)
  else return $1-
}





;; Carinha colorida
`myface {
  if (!%pop.util.carinha) { return $1- }
  else {
    unset %face

    var %bug = $replace($1-,0,)

    var %c = 1
    while ($gettok(%bug,%c,32)) { 

      if ($left($gettok($strip(%bug),%c,32),2) isincs %list.carinhas && $len($gettok($strip(%bug),%c,32)) >= 2) {
        var %s = $gettok(%bug,%c,32)
        if (%carinha.barba) { var %face = %face  $+ $iif(%carinha.bone.en,$chr(3) $+ %carinha.bone $+ $chr(44) $+ %carinha.bone.fundo $+ $iif(%carinha.bone.en,%carinha.bone.edit)) $+ $chr(3) $+ %carinha.olho $+ , $+ %carinha.fundo $+ $left(%s,1) $+ $iif(%carinha.nariz.en,$chr(3) $+ %carinha.nariz $+ %carinha.nariz.edit) $+ $chr(3) $+ %carinha.boca $+ , $+ %carinha.boca.fundo $+ $`checkface($right(%s,-1)) $+ $return.autocor }
        else { var %face = %face  $+ $iif(%carinha.bone.en,$chr(3) $+ %carinha.bone $+ $chr(44) $+ %carinha.bone.fundo $+ $iif(%carinha.bone.en,%carinha.bone.edit)) $+ $chr(3) $+ %carinha.olho $+ , $+ %carinha.fundo $+ $left(%s,1) $+ $iif(%carinha.nariz.en,$chr(3) $+ %carinha.nariz $+ %carinha.nariz.edit) $+ $chr(3) $+ %carinha.boca $+ , $+ %carinha.boca.fundo $+ $`checkface($right(%s,-1)) $+ $iif(%carinha.barba,) $+ $iif(%carinha.barba,%carinha.barba) $+ $return.autocor }

      }
      else { var %face = %face $replace($gettok(%bug,%c,32),,0) }
      inc %c 
    }

    return $replace(%face,,0)

    halt
  }
}
return.autocor {
  if (%pop.util.autocor) return $acroutine($1-)
  return  $+ $1-
}
`checkface {
  unset %mf %cc

  tokenize 32 $replace($1-,$chr(32),¨(*)¨)

  var %c 1
  while (%c <= $len($1-)) {
    if ($mid($1-,1,1) === $mid($1-,%c,1) && (%ok == $null)) { inc %cc 1 | var %mf = %mf $+ $mid($1-,%c,1) }
    else { var %ok = ok | var %mf = %mf $+ $mid($1-,%c,1) }
    inc %c
  }
  var %var1 = $replace(%mf,¨(*)¨,$chr(32))
  var %var2 = %cc + 1

  unset %cc
  if (%carinha.barba) { return $mid(%var1,1,$calc(%var2 - 1)) $+  $+ %carinha.barba $+ $iif($mid(%var1,%var2),$remove($autocor($mid(%var1,%var2)), $strip(%carinha.barba))) }
  else { return $mid(%var1,1,$calc(%var2 - 1)) $+ $iif($mid(%var1,%var2), $+ $autocor($mid(%var1,%var2))) }
}











;; Encript..
`encript  return $replacecs($1-,a,å,A,Å,b,ß,c,©,D,Ð,e,ë,i,î,n,ñ,N,Ñ,o,ø,p,þ,r,®,S,§,u,ü,x,×)
`dencript return $replacecs($1-,å,a,Å,A,ß,b,©,c,Ð,D,ë,e,î,i,ñ,n,Ñ,N,ø,o,þ,p,®,r,§,S,ü,u,×,x)

;; Tabelas de cores
tabelacores !echo -a 1,0 0 0,1 1 0,2 2 0,3 3 0,4 4 0,5 5 0,6 6 0,7 7 0,8 8 0,9 9 0,10 10 0,11 11 0,12 12 0,13 13 0,14 14 0,15 15 

;; Complex
colorcomplex {
  if ($1) var %fra = $1-
  else var %fra = $$input(Texto:,qe,Requisição)
  tabelacores

  set %a1 $$input(Digite o número da 1ª cor:,qe,Requisição)
  set %a2 $$input(Digite o número da 2ª cor:,qe,Requisição) 

  echo  $+ %a1 $+ ,0¦|0, $+ %a1 $+ ¦| $+ %a2 $+ , $+ %a1 $+ ¦| $+ %a1 $+ , $+ %a2 $+ ¦|1, $+ %a2 $+ ¦| $+ %a2 $+ ,1¦|0,1 %fra $&
     $+ %a2 $+ ,1|¦1, $+ %a2 $+ |¦ $+ %a1 $+ , $+ %a2 $+ |¦ $+ %a2 $+ , $+ %a1 $+ |¦0, $+ %a1 $+ |¦ $+ %a1 $+ ,0|¦12 

  unset %a1 %a2
}

;; Blocos
b1 { if $1 == $null { fecho Use /b1 texto | halt } | echo 2,2  $1- $+ ! | echo 0,2  $1-  1,1!  | echo 2,2  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b2 { if $1 == $null { fecho Use /b2 texto | halt } | echo 3,3  $1- $+ ! | echo 8,3  $1-  1,1!  | echo 3,3  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b3 { if $1 == $null { fecho Use /b3 texto | halt } | echo 4,4  $1- $+ ! | echo 0,4  $1-  1,1!  | echo 4,4  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b4 { if $1 == $null { fecho Use /b4 texto | halt } | echo 8,8  $1- $+ ! | echo 3,8  $1-  1,1!  | echo 8,8  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b5 { if $1 == $null { fecho Use /b5 texto | halt } | echo 9,9  $1- $+ ! | echo 12,9  $1-  1,1!  | echo 9,9  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b6 { if $1 == $null { fecho Use /b6 texto | halt } | echo 11,11  $1- $+ ! | echo 2,11  $1-  1,1!  | echo 11,11  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b7 { if $1 == $null { fecho Use /b7 texto | halt } | echo 12,12  $1- $+ ! | echo 0,12  $1-  1,1!  | echo 12,12  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b8 { if $1 == $null { fecho Use /b8 texto | halt } | echo 13,13  $1- $+ ! | echo 1,13  $1-  1,1!  | echo 13,13  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b9 { if $1 == $null { fecho Use /b9 texto | halt } | echo 15,15  $1- $+ ! | echo 12,15  $1-  1,1!  | echo 15,15  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }
b10 { if $1 == $null { fecho Use /b10 texto | halt } | echo 5,5  $1- $+ ! | echo 0,5  $1-  1,1!  | echo 5,5  $1-  1,1! | echo 0,0 1,1 $1- $+ ! }

bbanner { 

  if (!$1) return

  tokenize 38 $1-

  echo  $+ $2 $+ , $+ $2  $3- $+ !
  echo  $+ $1 $+ , $+ $2  $3-  1,1!
  echo  $+ $2 $+ , $+ $2  $3-  1,1!
  echo  $+ $colour(back) $+ , $+ $colour(back) 1,1 $3- $+ !
}
;; Another
d0608 if ($left($date,5) == 06/08) { return 06/08 niver do Ha $+ fu $+ k :) ~  }

;; Diversas
variascores     say 1,1m2,2m3,3m4,4m5,5m6,6m7,7m8,8m9,9m10,10m11,11m12,12m13,13m14,14m15,15m $iif($1,$1-,$$input(Texto:,qe,Requisição)) 15,15m14,14m13,13m12,12m11,11m10,10m9,9m8,8m7,7m6,6m5,5m4,4m3,3m2,2m1,1m
setascoloridas  say 1,1--2,1--12,1--6,1--4,1--7,1--9,1--8,1--11,1>13,1 $iif($1,$1-,$$input(Texto:,qe,Requisição)) 11,1<8,1--9,1--7,1--4,1--6,1--12,1--2,1--1,1--
florestexto     say 3,1@4,1}----}--3,1 @4,1}----}--8,1 $iif($1,$1-,$$input(Texto:,qe,Requisição)) 4,1--{----{3,1@ 4,1--{----{3,1@ 0
coloracaosonora say 16,1(2(3(4(5(6(7(8(9(10(11(12(13(14(15(160 $iif($1,$1-,$$input(Texto:,qe,Requisição)) 15)14)13)12)11)10)9)8)7)6)5)4)3)2)16) 0
ondasdomar      say 2,1(¯`·._10,1(¯`·._11,1(¯`·._8,1( $iif($1,$1-,$$input(Texto:,qe,Requisição)) )11,1_.·´¯)10,1_.·´¯)2,1_.·´¯) 0

;; Degradèz
degrade {
  if ($1 == brasil) say 8,0´%0,8%,8,8 9,8`%8,9%,9,9 3,9`%9,3%,3,3 2,3`%3,2%,2,21,2`%2,1%,0 $$input(Texto:,qe,Requisição) 2,1`%1,2%,2,2 3,2`%2,3%,3,3 9,3`%3,9%,9,9 8,9`%9,8%8,8 0,8`%8,0%,
  else if ($1 == azul) say 11`%0,11%¸ 10`%11,10%¸ 12`%10,12%¸2`%12,2%¸ 1`%2,1%,0 $$input(Texto:,qe,Requisição) 2`%1,2%, 12`%2,12%, 10`%12,10%, 11`%10,11%, 0`%11,0%,
  else if ($1 == vermelha) say 4`%0,4%¸5`%4,5%¸ 1`%5,1%,0 $$input(Texto:,qe,Requisição) 5`%1,5%, 4`%5,4%, 0`%4,0%, 
  else if ($1 == verde) say 9`%0,9%¸3`%9,3%¸ 1`%3,1%,0 $$input(Texto:,qe,Requisição) 3`%1,3%, 9`%3,9%, 0`%9,0%, 
  else if ($1 == amarelo) say 8`%0,8%¸7`%8,7%¸ 1`%7,1%,0 $$input(Texto:,qe,Requisição) 7`%1,7%, 8`%7,8%, 0`%8,0%, 
  else if ($1 == violeta) say 13`%0,13%¸6`%13,6%¸ 1`%6,1%,0 $$input(Texto:,qe,Requisição) 6`%1,6%, 13`%6,13%, 0`%13,0%, 
  else if ($1 == preto) say 15`%0,15%¸ 14`%15,14%¸ 1`%14,1%¸0 $$input(Texto:,qe,Requisição) 14`%1,14%, 15`%14,15%, 0`%15,0%,
}

;; Reverse
reverse {
  if ($1- == $null) { fecho -a Use /reverse texto | halt }

  var %parms = $strip($1-,c)
  var %parms = $replace($1-,$chr(32),$chr(160))

  var %i = $len(%parms)
  while (%i > 0) { var %text = %text $+ $mid(%parms,%i,1) | dec %i }

  if ($isid) return $replace(%text,$chr(160),$chr(32))
  else fecho $replace(%text,$chr(160),$chr(32))
}

;; Horóscopo..
horoscopo {
  if ($1 == aries) {
    fmsg ÁRIES (23 mar a 23 abr) $iif($2,- $2 )
    fmsg Vc se axa mto honesto,íntegro, independente e poderoso. Bom,é o q vc acha. Vc adora mandar e botar tudo p/ ferver, desde q seja do seu jeito, mesmo $&
      q seja na porrada.E no fundo.. bem no fundo..é um coração-de-manteiga (embora d-e-t-e-s-t-e admitir). 
    fmsg Vc n consegue influenciar ninguém, apesar de ficar o tempo todo tentando exibir seu poder. Gosta de $&
      parecer mto liberal,mas fica desesperado se as coisas fogem do seu controle.Aliás, o q vc queria mesmo é dominar o mundo! Os arianos são ótimos juízes, sogras,lutadores de jiu-jitsu e professores de ed.física. 
  }
  else if ($1 == touro) {
    fmsg TOURO (23 abr a 22 mai) $iif($2,- $2 )
    fmsg Vc tem uma determinação canina e trabalha como um condenado. A maioria das pessoas pensa que vc é um pão-duro e cabeça-dura e estão certas. Sua $&
      persistência faz vc um puta de um chato.Vc é guloso, adora a natureza, o belo e ser amado. Taurinos são bons tri-atletas, vendedores de enciclopédia e decoradores. 
  }
  else if ($1 == gemeos) {
    fmsg GÊMEOS (23 mai a 22 jun) $iif($2,- $2 )
    fmsg Vc é comunicativo, curioso, bem humorado, inteligente e tem duas caras. Sua inconstância e preguiça fazem de vc um manipulador de primeira. $&
      Vc n liga pro que os outros sentem e adoram distribuir chifres por aí. Geminianos costumam fazer mto sucesso na política, no circo, na novela das 8 e pulando a cerca. 
  }
  else if ($1 == cancer) {
    fmsg CÂNCER (23 jun a 22 jul) $iif($2,- $2 )
    fmsg Vc é solidário, defensivo e compreensivo com os problemas das outras pessoas, o q faz de vc um xarope. Vc se acha pé frio e mal amado. $&
      Sua compaixão, sensibilidade e emotividade fazem do homem de Câncer uma tremenda de uma bichona. Os cancerianos são ótimos cabeleireiros, melhores amigas e leitores de romance. 
  }
  else if ($1 == leao) {
    fmsg LEÃO (23 jul a 22 ago) $iif($2,- $2 )
    fmsg Vc se considera um líder natural. Os outros acham vc um idiota completo.Vc é vaidoso, arrogante e impaciente, como se fosse a última Coca-Cola gelada do deserto e costuma lidar com críticas na base da $&
      porrada. Os leoninos são ótimos guardas de trânsito, ditadores e emergentes. 
  }
  else if ($1 == virgem) {
    fmsg VIRGEM (23 ago a 22 set) $iif($2,- $2 )
    fmsg Vc é do tipo lógico, trabalhador, analítico, tímido e odeia desordem. Sua atitude detalhista e organizada $&
      é enojante p/ seus amigos e colegas de trabalho.Vc é frio, não tem emoções e freqüentemente dorme enquanto está trepando. Virginianos dão bom cobradores $&
      de ônibus, costureiras e montadores de quebra-cabeças. 
  }
  else if ($1 == libra) {
    fmsg LIBRA (23 set a 22 out) $iif($2,- $2 )
    fmsg Vc é do tipo artístico, discreto,equilibrado e idealista, com mto gosto pelo harmonioso e esteticamente belo.Se você for homem, provavelmente é viado. Vc sente necessidade de proteger os outros $&
      e lutar contra as injustiças,mas esperando algo em troca. E embora não goste de admitir, é um puta teimoso irritante até o último! Os librianos são perfeitos na advocacia, arquitetura e gerenciando casas de tolerância. 
  }
  else if ($1 == escorpiao) {
    fmsg ESCORPIÃO (23 out a 22 nov) $iif($2,- $2 )
    fmsg Vc é o pior de todos:desconfiado, vingativo, obsessivo, rancoroso, frio, orgulhoso, pessimista, malicioso, cínico, fofoqueiro e traiçoeiro nos negócios. Você é o perfeito filho da puta, só ama sua $&
      mãe e a si mesmo.Aliás, alguns de vcs não amam nem a mãe! O escorpiano leva jeito para terrorista, nazista, dentista, fiscal da receita e juiz de futebol. 
  }
  else if ($1 == sagitario) {
    fmsg SAGITÁRIO (23 nov a 22 dez) $iif($2,- $2 )
    fmsg Vc é otimista, aventureiro, entusiástico e tem uma forte tendência a confiar na sorte. O q é necessário para quem é imprudente, exagerado, indisciplinado, irresponsável, infantil, sem concentração e limitado. $&
      Isso explica pq a maioria dos sagitarianos são bêbados.São ótimos garçons, jornalistas e bicheiros. 
  }
  else if ($1 == capricornio) {
    fmsg CAPRICÓRNIO (23 dez a 22 jan) $iif($2,- $2 )
    fmsg Vc é conservador, sério, frio e inflexível como uma baixela de inox.Sua fidelidade e paciência não encobrem seu lado materialista e ambicioso, mas quem $&
      se importa? Se a grana está entrando.. Os capricornianos são um sucesso com bancários, banqueiros, agiotas ou mesmo contando dinheiro em casa. 
  }
  else if ($1 == aquario) {
    fmsg AQUÁRIO (23 jan a 22 fev) $iif($2,- $2 )
    fmsg Vc tem uma mente inventiva e dirigida para o progresso.Vc mente e comete os mesmos erros repetidamente pq é imbecil e teimoso.Adora novelas, se reunir em grupos e ser fashion. Se você é $&
      homem, cuidado! Os aquarianos são ótimos sindicalistas e estilistas, às vezes, ambos ao mesmo tempo. 
  }
  else if ($1 == peixes) {
    fmsg PEIXES (23 fev a 22 mar) $iif($2,- $2 )
    fmsg Vc é do tipo sonhador, místico, sensível e costuma se doar muito. Se você é homem, as suas chances de $&
      ser viado são muito grandes.Vc é cheio de conselhos fúteis e não faz nada além de encher o saco de todos que se aproximam de vc.As piscianas dão boas apresentadoras de programa infantil e atrizes pornô. 
  }
}

;; Kiss
kiss {
  if ($isid) return $+(:,$str(1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*,$r(3,5))) 
  else fmsg $+(:,$str(1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*,$r(3,5)))
}

;; Morar juntos
morarjuntos { 
  fmsg 11,11             4x     2Que tal morarmos juntos?     3X         
  fmsg 11,11  4.-. 5_______|                                 3XXX         
  fmsg 11,11  4|14=4|5/     /  \  11,11                              3XXXXX       
  fmsg 11,11  4| |5_____|_""_|                             3XXXXXXX      
  fmsg 11,11  4|_|_5[×]4_|____|11jgs3¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸¸5X3¸¸¸¸¸¸¸¸ 
}

;; Happybirth
happybirth {
  fmsg 0......8 66666 
  fmsg 0.....1__|||||__0.........4F E L I Z 
  fmsg 0....1{._._._._.}0..4A N I V E R S Á R I O 
  fmsg 0..1__{._._._._.}__0......1 $1 !!! 
  fmsg 0.1`~~~~~~~~~~~~~~~`
}

;; Monumento
Monument {
  fmsg  7,1©º°¨¨°º©º°¨¨°º©º°¨¨°º©º°¥°º©º°¨¨°º©º°¨¨°º©º°¨¨°º© 
  fmsg 0,0t 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 y
  fmsg  0,0e 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥6¥0¥6 $1 ! 0,0¥6¥0¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 x
  fmsg  0,0x 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥14,14 ¥¥¥¥¥¥¥¥¥¥¥¥¥ 0,0¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 x 
  fmsg 0,0x 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 10,10¥ 7,1¥10,10~hi and welcome to~7,1¥10,10 ¥0,0 7,1¥0,0 ¥ 7,1¥0,0 ¥ 7,1¥0,0 e
  fmsg  0,0y 7,1¥0,0 ¥ 7,1¥0,0 2,2¥ 7,1¥2,2 ¥ 7,1¥2,2~~~~~~~~~~~~~~~~~~~7,1¥2,2 ¥ 7,1¥2,2 ¥0,0 7,1¥0,0 ¥ 7,1¥0,0 t 
  fmsg  7,1©º°¨¨°º©»»»»»MONUMENTO A $1 !«««««©º°¨¨°º© 
}

;; Nick em cores
n1ckcolor {
  fmsg 8,1 $1 9¯8`4°9²8º4¤9æ8=4¬9«8.4,9¸8_9¸4,8.9»4¬8=9æ4¤8º9²4°8`9¯ 
  fmsg 4,1 $1- 9>8<9(8(9(8(9°8>4 $1 ! 8<9°8)9)8)9)8>9<
  fmsg 9,1 $1- 9_8¸4,9.8»4¬9=8æ4¤9º8²4°9`8¯9`4°8²9º4¤8æ9=4¬8«9.4,8¸9_ 
}

;; Capoeira
jogarcapoeira {
  fmsg  0--2o/0---9o__0---------4/0----6__ __0---7\4 $1 ! $+ 12|0-----13o/ 
  fmsg  2__|0--9\/0----10\ __o0--4/ \o0----6|o0----7/\0----3__|0---12o\ 12/0--13|__ 
  fmsg  0--2|0---9|0-----10|0--10\0-----4\0----6|0----7|o0----3/o 3|0-----12|0---13|4 $me 5ensina4 $1 5a jogar capoeira! 
}

;; Charuto
charutodapaz {
  say 8,1 Cowboy $left(9, [ $me $+ !!!!!!!!! ] ) 4e o 9amigo $left(9, [ $1 $+ !!!!!!!!! ] )  
  say 11,1 precisam fumar o 13charuto da paz1,1 8,5¯¯1,1~~~ 
  say 8,5o)5,5~~~~~~~~~~~~~texxy~~~~~~~~~~~~~~~~~1,1~
  say 1,1 4«»»»»-´11«»»»»-´8«»»»»-´13«»»»»-´9«»»»»-´1,1~~ 
}

;; Me faz feliz
vocemefazfeliz { 
  say 4¯`+ 0,0:}10VOCÊ0,0: 4+´¯`+ 12 ME FAZ 4+´¯`+ 0,0-2FELIZ0,0- 4+´¯`+ 
  say 0,0@¿@4°¸0,0!!!!!4¸°0,0 >I< 4°¸0,0!!!!!4¸° 0,0luv 4°¸0BUMPS4¸° 0,0you 4°¸ 
  say 0,0texxy4+,¸,+10 $+ $left(9, [ $1 $+ !!!!!!!!! ] ) $+ 4+,¸,+12 $+ $left(9, [ $1 $+ !!!!!!!!! ] ) $+ 4+,¸,+2 $+ $left(9, [ $1 $+ !!!!!!!!! ] ) $+ 4+,¸
}

;; Centro do meu universo
centrodomeuuniverso {
  say 11,1~9`13*4.7,8:9*11`11'13.4"7'8;9`11*13^4"7'8,9*11;13~4`7;8.9,11*13`4.7`8*9~11;13*4~7`8;9,11.13'4*7`8.9;11'13;4`7*8^9" 
  say 9,1;11`13.4`7*8~9;11*13~4`7;8,9.11'13*4`7.8;9*4,1 $left(9, [ $1 $+ !!!!!!!!! ] ) 11,1*13`7.8^9.11*13`4~7.8.9;11`13*4.78`9*11^13"4'7, 
  say 9,1'11,13*4;7~8`9;11.4VOCÊ  $nick É O CENTRO DO MEU UNIVERSO8:9*13,4*7`9*8.9`11*13~4; 
  say 11,1.8'9,11*13;4~7`8;9.11,13*4`7.8`9*11~13;4*7~8`9;11,13.4'7*8`9.11;13*4`7`8;9.11^13.4*7`8~9.11.13;4`7*8.9^11;13.4,13^4"
}

;; Musicas juntos
quarternotes {
  say  0maya.2__0....... 
  say  0....2|=.0...4__0 1 $me & $1 
  say  0...2_|0....4|=.0... 1podem fazer 
  say  0..2(_)0...4_|0....1lindas musicas 
  say  0.......4(_)0... ...1juntos!
}

;; Moldura 3D
3dmoldure { 
  tokenize 32 $1-
  fmsg 1,1. $+ $2 $+ , $+ $2 $+ n $+ $3 $+ , $+ $3 $+ n1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1. $+ $2 $+ , $+ $2 $+ n $+ $3 $+ , $+ $3 $+ n1,1 $1 1,1_ 1,1_ $+ $&
    1,1. $+ $2 $+ , $+ $2 $+ n $+ $3 $+ , $+ $3 $+ n1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1. $+ $2 $+ , $+ $2 $+ n $+ $3 $+ , $+ $3 $+ n1,1
  fmsg 1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $8 $+ , $+ $8 $+ n $+ $9 $+ , $+ $9 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1 1_0,1 $1 1_ $+ $&
    1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $8 $+ , $+ $8 $+ n $+ $9 $+ , $+ $9 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $4 $+ , $+ $4 $+ n $+ $5 $+ , $+ $5 $+ n1,1
  fmsg 1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $8 $+ , $+ $8 $+ n $+ $9 $+ , $+ $9 $+ n1,1. $+ $2 $+ , $+ $2 $+ n $+ $3 $+ , $+ $3 $+ n1,1  $+ $8 $+ , $+ $8 $+ n $+ $9 $+ , $+ $9 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1.1,1 $1 1,1__ $+ $&
    1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1. $+ $8 $+ , $+ $8 $+ n $+ $9 $+ , $+ $9 $+ n1,1. $+ $2 $+ , $+ $2 $+ n $+ $3 $+ , $+ $3 $+ n1,1  $+ $8 $+ , $+ $8 $+ n $+ $9 $+ , $+ $9 $+ n1,1. $+ $6 $+ , $+ $6 $+ n $+ $7 $+ , $+ $7 $+ n1,1.1,1
}
