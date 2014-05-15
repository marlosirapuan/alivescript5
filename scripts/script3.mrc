;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   05/06/2009
; @data término  
;
; @titulo        ALIASES
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------


;; Remove todas as aliases atuais

alias __removeallaliases {
  .unload -a %getdiraliases
  .remove %getdiraliases
  .write -c %getdiraliases ;-------------------------------------------------------------------------------------------------------------------------------------
  .write %getdiraliases    ; Arquivo de aliase gerado dinâmicamente pelo o Alive Script. Se preferir adicionar seus aliases por aqui, LEIA ANTES:
  .write %getdiraliases    ; 
  .write %getdiraliases    ; 1) **NÃO** use múltiplas linhas
  .write %getdiraliases    ; 2) CUIDADO ao utilizar esse editor! Em caso de dúvidas, passar longe!
  .write %getdiraliases    ;-------------------------------------------------------------------------------------------------------------------------------------
  .reload -a %getdiraliases
}

;; Menu Window Aliases
menu @Aliases {
  dclick {
    if ($sline($active,1).ln >= 3) { 
      if ($server != $null) { 
        if ($lactive) && ($lactive != Status Window) { msg $lactive $gettok($sline($active,1),2,9) }
        else { __aviso ho Meus Aliases:Clique antes em um canal ou PVT para mostrar o aliase! :-) }
      }
      else { echo 1 $gettok($sline($active,1),2,9) }
    }
  }
  Adicionar:__opendialog aliases
  Editar: {
    if ($sline($active,1).ln) {
      set %edit.aliase.cmd $gettok($sline($active,1),1,9)
      set %edit.aliase.msg $gettok($sline($active,1),2,9)
    }
    __opendialog aliases
  }
  -
  Remover: {
    if ($sline($active,1).ln >= 3) { 
      if ($$input(Remover esse Aliase: $gettok($strip($sline($active,1)),1,9) ?,qy,Confirmação) == $true) {

        if (%getdiraliases == $null) { __aviso wo Erro Interno:Ocorreu um erro ao remover. Favor $+ $chr(44) feche esse janela e a caixa de Aliases e reabra novamente para corrigir. | return }

        //.alias %getdiraliases $gettok($strip($sline($active,1)),1,9)

        .saveini
        .reload -a %getdiraliases
        dline @aliases $sline($active,1).ln
      }
    }
  }
  Remover tudo: {
    if $$input(Remover TODOS os aliases da lista?,qy,Confirmação) == $true { 
      if (%getdiraliases == $null) { __aviso wo Erro Interno:Ocorreu um erro ao remover. Favor $+ $chr(44) feche esse janela e a caixa de Aliases e reabra novamente para corrigir. | return }

      __removeallaliases

      clear @aliases 
      aline $colour(ctcp) @Aliases /atalhos $+ $chr(9) $+ Mensagem dos aliases (duplo clique para mostrar)
      aline @Aliases $chr(160)
    }
  }
  -
  Fechar:unset %active | window -c @aliases
}
dialog aliases {
  title "Adicionar Aliases"
  size -1 -1 456 140
  icon $aliveicon

  text "Nome do seu /atalho: (Por exemplo: /bye):", 1, 9 13 213 15
  edit "", 2, 8 30 201 23, multi return autohs
  text "Mensagem: (não precisa colocar '/say' antes)", 3, 9 57 240 15
  edit "", 4, 8 74 433 23, return autohs
  button "Adicionar", 5, 145 105 75 25,default
  button "Fechar", 6, 226 105 75 25,ok
  text "Atalhos já incluídos:", 7, 244 33 95 13
  combo 8, 344 28 96 240, drop size
  button "Remover", 9, 380 52 60 18, disable
}
on *:dialog:aliases:*:*: {

  ;;; INIT
  if ($devent == init) {
    .timer 1 0 __doaliasesdlg
  }
  ;;; SCLICK
  if ($devent == sclick) {

    if ($did == 9) {
      if (%getdiraliases == $null) { __aviso wo Erro Interno:Ocorreu um erro ao remover. Favor $+ $chr(44) feche esse janela e a caixa de Aliases e reabra novamente para corrigir. | return }

      if ($$input(Deseja realmente remover esse aliase: $did(8).seltext ?,yw,Confirmação)) {
        //.alias %getdiraliases $did(8) 
        .saveini 
        .reload -a %getdiraliases 
        did -d $dname 8 $did(8).sel

        __doaliasesdlg 
        ;; if $window(@aliases) != $null { atalhos }
      }
    }

    if ($did == 8) {
      did -ra $dname 2 $did(8) | did -ra $dname 4 $gettok($isalias($did(8)).alias,2-,32) | did -e $dname 9
    }

    if ($did == 5) {
      if ($did(2) == $null) { __aviso ho Meus Aliases:Dê uma nome ao aliase! | did -f $dname 2 | halt }
      if ($did(4) == $null) { __aviso ho Meus Aliases:Coloque a mensagem do aliase! | did -f $dname 4 | halt }

      ;; default
      if ($istok(/xau /oi /tis /kb /kiss /rir /quit /q /p /j /q /k /s /w /n /rec,$did(2),32) == $true) { _msg Erro Esse nome de atalho já faz parte do script, escolha outro! Exemplo: $+($did(2),2) | halt }

      if ($isalias($did(2)) == $true) {

        if (%getdiraliases == $null) { __aviso wo Erro Interno:Ocorreu um erro ao adicionar. Favor $+ $chr(44) feche esse janela e a caixa de Aliases e reabra novamente para corrigir. | return }

        if ($$input(Já existe esse aliase ou na lista de aliase ou na configuração do script $crlf $crlf $+ Recomenda-se que procure na lista um não existente. Se for aliase $+ $chr(44) pode substituir. No entanto $+ $chr(44) se não tiver na lista é por que pode fazer parte do script $crlf $crlf $+ Deseja substituí-lo mesmo assim?,yw,Confirmação)) { 
          var %l = 1
          while $line(@aliases,%l) {
            if ($strip($gettok($line(@aliases,%l),1,9)) == $did(2)) { 
              rline @aliases %l $did(2) $+ $chr(9) $+ $iif($did(4),$did(4),noalias)
              goto p 
              halt 
            }
            inc %l
          }
          :p
          //.alias %getdiraliases $did(2) say $did(4)
          .saveini
          .reload -a %getdiraliases
        } 
        dialog -x aliases aliases
        halt
      }
      //.alias %getdiraliases $did(2) say $did(4)
      .saveini
      .reload -a %getdiraliases

      aline @aliases $did(2) $+ $chr(9) $+ $did(4)
      did -r $dname 2,4
      dialog -x aliases aliases

    }
  }

  ;;; EDIT
  if ($devent == edit) {
    if ($did == 2) {
      var %var = $did(2) 
      if $left(%var,1) != / { did -ra $dname 2 / $+ %var } 
      else { did -ra $dname 2 %var }
    }
  }
}

