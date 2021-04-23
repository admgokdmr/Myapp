import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Custom Widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Material(
          color: Colors.lime,
          child: Text("Body",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.black54, fontSize: 25.0),),
        ),
      ),
    );
  }
}