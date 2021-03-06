algoritmo "JogoDaVelha"
// Função : Jogo da Velha
// Autor : Brenno Cavalcante
// Data : 24/02/2021
// Seção de Declarações
var
  matriz: vetor[1..3, 1..3] de Caractere
  l, c, cont1: inteiro
  posi, simbolo, simbCamp: Caractere
  vencedor, resp: logico

Procedimento MostraTabuleiro()
inicio
  Escreval("+---+---+---+")
  Para l <- 1 ate 3 faca
    Escreva("|  ")
    Para c <- 1 ate 3 faca
        Escreva(matriz[l,c], "|  ")
    FimPara
    Escreval()
    Escreval("+---+---+---+")
  FimPara

FimProcedimento

Funcao Jogada(s: Caractere; p: Caractere): Logico
var  mudou: Logico
inicio
 mudou <- falso
    Para l <- 1 ate 3 faca
     Para c <- 1 ate 3 faca
       Se(matriz[l,c] = p) entao
         matriz[l,c] <- s
         mudou <- verdadeiro

       FimSe
     FimPara
  FimPara

  Retorne mudou
FimFuncao

Funcao VerificaGanhador(): Logico
var cont: inteiro
inicio

   //diagonais
   Se(matriz[1,1] = matriz[2,2]) e (matriz[2,2] = matriz[3,3]) entao
    vencedor <- verdadeiro
   FimSe
   
   Se(matriz[1,3] = matriz[2,2]) e (matriz[2,2] = matriz[3,1]) entao
    vencedor <- verdadeiro
   FimSe

   //linhas horizontais
   Se(matriz[1,1] = matriz[1,2]) e (matriz[1,2] = matriz[1,3]) entao
     vencedor <- verdadeiro
   FimSe
   
   Se(matriz[2,1] = matriz[2,2]) e (matriz[2,2] = matriz[2,3]) entao
     vencedor <- verdadeiro
   FimSe
   
   Se(matriz[3,1] = matriz[3,2]) e (matriz[3,2] = matriz[3,3]) entao
     vencedor <- verdadeiro
   FimSe
   
   //linhas verticais
   Se(matriz[1,1] = matriz[2,1]) e (matriz[2,1] = matriz[3,1]) entao
     vencedor <- verdadeiro
   FimSe

   Se(matriz[1,2] = matriz[2,2]) e (matriz[2,2] = matriz[3,2]) entao
     vencedor <- verdadeiro
   FimSe

   Se(matriz[1,3] = matriz[2,3]) e (matriz[2,3] = matriz[3,3]) entao
     vencedor <- verdadeiro
   FimSe

   //velha
   cont <- 0
   Para l <- 1 ate 3 faca
      Para c <- 1 ate 3 faca
         Se(matriz[l,c] <> "X") e (matriz[l,c] <> "O") entao
            cont <- cont + 1
         FimSe
      FimPara
   FimPara
   Se(cont = 0) entao
     vencedor <- verdadeiro
     simbCamp <- "velha"
   FimSe
   
   Retorne vencedor
FimFuncao

Funcao MudaJogador(s: Caractere): Caractere
inicio
  Se(s = "X") entao
    s <- "O"
  Senao
    s <- "X"
  FimSe
  
  Retorne s
FimFuncao
inicio
  vencedor <- falso
  cont1 <- 1
  Para l <- 1 ate 3 faca
     Para c <- 1 ate 3 faca
        matriz[l,c] <- NumpCarac(cont1)
        cont1 <- cont1 + 1
     FimPara
  FimPara
  
  simbolo <- "X"
  
  Repita
     MostraTabuleiro()
     
     Repita

        Escreval("Vai jogar [",simbolo,"] em qual posição?")
        Leia(posi)

        simbCamp <- simbolo
        resp <- Jogada(simbolo, posi)
        
        Se(resp = falso) entao
          LimpaTela
          MostraTabuleiro()
          Escreval("Posição inválida, escolha outra!")
        FimSe
     Ate(resp = verdadeiro)
     
     simbolo <- MudaJogador(simbolo)
     vencedor <- VerificaGanhador()
     LimpaTela
     


  Ate(vencedor = verdadeiro)

  MostraTabuleiro()
  Escreval("JOGO FINALIZADO! [",simbCamp,"] venceu!!")
fimalgoritmo
