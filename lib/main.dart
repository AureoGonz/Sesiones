import 'package:flutter/material.dart';
import 'package:sesion_calendar/entities/user.dart';
import 'package:sesion_calendar/services/preferencias.dart';
import 'package:sesion_calendar/ventanas/formularios/primer_email.dart';
import 'package:sesion_calendar/ventanas/principal/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Sesiones\nUnete',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Emails _emails = Emails();

  @override
  void initState() {
    super.initState();
    PreferenciasEstaticas.getEmails().then((value){
      _emails.lista = value;
      if(value.isEmpty){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>PrimerEmail()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>PrincipalScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Sesiones\nUNETE',
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 35),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        CircularProgressIndicator()
      ],
    )));
  }
}
