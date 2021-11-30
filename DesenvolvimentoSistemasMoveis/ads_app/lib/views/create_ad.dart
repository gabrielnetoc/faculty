import 'package:ads_app/models/todo.dart';
import 'package:flutter/material.dart';

class CreateAd extends StatefulWidget {
  Ads? ads;

  CreateAd({this.ads});

  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.ads != null) {
      setState(() {
        _textController.text = widget.ads!.text;
        _priceController.text = widget.ads!.price;
        _descController.text = widget.ads!.description;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: TextFormField(
                controller: _textController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: "Título do Anúncio",
                    labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Preenchimento Obrigatório";
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              child: TextFormField(
                controller: _descController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: "Descrição do Anúncio",
                    labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Preenchimento Obrigatório";
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: TextFormField(
                controller: _priceController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: "Preço", labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Preenchimento Obrigatório";
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    child: ElevatedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          Ads newAds = Ads(_textController.text,
                              _descController.text, _priceController.text);
                          Navigator.pop(context, newAds);
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}