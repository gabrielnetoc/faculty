import 'dart:ui';

import 'package:ads_app/models/ads.dart';
import 'package:ads_app/service/ads_service.dart';
import 'package:ads_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key, this.ads}) : super(key: key);
  final Ads? ads;

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _descControler = TextEditingController();
  final TextEditingController _priceControler = TextEditingController();

  final AdsService _adsService = AdsService();

  @override
  void initState() {
    super.initState();
    if (widget.ads != null) {
      _titleControler.text = widget.ads!.titulo;
      _descControler.text = widget.ads!.descricao;
      _priceControler.text = widget.ads!.preco.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Criar Anúncio",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _titleControler,
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
                          prefixIcon: Icon(Icons.edit),
                          hintText: "Título",
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
                      controller: _descControler,
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
                          prefixIcon: Icon(Icons.paste),
                          hintText: "Descrição",
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
                      keyboardType: TextInputType.number,
                      controller: _priceControler,
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
                          prefixIcon: Icon(Icons.paid),
                          hintText: "Preço",
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: widget.ads == null
                                    ? Colors.blue
                                    : Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (widget.ads == null) {
                                    bool? ad = await _adsService.newAds(Ads(
                                        id: 0,
                                        titulo: _titleControler.text,
                                        descricao: _descControler.text,
                                        preco: double.parse(
                                            _priceControler.text)));

                                    if (ad == true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            "Erro ao cadastrar, verifique seus dados, zé!"),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  } else {
                                    widget.ads!.titulo = _titleControler.text;
                                    widget.ads!.descricao = _descControler.text;
                                    widget.ads!.preco =
                                        double.parse(_priceControler.text);

                                    bool? edited =
                                        await _adsService.editAds(widget.ads!);
                                    Navigator.pop(context, true);
                                  }
                                }
                              },
                              child: Text(
                                widget.ads == null ? "Cadastrar" : "Editar",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: 50,
                          width: 200,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.black),
                              )),
                        ))
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