alias __doaliasesdlg { 
  if (%getdiraliases == $null) { __aviso wo Erro Interno:Ocorreu um erro ao carregar. Favor $+ $chr(44) feche esse janela e a caixa de Aliases e reabra novamente para corrigir. | return }

  .saveini 
  .reload -a %getdiraliases 

  did -r aliases 8 

  var %lines = 7 
  while (%lines <= $lines(%getdiraliases)) { 
    var %var = $read -l $+ %lines %getdiraliases
    did -a aliases 8 $gettok(%var,1,32) 
    inc %lines 
  }

  if (%edit.aliase.cmd) {
    did -ra aliases 2 %edit.aliase.cmd
    did -c aliases 8 $didwm(aliases,8,$did(aliases,2).text,0)
    did -e aliases 9
  }
  if (%edit.aliase.msg) did -ra aliases 4 %edit.aliase.msg

  unset %edit.aliase.cmd %edit.aliase.msg

}

;; Menu Frases Aliases e Piadas

alias `frases {
  if ($1 == begin) return -
  var %cc = 1
  while ($findfile($shortfn($mircdirdocs\frases\),*.txt,%cc)) {
    var %dir      = $ifmatch
    var %namemenu = $upper($mid($nopath($ifmatch),1,-4))
    if ($1 == %cc) return $replace(%namemenu,_,$chr(32)) $+ : echo 12 $replace(%namemenu,_,$chr(32)) $+ : $read(%dir)
    %cc = %cc + 1
  }
  if ($1 == end) return -
}

alias `piadas {
  if ($1 == begin) return -
  var %cc = 1
  while ($findfile($shortfn($mircdirdocs\piadas\),*.txt,%cc)) {
    var %dir      = $ifmatch
    var %namemenu = $upper($mid($nopath($ifmatch),1,-4))
    if ($1 == %cc) return $replace(%namemenu,_,$chr(32)) $+ : echo 12 $replace(%namemenu,_,$chr(32)) $+ : $read(%dir)
    %cc = %cc + 1
  }
  if ($1 == end) return -
}
alias `myaliases {
  if ($1 == begin) return -
  if ($1 == 1) return teste
  if ($1 == 2) return .teste 2:.
  if ($1 == end) return -
}
alias `myaliases_futebol {
  if ($1 == begin) return -

  var %t = 1
  while ($findfile($shortfn($mircdirdocs\aliases\futebol\),*.txt,%t)) {
    var %dir      = $ifmatch
    var %namemenu = $upper($mid($nopath($ifmatch),1,-4))
    if ($1 == %t) return $replace(%namemenu,_,$chr(32)) $+ : __openaliases`fut $+(%namemenu,$chr(127),%dir)

    %t = %t + 1
  }

  if ($1 == end) return -
}
alias __addtimefut {
  var %time = $lower($$input(Novo time:,129,Requisição))
  if ($exists($shortfn(docs\aliases\futebol\) $+ %time $+ .txt)) { __aviso ho Aliases:Já existe esse time adicionado na lista! | return }

  var %nomearquivo = $shortfn(docs\aliases\futebol\) $+ %time $+ .txt

  .write -c %nomearquivo ;-------------------------------------------------------------------------------------------------------------------------------------
  .write %nomearquivo    ; Arquivo de aliase gerado dinâmicamente pelo o Alive Script. Se preferir adicionar seus aliases por aqui, LEIA ANTES:
  .write %nomearquivo    ; 
  .write %nomearquivo    ; - **NÃO** use múltiplas linhas
  .write %nomearquivo    ; - CUIDADO ao utilizar esse editor!
  .write %nomearquivo    ;-------------------------------------------------------------------------------------------------------------------------------------

  __aviso io Aliases:Time $upper(%time) adicionado com sucesso!
}

;; Aliases para futebol

alias __openaliases`fut {
  tokenize 127 $1-

  if (!$1) return
  if ($window(@Aliases) != $null) { window -c @Aliases }

  set %active $iif($active == Status Window,"Status Window",$remove($active,=))

  window -c @Aliases
  var %f = " $+ $window(Status Window).font $+ "
  window -Ckl+w2 $iif(%f = Fixedsys,-t20,-t15) @Aliases " $+ $window(Status Window).font $+ " $window(Status Window).fontsize

  if ($1) titlebar @Aliases - $1 - Clique com o botão direito para Opções
  else titlebar @Aliases - Clique com o botão direito para Opções

  aline $colour(ctcp) @Aliases /atalhos $+ $chr(9) $+ Mensagem dos aliases (duplo clique enviar o aliase selecionado)
  aline @Aliases $chr(160)

  set %getdiraliases_temp $2
  .timer 1 0 __doaliases`fut %getdiraliases_temp
}

alias __doaliases`fut { 
  var %l = 7 
  var %l.window = $lines($1-)
  while (%l <= %l.window) {
    var %var = $read -l $+ %l $1-
    aline @Aliases $gettok(%var,1,32) $+ $chr(9) $+ $gettok(%var,3-,32)
    inc %l 
  } 
  if (%l > 0) {
    if ((%getdiraliases_temp != %getdiraliases) && (%getdiraliases_temp)) {
      if ($alias(%getdiraliases)) { 
        if ($nopath(%getdiraliases) != diversos.txt) .unload -a %getdiraliases 
      }
    }
    set %getdiraliases %getdiraliases_temp
    unset %getdiraliases_temp

    if ($alias(%getdiraliases) == $null) {
      .load -a %getdiraliases
    }
  }
  window -afklbC @Aliases
}


;; Aliases personalizadas

alias __openaliases {
  tokenize 127 $1-

  if (!$1) return
  if ($window(@Aliases) != $null) { window -c @Aliases }

  set %active $iif($active == Status Window,"Status Window",$remove($active,=))

  window -c @Aliases
  var %f = " $+ $window(Status Window).font $+ "
  window -Ckl+w2 $iif(%f = Fixedsys,-t20,-t15) @Aliases " $+ $window(Status Window).font $+ " $window(Status Window).fontsize

  if ($1) titlebar @Aliases - $1 - Clique com o botão direito para Opções
  else titlebar @Aliases - Clique com o botão direito para Opções

  aline $colour(ctcp) @Aliases /atalhos $+ $chr(9) $+ Mensagem dos aliases (duplo clique enviar o aliase selecionado)
  aline @Aliases $chr(160)

  set %getdiraliases_temp $2
  .timer 1 0 __doaliases %getdiraliases_temp
}

alias __doaliases { 
  var %l = 7 
  var %l.window = $lines($1-)
  while (%l <= %l.window) {
    var %var = $read -l $+ %l $1-
    aline @Aliases $gettok(%var,1,32) $+ $chr(9) $+ $gettok(%var,3-,32)
    inc %l 
  }

  .load -a %getdiraliases_temp
  set %getdiraliases %getdiraliases_temp

  window -afklbC @Aliases
}



;------------------------------------------------------------
; RISADAS, AMOR, OFENSA etc
;------------------------------------------------------------

alias __editaliases {
  if (!$1) return

  ; path
  %pop.file.aliase  = $+(docs\aliases\,$1-)
  ; win name
  %pop.win.aliase   = $+(@,Aliases,$chr(160),$upper($mid($1-,1,-4)))

  window -c %pop.win.aliase
  window -Ckl %pop.win.aliase
  titlebar %pop.win.aliase - Clique com o botão direito para mais Opções
  .timer 1 0 __dolaugh
}
alias __dolaugh {
  var %lines = 1
  while %lines <= $lines(%pop.file.aliase) {
    var %read = $read -l $+ %lines %pop.file.aliase
    aline %pop.win.aliase %read
    inc %lines
  }
  window -afklbC %pop.win.aliase
}
menu @Aliases * {
  dclick {
    if ($sline($active,1).ln >= 3) { 
      if ($server != $null) { 
        if ($lactive) && ($lactive != Status Window) { msg $lactive $sline($active,1) }
        else { __aviso ho Aliases:Clique antes em um canal ou PVT para mostrar o aliase! :-) }
      }
      else { echo 1 $sline($active,1) }
    }
  }
  Adicionar: .write %pop.file.aliase $$input(Adicionar:,129,Adicionar) | aline %pop.win.aliase $$!
  Editar: {
    var %laugh.line  = $sline($active,1).ln
    var %laugh.msg = $$input(Editar:,qe,Editar aliase,$sline($active,1))
    if (%laugh.msg) && (%laugh.line) {
      write -l $+ %laugh.line %pop.file.aliase %laugh.msg
      rline %pop.win.aliase %laugh.line %laugh.msg
    }
  }
  -
  $iif(!$lines(%pop.file.aliase), $style(2)) Remover: {
    if ($$input(Remover esse aliase?,qy,Confirmação) == $true) {
      var %l = $sline($active,1).ln 
      write -dl $+ %l %pop.file.aliase 
      dline $active %l
    }
  }
  $iif(!$lines(%pop.file.aliase), $style(2)) Remover tudo: { 
    if ($$input(Apagar todas as aliases adicionadas ?,qy,Confirmação) == $true) { 
      .remove %pop.file.aliase 
      clear %pop.win.aliase 
    }
  }
  -
  Copiar para o Clipboard:clipboard $sline($active,1)
  -
  Editar Arquivo:run notepad %pop.file.aliase
  -
  Fechar:window -c $active
}

menu @CloneScan {
  Fechar:window -c $active
}
menu @MaskScan {
  Fechar:window -c $active
}
