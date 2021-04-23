
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temel_widget/models/person.dart';
import 'package:temel_widget/validation/person_validator.dart';

class PersonUpdate extends StatefulWidget{
  List<Person>personList;
  PersonUpdate(List<Person> personList){
    this.personList = personList;
  }


  @override
  State<StatefulWidget> createState() {
    return PersonUpdateState(personList);
  }
}

class PersonUpdateState extends State with PersonValidationMixin{
  List <Person>personList;
  var person = Person.withoutInfo();
  var formKey = GlobalKey<FormState>();

  PersonUpdateState(List<Person> personList){
    this.personList = personList;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Update Screen"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Updated Person Name",hintText: "Name"),
                    validator: validateName,
                    onSaved: (String value){
                      person.name = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Updated Person Surname",hintText: "Surname"),
                    validator: validateSurname,
                    onSaved: (String value){
                      person.surname = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Updated Person Title",hintText: "Title"),
                    validator: validateTitle,
                    onSaved: (String value){
                      person.title = int.parse(value);
                    },
                  ),
                  saveButton(),
                ],
            ),
          )
        ),
      ),
    );
  }
  Widget saveButton(){
    return RaisedButton(
      child: Text("Save"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          personList.add(person);
          Navigator.pop(context);
          var alert = AlertDialog(
            title: Text("Update"),
            content: Text("Rebuilt"),
          );
          showDialog(context: context, builder: (BuildContext context)=>alert);
        }
      },
    );
  }
}