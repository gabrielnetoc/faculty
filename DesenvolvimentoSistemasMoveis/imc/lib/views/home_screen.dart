import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _resultadoIMC = "";

  void _calcularIMC() {
    if (double.tryParse(_controllerPeso.text) != null &&
        double.tryParse(_controllerAltura.text) != null) {
      double peso = double.parse(_controllerPeso.text);
      double altura = double.parse(_controllerAltura.text);
      double imc = peso / (altura * altura);

      if (imc < 18.5) {
        setState(() {
          _resultadoIMC = "Abaixo do Peso";
        });
      } else if (imc >= 18.6 && imc <= 24.9) {
        setState(() {
          _resultadoIMC = "Peso Ideal";
        });
      } else if (imc >= 25.0 && imc <= 29.9) {
        setState(() {
          _resultadoIMC = "Levemente acima do peso";
        });
      } else if (imc >= 30.0 && imc <= 34.9) {
        setState(() {
          _resultadoIMC = "Obesidade grau 1";
        });
      } else if (imc >= 35.0 && imc <= 39.9) {
        setState(() {
          _resultadoIMC = "Obesidade grau 2";
        });
      } else if (imc > 40) {
        setState(() {
          _resultadoIMC = "Obesidade grau 3";
        });
      } else {
        setState(() {
          _resultadoIMC = "Dados Inválidos";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset("assets/imgs/imc.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "Calcule seu Índice de Massa Corporal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Peso"),
                style: TextStyle(fontSize: 20),
                controller: _controllerPeso,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura"),
                style: TextStyle(fontSize: 20),
                controller: _controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  child: Text("Calcular"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: _calcularIMC,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  _resultadoIMC,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
