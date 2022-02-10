import 'dart:ui';

import 'package:ads_app/service/user_service.dart';
import 'package:ads_app/views/home_screen.dart';
import 'package:ads_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ads_app/models/user.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final UserService _user = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      cursorWidth: 2.5,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: Icon(Icons.person),
                          hintText: "Nome",
                          filled: true,
                          fillColor: Colors.blue[50],
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.black12)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tem que preencher zé";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      cursorWidth: 2.5,
                      controller: _telController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Telefone",
                          filled: true,
                          fillColor: Colors.blue[50],
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.black)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tem que preencher zé";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      controller: _senhaController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Senha",
                          filled: true,
                          fillColor: Colors.blue[50],
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.black)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tem que preencher zé";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool? cad = await _user.newUser(User(
                                id: 0,
                                nome: _nameController.text,
                                telefone: _telController.text,
                                senha: _senhaController.text));

                            if (cad == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            } else {
                              final snackBar = SnackBar(
                                content: Text(
                                    "Erro ao cadastrar, verifique seus dados, zé!"),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já possui conta?',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Acessar",
                            style: TextStyle(
                              color: Colors.blue[800],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
