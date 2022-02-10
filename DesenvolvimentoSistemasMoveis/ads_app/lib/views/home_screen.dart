import 'package:ads_app/models/user.dart';
import 'package:ads_app/service/ads_service.dart';
import 'package:ads_app/views/create_ad.dart';
import 'package:flutter/material.dart';
import 'package:ads_app/views/login_screen.dart';
import 'package:ads_app/helpers/login_helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AdsService _adsService = AdsService();
  LoginHelper _login = LoginHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD1D1D1),
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: ListTile(
            title: Center(
              child: Text(
                "Lista de Anúncios",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            trailing: IconButton(
                onPressed: () async {
                  bool? log = await _login.logout();
                  if (log == false) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } else {
                    print("erro ao sair");
                  }
                },
                icon: Icon(
                  Icons.person_remove_sharp,
                  color: Colors.black,
                )),
          ),
        ),
      ),
      body: FutureBuilder(
          key: UniqueKey(),
          future: _adsService.getAds(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List adss = snapshot.data!;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: adss.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: ListTile(
                      title: Text(adss[index].titulo),
                      subtitle: Text(
                        adss[index].descricao,
                      ),
                      trailing: Text('R\$:' + adss[index].preco.toString()),
                    ),
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
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        bool? sucess = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateScreen(
                              ads: adss[index],
                            ),
                          ),
                        );

                        if (sucess != null && sucess) {
                          final snackBar = SnackBar(
                            content: Text("Anúncio editado!"),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          setState(() {});
                        }
                      } else if (direction == DismissDirection.startToEnd) {
                        bool? deleted =
                            await _adsService.deleteAds(adss[index].id);

                        if (deleted) {
                          final snackBar = SnackBar(
                            content: Text("Anúncio deletado!"),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return deleted;
                      }
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateScreen()));
        },
      ),
    );
  }
}
