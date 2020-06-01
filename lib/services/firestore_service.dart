import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreQuery {
  static final Firestore fs = Firestore.instance;
  static final batch = fs.batch();
  
  static final FirestoreQuery _instance =
      FirestoreQuery._internal();

  factory FirestoreQuery() => _instance;

  FirestoreQuery._internal();

  static FirestoreQuery get instance => _instance;

  Stream<QuerySnapshot> allTemas() {
    return fs
        .collection('temas')
        .snapshots();
  }
}