;------------------------------------------------------------
; ALIVE SCRIPT by hafuk
; http://github.com/marlosirapuan/alivescript5
;
; @data inicio   11/11/2008
; @data término  
;
; @titulo        CONFIGURACAO PRINCIPAL
;
; @versao-data   v5 - ??/??/2009 - [...]
;------------------------------------------------------------

dialog configuracao {
  title "Opções Gerais"
  size -1 -1 633 444
  option pixels
  icon $aliveicon

  ;-------------------------------  
  ; Geral
  ;-------------------------------

  tab "geral", 1, 26 -50 593 47

  check "Colocar nick que citou você em um canal na editbox (lugar onde escreve)", 2, 178 20 380 20, tab 1
  check "Avisar à você com uma mensagem", 3, 196 38 190 20, tab 1
  check "Mostar menu de Helf-ops na lista de nicks", 4, 178 76 225 20, tab 1
  check "Habilitar comandos sem a barra (/) na janela de status", 5, 178 57 286 20, tab 1
  check "Usar cores do autocor em suas mensagens de quit", 6, 178 95 269 20, tab 1
  box "Sons", 7, 176 237 446 90, tab 1
  check "Ao abrir o script", 8, 185 254 101 20, tab 1
  combo 9, 185 274 209 25, tab 1 size drop
  button "Button", 10, 185 299 405 20, tab 1
  ;;check "Usar cores na carinha em suas mensagens de quit", 11, 178 114 269 20, tab 1
  button "!", 12, 592 299 23 20, tab 1
  box "Padrão", 13, 176 330 446 73, tab 1
  text "Máscara do ban", 14, 309 352 134 16, tab 1 right
  combo 15, 448 349 166 250, tab 1 size drop
  text "Máscara do ignore", 16, 323 374 120 16, tab 1 right
  combo 17, 448 371 166 250, tab 1 size drop
  check "Checar por novas versões ao iniciar o script", 18, 178 132 238 20, tab 1
  check "Ativar antidle, máximo de segundos", 19, 178 150 199 20, tab 1
  edit %pop.general.aidle.time, 20, 418 150 46 21, tab 1, center


  ;-------------------------------  
  ; Away
  ;-------------------------------

  tab "away", 21
  check "Ativar pager (/ctcp <nick> page <mensagem>)", 22, 178 20 255 20, tab 21
  text "Mensagens", 23, 178 43 79 16, tab 21
  check "Enviar aviso no canal ativo apenas ", 24, 195 60 195 20, tab 21
  check "Enviar aviso em todos os canais", 25, 195 78 180 20, tab 21
  check "Enviar aviso em todos os pvts abertos", 26, 195 96 209 20, tab 21
  check "Não enviar aviso à esses canais", 27, 195 114 180 20, tab 21
  list 28, 195 159 100 76, tab 21 size
  button "Adicionar", 29, 297 135 65 19, tab 21
  button "Remover", 30, 297 156 65 19, tab 21
  check "Permanecer away se conexão cair ou desconectar", 31, 178 240 262 20, tab 21
  edit "", 32, 194 135 100 21, tab 21  
  check "Auto-away se ficar inativo por", 33, 178 260 172 20, tab 21
  edit %pop.away.idletime, 34, 379 260 46 21, tab 21, center
  text "minutos", 35, 427 264 50 16, tab 21
  ;;check "Enviar aviso nos canais ao entrar no auto-away", 36, 197 295 256 20, tab 21
  check "Me avisar antes de entrar no auto-away", 37, 197 282 225 19, tab 21
  text "Informar away", 38, 178 335 77 20, tab 21
  combo 39, 254 332 123 200, tab 21 size drop
  text "minutos", 41, 427 333 50 16, tab 21, disable
  edit %pop.away.delay, 40, 379 331 46 21, tab 21, center, disable


  ;-------------------------------  
  ; Away > Config
  ;-------------------------------

  tab "away.config", 42
  text "Campo [1]:", 43, 186 32 98 16, tab 42 right
  edit %pop.away.campo1, 44, 287 29 186 21, tab 42
  text "Campo [2]:", 46, 186 53 98 16, tab 42 right
  edit %pop.away.campo2, 47, 287 50 186 21, tab 42
  text "Campo [3]:", 48, 186 75 98 16, tab 42 right
  edit %pop.away.campo3, 49, 287 72 186 21, tab 42
  ;box "Nickname", 45, 176 85 447 137, tab 42
  text "Os campos acima servem para você colocar link do seu orkut, twitter, msn se quiser e usá-lo no editor do away", 50, 186 94 395 30, tab 42 left
  ;combo 51, 288 103 184 25, tab 42 size drop
  ;text "Nickname padrão", 52, 186 128 98 16, tab 42 right
  ;edit "", 53, 287 126 185 21, tab 42
  ;text "Nickname away", 54, 186 152 98 16, tab 42 right
  ;edit "", 55, 287 148 185 21, tab 42
  ;text "Quando voltar do away, usar:", 56, 193 180 149 16, tab 42
  ;radio "Nickname padrão", 64, 344 178 107 20, tab 42
  ;radio "Nickname antigo", 65, 344 195 101 20, tab 42
  ;button "+", 62, 475 102 20 20, tab 42
  ;button "-", 63, 496 102 20 20, tab 42

  box "Motivos", 57, 176 136 447 178, tab 42
  list 58, 185 177 360 127, tab 42 size
  edit "", 59, 185 156 360 21, tab 42
  button "Adicionar", 60, 550 156 65 19, tab 42
  button "Remover", 61, 550 177 65 19, tab 42

  ;-------------------------------  
  ; Away > Mensagem
  ;-------------------------------

  tab "away.mensagem", 66
  text "Entrou em away", 67, 177 21 98 16, tab 66
  edit %pop.away.msgaway, 68, 175 36 444 21, tab 66, autohs
  ;edit "", 70, 175 74 444 21, tab 66
  text "Voltou do away", 71, 176 62 89 16, tab 66
  edit %pop.away.msgback, 72, 175 77 444 21, tab 66, autohs

  text "Preview:", 69, 176 125 69 16, tab 66
  button "PRÉVIA", 73, 175 143 444 72, tab 66

  text "Estilos salvos:", 74, 177 225 71 16, tab 66
  combo 75, 249 222 128 150, tab 66 size drop
  button "Salvar", 76, 379 222 65 20, tab 66
  button "Remover", 77, 379 243 65 20, tab 66
  text "Tags: <me>, <tempo>, <desde>, <motivo>, <motivovolta>, <page>, <campo1>, <campo2>, <campo3>, <script>", 78, 181 271 438 41, tab 66

  ;-------------------------------  
  ; Informacao
  ;-------------------------------

  tab "informacao", 79
  check "Info dos canais à cada 10 minutos", 80, 178 20 190 20, tab 79
  ;; combo 81, 381 18 118 24, tab 79 size drop
  check "Ao entrar no canal, mostrar censo", 82, 178 38 186 20, tab 79
  text "Mostrar no pvt", 84, 177 61 80 16, tab 79
  check "Nick entrou no canal", 83, 196 76 122 20, tab 79
  check "Nick saiu do canal", 85, 196 93 122 20, tab 79
  check "Nick kickado", 86, 196 111 90 20, tab 79
  check "Nick saiu do IRC", 87, 196 129 102 20, tab 79
  check "Canais em comum", 101, 196 147 110 20, tab 79
  check "Mostrar estatísticas ao abrir um pvt", 88, 178 208 197 20, tab 79
  check "Baixar foto do site da Virtualife e colocar no pvt com nick", 89, 178 190 299 20, tab 79
  check "Ao receber uma imagem via DCC, mostrá-la no pvt com nick", 90, 178 172 311 20, tab 79
  ;;check "Verificar seu lag à cada", 91, 178 227 136 20, tab 79
  ;;edit "", 92, 314 227 51 21, tab 79
  ;;text "segundos", 93, 368 230 53 16, tab 79
  ;;check "Detecar entrada de clones no canal", 94, 178 246 193 20, tab 79
  ;;check "Detectar no /whois", 95, 196 266 115 20, tab 79
  ;; combo 96, 371 282 118 24, tab 79 size drop
  ;; check "Mostrar resposta do /Whois", 97, 178 285 160 20, tab 79

  check "Usar fullname colorido", 98, 178 305 136 20, tab 79
  edit %ALIVE, 99, 177 325 444 21, tab 79
  icon 100, 177 347 444 22, $mircexe, tab 79
  button "Aplicar", 97, 566 370 55 22, tab 79
  text "OBS: Se estiver conectado, as alterações só serão aplicadas na próxima conexão", 96, 177 375 344 41, tab 79, multi

  ;-------------------------------  
  ; Layout > Toolbar
  ;-------------------------------

  tab "layout.toolbar", 102
  combo 103, 440 37 183 28, tab 102 size drop
  text "Ícones", 104, 362 40 74 16, tab 102 right
  button "Button", 105, 546 59 75 25, tab 102
  button "Button", 106, 546 86 75 25, tab 102
  button "Button", 107, 546 124 75 25, tab 102
  button "Button", 108, 546 169 75 25, tab 102
  button "Button", 109, 546 197 75 25, tab 102
  list 110, 186 60 354 334, tab 102 size
  button "Padrao", 111, 546 367 75 25, tab 102
  button "Button", 112, 546 253 75 25, tab 102
  button "Button", 113, 546 280 75 25, tab 102
  check "Ligar toolbar", 114, 178 20 100 20, tab 102

  ;-------------------------------  
  ; Layout > Statusbar
  ;-------------------------------

  tab "layout.statusbar", 115
  check "Ligar statusbar", 116, 178 20 100 20, tab 115
  radio "em cima", 92, 278 40 100 20, tab 115, group
  radio "em baixo", 93, 278 60 100 20, tab 115
  ;list 117, 186 60 354 334, tab 115 size
  ;button "Button", 118, 546 60 75 25, tab 115
  ;button "Button", 119, 546 124 75 25, tab 115
  ;button "Button", 120, 546 169 75 25, tab 115
  ;button "Button", 121, 546 197 75 25, tab 115
  ;button "Button", 122, 546 253 75 25, tab 115
  ;button "Button", 123, 546 280 75 25, tab 115
  ;combo 124, 440 37 183 28, tab 115 size drop
  ;text "Ícones", 125, 362 40 74 16, tab 115 right

  ;-------------------------------  
  ; Layout > Titulo
  ;-------------------------------

  tab "layout.titulo", 126
  button "Aplicar", 127, 568 375 55 22, tab 126
  list 128, 186 60 354 312, tab 126 size
  edit %mytitle, 129, 179 376 386 21, tab 126, autohs
  text "Estilos salvos", 130, 362 40 74 16, tab 126 right
  combo 131, 440 37 183 28, tab 126 size drop
  button "Salvar", 132, 546 59 75 25, tab 126
  button "Button", 133, 546 86 75 25, tab 126
  ;;check "Animação", 134, 544 145 73 20, tab 126
  ;;combo 135, 543 165 79 27, tab 126 size drop
  ;;edit "", 136, 542 193 80 21, tab 126

  ;-------------------------------  
  ; Layout > Papel de parede
  ;-------------------------------

  tab "layout.papelparede", 137
  check "Ligar papel de parede", 138, 178 20 131 20, tab 137
  text "Atenção: com o uso de papel de parede, as mensagens nas janelas ficarão um pouco mais lentas", 139, 184 49 435 30, tab 137
  text "Selecionar figura", 140, 201 105 89 16, tab 137
  radio "Figura 1", 141, 226 121 100 20, tab 137
  radio "Figura 2", 142, 226 139 100 20, tab 137
  radio "Figura 3", 143, 226 158 100 20, tab 137
  radio "Escolher", 144, 226 176 68 20, tab 137
  edit "", 145, 293 176 271 21, tab 137
  button "Procurar", 146, 567 176 51 19, tab 137
  text "Alinhar imagem", 147, 293 201 80 16, tab 137
  radio "Center", 148, 295 217 59 20, tab 137
  radio "Fill", 149, 295 235 44 20, tab 137
  radio "Normal", 150, 295 254 61 20, tab 137
  radio "Stretch", 151, 295 273 64 20, tab 137
  radio "Tile", 152, 295 292 44 20, tab 137

  ;-------------------------------  
  ; Editar
  ;-------------------------------

  tab "editar", 153
  list 154, 180 20 444 294, tab 153 size
  edit "", 155, 180 315 444 21, tab 153, autohs
  button "previa", 156, 180 337 444 42, tab 153
  button "Resetar", 157, 555 382 68 21, tab 153
  button "Salvar", 134, 180 382 68 21, tab 153

  ;-------------------------------  
  ; Editar > Onotice
  ;-------------------------------

  tab "editar.onotice", 158
  box "Cores", 159, 181 57 435 100, tab 158
  icon 160, 190 127 417 21, $mircexe, tab 158
  button "Padrão", 161, 541 161 75 25, tab 158
  edit %myonotice.left, 162, 190 79 130 21, tab 158, right autohs
  check "#canal", 163, 324 79 57 20, tab 158
  edit %myonotice.right, 164, 383 78 130 21, tab 158, autohs
  ;check "espaço", 165, 453 98 59 20, tab 158
  text "Personalize abaixo como irá aprecer suas mensagens em Onotice (entre operadores)", 166, 179 29 412 16, tab 158

  ;-------------------------------  
  ; Janelas
  ;-------------------------------

  tab "janela", 182
  text "ChanServ:", 183, 358 50 73 20, tab 182, right
  combo 184, 436 46 120 100, tab 182 size drop
  text "NickServ:", 185, 358 72 73 20, tab 182, right
  combo 186, 436 68 120 100, tab 182 size drop
  text "MemoServ:", 187, 358 92 73 20, tab 182, right
  combo 188, 436 90 120 100, tab 182 size drop
  text "BotServ:", 190, 358 114 73 20, tab 182, right
  combo 191, 436 112 120 100, tab 182 size drop

  box "Mostrar mensagens dos serviços abaixo", 192, 193 28 400 116, tab 182

  ;text "segundos", 185, 413 22 50 16, tab 182
  ;text "Gerar nickname com", 186, 289 76 100 16, tab 182
  ;text "caracteres", 187, 430 75 58 16, tab 182
  ;edit "", 188, 390 73 38 21, tab 182
  ;button "Gerar!", 189, 349 98 75 25, tab 182
  ;edit "", 190, 288 129 198 21, tab 182
  ;box "Gerar nickname", 191, 178 53 442 116, tab 182
  ;button "copiar", 192, 486 129 43 19, tab 182

  ;-------------------------------  
  ; Utilitarios - Autocor
  ;-------------------------------

  tab "util.autocor", 193
  check "Ligar autocor", 194, 178 20 92 20, tab 193
  box "", 195, 178 46 443 50, tab 193
  edit %autocor.pre, 197, 187 64 50 21, tab 193, autohs right
  edit %autocor.suf, 196, 564 64 50 21, tab 193, autohs
  icon 198, 238 64 324 22, $mircexe, tab 193
  box "Cores", 201, 178 88 443 168, tab 193
  combo 210, 186 107 134 150, tab 193 size drop

  box "Efeitos", 200, 178 248 443 88, tab 193
  box "Mais frescuras", 199, 178 328 443 76, tab 193
  check "Tëxtð ëѩ®îþTåÐð", 202, 186 306 115 20, tab 193
  check "VoGaL MiNúSCuLa", 203, 186 266 110 20, tab 193
  check "T3xt0 3m num3r05", 204, 186 286 113 20, tab 193
  combo 206, 425 266 95 150, tab 193 size drop
  check "Efeito fogoió", 207, 330 266 87 20, tab 193

  check "Alternar", 205, 330 286 62 20, tab 193
  check "Reverso", 208, 348 305 63 20, tab 193
  check "Negrito", 209, 414 305 58 20, tab 193
  check "Sublinhado", 214, 476 306 74 20, tab 193

  check "Negritar", 211, 186 139 65 20, tab 193
  check "Sublinhar", 212, 186 157 69 20, tab 193
  check "Maiúscula", 213, 186 181 71 20, tab 193


  ;; cor fundo
  ;icon 215, 424 225 22 22, $mircexe, tab 193
  ;check "Cor fundo", 216, 330 225 69 20, tab 193

  ;; 6ª cor
  check "Cor nº 6", 217, 330 215 64 20, tab 193 
  ;text "letra", 218, 398 208 25 16, tab 193 right
  icon 219, 404 215 22 22, $mircexe, tab 193
  ;text "fundo", 220, 467 208 32 16, tab 193 right
  icon 221, 430 215 22 22, $mircexe, tab 193

  ;; 5ª cor
  icon 222, 430 195 22 22, $mircexe, tab 193
  ;text "fundo", 223, 467 188 32 16, tab 193 right
  icon 224, 404 195 22 22, $mircexe, tab 193
  ;text "letra", 225, 398 188 25 16, tab 193 right
  check "Cor nº 5", 226, 330 195 64 20, tab 193

  ;; 4ª cor
  check "Cor nº 4", 227, 330 175 64 20, tab 193
  ;text "letra", 228, 398 168 25 16, tab 193 right
  icon 229, 404 175 22 22, $mircexe, tab 193
  ;text "fundo", 230, 467 168 32 16, tab 193 right
  icon 231, 430 175 22 22, $mircexe, tab 193

  ;; 3ª cor
  icon 232, 430 155 22 22, $mircexe, tab 193
  ;text "fundo", 233, 467 148 32 16, tab 193 right
  icon 234, 404 155 22 22, $mircexe, tab 193
  ;text "letra", 235, 398 148 25 16, tab 193 right
  check "Cor nº 3", 236, 330 155 64 20, tab 193

  ;; 2ª cor
  check "Cor nº 2", 237, 330 135 64 20, tab 193
  ;text "letra", 238, 398 128 25 16, tab 193 right
  icon 239, 404 135 22 22, $mircexe, tab 193
  ;text "fundo", 240, 467 128 32 16, tab 193 right
  icon 241, 430 135 22 22, $mircexe, tab 193

  ;; 1ª cor
  icon 242, 430 115 22 22, $mircexe, tab 193
  text "fundo", 243, 427 98 32 16, tab 193 right
  icon 244, 404 115 22 22, $mircexe, tab 193
  text "letra", 245, 398 98 25 16, tab 193 right
  check "Cor nº 1", 246, 330 114 64 20, tab 193 

  ;; Cor sem nome
  ;; 2ª cor
  icon 600, 404 135 22 22, $mircexe, tab 193
  icon 601, 430 135 22 22, $mircexe, tab 193
  check "Cor nº 2", 602, 330 135 64 20, tab 193

  ;; 1ª cor
  icon 603, 430 115 22 22, $mircexe, tab 193
  icon 604, 404 115 22 22, $mircexe, tab 193
  check "Cor nº 1", 605, 330 114 64 20, tab 193

  check "Negritar", 606, 466 116 64 20, tab 193
  check "Sublinhar", 607, 535 116 64 20, tab 193

  check "Negritar", 608, 466 136 64 20, tab 193
  check "Sublinhar", 609, 535 136 64 20, tab 193

  ;; Cor no espaço
  ;; 2ª cor
  icon 610, 404 135 22 22, $mircexe, tab 193
  icon 611, 430 135 22 22, $mircexe, tab 193
  check "Cor nº 2", 612, 330 135 64 20, tab 193

  ;; 1ª cor
  icon 613, 430 115 22 22, $mircexe, tab 193
  icon 614, 404 115 22 22, $mircexe, tab 193
  check "Cor nº 1", 615, 330 114 64 20, tab 193

  check "Negritar", 616, 466 116 64 20, tab 193
  check "Sublinhar", 617, 535 116 64 20, tab 193

  check "Negritar", 618, 466 136 64 20, tab 193
  check "Sublinhar", 619, 535 136 64 20, tab 193

  ;; Cor assim e tal
  ;; 2ª cor 
  icon 620, 404 135 22 22, $mircexe, tab 193
  icon 621, 430 135 22 22, $mircexe, tab 193
  check "Cor nº 2", 622, 330 135 64 20, tab 193

  ;; 1ª cor
  icon 623, 430 115 22 22, $mircexe, tab 193
  icon 624, 404 115 22 22, $mircexe, tab 193
  check "Cor nº 1", 625, 330 114 64 20, tab 193

  check "Negritar", 626, 466 116 64 20, tab 193
  check "Sublinhar", 627, 535 116 64 20, tab 193

  check "Negritar", 628, 466 136 64 20, tab 193
  check "Sublinhar", 629, 535 136 64 20, tab 193


  ;; Cor Fraco&Forte
  ;; 1ª cor
  icon 633, 430 115 22 22, $mircexe, tab 193
  icon 634, 404 115 22 22, $mircexe, tab 193
  check "Cor nº 1", 635, 330 114 64 20, tab 193

  ;; 2ª cor 
  icon 630, 404 135 22 22, $mircexe, tab 193
  icon 631, 430 135 22 22, $mircexe, tab 193
  check "Cor nº 2", 632, 330 135 64 20, tab 193

  ;; 3ª cor
  icon 636, 430 155 22 22, $mircexe, tab 193
  icon 637, 404 155 22 22, $mircexe, tab 193
  check "Cor nº 3", 638, 330 154 64 20, tab 193

  ;; Fundo
  ;icon 639, 430 175 22 22, $mircexe, tab 193
  check "Cor à esquerda", 640, 330 176 94 20, tab 193



  text "Tag: <contar>", 247, 186 369 79 16, tab 193
  check "Contar msgs", 248, 186 347 88 20, tab 193
  edit "", 249, 273 347 128 21, tab 193, autohs
  text "contagem", 250, 320 373 50 16, tab 193, autohs
  edit "", 251, 370 370 31 21, tab 193
  text "Alternar prefixo e sufixo", 252, 415 343 156 16, tab 193
  ;check "", 253, 414 359 15 20, tab 193
  check "Prefixo", 254, 429 359 58 20, tab 193
  ;check "", 255, 414 378 15 20, tab 193
  check "Sufixo", 256, 429 378 56 20, tab 193
  button "Editar", 257, 555 359 58 18, tab 193
  button "Editar", 258, 555 378 58 18, tab 193
  text "Caractér entre espaços", 259, 495 209 125 16, tab 193
  edit %autocor.charspace, 260, 496 227 30 21, tab 193
  button "·", 261, 540 227 19 19, tab 193
  button "¸", 262, 560 227 19 19, tab 193
  button "°", 263, 580 227 19 19, tab 193

  ;-------------------------------  
  ; Utilitarios - Carinha
  ;-------------------------------

  tab "util.carinha", 264
  check "Ligar carinha colorida", 265, 178 20 126 20, tab 264

  box "Cores", 266, 268 199 343 124, tab 264
  box "Adicionar", 267, 268 45 343 70, tab 264
  box "Lista", 268, 187 45 77 356, tab 264

  icon 269, 314 63 63 21, $mircexe, tab 264

  button "Adicionar", 270, 378 63 58 19, tab 264
  button "Remover", 271, 378 84 58 19, tab 264

  edit "", 274, 276 63 37 21, tab 264

  radio "Com nariz", 272, 279 128 74 20, tab 264, group
  radio "Sem nariz", 273, 279 147 72 20, tab 264
  edit %carinha.nariz.edit, 277, 354 136 37 21, tab 264
  check "Boné", 275, 429 136 44 20, tab 264
  edit %carinha.bone.edit, 276, 477 136 37 21, tab 264
  text "Barbinha", 278, 295 171 50 16, tab 264 right
  edit %carinha.barba, 279, 354 168 37 21, tab 264
  list 280, 195 63 59 310, tab 264 size

  text "Boca", 281, 313 247 31 16, tab 264 right
  text "Olho", 282, 313 228 31 16, tab 264 right

  icon 283, 346 283 22 22, $mircexe, tab 264 ;bone
  icon 284, 367 283 22 22, $mircexe, tab 264 ;bone fundo

  icon 285, 346 223 22 22, $mircexe, tab 264 ;olho
  icon 286, 367 223 22 22, $mircexe, tab 264 ;olho fundo

  icon 287, 367 243 22 22, $mircexe, tab 264 ;boca fundo
  icon 288, 346 243 22 22, $mircexe, tab 264 ;boca

  icon 289, 346 263 22 22, $mircexe, tab 264 ;nariz
  box "" 290, 369 260 18 24, tab 264

  text "Nariz", 291, 313 266 31 16, tab 264 right
  text "Boné", 292, 313 285 31 16, tab 264 right

  button "Reset", 293, 196 375 58 21, tab 264
  button "Reset", 294, 400 248 58 21, tab 264
  link "Dicionário de emoticons", 295, 497 386 117 16, tab 264

  ;-------------------------------  
  ; Utilitarios - Completacao de nick
  ;-------------------------------

  tab "util.nc", 296
  box "Prévia", 297, 203 349 382 53, tab 296
  box "Opções", 298, 203 275 382 72, tab 296
  box "Usar esse(s)", 299, 445 31 140 240, tab 296
  box "Estilos", 300, 203 31 140 240, tab 296
  text "Ativadores", 301, 207 296 59 16, tab 296 right
  edit %ativadores, 302, 268 294 32 21, tab 296
  check "Encriptar nick", 303, 211 318 86 20, tab 296
  list 304, 211 48 123 214, tab 296 size sort
  list 305, 453 48 123 214, tab 296 size sort
  icon 306, 211 369 367 22, $mircexe, tab 296
  button "4", 307, 356 93 75 25, tab 296
  button "3", 308, 356 120 75 25, tab 296
  button "Editor", 309, 356 204 75 25, tab 296
  check "Mostrar modos do nick", 310, 312 318 134 20, tab 296

  ;-------------------------------  
  ; Atalhos Personalizados
  ;-------------------------------

  tab "atalhos", 311
  list 312, 181 20 441 354, tab 311 size
  text "Duplo clique para editar um atalho", 313, 181 376 195 16, tab 311
  button "Resetar", 314, 545 376 75 25, tab 311

  ;-------------------------------  
  ; Protecoes > Canal
  ;-------------------------------

  tab "prot.canal", 315
  text "Selecione um canal", 316, 194 40 112 16, tab 315 right
  combo 317, 310 37 183 28, tab 315 size drop
  button "Adicionar", 318, 495 36 62 22, tab 315
  button "Remover", 319, 559 36 62 22, tab 315
  check "Usar definição padrão para todos os canais", 320, 187 69 232 20, tab 315
  list 321, 186 91 435 202, tab 315 size
  button "Alterar", 322, 186 295 75 25, tab 315
  box "Opcoes", 323, 180 327 440 75, tab 315
  check "Lhe avisar da ação no balão (tips)", 324, 188 347 187 20, tab 315

  ;-------------------------------  
  ; Protecoes > Pessoal
  ;-------------------------------

  ;tab "prot.pessoal", 325
  ;list 326, 186 25 435 224, tab 325 size
  ;button "Alterar", 327, 186 252 75 25, tab 325
  ;box "Opcoes", 328, 180 327 440 75, tab 325
  ;check "Lhe avisar da ação no balão (tips)", 329, 188 347 187 20, tab 325

  ;-------------------------------  
  ; Protecoes > Exclusos
  ;-------------------------------

  tab "prot.exclusos", 330
  list 331, 186 80 354 224, tab 330 size
  button "Adicionar", 332, 546 80 75 25, tab 330
  button "Remover", 333, 546 107 75 25, tab 330
  button "Editar", 334, 546 147 75 25, tab 330
  button "Limpar", 335, 546 203 75 25, tab 330
  check "Proteger também quem estiver na lista de protegidos do mIRC", 336, 186 308 324 20, tab 330
  text "Os nicks/hosts adicionados abaixo não sofrerão ação das suas proteções de canais", 337, 183 44 424 32, tab 330

  ;-------------------------------  
  ; Canais Favoritos
  ;-------------------------------

  tab "chanfav", 338
  list 339, 180 126 440 151, tab 338 size
  button "Adicionar", 340, 244 95 75 25, tab 338
  button "Remover", 341, 324 95 75 25, tab 338
  button "Atualizar", 342, 403 95 75 25, tab 338
  edit "", 343, 271 46 188 21, tab 338
  combo 344, 272 23 187 150, tab 338 size drop
  text "Rede", 345, 217 26 50 16, tab 338 right
  text "Canal favorito", 346, 176 49 90 16, tab 338 right
  box "Opções", 347, 180 282 440 120, tab 338
  radio "Ao digitar o comando /ajoin ou /cjoin", 348, 282 319 198 20, tab 338, group
  radio "Ao conectar", 349, 282 336 87 20, tab 338
  radio "Ao ser reconhecido pelo o NickServ/L bot", 350, 282 354 223 20, tab 338
  radio "Desligado", 354, 282 373 73 20, tab 338
  text "Descrição", 351, 217 71 50 16, tab 338 right
  edit "", 352, 271 68 188 21, tab 338, autohs
  button "Entrar", 353, 536 95 75 25, tab 338
  text "Entrar nos canais", 355, 190 321 90 16, tab 338
  check "Minimizar canais", 356, 189 298 100 20, tab 338
  ; check "Entrar nos canais após se identificar", 357, 189 280 200 20, tab 338
  button "+", 358, 462 22 20 20, tab 338
  button "-", 359, 483 22 20 20, tab 338

  ;-------------------------------  
  ; Servicos
  ;-------------------------------

  tab "servicos", 360
  button "Undernet", 361, 352 205 75 25, tab 360
  button "Quakenet", 362, 352 174 75 25, tab 360
  button "NickServ", 363, 353 143 75 25, tab 360
  text "Clique para configurar ou selecione uma sub-categoria ao lado", 364, 242 103 312 19, tab 360 center
  button "GameSurge", 365, 352 235 75 25, tab 360

  ;-------------------------------  
  ; Servicos > NickServ
  ;-------------------------------

  tab "servicos.nickserv", 366
  text "Rede", 367, 217 26 50 16, tab 366 right
  combo 381, 272 23 187 150, tab 366 size drop
  button "+", 368, 462 22 20 20, tab 366
  button "-", 369, 483 22 20 20, tab 366
  text "Nickname", 370, 178 49 88 16, tab 366 right, disabled
  edit "", 382, 271 46 188 21, tab 366, disabled
  text "Senha", 371, 217 71 50 16, tab 366 right, disabled
  edit "", 372, 271 68 188 21, tab 366, password, disabled

  text "Nickname away", 167, 177 95 90 16, tab 366 right, disabled
  edit "", 168, 271 90 188 21, tab 366, disabled

  button "Adicionar", 373, 274 235 75 25, tab 366, disabled
  button "Remover", 374, 354 235 75 25, tab 366, disabled
  button "Atualizar", 376, 433 235 75 25, tab 366

  box "Opções", 377, 180 132 440 100, tab 366, disabled
  radio "Usar /nickserv identify <senha>", 378, 189 150 180 20, tab 366, group, disabled
  radio "Usar /msg nickserv identify <senha>", 379, 189 168 200 20, tab 366, disabled
  check "Recuperar quando nick estiver em uso (anti-ghost)", 380, 189 192 269 20, tab 366, disabled

  list 375, 180 266 440 131, tab 366 size sort, disabled

  ;-------------------------------  
  ; Servicos > Quakenet
  ;-------------------------------

  tab "servicos.qnet", 383
  box "Q bot", 384, 180 24 440 160, tab 383
  text "Nickname", 385, 217 46 50 16, tab 383 right
  edit "", 386, 272 43 188 21, tab 383
  text "Senha", 387, 217 68 50 16, tab 383 right
  edit "", 388, 272 65 188 21, tab 383
  check "Autenticar automaticamente ao se conectar na Quakenet", 389, 190 102 300 20, tab 383
  check "Esconder host ao se autenticar (usermode +x)", 390, 190 120 247 20, tab 383
  check "Requisitar op/voice do Q/bot ao perder", 391, 190 138 215 20, tab 383
  text "FAQ Quakenet (em inglês)", 392, 180 196 131 16, tab 383
  link "http://www.quakenet.org/faq/faq.php?c=1", 393, 180 213 230 16, tab 383
  link "http://www.quakenet.org/", 394, 181 231 230 16, tab 383

  ;-------------------------------  
  ; Servicos > Undernet
  ;-------------------------------

  tab "servicos.under", 395
  box "X bot", 396, 180 24 440 160, tab 395
  text "Nickname", 397, 217 46 50 16, tab 395 right
  edit "", 398, 272 43 188 21, tab 395
  text "Senha", 399, 217 68 50 16, tab 395 right
  edit "", 400, 272 65 188 21, tab 395
  check "Autenticar automaticamente ao se conectar na Undernet", 401, 190 102 300 20, tab 395
  check "Esconder host ao se autenticar (usermode +x)", 402, 190 120 247 20, tab 395
  check "Requisitar op/voice do X/bot ao perder", 403, 190 138 213 20, tab 395
  text "FAQ Undernet (em inglês)", 404, 180 196 131 16, tab 395
  link "http://www.undernet.org/", 405, 180 213 149 16, tab 395
  link "http://cservice.undernet.org/", 406, 180 231 160 16, tab 395

  ;-------------------------------  
  ; Servicos > Gamesurge
  ;-------------------------------

  tab "servicos.gamesurge", 407
  box "Authserv bot", 408, 180 24 440 160, tab 407
  text "Nickname", 409, 217 46 50 16, tab 407 right
  text "Senha", 410, 217 68 50 16, tab 407 right
  edit "", 411, 272 43 188 21, tab 407
  edit "", 412, 272 65 188 21, tab 407
  check "Esconder host ao se autenticar (usermode +x)", 413, 190 120 247 20, tab 407
  check "Autenticar automaticamente ao se conectar na Gamesurge", 414, 190 102 315 20, tab 407
  check "Requisitar op/voice do X/bot ao perder", 415, 190 138 213 20, tab 407
  text "FAQ GameSurge (em inglês)", 416, 180 196 144 16, tab 407
  link "http://www.gamesurge.net/faq/", 417, 180 231 160 16, tab 407
  link "http://www.gamesurge.net/", 418, 180 213 149 16, tab 407
  check "Recuperar quando nick estiver em uso (anti-ghost)", 419, 190 157 272 20, tab 407



  ;-------------------------------  
  ; Padrão
  ;-------------------------------
  list 1000, 3 8 160 406, size
  box "Geral" , 1001, 168 3 462 410
  button "OK" , 1002, 554 416 75 25, ok
  link $strip(%site), 1003, 6 424 147 16

}

