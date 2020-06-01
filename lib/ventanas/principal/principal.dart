import 'package:flutter/material.dart';
import 'package:sesion_calendar/entities/user.dart';
import 'package:sesion_calendar/services/preferencias.dart';
import 'package:sesion_calendar/ventanas/formularios/primer_email.dart';

class PrincipalScreen extends StatelessWidget {
  static Emails _emails = Emails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: Center(
        child: Expanded(
            child: ListView.builder(
                itemCount: _emails.lista.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_emails.lista[index]),
                  );
                })),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        PreferenciasEstaticas.setEmails([]);
        Emails.instance.lista = [];
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (builder) => PrimerEmail()));
      }),
    );
  }
}
