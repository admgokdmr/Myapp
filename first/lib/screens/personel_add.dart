import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
    import 'package:flutter/services.dart';
import 'package:temel_widget/models/personel.dart';
import 'package:temel_widget/validation/personel_validator.dart';

class PersonelAdd extends StatefulWidget{
  List <Personel>personelListesi;
  PersonelAdd(List<Personel> personelListesi){
    this.personelListesi = personelListesi;
  }
  @override
  State<StatefulWidget> createState() {
    return _PersonelAddState(personelListesi);
  }
}
class _PersonelAddState extends State with PersonelValidationMixin{
  List <Personel>personelListesi;
  var personel = Personel.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _PersonelAddState(List<Personel> personelListesi){
    this.personelListesi = personelListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Yeni Personel Ekle"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText:"Personel Adı",hintText: "Ad" ),
                  validator: validateAd,
                  onSaved: (String value){
                    personel.ad = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText:"Personel Soyadı",hintText: "Soyad" ),
                  validator: validateSoyad,
                  onSaved: (String value){
                    personel.soyad = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText:"Geçen Yılı",hintText: "Yıl" ),
                  validator: validateKidem,
                  onSaved: (String value){
                    personel.kidem = int.parse(value);
                  },
                ),
                kaydetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget kaydetButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          personelListesi.add(personel);
          Navigator.pop(context);
          var alert = AlertDialog(
            title: Text("Kayıt"),
            content: Text("Eklendi"),
          );
          showDialog(context: context, builder: (BuildContext context)=>alert);
        }
      },
    );
 }
}