alias -l __selectedconfig {
  ; recebe nome da dialog
  var %tmpdlg = $gettok($1,1,32)    

  ; recebe id do menu selecionado (list)
  var %tmpid  = $gettok($2-,4-,32)  

  ;;;;;;;;;;;;;;;;;;;; Geral
  if (%tmpid == 2) { did -f %tmpdlg 1 | did -ra %tmpdlg 1001 Geral }

  ;;;;;;;;;;;;;;;;;;;; Away
  else if (%tmpid == 3) { did -f %tmpdlg 21 | did -ra %tmpdlg 1001 Away }

  ;;;;;;;;;;;;;;;;;;;; Away > Config
  else if (%tmpid == 3 2) { did -f %tmpdlg 42 | did -ra %tmpdlg 1001 Opções do away }

  ;;;;;;;;;;;;;;;;;;;; Away > Mensagem
  else if (%tmpid == 3 3) { did -f %tmpdlg 66 | did -ra %tmpdlg 1001 Editar mensagem }

  ;;;;;;;;;;;;;;;;;;;; Informacao
  else if (%tmpid == 4) { did -f %tmpdlg 79 | did -ra %tmpdlg 1001 Informação }

  ;;;;;;;;;;;;;;;;;;;; Layout > Toolbar
  else if (%tmpid == 5 2) { did -f %tmpdlg 102 | did -ra %tmpdlg 1001 Toolbar }

  ;;;;;;;;;;;;;;;;;;;; Layout > Statusbar
  else if (%tmpid == 5 3) { did -f %tmpdlg 115 | did -ra %tmpdlg 1001 Statusbar }

  ;;;;;;;;;;;;;;;;;;;; Layout > Titulo
  else if (%tmpid == 5 4) { did -f %tmpdlg 126 | did -ra %tmpdlg 1001 Título }

  ;;;;;;;;;;;;;;;;;;;; Layout > Papel de parede
  else if (%tmpid == 5 5) { did -f %tmpdlg 137 | did -ra %tmpdlg 1001 Papel de parede }

  ;;;;;;;;;;;;;;;;;;;; Editar
  else if (%tmpid == 6) { did -f %tmpdlg 153 | did -ra %tmpdlg 1001 Editar (duplo clique p/ editar) }

  ;;;;;;;;;;;;;;;;;;;; Editar > Onotice
  else if (%tmpid == 6 2) { did -f %tmpdlg 158 | did -ra %tmpdlg 1001 Editar Onotice }

  ;;;;;;;;;;;;;;;;;;;; Janelas
  else if (%tmpid == 7 ) { did -f %tmpdlg 182 | did -ra %tmpdlg 1001 Janelas }

  ;;;;;;;;;;;;;;;;;;;; Util. > Autocor
  else if (%tmpid == 8 2) { did -f %tmpdlg 193 | did -ra %tmpdlg 1001 Autocor }

  ;;;;;;;;;;;;;;;;;;;; Util. > Carinha
  else if (%tmpid == 8 3) { did -f %tmpdlg 264 | did -ra %tmpdlg 1001 Carinha }

  ;;;;;;;;;;;;;;;;;;;; Util. > Completacao de nick
  else if (%tmpid == 8 4) { did -f %tmpdlg 296 | did -ra %tmpdlg 1001 Completação de nick }

  ;;;;;;;;;;;;;;;;;;;; Atalhos
  else if (%tmpid == 9) { did -f %tmpdlg 311 | did -ra %tmpdlg 1001 Atalhos Personalizados (duplo clique p/ escolher) }

  ;;;;;;;;;;;;;;;;;;;; Protecoes > Canal
  else if (%tmpid == 10 2) { did -f %tmpdlg 315 | did -ra %tmpdlg 1001 Proteções de Canal }

  ;;;;;;;;;;;;;;;;;;;; Protecoes > Pessoal
  ;;; if (%tmpid == 10 3) { did -f %tmpdlg 325 | did -ra %tmpdlg 1001 Proteções Pessoais }

  ;;;;;;;;;;;;;;;;;;;; Protecoes > Exclusos
  else if (%tmpid == 10 3) { did -f %tmpdlg 330 | did -ra %tmpdlg 1001 Exclusos }

  ;;;;;;;;;;;;;;;;;;;; Canais Favoritos
  else if (%tmpid == 11) { did -f %tmpdlg 338 | did -ra %tmpdlg 1001 Canais Favoritos }

  ;;;;;;;;;;;;;;;;;;;; Servicos
  else if (%tmpid == 12) { did -f %tmpdlg 360 | did -ra %tmpdlg 1001 Serviços da Rede }

  ;;;;;;;;;;;;;;;;;;;; Servicos > NickServ
  else if (%tmpid == 12 2) { did -f %tmpdlg 366 | did -ra %tmpdlg 1001 NickServ }

  ;;;;;;;;;;;;;;;;;;;; Servicos > Quakenet
  else if (%tmpid == 12 3) { did -f %tmpdlg 383 | did -ra %tmpdlg 1001 Quakenet }

  ;;;;;;;;;;;;;;;;;;;; Servicos > Undernet
  else if (%tmpid == 12 4) { did -f %tmpdlg 395 | did -ra %tmpdlg 1001 Undernet }

  ;;;;;;;;;;;;;;;;;;;; Servicos > GameSurge
  else if (%tmpid == 12 5) { did -f %tmpdlg 407 | did -ra %tmpdlg 1001 Gamesurge }

}
on *:dialog:configuracao:*:*:{

  ;;;;;;;;;;;;;;;;;;;;;; CLOSE

  if ($devent == close) {
    unset %command %nc.chan %nc.nick %nc.nickadd %nc.nick3 %nc.msg %nc.who %mycolors %etype %esel
  }

  ;;;;;;;;;;;;;;;;;;;;;; INIT

  elseif ($devent == init) {

    ; ------------------------    

    __mdx SetControlMDX $dname 1000 TreeView haslines linesatroot hasbuttons hottrack sort > $__mdxfile(views)
    __mdx SetFont $dname 1001,195,199,201,200,252 ANSI 13 700 Tahoma

    ; ------------------------

    did -a $dname 1000   Geral
    did -a $dname 1000   Away
    did -i $dname 1000 1 cb root  last 1
    did -a $dname 1000   Opções
    did -a $dname 1000   Editar mensagem
    did -i $dname 1000 1 cb root 1
    did -a $dname 1000   Informação
    did -a $dname 1000   Layout
    did -i $dname 1000 1 cb root  last 1
    ;;did -a $dname 1000   Menubar
    did -a $dname 1000   Toolbar
    did -a $dname 1000   Statusbar
    did -a $dname 1000   Título
    did -a $dname 1000   Papel de parede
    did -i $dname 1000 1 cb root 1
    did -a $dname 1000   Editar
    did -i $dname 1000 1 cb root  last 1
    did -a $dname 1000   Onotice
    did -i $dname 1000 1 cb root 1
    did -a $dname 1000   Janelas
    did -i $dname 1000 1 cb root  last 1
    did -a $dname 1000   RSS Feeds
    did -i $dname 1000 1 cb root 1
    did -a $dname 1000   Utilitários
    did -i $dname 1000 1 cb root  last 1
    did -a $dname 1000   Autocor
    did -a $dname 1000   Carinha
    did -a $dname 1000   Completação de nick
    did -i $dname 1000 1 cb root 10001
    did -a $dname 1000   Atalhos Personalizados
    did -a $dname 1000   Proteções
    did -i $dname 1000 1 cb root  last 1
    did -a $dname 1000   Canal
    ;; did -a $dname 1000   Pessoal
    did -a $dname 1000   Exclusos
    did -i $dname 1000 1 cb root 1
    did -a $dname 1000   Canais Favoritos
    did -a $dname 1000   Serviços da Rede
    did -i $dname 1000 1 cb root  last 1
    did -a $dname 1000   NickServ
    did -a $dname 1000   Quakenet
    did -a $dname 1000   Undernet
    did -a $dname 1000   GameSurge

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; GERAL
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    did $iif(%pop.general.nickeditbox,-c,-u) $dname 2
    did $iif(%pop.general.nickeditbox.msg,-c,-u) $dname 3
    did $iif(%pop.general.showmenuhalfop,-c,-u) $dname 4
    did $iif(%pop.general.cmdstatus,-c,-u) $dname 5
    did $iif(%pop.general.colorquit,-c,u) $dname 6
    ; an?
    ;did -c $dname 6

    ;; mask ban
    did -a $dname 15,17 0: *!user@host
    did -a $dname 15,17 1: *!*user@host
    did -a $dname 15,17 2: *!*@host
    did -a $dname 15,17 3: *!*user@*.host
    did -a $dname 15,17 4: *!*@*.host
    did -a $dname 15,17 5: nick!user@host
    did -a $dname 15,17 6: nick!*user@host
    did -a $dname 15,17 7: nick!*@host
    did -a $dname 15,17 8: nick!*user@*.host
    did -a $dname 15,17 9: nick!*@*.host

    did -c $dname 15 $didwm($dname,15,%banmask,0)
    did -c $dname 17 $didwm($dname,17,%ignoremask,0)

    did $iif(%pop.general.aidle,-c,-u) $dname 19
    if (%pop.general.aidle) { did -e $dname 20 }
    else { did -b $dname 20 }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; LAYOUT
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    __mdx SetControlMDX $dname 128 ListView rowselect showsel single infotip labeltip report > $__mdxfile(views)

    did -i $dname 128 1 headerdims 80 270
    did -i $dname 128 1 headertext +r 0 Tags	+ 0 Descrição

    did -a $dname 128 $+(<lag>,$chr(9),Tempo de lag)
    did -a $dname 128 $+(<idle>,$chr(9),Tempo de sua inatividade)
    did -a $dname 128 $+(<status>,$chr(9),Conectado/desconectado)
    did -a $dname 128 $+(<away>,$chr(9),Retorna sim ou não se você está away)
    did -a $dname 128 $+(<data>,$chr(9),Data atual no formato dd/mm/aaaa)
    did -a $dname 128 $+(<dia>,$chr(9),Dia da semana)
    did -a $dname 128 $+(<uptime>,$chr(9),Uptime - tempo PC ligado)
    did -a $dname 128 $+(<online>,$chr(9),Online - tempo online)
    did -a $dname 128 $+(<anime>,$chr(9),Animação - giratória)
    did -a $dname 128 $+(<mp3>,$chr(9),MP3 corrente)
    did -a $dname 128 $+(<mode>,$chr(9),Seus modos atuais)
    did -a $dname 128 $+(<server>,$chr(9),Servidor atual)
    did -a $dname 128 $+(<network>,$chr(9),Rede atual)

    ;; Statusbar
    if ($gettok(%statusbar,1,32)) { did -c $dname 116 | did -e $dname 92,93 }
    else { did -b $dname 92,93 }
    if ($gettok(%statusbar,2,32)) did -c $dname 92
    else did -c $dname 93

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; EDITAR
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    __mdx SetControlMDX $dname 154 ListView rowselect showsel single infotip labeltip report > $__mdxfile(views)
    did -i $dname 154 1 headerdims 100 250 260 0
    did -i $dname 154 1 headertext +r 0 Editar	+ 0 Tags	+ 0 Atual	+ 0 Edit
    did -a $dname 154 Sair do IRC $+ $chr(9) $+ <mensagem> <tempo> <logo> <site> $+ $chr(9) $+ %myedit.quit $+ $chr(9) $+ quit
    did -a $dname 154 Kick $+ $chr(9) $+ <motivo> <nick> <logo> <contador> $+ $chr(9) $+ %myedit.kick $+ $chr(9) $+ kick
    did -a $dname 154 Kill $+ $chr(9) $+ <motivo> <nick> <logo> <contador> $+ $chr(9) $+ %myedit.kill $+ $chr(9) $+ kill
    did -a $dname 154 BANNED $+ $chr(9) $+ -não utiliza tags- $+ $chr(9) $+ %myedit.banned $+ $chr(9) $+ banned

    ;preview
    __ppwin $dname 156
    mypreviewmulti $dname 156 edit 155

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; EDITAR ONOTICE
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    if (%myonotice.showchan) did -c $dname 163
    mypreview $dname 160 417 22 %myonotice.left $+ $iif(%myonotice.showchan,#canal) $+ %myonotice.right $+  $autocor(mensagem)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; AWAY
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    if (%pop.away.stay) did -c $dname 31
    if (%pop.away.page) did -c $dname 22
    if (%pop.away.onlychanactive) did -c $dname 24
    if (%pop.away.sendallchan) did -c $dname 25
    if (%pop.away.sendallpvt) did -c $dname 26
    if (%pop.away.nomsgtochan) did -c $dname 27

    var %n = 1
    while ($gettok(%pop.away.listchannomsg,%n,44)) { did -a $dname 28 $v1 | %n = %n + 1 }

    did -a $dname 39 só se citarem seu nick
    did -a $dname 39 sempre à cada

    if (%pop.away.warning == citeme) { did -c $dname 39 1 | did -b $dname 40,41 }
    else { did -c $dname 39 2 | did -e $dname 40,41 }

    if (%pop.away.idle) { did -c $dname 33 | did -e $dname 34,35 }
    else { did -b $dname 34,35 }

    .loadbuf -o $dname 58 $shortfn(docs\away.txt)

    ;preview away
    __ppwin $dname 73
    mypreviewmulti $dname 73 away 72

    __listmyeditAway $dname 75


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; INFORMAÇÃO
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    did $iif(%pop.info.censojoin,-c,-u) $dname 82

    if ($findtok(%pop.info.query,join,1,32)) did -c $dname 83
    if ($findtok(%pop.info.query,part,1,32)) did -c $dname 85
    if ($findtok(%pop.info.query,kick,1,32)) did -c $dname 86
    if ($findtok(%pop.info.query,quit,1,32)) did -c $dname 87
    if ($findtok(%pop.info.query,common,1,32)) did -c $dname 101
    if ($findtok(%pop.info.query,pvtstats,1,32)) did -c $dname 88
    if ($findtok(%pop.info.query,showpvtpic,1,32)) did -c $dname 90

    if (%pop.info.chan) did -c $dname 80

    mypreview $dname 100 444 22 %ALIVE


    if (%pop.info.fullname) did -c $dname 98


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; MDX :: Canais Favoritos
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; canais favoritos, nickserv
    __mdx SetControlMDX $dname 339,375 ListView rowselect grid showsel single infotip labeltip report > $__mdxfile(views)

    did -i $dname 339 1 headerdims 160 110 210
    did -i $dname 339 1 headertext $+(Canal,$chr(9),Rede,$chr(9),Descrição)
    __listchanfav $dname 339

    ;; Lista de redes (canais favoritos)
    did $iif(%pop.chanfav.minimized == 1,-c,-u) $dname 356
    if (%pop.networks.chanfav) __list $+(%pop.networks.chanfav, $chr(127), $dname, $chr(127), 344)

    if (%pop.chanfav.typeident == command)  did -c $dname 348
    if (%pop.chanfav.typeident == connect)  did -c $dname 349
    if (%pop.chanfav.typeident == identify) did -c $dname 350
    if (%pop.chanfav.typeident == $null) did -c $dname 354


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; MDX :: Serviços da Rede
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;;__mdx SetControlMDX $dname 375 ListView rowselect grid showsel single infotip labeltip report > $__mdxfile(views)
    did -i $dname 375 1 headerdims 140 140 130
    did -i $dname 375 1 headertext $+(Nickname,$chr(9),Nickname away,$chr(9),Rede)

    ;; NickServ: Lista nicks adicionados para identificação
    __listnicksidentify $dname 375

    ;; NickServ: Lista de redes (auto identificacao)
    if (%pop.networks.nickserv) __list $+(%pop.networks.nickserv, $chr(127), $dname, $chr(127), 381)

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Autocor
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    if (%pop.util.autocor) did -c $dname 194

    did -a $dname 210 Cor normal
    did -a $dname 210 Escrita sem nome
    did -a $dname 210 Cores de espaço
    did -a $dname 210 Texto Assim E Tal
    did -a $dname 210 Efeitos Fracos&Fortes

    did -c $dname 210 %autocor.estilo
    __loadcolor $did(210).sel

    if (%autocor.upper) did -c $dname 213
    if (%autocor.txtencrip) did -c $dname 202
    if (%autocor.vogalmin) did -c $dname 203
    if (%autocor.txtnumb) did -c $dname 204

    if ($did(237).state) { did -b $dname 205,206,207,208,209,214 | did -e $dname 239,241 }
    else { did -e $dname 205,206,207,208,209,214 | did -b $dname 239,241 }

    did -a $dname 206 Negrito
    did -a $dname 206 Sublinhado

    if (%autocor.fogoio) did -c $dname 207
    if (%autocor.fogoio.ns == ) did -c $dname 206 1
    if (%autocor.fogoio.ns == ) did -c $dname 206 2

    ;; Contar
    if (%pop.autocor.count) did -c $dname 248
    did -ra $dname 249 $gettok(%pop.autocor.count.inc,2-,127)
    did -ra $dname 251 $gettok(%pop.autocor.count.inc,1,127)

    if (pre isin %autocor.presuf) { did -c $dname 254 | did -b $dname 197 }
    if (suf isin %autocor.presuf) { did -c $dname 256 | did -b $dname 196 }

    if ( isin %autocor.noname.i) did -c $dname 606
    if ( isin %autocor.noname.i) did -c $dname 607

    if ( isin %autocor.noname.e) did -c $dname 608
    if ( isin %autocor.noname.e) did -c $dname 609

    if ( isin %autocor.space.i) did -c $dname 616
    if ( isin %autocor.space.i) did -c $dname 617

    if ( isin %autocor.space.e) did -c $dname 618
    if ( isin %autocor.space.e) did -c $dname 619

    if ( isin %autocor.that.i) did -c $dname 626
    if ( isin %autocor.that.i) did -c $dname 627

    if ( isin %autocor.that.e) did -c $dname 628
    if ( isin %autocor.that.e) did -c $dname 629

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Carinhas (Emoticons)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    did $iif(%pop.util.carinha,-c,-u) $dname 265

    __listemoticons $dname 280
    var %char = :)
    mypreview $dname 269 63 21 $`myface(%char)

    ;; carrega as cores atuais
    did -g $dname 283 $+($shortfn($mircdirscripts\img\),%carinha.bone,.bmp)
    did -g $dname 284 $+($shortfn($mircdirscripts\img\),%carinha.bone.fundo,.bmp)

    did -g $dname 285 $+($shortfn($mircdirscripts\img\),%carinha.olho,.bmp)
    did -g $dname 286 $+($shortfn($mircdirscripts\img\),%carinha.fundo,.bmp)

    did -g $dname 287 $+($shortfn($mircdirscripts\img\),%carinha.boca.fundo,.bmp)
    did -g $dname 288 $+($shortfn($mircdirscripts\img\),%carinha.boca,.bmp)

    did -g $dname 289 $+($shortfn($mircdirscripts\img\),%carinha.nariz,.bmp)

    ;nariz
    if (%carinha.nariz.en) { did -c $dname 272 | did -e $dname 277 }
    else { did -c $dname 273 | did -b $dname 277 }

    ;bone
    did $iif(%carinha.bone.en,-c,-u) $dname 275
    did $iif(%carinha.bone.en,-e,-b) $dname 276

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Completação de nick
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    __listNC
    mypreview $dname 306 367 22 Selecione um estilo na lista acima

    did $iif(%pop.nc.encript,-c,-u) $dname 303
    did $iif(%pop.nc.mode,-c,-u) $dname 310

    __mdx SetFont 307 +a 22 400 Webdings
    __mdx SetFont 308 +a 22 400 Webdings

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Atalhos Personalizados
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    __mdx SetControlMDX $dname 312 ListView rowselect showsel single infotip labeltip editlabels report > $__mdxfile(views)
    did -i $dname 312 1 headerdims 100:1 280:2
    did -i $dname 312 1 headertext +r 0 Tecla/Ação	+ 0 /comandos
    __listbindings

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Janelas
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    did -a $dname 184,186,188,191 No Status
    did -a $dname 184,186,188,191 Janela ativa
    did -a $dname 184,186,188,191 @Janela separada

    if (!%pop.window.chanserv) set %pop.window.chanserv -s
    if (%pop.window.chanserv == -s) did -c $dname 184 1
    else if (%pop.window.chanserv == -a) did -c $dname 184 2
    else if (%pop.window.chanserv == @) did -c $dname 184 3

    if (!%pop.window.nickserv) set %pop.window.nickserv -s
    if (%pop.window.nickserv == -s) did -c $dname 186 1
    else if (%pop.window.nickserv == -a) did -c $dname 186 2
    else if (%pop.window.nickserv == @) did -c $dname 186 3

    if (!%pop.window.memoserv) set %pop.window.memoserv -s
    if (%pop.window.memoserv == -s) did -c $dname 188 1
    else if (%pop.window.memoserv == -a) did -c $dname 188 2
    else if (%pop.window.memoserv == @) did -c $dname 188 3

    if (!%pop.window.botserv) set %pop.window.botserv -s
    if (%pop.window.botserv == -s) did -c $dname 191 1
    else if (%pop.window.botserv == -a) did -c $dname 191 2
    else if (%pop.window.botserv == @) did -c $dname 191 3

  }




  ;;;;;;;;;;;;;;;;;;;;;; SCLICK

  else if ($devent == sclick) {

    ;; Lista de opções

    if ($did == 1000) {
      if (slclick select * iswm $did($did,1)) { __selectedconfig $dname $did(1000,1) } 
    }

    ;; Link URL
    if ($did == 1003) url -an %site

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Geral

    if ($did == 2) set %pop.general.nickeditbox $did(2).state
    if ($did == 3) set %pop.general.nickeditbox.msg $did(3).state
    if ($did == 4) set %pop.general.showmenuhalfop $did(4).state
    if ($did == 5) set %pop.general.cmdstatus $did(5).state

    if ($did == 6) set %pop.general.colorquit $did(6).state

    if ($did == 15) set %banmask $did(15).seltext
    if ($did == 17) set %ignoremask $did(17).seltext

    if ($did == 19) set %pop.general.aidle $did(19).state
    if ($did(19).state) did -e $dname 20
    else did -b $dname 20


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Away

    if ($did == 22) set %pop.away.page $did(22).state
    if ($did == 31) set %pop.away.stay $did(31).state
    if ($did == 24) {
      set %pop.away.onlychanactive $did(24).state
      if ($did(24).state) { did -u $dname 25 | set %pop.away.sendallchan $did(25).state }
    }
    if ($did == 25) {
      set %pop.away.sendallchan $did(25).state
      if ($did(25).state) { did -u $dname 24 | set %pop.away.onlychanactive $did(24).state }
    }
    if ($did == 26) set %pop.away.sendallpvt $did(26).state
    if ($did == 27) set %pop.away.nomsgtochan $did(27).state

    if ($did == 29) && ($did(32)) {
      var %chan = $iif($left($did(32),1) != $chr(35),$chr(35) $+ $did(32),$did(32))

      if ($findtok(%pop.away.listchannomsg,%chan,1,44)) { __aviso io Away:Já existe esse canal na lista | did -f $dname 32 | return }

      set %pop.away.listchannomsg $addtok(%pop.away.listchannomsg,%chan,44)
      did -a $dname 28 %chan
      did -r $dname 32
      ;;%pop.away.listchannomsg
    }
    if ($did == 30) {
      if ($did(28).sel) {
        set %pop.away.listchannomsg $remtok(%pop.away.listchannomsg,$did(28).seltext,1,44)
        did -d $dname 28 $did(28).sel
      }
    }

    if ($did == 39) {
      if ($did(39).sel == 1) { did -b $dname 40,41 | set %pop.away.warning citeme }
      else { did -e $dname 40,41 | set %pop.away.warning time }
    }

    if ($did == 33) {
      set %pop.away.idle $did(33).state
      if ($did(33).state) did -e $dname 34,35
      else did -b $dname 34,35
    }

    if ($did == 60) {
      if (!$did(59).text) { __aviso io Away:Preencha um motivo! | did -f $dname 59 | return }

      if (!$didwm($dname,58,$did(59).text,0)) {
        write docs\away.txt $did(59).text
        did -a $dname 58 $did(59).text
        did -r $dname 59
      }
      else { __aviso io Away:Já existe esse motivo na lista! }
    }
    if ($did == 61) {
      if ($did(58).sel) {
        write -dl $+ $did(58).sel $shortfn(docs\away.txt)
        did -d $dname 58 $did(58).sel
      }
      else { __aviso io Away:Selecione um motivo na lista! }
    }

    if ($did == 76) {
      var %n = $remove($$input(Nome para o estilo do away:,qe,Requisição),$chr(58))
      if (!$didwm($dname,75,%n,0)) {
        .write configs\edit-away.txt $+(%n,:,nome)
        .write configs\edit-away.txt $+(%n,:,away) $did(68).text
        .write configs\edit-away.txt $+(%n,:,back) $did(72).text

        did -a $dname 75 %n
        __aviso io Away:Estilo adicionado com sucesso!
      }
      else { __aviso wo Away:Esse estilo %n já existe na lista! }
    }

    if ($did == 75) { __readmyeditAway $did(75).seltext }
    if ($did == 77) { 
      if ($did(75).seltext == Padrão) { __aviso wo Away:Você não pode remover o estilo Padrão! | return }
      if ($did(75).sel) {
        if (!$$input(Remover realmente o estilo $did(75).seltext ?, qy, Confirmação)) return
        __delmyeditAway $did(75).seltext
        did -d $dname 75 $did(75).sel
      }
      else { __aviso wo Away:Selecione um estilo na lista! }
    }





    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Informação

    if ($did == 80) { 
      set %pop.info.chan $did(80).state
      if ($did(80).state) .timerchaninfo 0 600 chaninfo
      else .timerchaninfo off
    }
    if ($did == 82) { set %pop.info.censojoin $did(82).state }

    if ($did == 83) { 
      if ($did(83).state) set %pop.info.query $instok(%pop.info.query,join,1,32)
      else set %pop.info.query $remtok(%pop.info.query,join,1,32)
    }
    if ($did == 85) { 
      if ($did(85).state) set %pop.info.query $instok(%pop.info.query,part,1,32)
      else set %pop.info.query $remtok(%pop.info.query,part,1,32)
    }
    if ($did == 86) { 
      if ($did(86).state) set %pop.info.query $instok(%pop.info.query,kick,1,32)
      else set %pop.info.query $remtok(%pop.info.query,kick,1,32)
    }
    if ($did == 87) {
      if ($did(87).state) set %pop.info.query $instok(%pop.info.query,quit,1,32)
      else set %pop.info.query $remtok(%pop.info.query,quit,1,32)
    }
    if ($did == 101) {
      if ($did(101).state) set %pop.info.query $instok(%pop.info.query,common,1,32)
      else set %pop.info.query $remtok(%pop.info.query,common,1,32)
    }
    if ($did == 88) {
      if ($did(88).state) set %pop.info.query $instok(%pop.info.query,pvtstats,1,32)
      else set %pop.info.query $remtok(%pop.info.query,pvtstats,1,32)
    }
    if ($did == 90) {
      if ($did(90).state) set %pop.info.query $instok(%pop.info.query,showpvtpic,1,32)
      else set %pop.info.query $remtok(%pop.info.query,showpvtpic,1,32)
    }

    if ($did == 98) set %pop.info.fullname $did(98).state
    if ($did == 97) { fullname $did(99).text | mypreview $dname 100 444 22 %ALIVE }



    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Layout

    if ($did == 127) { set %mytitle $did(129).text }

    ;; Statusbar
    if ($did == 116) {
      set %statusbar $puttok(%statusbar,$did(116).state,1,32)
      if ($did(116).state) { statusbar on | did -e $dname 92,93 }
      else { statusbar off | did -b $dname 92,93 }
    }
    if ($did == 92) { set %statusbar $puttok(%statusbar,1,2,32) | statusbar off | statusbar on }
    if ($did == 93) { set %statusbar $puttok(%statusbar,0,2,32) | statusbar off | statusbar on }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Editar
    if ($did == 134) { 

      if (%esel) {

        if (!$did(155).text) { __aviso wo Editar:A edição está vazia! Preenche algo para poder salvar! | did -f $dname 155 | return }

        var %valsel = $did(154,%esel).seltext
        set %myedit. [ $+ [ %etype ] ] $did(155).text
        did -o $dname 154 %esel $puttok(%valsel,+fs 0 0 0 $did(155).text,3,9)
        __aviso io Editar:Edição efetuada e salva com sucesso!
      }
    }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Editar Onotice

    if ($did == 161) { 
      %myonotice.left     = (15el33t1:02
      %myonotice.right    = 1)
      %myonotice.showchan = 1

      did -ra $dname 162 %myonotice.left
      did -ra $dname 164 %myonotice.right
      did -c $dname 163

      mypreview $dname 160 417 22 $did(162).text $+ $iif($did(163).state,#canal) $+ $did(164).text $+  $autocor(mensagem)
    }
    if ($did == 163) { mypreview $dname 160 417 22 $did(162).text $+ $iif($did(163).state,#canal) $+ $did(164).text $+  $autocor(mensagem) | set %myonotice.showchan $did(163).state }


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Atalhos Personalizados

    if ($did == 314) { 
      if (!$$input(Restaurando os atalhos padrões do script você perderá todas as mudanças já feitas por você. Deseja continuar ?, qy, Confirmação)) return
      if ($dialog($dname)) __defaultbindings
    }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Canais Favoritos

    ;; Configs
    if ($did == 356) set %pop.chanfav.minimized $did(356).state

    if ($did(348).state == 1) set %pop.chanfav.typeident command
    if ($did(349).state == 1) set %pop.chanfav.typeident connect
    if ($did(350).state == 1) set %pop.chanfav.typeident identify
    if ($did(354).state == 1) set %pop.chanfav.typeident ""

    ;; Adicionar

    if (($did == 340) || ($did == 342)) {
      if (!$did(344).sel) { __aviso io Canais Favoritos:Escolha uma Rede! | did -f $dname 381 | return }
      if (!$did(343).text) { __aviso io Canais Favoritos:Preencha o canal! | did -f $dname 382 | return }
      ;; if (!$did(352).text) { __aviso io Canais Favoritos:Preencha a senha! | did -f $dname 372 | return }

      if ($did == 342) %noquestion = true
      if ($left($did(343).text,1) != $chr(35)) var %chanr = $chr(35) $+ $did(343).text
      else var %chanr = $did(343).text

      __addchantofav $+($did(344).seltext,:,%chanr,:,$did(352).text)
    }

    ;; Remover nickname

    if ($did == 341) {
      if ($did(339).sel) { 

        if ($$input(Deseja realmente remover esse registro?, yi, Confirmação)) {

          if ($dialog($dname)) {
            var %tmp.canal = $gettok($gettok($did(339).seltext,1,9),6-,32)
            var %tmp.rede  = $gettok($gettok($did(339).seltext,2,9),5-,32)

            __delchanfav $+(%tmp.canal,$chr(127),%tmp.rede)

            var %linha = $did(339).sel
            did -d $dname 339 %linha

            did -r $dname 343,352
          }
        }
      }
      else {
        __aviso io Canais Favoritos:Selecione um registro!
      }
    }

    ;; Seleciona Rede

    if ($did == 358) {
      noop $dialog(listnetworks,listnetworks,-4)

      if (%selecionado) {
        ; Procura se já não existe adicionado
        ; $didwm(name,id,wildtext,N)
        if (!$didwm($dname,344,%selecionado,0)) {
          %pop.networks.chanfav = $addtok(%pop.networks.chanfav , %selecionado, 44)

          did -a $dname 344 %selecionado 
          did -c $dname 344 $did(344).lines 
        }
        unset %selecionado
      }
    }

    ;; Exclui Rede

    if ($did == 359) {
      if ($did(344).sel) {
        %pop.networks.chanfav = $remtok(%pop.networks.chanfav , $did(344).seltext, 1, 44)
        did -d $dname 344 $did(344).sel
      }
    }



    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NickServ

    ;; Adicionar nickname

    if (($did == 373) || ($did == 376)) {
      if (!$did(381).sel) { __aviso io NickServ:Escolha uma Rede! | did -f $dname 381 | return }
      if (!$did(382).text) { __aviso io NickServ:Preencha o nickname! | did -f $dname 382 | return }
      if (!$did(372).text) { __aviso io NickServ:Preencha a senha! | did -f $dname 372 | return }

      if ($did == 376) %noquestion = true
      __addnicktoidentify $did(381).seltext $did(382).text $did(372).text $iif($did(378).state == 1,type1,type2) $did(380).state $iif($did(168).text,$did(168).text,<none>)
    }

    ;; Seleciona Rede

    if ($did == 368) {
      noop $dialog(listnetworks,listnetworks,-4)

      if (%selecionado) {
        ; Procura se já não existe adicionado
        ; $didwm(name,id,wildtext,N)
        if (!$didwm($dname,381,%selecionado,0)) { 
          %pop.networks.nickserv = $addtok(%pop.networks.nickserv, %selecionado, 44)

          did -a $dname 381 %selecionado 
          did -c $dname 381 $did(381).lines 
        }
        unset %selecionado
      }
    }

    ;; Exclui Rede

    if ($did == 369) {
      if ($did(381).sel) {
        %pop.networks.nickserv = $remtok(%pop.networks.nickserv, $did(381).seltext, 1, 44)
        did -d $dname 381 $did(381).sel
      }
    }


    ;; Remover nickname

    if ($did == 374) {
      if ($did(375).sel) { 

        if ($$input(Deseja realmente remover esse registro?, yi, Confirmação)) {

          if ($dialog($dname)) {
            var %tmp.network  = $gettok($gettok($did(375).seltext,3,9),5-,32)
            var %tmp.nickname = $gettok($gettok($did(375).seltext,1,9),6-,32)

            __delnickfromidentify %tmp.network %tmp.nickname

            var %linha = $did(375).sel
            did -d $dname 375 %linha

            did -r $dname 382,168,372
          }
        }
      }
      else {
        __aviso io NickServ:Selecione um registro!
      }
    }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Autocor

    ;; Auto cor
    if ($did == 194) { set %pop.util.autocor $did(194).state }

    ;; Contador
    if ($did == 248) { set %pop.autocor.count $did(248).state }

    ;; Prefixo/sufixo
    if ($did == 257) myedit docs\prefixos.txt
    if ($did == 258) myedit docs\sufixos.txt

    ;; T3xt0 num3r0
    if ($did == 204) { set %autocor.txtnumb $did(204).state }
    ;; Texto encriptado
    if ($did == 202) { set %autocor.txtencrip $did(202).state }
    ;; Vogal maiuscula
    if ($did == 203) {
      set %autocor.vogalmin $did(203).state
      if ($did(203).state) { did -u $dname 213 | set %autocor.upper $did(213).state }
    }
    ;; Maiuscula
    if ($did == 213) { set %autocor.upper $did(213).state }
    ;; Negritar
    if ($did == 211) {
      if (!$did(211).state) set %autocor.ns $remove(%autocor.ns,)
      else set %autocor.ns %autocor.ns 
      set %autocor.ns $remove(%autocor.ns,$chr(32))
    }
    ;; Sublinhar
    if ($did == 212) {
      if (!$did(212).state) set %autocor.ns $remove(%autocor.ns,)
      else set %autocor.ns %autocor.ns  
      set %autocor.ns $remove(%autocor.ns,$chr(32))
    }
    ;; Caracter entre espaço
    if ($did == 261) { set %autocor.charspace $did(261).text | did -ra $dname 260 $did(261).text }
    if ($did == 262) { set %autocor.charspace $did(262).text | did -ra $dname 260 $did(262).text }
    if ($did == 263) { set %autocor.charspace $did(263).text | did -ra $dname 260 $did(263).text }

    ;; Fogoió
    if ($did == 207) { set %autocor.fogoio $did(207).state }
    if ($did == 206) {
      if ($did(206).sel == 1) set %autocor.fogoio.ns 
      if ($did(206).sel == 2) set %autocor.fogoio.ns 
    }

    ;; Alternar
    if ($did == 205) {
      if ($did(205).state) { set %autocor.alt $did(205).state | did -e $dname 208,209,214 }
      else { set %autocor.alt $did(205).state | did -b $dname 208,209,214 }
    }
    if ($did == 208) {
      if ($did(208).state) set %autocor.alt.nsr %autocor.alt.nsr 
      else set %autocor.alt.nsr $remove(%autocor.alt.nsr,)
    }
    if ($did == 209) {
      if ($did(209).state) set %autocor.alt.nsr %autocor.alt.nsr 
      else set %autocor.alt.nsr $remove(%autocor.alt.nsr,)
    }
    if ($did == 214) {
      if ($did(214).state) set %autocor.alt.nsr %autocor.alt.nsr 
      else set %autocor.alt.nsr $remove(%autocor.alt.nsr,)
    }

    if ($did == 254) {
      if ($did(254).state) { set %autocor.presuf $instok(%autocor.presuf,pre,1,32) | did -b $dname 197 }
      else { set %autocor.presuf $remtok(%autocor.presuf,pre,1,32) | did -e $dname 197 }
    }
    if ($did == 256) {
      if ($did(256).state) { set %autocor.presuf $instok(%autocor.presuf,suf,1,32) | did -b $dname 196 }
      else { set %autocor.presuf $remtok(%autocor.presuf,suf,1,32) | did -e $dname 196 }
    }

    ;; 1 - Cor normal, 2 - Cor Sem Nome
    if ($did == 210) { set %autocor.estilo $did(210).sel | __loadcolor $did(210).sel }

    ;; Ativa/desativa cores
    ;; 1ª

    if ($did == 246) {
      if ($did(237).state == 1 || $did(236).state == 1 || $did(229).state == 1 || $did(227).state == 1 || $did(226).state == 1 || $did(217).state == 1) { did -c $dname 246 | __aviso io Autocor:Você só pode desativar a cor nº 1 quando as outras (2ª à 6ª) estiverem também desativadas | halt }
      if ($did(246).state == 0) {
        set %autocor.cnormal $puttok(%autocor.cnormal,XXXX,1,32)
        did -b $dname 205,206,207,208,209,214,242,244
      }
      else { 
        set %autocor.cnormal $puttok(%autocor.cnormal,1616,1,32) 
        did -e configuracao 237 
        did -b $dname 205,206,207,208,209,214,242,244
      }
    }
    ;; 2ª
    if ($did == 237) {
      if ($did(236).state == 1 || $did(229).state == 1 || $did(227).state == 1 || $did(226).state == 1 || $did(217).state == 1) { did -c $dname 237 | __aviso io Autocor:Você só pode desativar a cor nº 2 quando as outras (3ª à 6ª) estiverem também desativadas | halt }
      if ($did(237).state == 0) { set %autocor.cnormal $puttok(%autocor.cnormal,XXXX,2,32) | did -b $dname 239,241 }
      else { set %autocor.cnormal $puttok(%autocor.cnormal,1616,2,32) | did -e configuracao 232,234,236,239,241 | set %autocor.alt 0 | did -u $dname 205 }
    }
    ;; 3ª
    if ($did == 236) {
      if ($did(229).state == 1 || $did(227).state == 1 || $did(226).state == 1 || $did(217).state == 1) { did -c $dname 236 | __aviso io Autocor:Você só pode desativar a cor nº 3 quando as outras (4ª à 6ª) estiverem também desativadas | halt }
      if ($did(236).state == 0) { set %autocor.cnormal $puttok(%autocor.cnormal,XXXX,3,32) | did -b $dname 232,234 }
      else { set %autocor.cnormal $puttok(%autocor.cnormal,1616,3,32) | did -e configuracao 227,229,231,232,234 }
    }
    ;; 4ª
    if ($did == 227) {
      if ($did(226).state == 1 || $did(217).state == 1) { did -c $dname 227 | __aviso io Autocor:Você só pode desativar a cor nº 4 quando as outras (5ª e 6ª) estiverem também desativadas | halt }
      if ($did(227).state == 0) { set %autocor.cnormal $puttok(%autocor.cnormal,XXXX,4,32) | did -b $dname 229,231 }
      else { set %autocor.cnormal $puttok(%autocor.cnormal,1616,4,32) | did -e configuracao 222,224,226,229,231 }
    }
    ;; 5ª
    if ($did == 226) {
      if ($did(217).state == 1) { did -c $dname 226 | __aviso io Autocor:Você só pode desativar a cor nº 5 quando a 6ª estiver também desativada | halt }
      if ($did(226).state == 0) { set %autocor.cnormal $puttok(%autocor.cnormal,XXXX,5,32) | did -b $dname 222,224 }
      else { set %autocor.cnormal $puttok(%autocor.cnormal,1616,5,32) | did -e configuracao 217,219,221,222,224 }
    }
    ;; 6ª
    if ($did == 217) {
      if ($did(217).state == 0) { set %autocor.cnormal $puttok(%autocor.cnormal,XXXX,6,32) | did -b $dname 219,221 }
      else { set %autocor.cnormal $puttok(%autocor.cnormal,1616,6,32) | did -e $dname 219,221 }
    }

    ;; Cor Sem Nome
    if ($did == 602) {
      if ($did(602).state == 0) { set %autocor.noname $puttok(%autocor.noname,XXXX,2,32) | did -b $dname 600,601 }
      else { set %autocor.noname $puttok(%autocor.noname,1616,2,32) | did -e $dname 600,601 }
    }
    if ($did == 605) {
      if ($did(605).state == 0) { set %autocor.noname $puttok(%autocor.noname,XXXX,1,32) | did -b $dname 603,604 }
      else { set %autocor.noname $puttok(%autocor.noname,1616,1,32) | did -e $dname 603,604 }
    }

    ;; Cor no espaço
    if ($did == 612) {
      if ($did(612).state == 0) { set %autocor.space $puttok(%autocor.space,XXXX,2,32) | did -b $dname 610,611 }
      else { set %autocor.space $puttok(%autocor.space,1616,2,32) | did -e $dname 610,611 }
    }
    if ($did == 615) {
      if ($did(615).state == 0) { set %autocor.space $puttok(%autocor.space,XXXX,1,32) | did -b $dname 613,614 }
      else { set %autocor.space $puttok(%autocor.space,1616,1,32) | did -e $dname 613,614 }
    }

    ;; Cor assim e tal
    if ($did == 622) {
      if ($did(622).state == 0) { set %autocor.that $puttok(%autocor.that,XXXX,2,32) | did -b $dname 620,621 }
      else { set %autocor.that $puttok(%autocor.that,1616,2,32) | did -e $dname 620,621 }
    }
    if ($did == 625) {
      if ($did(625).state == 0) { set %autocor.that $puttok(%autocor.that,XXXX,1,32) | did -b $dname 623,624 }
      else { set %autocor.that $puttok(%autocor.that,1616,1,32) | did -e $dname 623,624 }
    }

    ;; Cor Fraco e forte
    if ($did == 635) {
      if ($did(635).state == 0) { set %autocor.weak $puttok(%autocor.weak,XXXX,1,32) | did -b $dname 634,633 }
      else { set %autocor.weak $puttok(%autocor.weak,1616,1,32) | did -e $dname 634,633 }
    }
    if ($did == 632) {
      if ($did(632).state == 0) { set %autocor.weak $puttok(%autocor.weak,XXXX,2,32) | did -b $dname 631,630 }
      else { set %autocor.weak $puttok(%autocor.weak,1616,2,32) | did -e $dname 631,630 }
    }
    if ($did == 638) {
      if ($did(638).state == 0) { set %autocor.weak $puttok(%autocor.weak,XXXX,3,32) | did -b $dname 637,636 }
      else { set %autocor.weak $puttok(%autocor.weak,1616,3,32) | did -e $dname 637,636 }
    }
    if ($did == 640) {
      if ($did(640).state == 0) { set %autocor.weak $remove(%autocor.weak,left) }
      else { set %autocor.weak %autocor.weak left }
    }






    ;; Seleção de cores (Cor normal)
    ;; 1ª
    if ($did == 244) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 242) { 
      if ($left($right($did($dname,244),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }

    ;; 2ª
    if ($did == 241) { 
      if ($left($right($did($dname,239),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 239) { set %mycolors autocor $dname $did | __opendialog mycolors }

    ;; 3ª
    if ($did == 232) { 
      if ($left($right($did($dname,234),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 234) { set %mycolors autocor $dname $did | __opendialog mycolors }

    ;; 4ª
    if ($did == 229) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 231) { 
      if ($left($right($did($dname,229),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }

    ;; 5ª
    if ($did == 222) { 
      if ($left($right($did($dname,224),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 224) { set %mycolors autocor $dname $did | __opendialog mycolors }

    ;; 6ª
    if ($did == 219) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 221) { 
      if ($left($right($did($dname,219),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }

    ;; Seleção de cores (Cor Sem Nome)
    ;; 1ª Cor

    ;; 2ª Cor
    if ($did == 600) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 601) { 
      if ($left($right($did($dname,600),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }

    if ($did == 603) { 
      if ($left($right($did($dname,604),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 604) { set %mycolors autocor $dname $did | __opendialog mycolors }

    if ($did == 606) {
      if ($did(606).state) set %autocor.noname.i %autocor.noname.i $+ 
      else set %autocor.noname.i $remove(%autocor.noname.i,)
    }
    if ($did == 607) {
      if ($did(607).state) set %autocor.noname.i %autocor.noname.i $+ 
      else set %autocor.noname.i $remove(%autocor.noname.i,)
    }
    if ($did == 608) {
      if ($did(608).state) set %autocor.noname.e %autocor.noname.e $+ 
      else set %autocor.noname.e $remove(%autocor.noname.e,)
    }
    if ($did == 609) {
      if ($did(609).state) set %autocor.noname.e %autocor.noname.e $+ 
      else set %autocor.noname.e $remove(%autocor.noname.e,)
    }


    ;; Seleção de cores (Cor no espaço)
    ;; 1ª Cor

    ;; 2ª Cor
    if ($did == 610) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 611) { 
      if ($left($right($did($dname,610),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }

    if ($did == 613) { 
      if ($left($right($did($dname,614),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 614) { set %mycolors autocor $dname $did | __opendialog mycolors }

    if ($did == 616) {
      if ($did(616).state) set %autocor.space.i %autocor.space.i $+ 
      else set %autocor.space.i $remove(%autocor.space.i,)
    }
    if ($did == 617) {
      if ($did(617).state) set %autocor.space.i %autocor.space.i $+ 
      else set %autocor.space.i $remove(%autocor.space.i,)
    }
    if ($did == 618) {
      if ($did(618).state) set %autocor.space.e %autocor.space.e $+ 
      else set %autocor.space.e $remove(%autocor.space.e,)
    }
    if ($did == 619) {
      if ($did(619).state) set %autocor.space.e %autocor.space.e $+ 
      else set %autocor.space.e $remove(%autocor.space.e,)
    }

    ;; Seleção de cores (Cor Assim e tal)
    ;; 1ª Cor

    ;; 2ª Cor
    if ($did == 620) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 621) { 
      if ($left($right($did($dname,620),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }

    if ($did == 623) { 
      if ($left($right($did($dname,624),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 624) { set %mycolors autocor $dname $did | __opendialog mycolors }

    if ($did == 626) {
      if ($did(626).state) set %autocor.that.i %autocor.that.i $+ 
      else set %autocor.that.i $remove(%autocor.that.i,)
    }
    if ($did == 627) {
      if ($did(627).state) set %autocor.that.i %autocor.that.i $+ 
      else set %autocor.that.i $remove(%autocor.that.i,)
    }
    if ($did == 628) {
      if ($did(628).state) set %autocor.that.e %autocor.that.e $+ 
      else set %autocor.that.e $remove(%autocor.that.e,)
    }
    if ($did == 629) {
      if ($did(629).state) set %autocor.that.e %autocor.that.e $+ 
      else set %autocor.that.e $remove(%autocor.that.e,)
    }

    ;; Seleção de cores (Cor Fraco e Forte)
    if ($did == 634) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 633) {
      if ($left($right($did($dname,634),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 630) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 631) {
      if ($left($right($did($dname,630),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    if ($did == 637) { set %mycolors autocor $dname $did | __opendialog mycolors }
    if ($did == 636) {
      if ($left($right($did($dname,637),6),2) == 16) return
      set %mycolors autocor $dname $did | __opendialog mycolors 
    }
    ;if ($did == 639) { set %mycolors autocor $dname $did | __opendialog mycolors }




    ;; Update colors
    if ($istok(246 237 236 227 226 217 211 212 213 261 262 263 203 202 204 207 206 205 208 209 214 248 254 256 602 605 606 607 608 609 616 617 618 619 626 627 628 629 635 632 638 640,$did,32)) { mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;]) | __loadcolor $did(210).sel }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Carinha

    ;; on off
    if ($did == 265) { set %pop.util.carinha $did(265).state }

    ;; add
    if ($did == 270) {
      if (!$did(274).text) { __aviso io Carinha:Entre com uma carinha | did -f $dname 274 | return }
      if ($findtok(%list.carinhas,$did(274),1,32)) { __aviso io Carinha:Já existe essa carinha na lista! | did -f $dname 274 | return }

      set %list.carinhas $addtok(%list.carinhas,$did(274).text,32)
      did -a $dname 280 $did(274).text
      did -r $dname 274
    }
    ;; rem
    ;button "&Remover", 271, 378 84 58 19, tab 264
    if ($did == 271) {
      if ($did(280).sel) { 
        set %list.carinhas $remtok(%list.carinhas,$did(280).seltext,1,32)
        did -d $dname 280 $did(280).sel 
      } 
      else { __aviso io Carinha:Selecione uma carinha na lista para remover | return }
    }

    if ($did == 280) {
      if ($did(280).seltext) mypreview $dname 269 63 21 $`myface($did(280).seltext)
    }
    if ($did == 272) { set %carinha.nariz.en 1 | did -e $dname 277 | var %char = :) | mypreview $dname 269 63 21 $`myface(%char) }
    if ($did == 273) { set %carinha.nariz.en 0 | did -b $dname 277 | var %char = :) | mypreview $dname 269 63 21 $`myface(%char) }
    if ($did == 275) { set %carinha.bone.en $did(275).state | did $iif($did(275).state,-e,-b) $dname 276 | var %char = :) | mypreview $dname 269 63 21 $`myface(%char) }

    ; olho
    if ($did == 285) { set %mycolors carinha $dname $did | __opendialog mycolors }
    ; olho fundo
    if ($did == 286) { set %mycolors carinha $dname $did | __opendialog mycolors }
    ; bone
    if ($did == 283) { set %mycolors carinha $dname $did | __opendialog mycolors }
    ; bone fundo
    if ($did == 284) { set %mycolors carinha $dname $did | __opendialog mycolors }
    ; boca
    if ($did == 288) { set %mycolors carinha $dname $did | __opendialog mycolors }
    ; boca fundo
    if ($did == 287) { set %mycolors carinha $dname $did | __opendialog mycolors }
    ; nariz
    if ($did == 289) { set %mycolors carinha $dname $did | __opendialog mycolors }

    ; default emoticons
    if ($did == 293) {
      if ($$input(Resetar lista de carinhas? Ira' voltar a lista padrao, qy, Confirmação)) {
        set %list.carinhas :) :( :/ :\ :| :Þ :þ :P :p :b :D :T :6 :* :] :[ :# :x :X :~ ;) ;( ;/ ;\ ;| ;Þ ;þ ;P ;p ;b ;D ;T ;6 ;* ;¤ ;] ;# ;x ;X ;~ ;[ =) =( =/ =\ =| =Þ =þ =P =p =b =D =T =6 =* =¤ =] =[ =# =x =X =~ #) #} ¦) ¦( ¦/ ¦\ ¦| ¦Þ ¦þ ¦P ¦p ¦b ¦D ¦T ¦6 ¦* ¦] ¦[ ¦# ¦x ¦X ¦~ ¦} ;} >| >} ¦Ð =Ð :Ð :} =} :I ;I x) X) xD x( >T xP x] :F
        if ($dialog($dname)) __listemoticons $dname 280
      }
    }

    ; default colors
    if ($did == 294) {
      did -g $dname 285 $shortfn(scripts\img\01.bmp) | did -g $dname 286 $shortfn(scripts\img\08.bmp)
      did -g $dname 283 $shortfn(scripts\img\12.bmp) | did -g $dname 284 $shortfn(scripts\img\08.bmp)
      did -g $dname 287 $shortfn(scripts\img\08.bmp) | did -g $dname 288 $shortfn(scripts\img\04.bmp)
      did -g $dname 289 $shortfn(scripts\img\01.bmp)

      set %carinha.bone $left($right($did(283),6),2)
      set %carinha.bone.fundo $left($right($did(284),6),2)

      set %carinha.fundo $left($right($did(286),6),2)
      set %carinha.olho $left($right($did(285),6),2)

      set %carinha.boca.fundo $left($right($did(287),6),2)
      set %carinha.boca $left($right($did(288),6),2)

      set %carinha.nariz $left($right($did(289),6),2)

      var %char = :)
      mypreview $dname 269 63 21 $`myface(%char)
    }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Completação de nick

    if ($did == 304) {
      mypreview $dname 306 367 22 $nickcompletion(nick,$did(304).seltext) $autocor(sua mensagem)
    }
    if ($did == 305) {
      mypreview $dname 306 367 22 $nickcompletion(nick,$did(305).seltext) $autocor(sua mensagem)
    }
    if ($did == 303) { set %pop.nc.encript $did(303).state | mypreview $dname 306 367 22 $nickcompletion(nick,$did(304).seltext) $autocor(sua mensagem) }
    if ($did == 310) { set %pop.nc.mode $did(310).state | mypreview $dname 306 367 22 $nickcompletion(nick,$did(304).seltext) $autocor(sua mensagem) }


    if ($did == 307) {
      if (!$did(304).sel) { return }

      if ($did(304).seltext isin $didtok(305,305,32)) { __aviso wo Completação de nick:Já existe na lista de uso! | return }
      writeini configs\nc2.ini usar $did(304,$did(304).sel) crows 
      did -a $dname 305 $did(304,$did(304).sel) 
      did -d $dname 304 $did(304).sel
    }
    if ($did == 308) {
      if ($did(305).sel) { did -a $dname 304 $did(305).seltext | remini configs\nc2.ini usar $did(305).seltext | did -d $dname 305 $did(305).sel }
    }
    if ($did == 309) { __opendialog nc.edit }


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Janelas

    if ($did(184).sel == 1) set %pop.window.chanserv -s
    if ($did(184).sel == 2) set %pop.window.chanserv -a
    if ($did(184).sel == 3) set %pop.window.chanserv @

    if ($did(186).sel == 1) set %pop.window.nickserv -s
    if ($did(186).sel == 2) set %pop.window.nickserv -a
    if ($did(186).sel == 3) set %pop.window.nickserv @

    if ($did(188).sel == 1) set %pop.window.memoserv -s
    if ($did(188).sel == 2) set %pop.window.memoserv -a
    if ($did(188).sel == 3) set %pop.window.memoserv @

    if ($did(191).sel == 1) set %pop.window.botserv -s
    if ($did(191).sel == 2) set %pop.window.botserv -a
    if ($did(191).sel == 3) set %pop.window.botserv @

  }

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; DCLICK
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  else if ($devent == dclick) {

    ;; Editar
    if ($did == 154) {
      ;quit
      %etype = $gettok($gettok($did(154).seltext,4-,9),5,32)
      %esel  = $did(154).sel

      did -ra $dname 155 $gettok($gettok($did(154).seltext,3,9),5-,32)
      mypreviewmulti $dname 156 edit 155

      did -f $dname 155
    }

    ;; Atalhos Personalizados
    if ($did == 312) { 

      var %keysel = $gettok($gettok($did($did).seltext,1,9),6-,32)
      var %cmdsel = $gettok($gettok($did($did).seltext,2,9),5-,32)
      var %sel    = $did($did).sel
      var %cmd    = $input(Comando que será executado ao teclar %keysel $+ :,qe,Editar Atalho,%cmdsel)

      if (%cmd == $null) set %cmd ""

      did -o $dname 312 %sel %keysel $+ $chr(9) $+ %cmd
      set % $+ $replace(%keysel,Ctrl+,c,Shift+,s) %cmd

    }

    ;; Canais Favoritos

    if ($did == 339) {
      __editchanfav $+($dname,$chr(127),$gettok($gettok($did(339).seltext,1,9),6-,32),$chr(127),$gettok($gettok($did(339).seltext,2,9),5-,32),$chr(127),$gettok($gettok($did(339).seltext,3,9),5-,32))
    }

    ;; NickServ

    if ($did == 375) {
      __editnicktoidentify $dname $gettok($gettok($did(375).seltext,3,9),5-,32) $gettok($gettok($did(375).seltext,1,9),6-,32)
    }

  }

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; EDIT
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  else if ($devent == edit) {

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Geral
    if ($did == 20) {
      set %pop.general.aidle.time $iif($did(20).text,$did(20).text,15)
      if ($did(20).text < 5) set %pop.general.aidle.time 15
    }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Editar Onotice

    if ($did == 162) { mypreview $dname 160 417 22 $did(162).text $+ $iif($did(163).state,#canal) $+ $did(164).text $+  $autocor(mensagem) | set %myonotice.left $did(162).text }
    if ($did == 164) { mypreview $dname 160 417 22 $did(162).text $+ $iif($did(163).state,#canal) $+ $did(164).text $+  $autocor(mensagem) | set %myonotice.right $did(164).text }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Away
    if ($did == 40) { 
      set %pop.away.delay $iif($did(40).text,$did(40).text,5) 
      if ($did(40).text < 5) set %pop.away.delay 5
    }
    if ($did == 34) {
      set %pop.away.idletime $iif($did(34).text,$did(34).text,5)
      if ($did(34).text < 5) set %pop.away.idletime 5
    }
    if ($did == 44) set %pop.away.campo1 $did(44).text
    if ($did == 47) set %pop.away.campo2 $did(47).text
    if ($did == 49) set %pop.away.campo3 $did(49).text

    ;preview
    if ($did == 68) { mypreviewmulti $dname 73 away 68 | set %pop.away.msgaway $did(68).text }
    if ($did == 72) { mypreviewmulti $dname 73 away 72 | set %pop.away.msgback $did(72).text }


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Informação


    if ($did == 99) { mypreview $dname 100 444 22 $iif($did(99).text, $did(99).text, $chr(160)) }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Editar
    if ($did == 155) { mypreviewmulti $dname 156 edit 155 }


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; NickServ

    if ($did == 382) did -ra $dname 382 $replace($did(382).text,$chr(32),_)
    if ($did == 168) did -ra $dname 168 $replace($did(168).text,$chr(32),_)
    if ($did == 372) did -ra $dname 372 $remove($did(372).text,$chr(32))

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Autocor

    if ($did == 260) { set %autocor.charspace $did(260) | mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;]) }
    if ($did == 197) { set %autocor.pre $did(197).text | mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;]) }
    if ($did == 196) { set %autocor.suf $did(196).text | mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;]) }

    if ($did == 249) {
      var %replace = $puttok(%pop.autocor.count.inc,$iif($did(249).text, $did(249).text, <contar>), 2, 127)
      set %pop.autocor.count.inc %replace
      mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;])
    }
    if ($did == 251) {
      var %replace = $puttok(%pop.autocor.count.inc,$iif($did(251).text, $iif($did(251).text isnum,$did(251).text, 0), 0), 1, 127)
      set %pop.autocor.count.inc %replace

      mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;])
    }


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Carinha

    if ($did == 274) mypreview $dname 269 63 21 $iif($did(274),$did(274),$chr(160))
    if ($did == 279) { set %carinha.barba $did(279) | var %char = :) | mypreview $dname 269 63 21 $`myface(%char) }
    if ($did == 277) { set %carinha.nariz.edit $did(277) | var %char = :) | mypreview $dname 269 63 21 $`myface(%char) }
    if ($did == 276) { set %carinha.bone.edit $did(276) | var %char = :) | mypreview $dname 269 63 21 $`myface(%char) }

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Completação de nick

    if ($did == 302) { set %ativadores $did(302).text }

  }
}

;; Carinha
alias -l __listemoticons {
  ; $1 = dialog
  ; $2 = did

  if (!$1) return
  if (!$2) return

  did -r $1 $2

  var %e = 1
  while ($gettok(%list.carinhas,%e,32)) { 
    did -a $1 $2 $gettok(%list.carinhas,%e,32) 
    %e = %e + 1
  }
}







;; Lista de Redes
dialog listnetworks {
  size -1 -1 229 264
  title "Redes"
  icon $aliveicon

  list 1,8 8 150 248,vsbar size , sort
  button "OK",2,161 7 60 30, ok, disable
  button "Cancelar",3,161 40 60 30, cancel
}
on *:dialog:listnetworks:*:*:{
  if ($devent == init) {
    dialog -t $dname Listando redes...
    .timer 1 0 /__lstnetworks
  }
  if ($devent == sclick) {
    if ($did == 1) did -e $dname 2
    if ($did == 2) {
      set %selecionado $did(1).seltext
    }
  }
}
alias __lstnetworks {
  var %ini = 0
  while ($readini(servers.ini,servers,n [ $+ [ %ini ] ]) != $null) {
    if (%tmp.rede) {
      if ($gettok($readini(servers.ini,servers,n [ $+ [ %ini ] ]),4,58) == %tmp.rede) var %achou = true
      else unset %achou
    }

    if (!%achou) {
      did -a listnetworks 1 $gettok($readini(servers.ini,servers,n [ $+ [ %ini ] ]),4,58)
      %tmp.rede = $gettok($readini(servers.ini,servers,n [ $+ [ %ini ] ]),4,58)
    }
    %ini = %ini + 1

  }
  dialog -t listnetworks Selecionar Rede
  unset %tmp.rede
}





;;; TABELA DE CORES

dialog mycolors {
  title "Cores"
  size -1 -1 196 72
  icon $aliveicon

  icon 1, 9 9 16 16, $shortfn(scripts\img\00.bmp)
  icon 2, 29 9 16 16, $shortfn(scripts\img\01.bmp)
  icon 3, 49 9 16 16, $shortfn(scripts\img\02.bmp)
  icon 4, 69 9 16 16, $shortfn(scripts\img\03.bmp)
  icon 5, 89 9 16 16, $shortfn(scripts\img\04.bmp)
  icon 6, 109 9 16 16, $shortfn(scripts\img\05.bmp)
  icon 7, 129 9 16 16, $shortfn(scripts\img\06.bmp)
  icon 8, 149 9 16 16, $shortfn(scripts\img\07.bmp)
  icon 9, 9 29 16 16, $shortfn(scripts\img\08.bmp)
  icon 10, 29 29 16 16, $shortfn(scripts\img\09.bmp)
  icon 11, 49 29 16 16, $shortfn(scripts\img\10.bmp)
  icon 12, 69 29 16 16, $shortfn(scripts\img\11.bmp)
  icon 13, 89 29 16 16, $shortfn(scripts\img\12.bmp)
  icon 14, 109 29 16 16, $shortfn(scripts\img\13.bmp)
  icon 15, 129 29 16 16, $shortfn(scripts\img\14.bmp)
  icon 16, 149 29 16 16, $shortfn(scripts\img\15.bmp)
  icon 17, 172 18 16 16, $shortfn(scripts\img\16.bmp)
  text "«clique em cima da cor desejada»", 18, 14 53 165 13
  button "", 19, 0 0 0 0, hide ok
}
on *:dialog:mycolors:*:*:{
  if ($devent == sclick) {
    if ($did isnum 1-17) {

      tokenize 32 %mycolors

      var %cor = $iif($len($calc($did - 1)) == 1,0 $+ $calc($did - 1),$calc($did - 1))
      did -g $2 $3 $+($shortfn(scripts\img\),%cor,.bmp))

      ;; Carinha
      if ($1 == carinha) { 

        set %carinha.bone $left($right($did($2,283),6),2)
        set %carinha.bone.fundo $left($right($did($2,284),6),2)

        set %carinha.fundo $left($right($did($2,286),6),2)
        set %carinha.olho $left($right($did($2,285),6),2)

        set %carinha.boca.fundo $left($right($did($2,287),6),2)
        set %carinha.boca $left($right($did($2,288),6),2)

        set %carinha.nariz $left($right($did($2,289),6),2)

        var %char = :)
        mypreview $2 269 63 21 $`myface(%char)
      }

      if ($1 == autocor) {
        if (!$dialog(configuracao)) { return }

        if ($did(configuracao,210).sel == 1) {

          ;;;;;;;;;;;;;;;;;;;;;;; 1ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 244) { var %c = $left($right($did($2,244),6),2), %r = $gettok(%autocor.cnormal,1,32), %t = %c $+ $right(%r,2) | set %autocor.cnormal $puttok(%autocor.cnormal,%t,1,32) }
          ;; fundo
          if ($gettok(%mycolors,3,32) == 242) { var %c = $left($right($did($2,242),6),2), %r = $gettok(%autocor.cnormal,1,32), %t = $left(%r,2) $+ %c | set %autocor.cnormal $puttok(%autocor.cnormal,%t,1,32) }
          ;;;;;;;;;;;;;;;;;;;;;;; 2ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 239) { var %c = $left($right($did($2,239),6),2), %r = $gettok(%autocor.cnormal,2,32), %t = %c $+ $right(%r,2) | set %autocor.cnormal $puttok(%autocor.cnormal,%t,2,32) }
          ;; fundo
          if ($gettok(%mycolors,3,32) == 241) { var %c = $left($right($did($2,241),6),2), %r = $gettok(%autocor.cnormal,2,32), %t = $left(%r,2) $+ %c | set %autocor.cnormal $puttok(%autocor.cnormal,%t,2,32) }
          ;;;;;;;;;;;;;;;;;;;;;;; 3ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 234) { var %c = $left($right($did($2,234),6),2), %r = $gettok(%autocor.cnormal,3,32), %t = %c $+ $right(%r,2) | set %autocor.cnormal $puttok(%autocor.cnormal,%t,3,32) }
          ;; fundo
          if ($gettok(%mycolors,3,32) == 232) { var %c = $left($right($did($2,232),6),2), %r = $gettok(%autocor.cnormal,3,32), %t = $left(%r,2) $+ %c | set %autocor.cnormal $puttok(%autocor.cnormal,%t,3,32) }
          ;;;;;;;;;;;;;;;;;;;;;;; 4ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 229) { var %c = $left($right($did($2,229),6),2), %r = $gettok(%autocor.cnormal,4,32), %t = %c $+ $right(%r,2) | set %autocor.cnormal $puttok(%autocor.cnormal,%t,4,32) }
          ;; fundo
          if ($gettok(%mycolors,3,32) == 231) { var %c = $left($right($did($2,231),6),2), %r = $gettok(%autocor.cnormal,4,32), %t = $left(%r,2) $+ %c | set %autocor.cnormal $puttok(%autocor.cnormal,%t,4,32) }
          ;;;;;;;;;;;;;;;;;;;;;;; 5ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 224) { var %c = $left($right($did($2,224),6),2), %r = $gettok(%autocor.cnormal,5,32), %t = %c $+ $right(%r,2) | set %autocor.cnormal $puttok(%autocor.cnormal,%t,5,32) }
          ;; fundo
          if ($gettok(%mycolors,3,32) == 222) { var %c = $left($right($did($2,222),6),2), %r = $gettok(%autocor.cnormal,5,32), %t = $left(%r,2) $+ %c | set %autocor.cnormal $puttok(%autocor.cnormal,%t,5,32) }

          ;;;;;;;;;;;;;;;;;;;;;;; 6ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 219) { var %c = $left($right($did($2,219),6),2), %r = $gettok(%autocor.cnormal,6,32), %t = %c $+ $right(%r,2) | set %autocor.cnormal $puttok(%autocor.cnormal,%t,6,32) }
          ;; fundo
          if ($gettok(%mycolors,3,32) == 221) { var %c = $left($right($did($2,221),6),2), %r = $gettok(%autocor.cnormal,6,32), %t = $left(%r,2) $+ %c | set %autocor.cnormal $puttok(%autocor.cnormal,%t,6,32) }
        }

        else if ($did(configuracao,210).sel == 2) {

          ;;;;;;;;;;;;;;;;;;;;;;; 2ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 600) { var %c = $left($right($did($2,600),6),2), %r = $gettok(%autocor.noname,2,32), %t = %c $+ $right(%r,2) | set %autocor.noname $puttok(%autocor.noname,%t,2,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 601) { var %c = $left($right($did($2,601),6),2), %r = $gettok(%autocor.noname,2,32), %t = $left(%r,2) $+ %c | set %autocor.noname $puttok(%autocor.noname,%t,2,32) }

          ;;;;;;;;;;;;;;;;;;;;;;; 1ª cor
          ;; letra
          else if ($gettok(%mycolors,3,32) == 603) { var %c = $left($right($did($2,603),6),2), %r = $gettok(%autocor.noname,1,32), %t = %c $+ $right(%r,2) | set %autocor.noname $puttok(%autocor.noname,%t,1,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 604) { var %c = $left($right($did($2,604),6),2), %r = $gettok(%autocor.noname,1,32), %t = $left(%r,2) $+ %c | set %autocor.noname $puttok(%autocor.noname,%t,1,32) }

        }

        else if ($did(configuracao,210).sel == 3) {

          ;;;;;;;;;;;;;;;;;;;;;;; 2ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 610) { var %c = $left($right($did($2,610),6),2), %r = $gettok(%autocor.space,2,32), %t = %c $+ $right(%r,2) | set %autocor.space $puttok(%autocor.space,%t,2,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 611) { var %c = $left($right($did($2,611),6),2), %r = $gettok(%autocor.space,2,32), %t = $left(%r,2) $+ %c | set %autocor.space $puttok(%autocor.space,%t,2,32) }

          ;;;;;;;;;;;;;;;;;;;;;;; 1ª cor
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 613) { 
            var %c = $left($right($did($2,613),6),2), %r = $gettok(%autocor.space,1,32), %t = %c $+ $right(%r,2) 
            set %autocor.space $puttok(%autocor.space,%t,1,32) 
          }
          ;; letra
          else if ($gettok(%mycolors,3,32) == 614) { 
            var %c = $left($right($did($2,614),6),2), %r = $gettok(%autocor.space,1,32), %t = $left(%r,2) $+ %c 
            set %autocor.space $puttok(%autocor.space,%t,1,32) 
          }

        }

        else if ($did(configuracao,210).sel == 4) {

          ;;;;;;;;;;;;;;;;;;;;;;; 2ª cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 620) { var %c = $left($right($did($2,620),6),2), %r = $gettok(%autocor.that,2,32), %t = %c $+ $right(%r,2) | set %autocor.that $puttok(%autocor.that,%t,2,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 621) { var %c = $left($right($did($2,621),6),2), %r = $gettok(%autocor.that,2,32), %t = $left(%r,2) $+ %c | set %autocor.that $puttok(%autocor.that,%t,2,32) }

          ;;;;;;;;;;;;;;;;;;;;;;; 1ª cor
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 623) { 
            var %c = $left($right($did($2,623),6),2), %r = $gettok(%autocor.that,1,32), %t = %c $+ $right(%r,2) 
            set %autocor.that $puttok(%autocor.that,%t,1,32) 
          }
          ;; letra
          else if ($gettok(%mycolors,3,32) == 624) { 
            var %c = $left($right($did($2,624),6),2), %r = $gettok(%autocor.that,1,32), %t = $left(%r,2) $+ %c 
            set %autocor.that $puttok(%autocor.that,%t,1,32) 
          }
        }
        else if ($did(configuracao,210).sel == 5) {

          ;;;;;;;;;;;;;;;;;;;;;;; 1ª Cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 634) { var %c = $left($right($did($2,634),6),2), %r = $gettok(%autocor.weak,1,32), %t = %c $+ $right(%r,2) | set %autocor.weak $puttok(%autocor.weak,%t,1,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 633) { var %c = $left($right($did($2,633),6),2), %r = $gettok(%autocor.weak,1,32), %t = $left(%r,2) $+ %c | set %autocor.weak $puttok(%autocor.weak,%t,1,32) }

          ;;;;;;;;;;;;;;;;;;;;;;;; 2ª Cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 630) { var %c = $left($right($did($2,630),6),2), %r = $gettok(%autocor.weak,2,32), %t = %c $+ $right(%r,2) | set %autocor.weak $puttok(%autocor.weak,%t,2,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 631) { var %c = $left($right($did($2,631),6),2), %r = $gettok(%autocor.weak,2,32), %t = $left(%r,2) $+ %c | set %autocor.weak $puttok(%autocor.weak,%t,2,32) }

          ;;;;;;;;;;;;;;;;;;;;;;;; 3ª Cor
          ;; letra
          if ($gettok(%mycolors,3,32) == 637) { var %c = $left($right($did($2,637),6),2), %r = $gettok(%autocor.weak,3,32), %t = %c $+ $right(%r,2) | set %autocor.weak $puttok(%autocor.weak,%t,3,32) }
          ;; fundo
          else if ($gettok(%mycolors,3,32) == 636) { var %c = $left($right($did($2,636),6),2), %r = $gettok(%autocor.weak,3,32), %t = $left(%r,2) $+ %c | set %autocor.weak $puttok(%autocor.weak,%t,3,32) }

          ;;;;;;;;;;;;;;;;;;;;;;;; Cor fundo
          ;;;; if ($gettok(%mycolors,3,32) == 639) { var %c = $left($right($did($2,639),6),2), %r = $gettok(%autocor.weak,4,32), %t = %c | set %autocor.weak $puttok(%autocor.weak,%t,4,32) }


        }

        mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;])

      }

      dialog -x mycolors mycolors
      unset %mycolors
    }
  }
}



