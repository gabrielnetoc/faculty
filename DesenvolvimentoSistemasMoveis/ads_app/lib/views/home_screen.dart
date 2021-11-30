import 'package:ads_app/views/create_ad.dart';
import 'package:flutter/material.dart';
import 'package:ads_app/models/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ads> _list = List.empty(growable: true);

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
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(Icons.delete_forever, color: Colors.white),
              ),
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                _list.removeAt(position);
              });
            },
            child: ListTile(
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
              trailing: Text(_list[position].price),
              dense: true,
              onLongPress: () async {
                Ads editedAds = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAd(ads: item)));

                if (editedAds != null) {
                  setState(() {
                    _list.removeAt(position);
                    _list.insert(position, editedAds);
                  });
                }
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
            });
          } catch (error) {
            print("Error: ${error.toString()}");
          }
        },
      ),
    );
  }
}
