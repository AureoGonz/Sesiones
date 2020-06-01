import 'package:sesion_calendar/services/preferencias.dart';

class User {
  static final User _instance = User._internal();
  
  factory User() => _instance;
  
  User._internal();
  
  static User get instance => _instance;
}

class Emails {
  List<String> lista;

  static final Emails _instance = Emails._internal();

  factory Emails()=>_instance;

  Emails._internal();

  static Emails get instance => _instance;

  addToList(String email){
    lista.add(email);
    PreferenciasEstaticas.setEmails(lista);
  }
}