;; NICK COMPLETION, ESCOLHA DE CANAL

dialog choose {
  title ""
  size -1 -1 166 211
  icon $aliveicon

  list 2, 4 5 158 130, size
  text "", 3, 5 136 157 44, center

  button "Selecionar", 5, 32 183 106 21,okdefault, disable
  button "Cancelar", 6, 0 0 0 0, cancel, hide
}
on *:dialog:choose:*:*: {

  ;;;;;;;;;;;;;;; INIT


  ;;;;;;;;;;;;;;; CLOSE
  if ($devent == close) {
    unset %command %nc.chan %nc.nick %nc.nickadd %nc.nick3 %nc.msg %nc.who 
  }

  ;;;;;;;;;;;;;;; SCLICK
  else if ($devent == sclick) {
    if ($did == 2) did -e $dname 5

    if ($did == 5) {
      if (motivo² isin %command) { $replace(%command,CHAN,$did(2,$did(2).sel)) $input(Motivo: [opcional],qe,Requisição) | unset %command }
      else if (NICK2$$ isin %command) { 
        ;$replace(%command,CHAN$$,$did(2,$did(2).sel),NICK2$$,$did(2,$did(2).sel)) 
        set %nc.who $did(2,$did(2).sel)
        .signal -n nickcompletion %nc.chan
        unset %command 
      } 
      else { $replace(%command,CHAN$$,$did(2,$did(2).sel),NICK$$,$did(2,$did(2).sel)) | unset %command }
      if ($did(2,$did(2).sel) == $null) { unset %command } 
      unset %canal.m
    }

    if ($did == 6) { unset %command | return }

  }

  ;;;;;;;;;;;;;;; DCLICK
  else if ($devent == dclick) {

    if ($did == 2) {
      if (motivo² isin %command) { $replace(%command,CHAN,$did(2,$did(2).sel)) $input(Motivo: [opcional],qe,Requisição) | unset %command }
      else if (NICK2$$ isin %command) { 
        ;$replace(%command,CHAN$$,$did(2,$did(2).sel),NICK2$$,$did(2,$did(2).sel)) 
        set %nc.who $did(2,$did(2).sel)
        .signal -n nickcompletion %nc.chan
        unset %command 
      } 
      else { $replace(%command,CHAN$$,$did(2,$did(2).sel),NICK$$,$did(2,$did(2).sel)) | unset %command }
      if ($did(2,$did(2).sel) == $null) { unset %command } 
    }

  }
}
on *:signal:nickcompletion: {
  if (%nc.who != $null) { 
    if ($1 != $null && $me ison $1) {
      msg $1 $replace($nickcompletion,$chr(160),$chr(32)) $autocor($gettok(%nc.msg,2-,32))
    }
    else { 
      say $replace($nickcompletion,$chr(160),$chr(32)) $autocor($gettok(%nc.msg,2-,32))
      unset %nc.nickadd %nc.nick %nc.chan %nc.msg
    }
  }
  else {
    if ($1 != $null && $me ison $1) {

      if (C isin $chan($1).mode && $me !isop $1 && $me !isvo $1) { msg $1 $strip(%nc.msg) }
      else if (c isin $chan($1).mode && $me !isop $1 && $me !isvo $1) { msg $1 $strip(%nc.msg,c) }
      else { msg $1 $autocor(%nc.msg) }

      unset %nc.msg 
    }
    else { say $autocor(%nc.msg) | unset %nc.msg }
  }
  unset %nc.chan %nc.nick %nc.nickadd %nc.nick3
  halt
}

