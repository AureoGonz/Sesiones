import 'package:flutter/material.dart';
import 'package:sesion_calendar/entities/user.dart';
import 'package:sesion_calendar/services/preferencias.dart';
import 'package:sesion_calendar/ventanas/formularios/primer_email.dart';
import 'package:sesion_calendar/ventanas/principal/temas/lista_temas.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  static Emails _emails = Emails();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Center(
            child: ListaTemas(),
          )
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          tabs: [
            Tab(
              child: Text('Temas'),
              icon: Icon(Icons.class_),
            )
          ],
          controller: _tabController,
        ),
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
