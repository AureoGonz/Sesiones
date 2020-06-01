import 'package:shared_preferences/shared_preferences.dart';
import 'package:sesion_calendar/entities/key_preferencias.dart';

class PreferenciasEstaticas {
  static Future<List<String>> getEmails() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getStringList(KeyPreferencias.emails) ?? <String>[];
  }

  static Future<void> setEmails(List<String> lista) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList(KeyPreferencias.emails, lista);
  }
}