alias __choose {
  __opendialog choose

  dialog -t choose Escolha um nick
  did -ra choose 3 Mais de um nick foi encontrado com ' $+ %nc.nick3 $+ '

  unset %nc.nick3

  var %n = 1
  while ($gettok(%nc.nickadd,%n,32)) { did -a choose 2 $gettok(%nc.nickadd,%n,32) | inc %n }
}
alias __chooseNC set %command $1- | __choose


;;; Away : Escolha do motivo
alias away_motivo noop $dialog(away_motivo,away_motivo,-4)
dialog away_motivo {
  size -1 -1 382 104
  title "Ficar ausente"
  icon $aliveicon

  text "Motivo:",1,11 11 44 17
  combo 2,10 30 364 150,drop  edit

  button "Away",3,105 65 75 25, ok, default
  button "Cancelar",4, 190 65 75 25, cancel
}
on *:dialog:away_motivo:*:*: {
  if ($devent == init) { .loadbuf -o $dname 2 $shortfn(docs\away.txt) }
  else if ($devent == sclick) {
    if ($did == 3) { away $did(2).text }
  }
}


;; Completação de nick

dialog nc.edit {
  title "Editor de Completação de nick"
  size -1 -1 444 256
  icon $aliveicon

  box "Meus estilos", 1, 7 8 136 208
  list 2, 12 24 126 160, size sort
  button "Remover", 3, 13 190 123 21, disable
  box "Editor", 4, 150 8 287 172
  text "Parte esquerda do nick:", 5, 168 37 115 13
  edit "", 6, 292 32 89 22, multi return autohs
  text "Meio do nick:", 7, 168 69 115 13, right
  edit "", 8, 292 64 45 22, multi return autohs right
  edit "", 17, 336 64 46 22, multi return autohs
  text "Parte direita do nick:", 9, 172 101 115 13, right
  edit "", 10, 292 96 89 22, multi return autohs
  text "Nome para a sua completação de nick:", 11, 165 131 191 13
  edit "", 12, 164 148 261 22, return autohs
  box "", 13, 150 172 287 44
  icon 14, 156 186 278 23, $mircexe, noborder

  button "Salvar", 15, 282 225 75 25,default disable
  button "Fechar", 16, 362 225 75 25,ok
}

