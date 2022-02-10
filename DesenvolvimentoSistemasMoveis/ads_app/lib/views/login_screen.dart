import 'dart:developer';

import 'package:ads_app/database/shared_preferences.dart';
import 'package:ads_app/helpers/login_helper.dart';
import 'package:ads_app/models/user.dart';
import 'package:ads_app/views/cadastro_screen.dart';
import 'package:ads_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final LoginHelper _user = LoginHelper();

  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    bool? loged = await Shared_Preferences.logged();
    if (loged != null && loged) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                  "Entrar",
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                          prefixIcon: Icon(Icons.person),
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
                    SizedBox(height: 25),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
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
                            bool? log = await _user.login(User(
                                id: 0,
                                nome: "",
                                telefone: _telController.text,
                                senha: _senhaController.text));
                            if (log == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            } else {
                              final snackBar = SnackBar(
                                content: Text(
                                    "Erro ao logar, verifique suas credencias, zé!"),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          "Acessar",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não possui cadastro?',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastroScreen()));
                          },
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Colors.blue[900],
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
