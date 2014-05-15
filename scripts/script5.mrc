;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   05/06/2009
; @data término  
;
; @titulo        DATABASE e ATUALIZACAO
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

alias checkdata { 
  if ($sock(dup)) { .sockclose dup | return } 
  sockopen dup www.alivescript.net 80
  deb socket aberto..
}

on *:sockopen:dup: {
  if ($sockerr != 0) { return }
  unset %z.*

  sockwrite -tn $sockname GET /script/data.php HTTP/1.0
  sockwrite -tn $sockname Host: www.alivescript.net
  sockwrite -tn $sockname $crlf
}
on *:sockread:dup: {
  if ($sockerr) { return }

  :volta
  .sockread %::data

  if (%::data == $null) { set %::data - }
  if (%::data == :START) { 
    set %start 1 

    unset %default.dmp3.chan.* %default.dmp3.netw.* 
    unset %default.dwarez.chan.* %default.dwarez.netw.* 
    unset %default.dchat.chan.* %default.dchat.netw.*
    unset %default.banner.* %default.news.* %default.radio.*
  }

  tokenize 58 %::data

  ;; Version
  ;; if ($1 == version) echo Versao: $2 lancada na data $3

  if ($1 == serverdefault)  set %default.server $2
  if ($1 == networkdefault) set %default.network $2
  if ($1 == netwservices) set %pop.networks.services $2-

  if ($1 == mp3) { 
    inc %z. [ $+ [ $1 ] ] 
    set %default.dmp3.chan. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $2 
    set %default.dmp3.netw. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $3
  }
  if ($1 == warez) { 
    inc %z. [ $+ [ $1 ] ] 
    set %default.dwarez.chan. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $2 
    set %default.dwarez.netw. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $3 
  }
  if ($1 == batepapo) { 
    inc %z. [ $+ [ $1 ] ] 
    set %default.dchat.chan. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $2 
    set %default.dchat.netw. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $3 
  }
  if ($1 == banner) { 
    inc %z. [ $+ [ $1 ] ] 
    set %default.banner. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $2 $+ & $+ $3 $+ & $+ $4- 
  }
  if ($1 == noticia) { 
    inc %z. [ $+ [ $1 ] ] 
    set %default.news. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $2 $+ : $+ $3- 
  }
  if ($1 == radio) { 
    inc %z. [ $+ [ $1 ] ] 
    set %default.radio. [ $+ [ %z. [ $+ [ $1 ] ] ] ] $2 $+ : $+ $3- 
  }

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  if ($sockbr == 0) { sockclose dup | return }
  if (!%::data) { goto volta }

  if (%::data == :CLOSE) { 
    if (%start) { deb oh right | unset %start %::data %z.* }
    sockclose dup 

    halt 
  }
  goto volta
}
alias deb {
  noop
  ;echo 1 -s $1-
}

alias shownews {
  echo -s  $+ %var
  echo 15 _ $str(_,40) _
  echo -s  $+ %var
  var %n = 1
  while ($var(%default.news.*,%n)) {
    var %news = $var($v1,1).value

    var %c.news = $gettok($gettok(%news,1,58),1,32)
    var %d.news = $gettok($gettok(%news,1,58),2-,32)
    var %m.news = $gettok(%news,2-,58)

    var %c1     = $left(%c.news,2)
    var %c2     = $mid(%c.news,3,2)
    var %c3     = $right(%c.news,2)

    echo -slfi16 $+(,%c1,$chr(44),%c1) $+(,%c2,$chr(44),%c2) $+(00,$chr(44),%c3) %d.news $+(,,%c1,>,) %m.news
    echo -s  $+ %var
    %n = %n + 1
  }
  echo 15 ¯ $str(¯,40) ¯
}
