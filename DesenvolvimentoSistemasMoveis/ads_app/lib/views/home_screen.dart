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
      setState(() {
        if (listaAds != null) {
          _list = listaAds;
        }
      });
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
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(Icons.delete_forever, color: Colors.white),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.orange,
              child: const Align(
                alignment: Alignment(0.9, 0.0),
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
            onDismissed: (direction) async {
              if (direction == DismissDirection.endToStart) {
                Ads? editAds = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAd(ads: item),
                    ));
                if (editAds != null) {
                  setState(() {
                    _list.removeAt(position);
                    _list.insert(position, editAds);
                  });
                }
              } else if (direction == DismissDirection.startToEnd) {
                setState(() {
                  _list.removeAt(position);
                  _filePersistence.saveData(_list);
                  SnackBar snackBar = SnackBar(
                    content: Text("Anúncio removido com sucesso"),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              }
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                Ads? editAds = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAd(ads: item),
                    ));
                if (editAds != null) {
                  setState(() {
                    _list.removeAt(position);
                    _list.insert(position, editAds);
                    _filePersistence.saveData(_list);
                    SnackBar snackBar = SnackBar(
                      content: Text("Anúncio editado com sucesso"),
                      backgroundColor: Colors.orange,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }
                return false;
              } else if (direction == DismissDirection.startToEnd) {
                return true;
              }
            },
            child: ListTile(
              leading: item.image != null
                  ? CircleAvatar(
                      child: ClipOval(
                        child: Image.file(item.image!),
                      ),
                    )
                  : const SizedBox(),
              title: Text(
                _list[position].text,
                style: TextStyle(
                    color: _list[position].done ? Colors.grey : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              subtitle: (Text(_list[position].description)),
              isThreeLine: true,
              trailing: Column(
                children: [
                  Text("R\$: " +
                      _list[position].price), //ao usar $ em texto, usar \
                  //TODO: implementar icon
                ],
              ),
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
                              leading: Icon(Icons.send_rounded),
                              title: const Text("WhatsApp"),
                              onTap: () async {
                                String tel = "+556499229-6708";
                                String msg =
                                    "Olha que anúncio legal, clique  e confira!";

                                final url =
                                    "https://api.whatsapp.com/send?$tel&text=$msg";
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
            Ads? newAds = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateAd()));

            if (newAds != null) {
              setState(() {
                _list.add(newAds);
                _filePersistence.saveData(_list);

                SnackBar snackBar = SnackBar(
                  content: Text("Anúncio criado com sucesso"),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            }
          } catch (error) {
            print("Error: ${error}");
          }
        },
      ),
    );
  }
}
