import 'package:ads_app/views/create_ad.dart';
import 'package:flutter/material.dart';
import 'package:ads_app/views/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {"/": (context) => Home(), "/cadastro": (context) => CreateAd()},
    ),
  );
}

/*

Desenvolva um aplicativo Flutter que terá como objetivo cadastrar e apresentar  anúncios de serviços e/ou 
produtos (OLX, Mercado Livre, … ). Cada anúncio terá, inicialmente, um título, descrição e preço. 
Os anúncios cadastrados deverão ser apresentados ao usuário em uma estrutura de lista, 
conforme apresentado em aula. 

Para realizar as operações de cadastro e edição é obrigatório a utilização de uma segunda tela, 
realizando a transição sempre que essas operações forem requisitadas. 
A operação de remoção poderá ser realizada diretamente na lista. 

Inicialmente o aplicativo não salvará as informações em Banco de Dados e/ou arquivos. 
Todo controle dos anúncios salvos, editados e/ou removidos serão executados em uma lista. 
Futuramente iremos aprender a trabalhar com Banco de Dados. 


/*******************VERSÃO 2 *******************/

Adicione no aplicativo desenvolvido até o momento suporte para persistência dos dados usando o package SQFLite, 
conforme apresentado em sala de aula.
Você também deve permitir que o usuário possa vincular uma imagem ao anúncio durante o cadastro, 
utilizando o package Image_Picker, e compartilhar as informações do anúncio em pelo um aplicativo do celular 
(SMS, E-mail e/ou Whatsapp), utilizando o package Url_Launcher. 

PS: Podem utilizar o Hive em substituição ao SQFLite, caso prefiram. 

Seja criativo! O design da tela é de sua responsabilidade. 
Utilize os Widgets apresentados durante a aula para criar uma tela bem elaborada.  

 */