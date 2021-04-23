import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temel_widget/models/personel.dart';
import 'package:temel_widget/screens/personel_add.dart';
import 'package:temel_widget/screens/personel_update.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Personel selectedPersonel = Personel.withId(0, "", "", 0);

  List<Personel> personelListesi = [
    Personel.withId(1, "Eleman1", "surname1", 20),
    Personel.withId(2, "Eleman2", "surname2", 40),
    Personel.withId(3, "Eleman3", "surname3", 50),
    Personel.withId(4, "Eleman4", "surname4", 1)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Personel Listesi"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              DrawerHeader(
                child: Text("Menü"),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Ayarlar"),
                        leading: Icon(Icons.settings),
                        onTap: (){

                        },
                      ),
                      ListTile(
                        title: Text("Çıkış"),
                        leading: Icon(Icons.exit_to_app),
                        onTap: (){
                          SystemNavigator.pop();
                        },
                      )
                    ],
                  ),
              ),
              Container(
                padding: EdgeInsets.only(top: 200.0,left: 200.0),
                child: ListTile(
                  leading: Icon(Icons.arrow_back),
                  onTap: (){
                    Navigator.pop(context);
                    Icon(Icons.backspace);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: personelListesi.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://productimages.hepsiburada.net/s/45/375/10835736559666.jpg"),
                      ),
                      title: Text(personelListesi[index].ad +
                          " " +
                          personelListesi[index].soyad),
                      subtitle: Text("Tecrübe: " +
                          personelListesi[index].kidem.toString() +
                          "ünvan: " +
                          personelListesi[index].getDurum),
                      trailing: buildStatusIcon(personelListesi[index].kidem),
                      onTap: () {
                        setState(() {
                          selectedPersonel = personelListesi[index];
                        });
                        print(personelListesi[index].ad +
                            " " +
                            personelListesi[index].soyad +
                            "a tıklandı");
                      },
                      onLongPress: () {
                        print(personelListesi[index].ad +
                            " " +
                            personelListesi[index].soyad +
                            "a uzun tıklandı");
                      },
                    );
                  }),
            ),
            Text("Seçili Personel: " + selectedPersonel.ad),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  //eşit aralıklı olmasını sağlar(hizalanmayı)
                  fit: FlexFit.tight,
                  flex: 1, //verilen parça genişliği
                  child: RaisedButton(
                    color: Colors.green,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Personel\nEkle"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonelAdd(personelListesi))).then((value) {
                        setState(() {});
                      });
                    },
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: RaisedButton(
                    color: Colors.red,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 4),
                        Text("Personel \nSil"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        personelListesi.remove(selectedPersonel);
                      });
                      var alert = AlertDialog(
                        title: Text("İşlem sonucu"),
                        content: Text("Silindi"),
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => alert);
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildStatusIcon(int kidem) {
    if (kidem <= 5) {
      return Icon(Icons.accessible_forward);
    } else if (kidem <= 25) {
      return Icon(Icons.add_moderator);
    } else if (kidem <= 45) {
      return Icon(Icons.agriculture_sharp);
    } else {
      return Icon(Icons.alt_route_outlined);
    }
  }
}
