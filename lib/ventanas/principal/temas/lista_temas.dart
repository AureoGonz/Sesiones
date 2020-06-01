import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sesion_calendar/services/firestore_service.dart';

class ListaTemas extends StatelessWidget {
  final FirestoreQuery fq = FirestoreQuery();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            child: StreamBuilder(
                stream: fq.allTemas(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: Text('No hay temas'),
                    );
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  List<Widget> cursos = docs
                      .map((e) => ListTile(
                            title: Text(e.data['titulo']),
                          ))
                      .toList();
                  return ListView(
                    controller: _scrollController,
                    children: <Widget>[
                      ...cursos,
                    ],
                  );
                }))
      ],
    ));
  }
}
