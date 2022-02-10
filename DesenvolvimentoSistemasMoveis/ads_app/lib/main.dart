import 'package:ads_app/views/cadastro_screen.dart';
import 'package:flutter/material.dart';
import 'package:ads_app/views/login_screen.dart';
import 'package:ads_app/views/create_ad.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Gerenciador de Anúncios',
      routes: {"/": (context) => LoginScreen()},
    ),
  );
}




/*v3*/

/*Desenvolva um aplicativo Flutter que terá como objetivo cadastrar e apresentar  
anúncios de serviços e/ou produtos (OLX, Mercado Livre, … ). 
O aplicativo desenvolvido deverá realizar todas as operações solicitadas realizando
 a comunicação com a API REST disponibilizada pelo professor. 

O aplicativo deverá ser capaz de cadastrar um usuário com as 
seguintes informações obrigatórias: Nome, telefone e senha. 
Após cadastrar o usuário, o aplicativo deve permitir que o 
usuário realize login no aplicativo, utilizando o campo telefone e senha. 
Somente usuários logados  terão acesso às operações dos anúncios 
(será controlado pela API REST). 

Cada anúncio terá, obrigatoriamente, um título, descrição e preço. 
Os anúncios serão cadastrados vinculados ao usuário logado e somente 
o usuário que os cadastrou terão acesso aos anúncios. Os anúncios 
cadastrados deverão ser apresentados ao usuário em uma estrutura de lista, 
conforme apresentado em aula. 

O aplicativo também deverá permitir ao usuário logado editar e/ou apagar 
o anúncio por ele cadastrado. 

Por fim, permita também que o usuário logado possa realizar logout da aplicação. Ao final dessa operação a tela de login deve ser apresentada ao usuário. 
*/
