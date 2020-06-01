import 'package:flutter/material.dart';
import 'package:sesion_calendar/entities/user.dart';
import 'package:sesion_calendar/services/preferencias.dart';
import 'package:sesion_calendar/services/validador_formuario.dart';
import 'package:sesion_calendar/ventanas/principal/principal.dart';

class PrimerEmail extends StatefulWidget {
  @override
  _PrimerEmail createState() => _PrimerEmail();
}

class _PrimerEmail extends State<PrimerEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Form(
          autovalidate: false,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: ValidadorFormulario.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => this.email = value,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 12),
                      hintText: 'ejemplo@mail.com',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: 32,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => _validate(),
                      child: Text('Iniciar sesión'),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  void _validate() {
    Emails _emails = Emails();
    if (_formKey.currentState.validate()) {
      _emails.addToList(email);
      PreferenciasEstaticas.setEmails(_emails.lista).whenComplete(() {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (builder) => PrincipalScreen()));
      });
    }
  }
}