on *:dialog:nc.edit:*:*: {

  if ($devent == init) {
    __mdx SetFont 1,4 ANSI 13 700 Tahoma
    mypreview $dname 14 278 23 Selecione ao lado ou crie

    var %n = 1
    while $ini(configs\nc.ini,%n) {
      did -a $dname 2 $ini(configs\nc.ini,%n)
      inc %n
    }
  }

  else if ($devent == sclick) {
    if ($did == 3) {
      if ($$input(Remover mesmo esse estilo?,qy,Confirmação) == $true) {
        .remini configs\nc.ini $did(2,$did(2).sel)
        .remini configs\nc2.ini usar $did(2,$did(2).sel)

        var %var = $did(2).sel
        did -d $dname 2 $did(2).sel
        did -b $dname 3

        __listNCedit
        __listNC
      }
    }

    if ($did == 2) {
      did -e $dname 3
      did -ra $dname 6 $replace($readini(configs\nc.ini,$did(2,$did(2).sel),inicio),*%&k,,*%&b,,*%&u,,*%&r,,*%&o,)
      did -ra $dname 8 $replace($readini(configs\nc.ini,$did(2,$did(2).sel),meio),*%&k,,*%&b,,*%&u,,*%&r,,*%&o,)
      did -ra $dname 17 $replace($readini(configs\nc.ini,$did(2,$did(2).sel),meio1),*%&k,,*%&b,,*%&u,,*%&r,,*%&o,)
      did -ra $dname 10 $replace($readini(configs\nc.ini,$did(2,$did(2).sel),fim),*%&k,,*%&b,,*%&u,,*%&r,,*%&o,)
      did -ra $dname 12 $did(2,$did(2).sel)
      mypreview $dname 14 278 23 $nickcompletion(nick,$did(2).seltext) $autocor(sua mensagem)
    }
    if ($did == 15) {
      %nc = $did(12)
      var %s 1
      while ($ini(configs\nc.ini,%s)) {
        tokenize 32 $ini(configs\nc.ini,%s)
        if ($1 == %nc) { 
          if (!$$input(Já existe uma completação de nick com esse nome $+ $chr(44) deseja substituir?,520,Confirmação)) { unset %nc | halt }
        }
        inc %s 
      }
      writeini configs\nc.ini %nc inicio $replace($iif($did(6),$did(6),""),,*%&k,,*%&b,,*%&u,,*%&o,,*%&r,$chr(32),$chr(160))
      writeini configs\nc.ini %nc meio $replace($iif($did(8),$did(8),""),,*%&k,,*%&b,,*%&u,,*%&o,,*%&r,$chr(32),$chr(160))
      writeini configs\nc.ini %nc meio1 $replace($iif($did(17),$did(17),""),,*%&k,,*%&b,,*%&u,,*%&o,,*%&r,$chr(32),$chr(160))
      writeini configs\nc.ini %nc fim $replace($iif($did(10),$did(10),""),,*%&k,,*%&b,,*%&u,,*%&o,,*%&r,$chr(32),$chr(160))
      did -r $dname 2
      var %n = 1
      while ($ini(configs\nc.ini,%n)) { did -a $dname 2 $ini(configs\nc.ini,%n) | inc %n }
      unset %nc

      __listNC

      __aviso io Completação de nick:Estilo cadastrado com sucesso!
    }

  }

  else if ($devent == edit) {
    if ($did == 12) { did -ra $dname 12 $replace($did(12),$chr(32),$chr(160)) | did $iif($did(12),-e,-b) $dname 15 }
    if ($istok(6 8 17 10,$did,32)) mypreview $dname 14 278 23 $nickcompletion(nick,"") $autocor(sua mensagem)
  }
}

