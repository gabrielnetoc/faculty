import 'package:flutter/material.dart';
import 'package:imc/views/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffEED1D8),
      ),
      home: Home(),
    ),
  );
}

/*

Desenvolva um aplicativo Flutter que irá calcular o Índice de Massa Corpórea (IMC) do usuário. O IMC é reconhecido como padrão internacional para avaliar o grau de sobrepeso e obesidade. É calculado dividindo o peso (em kg) pela altura ao quadrado (em metros).

IMC = peso / (altura*altura)

O aplicativo será composto por dois campos de texto, que terão como objetivo receber as informações necessárias do usuário. O primeiro campo é referente ao valor da altura (em metros) e o segundo referente ao peso (em Kg). O aplicativo deve possuir, também, um botão para disparar a ação de cálculo do IMC. 

Ao final do cálculo, o aplicativo deve apresentar em qual classificação o usuário pertence de acordo com a seguinte tabela. 

 */