;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   
; @data término  
;
; @titulo        CONFIGURACAO DE TEMAS
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

dialog temas {
  title "Temas"
  size -1 -1 675 449
  option pixels

  tab "Geral", 1, 129 7 540 413
  box "Info", 2, 136 34 527 87, tab 1
  text "Nome do Skin", 3, 145 52 80 16, tab 1 right
  edit "", 4, 227 50 150 21, tab 1
  box "Esquema de cores", 5, 136 121 527 107, tab 1
  edit "", 6, 227 72 150 21, tab 1
  edit "", 7, 227 94 150 21, tab 1
  text "Email", 8, 145 96 80 16, tab 1 right
  text "Autor", 9, 145 74 80 16, tab 1 right
  text "Cor número 1", 10, 150 140 78 16, tab 1 right
  edit "", 11, 231 137 21 21, tab 1
  text "Cor número 2", 12, 150 161 78 16, tab 1 right
  edit "", 13, 231 158 21 21, tab 1
  text "Cor número 3", 14, 150 183 78 16, tab 1 right
  edit "", 15, 231 180 21 21, tab 1
  text "Cor do fundo", 16, 150 204 78 16, tab 1 right
  edit "", 17, 231 201 21 21, tab 1
  check "&Negritar", 18, 257 202 62 20, tab 1
  check "&Negritar", 19, 257 181 62 20, tab 1
  check "&Negritar", 20, 257 159 62 20, tab 1
  check "&Negritar", 21, 257 138 62 20, tab 1
  check "&Sublinhar", 22, 321 138 68 20, tab 1
  check "&Sublinhar", 23, 321 159 68 20, tab 1
  check "&Sublinhar", 24, 321 181 68 20, tab 1
  check "&Sublinhar", 25, 321 202 68 20, tab 1
  text "Prefixo", 26, 403 157 50 16, tab 1 right
  edit "", 27, 456 154 100 21, tab 1
  text "Sufixo", 28, 403 178 50 16, tab 1 right
  edit "", 29, 456 175 100 21, tab 1

  tab "Fonte/Timestamp", 30
  box "Fonte", 31, 136 34 527 67, tab 30
  combo 32, 200 49 120 25, tab 30 size drop
  box "Timestamp", 33, 136 101 527 126, tab 30
  text "Fonte", 34, 147 51 50 16, tab 30 right
  text "Tamanho", 35, 147 74 50 16, tab 30 right
  combo 36, 200 71 120 25, tab 30 size drop
  edit "Tags: <sa>", 37, 142 160 514 61, tab 30
  edit "", 38, 142 136 273 21, tab 30
  check "&Timestamp ligado", 39, 143 116 105 20, tab 30

  tab "NickCor", 40
  box "Lista de nicks", 41, 136 34 214 194, tab 40
  list 42, 142 51 85 170, tab 40 size
  list 43, 228 51 85 170, tab 40 size
  text "Cor", 44, 314 51 32 16, tab 40 center
  edit "", 45, 316 68 28 21, tab 40

  tab "Eventos", 46
  box "Lista de Eventos", 47, 136 34 527 194, tab 46
  radio "Eventos Principais", 48, 143 57 100 20, tab 46 push
  radio "Eventos Textos", 49, 247 57 100 20, tab 46 push
  list 50, 142 79 102 142, tab 46 size
  text "Editar", 51, 250 81 50 16, tab 46
  edit "", 52, 245 98 410 48, tab 46
  edit "Tags:", 53, 245 147 410 74, tab 46

  tab "Whois", 54
  box "Whois/whowas", 55, 136 34 527 194, tab 54
  list 56, 142 51 115 170, tab 54 size
  text "Editar", 57, 263 51 50 16, tab 54
  edit "", 58, 258 68 398 48, tab 54
  edit "Tags:", 59, 258 117 398 104, tab 54

  tab "Outros", 60
  box "Selecione e edite", 61, 136 34 527 194, tab 60
  radio "Notices/CTCPs", 62, 143 57 100 20, tab 60 push
  radio "RAWs", 63, 247 57 100 20, tab 60 push
  radio "Misc.", 64, 351 57 100 20, tab 60 push
  list 65, 142 79 102 142, tab 60 size
  text "Editar", 66, 250 81 50 16, tab 60
  edit "", 67, 245 98 410 48, tab 60
  edit "Tags:", 68, 246 147 410 74, tab 60

  tab "Opções", 69
  box "Opções", 70, 136 34 527 194, tab 69
  check "&Limpar todas as janelas ao carregar um tema", 71, 144 55 238 20, tab 69
  check "&Esconder /names ao entrar no canal", 72, 144 72 199 20, tab 69
  check "&Carregar um tema aleatório ao abrir o script", 73, 144 90 248 20, tab 69
  box "Lista de Temas", 74, 5 4 122 442
  list 75, 11 20 110 420, size

  button "&Salvar", 76, 128 420 75 25
  button "&Remover", 77, 207 420 75 25
  button "&Carregar", 78, 516 420 75 25
  button "&Fechar", 79, 595 420 75 25,ok

  box "Prévia", 80, 136 228 527 182
  edit "", 81, 142 244 514 160
}
