class Person{
  int id;
  String name;
  String surname;
  int title;
  String state;

  Person.withId(int id, String name, String surname, int title){
    this.name = name;
    this.surname = surname;
    this.title = title;
    this.state = state;
    this.id = id;
}
  Person(String name, String surname, int title){
    this.name = name;
    this.surname = surname;
    this.title = title;
    this.state = state;
  }
  Person.withoutInfo(){

  }

String get getState{
    String message = "";
    if(this.title<5){
      message="Expert";
    }else if(this.title<30){
      message = "Master";
    }else{
      message ="Expert Master";
    }
    return message;
}
}