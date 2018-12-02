# Implementação

Esse arquivo visa informar o papel de cada arquivo e pacote (pasta) para os futuros desenvolvedores que forem utilizar os códigos, e/ou contribuir com o projeto

## docs

Pasta que armazena todos os arquivos Markdown de documentação do projeto

## src

Pasta que contém todos os arquivos de código do game

* main - Arquivo principal de execução, arquivo que será executado pela engine para rodar o jogo
* conf - Arquivo que determina quais módulos serão utilizados durante a execução do game, visando dessa forma diminuir o processamento. Esse arquivo também é responsável por definir tamanho de tela, icone e nome da janela de execução do game. Esse arquivo será executado antes de qualquer outro, inclusive a main

## src/assets

Essa pasta tem o intuito de armazenar todos os arquivos de imagem, áudio e fontes do jogo, visando dessa forma uma maior organização do projeto como um todo

## src/controllers

Essa pasta contém os principais controladores que são utilizados no jogo.

* CameraController - Controller que possui os scripts de camera para realizar a movimentação e manipulação do mundo do jogo.
* GameDirector - Controller mais importante de todos, ele manipula todo o jogo, faz a inclusão de cenas, e gerencia os métodos necessários para o funcionamento do game. Ele fica armazenada na tabela global do interpretador, para assim ser acessado em qualquer local.

## src/libs

Essa pasta contém os arquivos de biblioteca externos utilizados

## src/models

Pasta que contém os arquivos de modelagem do game

### src/models/actors

Pasta que contém todos os scripts de atores do jogo, como balas, inimigos, dentre outros

* Player - Classe que possui as informações de colisão e do corpo do jogador
* Bar - Classe que possui as informações de colisão e do corpo das barras

### src/models/business

Pasta que contém classes de modelagem que servem como uma abstração para manipulação de recursos importantes

* World - Faz as manipulações no Mundo do game, alterando seus efeitos na física do mesmo

### src/models/submenus

Pata que contém os submenus que irão aparecer durante o jogo, sem que haja a necessidade que tenha a cena atual do jogo alterada totalmente

* PauseGame - Classe que conterá a GUI do submenu do game quando o mesmo for pausado

## src/scenes

Pasta que contém as cenas do game, ou seja, cada uma das telas do jogo

* InGameScene - Cena que possuirá todos os elementos do jogo e da fase
