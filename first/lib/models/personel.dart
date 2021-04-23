class Personel{
  int id;
  String ad;
  String soyad;
  int kidem;
  String durum;

  Personel.withId(int id, String ad, String soyad, int kidem){
    this.ad = ad;
    this.soyad = soyad;
    this.kidem = kidem;
    this.durum = durum;
    this.id = id;
}
  Personel(String ad, String soyad, int kidem){
    this.ad = ad; 
    this.soyad = soyad;
    this.kidem = kidem;
    this.durum = durum;
  }
  Personel.withoutInfo(){

  }

String get getDurum{
    String mesaj = "";
    if(this.kidem<5){
      mesaj="Kıdemli";
    }else if(this.kidem<30){
      mesaj = "uzman";
    }else{
      mesaj="kidemli uzman";
    }
    return mesaj;
}
}