alias -l __listNC {
  if ($dialog(configuracao)) {
    did -r configuracao 304,305
    var %n = 1
    while ($ini(configs\nc.ini,%n)) {
      var %nsel = $ini(configs\nc.ini,%n)
      if (!$ini(configs\nc2.ini,usar,%nsel)) { did -a configuracao 304 $ini(configs\nc.ini,%n) }
      inc %n 
    }
    var %a = 1
    while ($ini(configs\nc2.ini,usar,%a)) { did -a configuracao 305 $ini(configs\nc2.ini,usar,%a) | inc %a }
  }
}
alias __listNCedit {
  if ($dialog(nc.edit)) {
    did -r nc.edit 2
    var %w = 1
    while $ini(configs\nc.ini,%w) { did -a nc.edit 2 $ini(configs\nc.ini,%w) | inc %w }
  }
}

alias __loadcolor {

  ;; cor normal
  if ($1 == 1) {

    if (%autocor.alt) { did -c configuracao 205 | did -e configuracao 208,209,214 }
    else { did -b configuracao 208,209,214 }

    if ( isin %autocor.alt.nsr) did -c configuracao 209
    if ( isin %autocor.alt.nsr) did -c configuracao 214
    if ( isin %autocor.alt.nsr) did -c configuracao 208

    if ($did(configuracao,237).state) { did -b configuracao 205,206,207,208,209,214 | did -e $dname 239,241 }
    else { did -e configuracao 205,206,207,208,209,214 | did -b $dname 239,241 }

    if ( isin %autocor.ns) did -c configuracao 211
    if ( isin %autocor.ns) did -c configuracao 212

    ;; 1ª cor
    if ($gettok(%autocor.cnormal,1,32) != XXXX) did -c configuracao 246
    var %ccor = $gettok(%autocor.cnormal,1,32)
    if (%ccor == XXXX) || (!%ccor) var %ccor = 1616
    did -g configuracao 242 $+($shortfn($mircdirscripts\img\),$right(%ccor,2),.bmp)
    did -g configuracao 244 $+($shortfn($mircdirscripts\img\),$left(%ccor,2),.bmp)
    if ($did(configuracao,246).state == 0) did -b configuracao 237,239,241,242,244
    else { did -e configuracao 242,244 }

    ;; 2ª cor
    if ($gettok(%autocor.cnormal,2,32) != XXXX) did -c configuracao 237
    var %ccor = $gettok(%autocor.cnormal,2,32)
    if (%ccor == XXXX) || (!%ccor) var %ccor = 1616
    did -g configuracao 241 $+($shortfn($mircdirscripts\img\),$right(%ccor,2),.bmp)
    did -g configuracao 239 $+($shortfn($mircdirscripts\img\),$left(%ccor,2),.bmp)
    if ($did(configuracao,237).state == 0) did -b configuracao 232,234,236,239,241

    ;; 3ª cor
    if ($gettok(%autocor.cnormal,3,32) != XXXX) did -c configuracao 236
    var %ccor = $gettok(%autocor.cnormal,3,32)
    if (%ccor == XXXX) || (!%ccor) var %ccor = 1616
    did -g configuracao 232 $+($shortfn($mircdirscripts\img\),$right(%ccor,2),.bmp)
    did -g configuracao 234 $+($shortfn($mircdirscripts\img\),$left(%ccor,2),.bmp)
    if ($did(configuracao,236).state == 0) did -b configuracao 227,229,231,232,234
    else did -e configuracao 232,234

    ;; 4ª cor
    if ($gettok(%autocor.cnormal,4,32) != XXXX) did -c configuracao 227
    var %ccor = $gettok(%autocor.cnormal,4,32)
    if (%ccor == XXXX) || (!%ccor) var %ccor = 1616
    did -g configuracao 231 $+($shortfn($mircdirscripts\img\),$right(%ccor,2),.bmp)
    did -g configuracao 229 $+($shortfn($mircdirscripts\img\),$left(%ccor,2),.bmp)
    if ($did(configuracao,227).state == 0) did -b configuracao 222,224,226,229,231
    else did -e configuracao 229,231

    ;; 5ª cor
    if ($gettok(%autocor.cnormal,5,32) != XXXX) did -c configuracao 226
    var %ccor = $gettok(%autocor.cnormal,5,32)
    if (%ccor == XXXX) || (!%ccor) var %ccor = 1616
    did -g configuracao 222 $+($shortfn($mircdirscripts\img\),$right(%ccor,2),.bmp)
    did -g configuracao 224 $+($shortfn($mircdirscripts\img\),$left(%ccor,2),.bmp)
    if ($did(configuracao,226).state == 0) did -b configuracao 217,219,221,222,224
    else did -e configuracao 222,224

    ;; 6ª cor
    if ($gettok(%autocor.cnormal,6,32) != XXXX) { did -c configuracao 217 | did -e configuracao 219,221 }
    else did -b configuracao 219,221
    var %ccor = $gettok(%autocor.cnormal,6,32)
    if (%ccor == XXXX) || (!%ccor) var %ccor = 1616
    did -g configuracao 221 $+($shortfn($mircdirscripts\img\),$right(%ccor,2),.bmp)
    did -g configuracao 219 $+($shortfn($mircdirscripts\img\),$left(%ccor,2),.bmp)

    ;; cor fundo
    ;; did -h configuracao 215,216


    ;; Cor normal
    did -v configuracao 242,244,241,239,232,234,231,229,222,224,221,219,246,237,236,227,226,217,259,260,261,262,263,211,212,213
    did -h configuracao 600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,640
  }

  ;; Cor Sem Nome
  else if ($1 == 2) {
    did -h configuracao 242,244,241,239,232,234,231,229,222,224,221,219,246,237,236,227,226,217,259,260,261,262,263,211,212,213,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629
    did -h configuracao 630,631,632,633,634,635,636,637,638,640
    did -v configuracao 600,601,602,603,604,605,606,607,608,609

    ;; Cor sem nome (2ª cor)
    if ($gettok(%autocor.noname,2,32) != XXXX) did -c configuracao 602
    var %ccor1 = $gettok(%autocor.noname,2,32)
    if (%ccor1 == XXXX) || (!%ccor1) var %ccor1 = 1616
    did -g configuracao 600 $+($shortfn($mircdirscripts\img\),$left(%ccor1,2),.bmp)
    did -g configuracao 601 $+($shortfn($mircdirscripts\img\),$right(%ccor1,2),.bmp)
    if ($did(configuracao,602).state == 0) did -b configuracao 600,601
    else { did -e configuracao 600,601 }

    ;; Cor sem nome (1ª cor)
    if ($gettok(%autocor.noname,1,32) != XXXX) did -c configuracao 605
    var %ccor2 = $gettok(%autocor.noname,1,32)
    if (%ccor2 == XXXX) || (!%ccor2) var %ccor2 = 1616
    did -g configuracao 603 $+($shortfn($mircdirscripts\img\),$left(%ccor2,2),.bmp)
    did -g configuracao 604 $+($shortfn($mircdirscripts\img\),$right(%ccor2,2),.bmp)
    if ($did(configuracao,605).state == 0) did -b configuracao 603,604
    else { did -e configuracao 603,604 }
  }
  ;; Cor no espaço
  else if ($1 == 3) {

    did -v configuracao 610,611,612,613,614,615,616,617,618,619
    did -h configuracao 600,601,602,603,604,605,606,607,608,609,630,631,632,633,634,635,636,637,638,640
    did -h configuracao 242,244,241,239,232,234,231,229,222,224,221,219,246,237,236,227,226,217,259,260,261,262,263,211,212,213,620,621,622,623,624,625,626,627,628,629

    ;; Cor sem nome (2ª cor)
    if ($gettok(%autocor.space,2,32) != XXXX) did -c configuracao 612
    var %ccor1 = $gettok(%autocor.space,2,32)
    if (%ccor1 == XXXX) || (!%ccor1) var %ccor1 = 1616
    did -g configuracao 610 $+($shortfn($mircdirscripts\img\),$left(%ccor1,2),.bmp)
    did -g configuracao 611 $+($shortfn($mircdirscripts\img\),$right(%ccor1,2),.bmp)
    if ($did(configuracao,612).state == 0) did -b configuracao 610,611
    else { did -e configuracao 610,611 }

    ;; Cor sem nome (1ª cor)
    if ($gettok(%autocor.space,1,32) != XXXX) did -c configuracao 615
    var %ccor2 = $gettok(%autocor.space,1,32)
    if (%ccor2 == XXXX) || (!%ccor2) var %ccor2 = 1616
    did -g configuracao 613 $+($shortfn($mircdirscripts\img\),$left(%ccor2,2),.bmp)
    did -g configuracao 614 $+($shortfn($mircdirscripts\img\),$right(%ccor2,2),.bmp)
    if ($did(configuracao,615).state == 0) did -b configuracao 613,614
    else { did -e configuracao 613,614 }
  }
  else if ($1 == 4) {
    did -v configuracao 620,621,622,623,624,625,626,627,628,629
    did -h configuracao 610,611,612,613,614,615,616,617,618,619,600,601,602,603,604,605,606,607,608,609,630,631,632,633,634,635,636,637,638,640
    did -h configuracao 242,244,241,239,232,234,231,229,222,224,221,219,246,237,236,227,226,217,259,260,261,262,263,211,212,213

    ;; Cor assim e tal (2ª cor)
    if ($gettok(%autocor.that,2,32) != XXXX) did -c configuracao 622
    var %ccor1 = $gettok(%autocor.that,2,32)
    if (%ccor1 == XXXX) || (!%ccor1) var %ccor1 = 1616
    did -g configuracao 620 $+($shortfn($mircdirscripts\img\),$left(%ccor1,2),.bmp)
    did -g configuracao 621 $+($shortfn($mircdirscripts\img\),$right(%ccor1,2),.bmp)
    if ($did(configuracao,622).state == 0) did -b configuracao 620,621
    else { did -e configuracao 620,621 }

    ;; Cor assim e tal (1ª cor)
    if ($gettok(%autocor.that,1,32) != XXXX) did -c configuracao 625
    var %ccor2 = $gettok(%autocor.that,1,32)
    if (%ccor2 == XXXX) || (!%ccor2) var %ccor2 = 1616
    did -g configuracao 623 $+($shortfn($mircdirscripts\img\),$left(%ccor2,2),.bmp)
    did -g configuracao 624 $+($shortfn($mircdirscripts\img\),$right(%ccor2,2),.bmp)
    if ($did(configuracao,625).state == 0) did -b configuracao 623,624
    else { did -e configuracao 623,624 }
  }
  else if ($1 == 5) {
    did -v configuracao 630,631,632,633,634,635,636,637,638,640

    did -h configuracao 620,621,622,623,624,625,626,627,628,629
    did -h configuracao 610,611,612,613,614,615,616,617,618,619,600,601,602,603,604,605,606,607,608,609
    did -h configuracao 242,244,241,239,232,234,231,229,222,224,221,219,246,237,236,227,226,217,259,260,261,262,263,211,212,213


    ;; Cor fraco e forte (1ª cor)
    if ($gettok(%autocor.weak,1,32) != XXXX) did -c configuracao 635
    var %tccor1 = $gettok(%autocor.weak,1,32)
    if (%tccor1 == XXXX) || (!%tccor1) var %tccor1 = 1616
    did -g configuracao 633 $+($shortfn($mircdirscripts\img\),$right(%tccor1,2),.bmp)
    did -g configuracao 634 $+($shortfn($mircdirscripts\img\),$left(%tccor1,2),.bmp)
    if ($did(configuracao,635).state == 0) did -b configuracao 633,634
    else { did -e configuracao 633,634 }

    ;; Cor fraco e forte (2ª cor)
    if ($gettok(%autocor.weak,2,32) != XXXX) did -c configuracao 632
    var %tccor2 = $gettok(%autocor.weak,2,32)
    if (%tccor2 == XXXX) || (!%tccor2) var %tccor2 = 1616
    did -g configuracao 630 $+($shortfn($mircdirscripts\img\),$left(%tccor2,2),.bmp)
    did -g configuracao 631 $+($shortfn($mircdirscripts\img\),$right(%tccor2,2),.bmp)
    if ($did(configuracao,632).state == 0) did -b configuracao 630,631
    else { did -e configuracao 630,631 }

    ;; Cor fraco e forte (3ª cor)
    if ($gettok(%autocor.weak,3,32) != XXXX) did -c configuracao 638
    var %tccor3 = $gettok(%autocor.weak,3,32)
    if (%tccor3 == XXXX) || (!%tccor3) var %tccor3 = 1616
    did -g configuracao 636 $+($shortfn($mircdirscripts\img\),$right(%tccor3,2),.bmp)
    did -g configuracao 637 $+($shortfn($mircdirscripts\img\),$left(%tccor3,2),.bmp)
    if ($did(configuracao,638).state == 0) did -b configuracao 636,637
    else { did -e configuracao 636,637 }

    ;; Cor fraco e forte (fundo)
    if (left isin %autocor.weak) did -c configuracao 640
    else did -u configuracao 640

  }

  mypreview configuracao 198 324 22 $mycolors(eu uso alive script ;])
}

;; Lista : Amigos
dialog amigos {
  title "Amigos"
  size -1 -1 300 243

  icon $aliveicon
  option pixels

  edit "", 1, 12 14 198 21
  button "Adicionar", 2, 214 14 75 25, default
  button "Remover", 3, 214 44 75 25
  list 4, 13 37 196 196, size
  button "Hugs...", 5, 214 98 75 25

  button "Fechar", 6, 214 206 75 25, cancel
}

on *:dialog:amigos:*:*:{

  if ($devent == init) {

  }
  else if ($devent == sclick) {
    if ($did == 2) {
      if (!$did(1).text) { __aviso io Amigos:Informe o nick! | did -f amigos 1 | return }
    }
  }
}


;------------------------------------------------------------
; EOF
;------------------------------------------------------------
