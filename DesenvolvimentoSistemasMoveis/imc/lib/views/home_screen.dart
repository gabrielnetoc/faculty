import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("assets/imgs/imc.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "Calcule seu Índice de Massa Corporal",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso"),
              style: TextStyle(fontSize: 20),
              //controller: ,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Altura"),
              style: TextStyle(fontSize: 20),
              //controller: ,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: Text("Calcular"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
