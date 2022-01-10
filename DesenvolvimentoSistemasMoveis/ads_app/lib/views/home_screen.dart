import 'package:ads_app/databases/file_persistence.dart';
import 'package:ads_app/views/create_ad.dart';
import 'package:flutter/material.dart';
import 'package:ads_app/models/ads.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ads> _list = List.empty(growable: true);
  final FilePersistence _filePersistence = FilePersistence();

  @override
  void initState() {
    super.initState();
    _filePersistence.getData().then((listaAds) {
      if (listaAds != null) {
        _list = listaAds;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD1D1D1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Lista de Anúncios",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: (context, position) {
          Ads item = _list[position];
          return Dismissible(
            key: Key(item.text),
            background: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: const Align(
                      alignment: Alignment(-0.9, 0.0),
                      child: Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment(-0.9, 0.0),
                      child: Icon(Icons.delete_forever, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            onDismissed: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                Ads listAds = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAd(ads: _list[position]),
                    ));
                if (listAds != null) {
                  setState(() {
                    _list.removeAt(position);
                    _list.insert(position, listAds);
                  });
                }
              } else if (direction == DismissDirection.endToStart) {
                setState(() {
                  _list.removeAt(position);
                });
              }
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                Ads editedAds = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAd(
                              ads: item,
                            )));
                if (editedAds != null) {
                  setState(() {
                    _list.removeAt(position);
                    _list.insert(position, editedAds);
                    // FilePersistence.saveData(_list);
                  });
                }
              }
            },
            child: ListTile(
              leading: item.image != null
                  ? CircleAvatar(
                      child: ClipOval(
                        child: Image.file(item.image),
                      ),
                    )
                  : const SizedBox(),
              title: Text(
                _list[position].text,
                style: TextStyle(
                    color: _list[position].done ? Colors.grey : Colors.black,
                    decoration: _list[position].done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              onTap: () {
                setState(() {
                  _list[position].done = !_list[position].done;
                });
              },
              subtitle: (Text(_list[position].description)),
              isThreeLine: true,
              trailing: Text("R\$: " + _list[position].price),
              dense: true,
              onLongPress: () async {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 180,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.email),
                              title: Text("Email"),
                              onTap: () async {
                                Navigator.pop(context);
                                final Uri params = Uri(
                                    scheme: "mailto",
                                    path:
                                        "gabriel.neto@estudante.ifgoiano.edu.br",
                                    queryParameters: {
                                      "\\Urisubject": "Anúncios",
                                      "body": "Lista de Anúncios"
                                    });

                                final url = params.toString();
                                if (!await launch(url)) {
                                  throw 'Não foi possível abrir a url ${url}';
                                }
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.sms),
                              title: Text("SMS"),
                              onTap: () async {
                                Navigator.pop(context);
                                final Uri params = Uri(
                                    scheme: "sms",
                                    path: "+5564992296708",
                                    queryParameters: {
                                      "body": "Lista de Anúncios"
                                    });

                                final url = params.toString();
                                if (!await launch(url)) {
                                  throw 'Não foi possível abrir a url ${url}';
                                }
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.cancel),
                              title: Text("Cancelar"),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          try {
            Ads newAds = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateAd()));
            setState(() {
              _list.add(newAds);
              _filePersistence.saveData(_list);
            });
          } catch (error) {
            print("Error: ${error.toString()}");
          }
        },
      ),
    );
  }
}
