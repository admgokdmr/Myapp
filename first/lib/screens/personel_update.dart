
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temel_widget/models/personel.dart';
import 'package:temel_widget/validation/personel_validator.dart';

class PersonelUpdate extends StatefulWidget{
  List<Personel>personelListesi;
  PersonelUpdate(List<Personel> personelListesi){
    this.personelListesi = personelListesi;
  }


  @override
  State<StatefulWidget> createState() {
    return PersonelUpdateState(personelListesi);
  }
}

class PersonelUpdateState extends State with PersonelValidationMixin{
  List <Personel>personelListesi;
  var personel = Personel.withoutInfo();
  var formKey = GlobalKey<FormState>();

  PersonelUpdateState(List<Personel> personelListesi){
    this.personelListesi = personelListesi;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personel Update Ekranı"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Güncel Personel Adı",hintText: "Ad"),
                    validator: validateAd,
                    onSaved: (String value){
                      personel.ad = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Güncel Personel Soyadı",hintText: "Soyadı"),
                    validator: validateSoyad,
                    onSaved: (String value){
                      personel.soyad = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Güncel Personel Kıdem",hintText: "Kıdem"),
                    validator: validateKidem,
                    onSaved: (String value){
                      personel.kidem = int.parse(value);
                    },
                  ),
                  kaydetButton(),
                ],
            ),
          )
        ),
      ),
    );
  }
  Widget kaydetButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          personelListesi.add(personel);
          Navigator.pop(context);
          var alert = AlertDialog(
            title: Text("Update"),
            content: Text("Yeniden Oluşturuldu"),
          );
          showDialog(context: context, builder: (BuildContext context)=>alert);
        }
      },
    );
  }
}