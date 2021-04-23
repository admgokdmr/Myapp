import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:temel_widget/screens/person_add.dart';
import 'package:temel_widget/models/person.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  Person selectedPerson = Person.withId(0, "", "", 0);

  List<Person> personList = [
    Person.withId(1, "Person1", "surname1", 20),
    Person.withId(2, "Person2", "surname2", 40),
    Person.withId(3, "Person3", "surname3", 50),
    Person.withId(4, "Person4", "surname4", 1)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Person List"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              DrawerHeader(
                child: Text("Menu"),
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
                        title: Text("Settings"),
                        leading: Icon(Icons.settings),
                        onTap: (){

                        },
                      ),
                      ListTile(
                        title: Text("Quit"),
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
                  itemCount: personList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://productimages.hepsiburada.net/s/45/375/10835736559666.jpg"),
                      ),
                      title: Text(personList[index].name +
                          " " +
                          personList[index].surname),
                      subtitle: Text("Experience: " +
                          personList[index].title.toString() +
                          "title: " +
                          personList[index].getState),
                      trailing: buildStatusIcon(personList[index].title),
                      onTap: () {
                        setState(() {
                          selectedPerson = personList[index];
                        });
                        print(personList[index].name +
                            " " +
                            personList[index].surname +
                            "clicked");
                      },
                      onLongPress: () {
                        print(personList[index].name +
                            " " +
                            personList[index].surname +
                            "long clicked");
                      },
                    );
                  }),
            ),
            Text("Selected Person: " + selectedPerson.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Person\nAdd"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonAdd(personList))).then((value) {
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
                        Text("Person \nDelete"),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        personList.remove(selectedPerson);
                      });
                      var alert = AlertDialog(
                        title: Text("Result"),
                        content: Text("Deleted"),
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

  Widget buildStatusIcon(int title) {
    if (title <= 5) {
      return Icon(Icons.accessible_forward);
    } else if (title <= 25) {
      return Icon(Icons.add_moderator);
    } else if (title <= 45) {
      return Icon(Icons.agriculture_sharp);
    } else {
      return Icon(Icons.alt_route_outlined);
    }
  }
}
