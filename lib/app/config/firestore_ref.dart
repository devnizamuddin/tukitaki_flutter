import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollection {
  static CollectionReference user = FirebaseFirestore.instance.collection('USER');
  static CollectionReference team = FirebaseFirestore.instance.collection('TEAM');
  static CollectionReference service = FirebaseFirestore.instance.collection('SERVICE');
  static CollectionReference settings = FirebaseFirestore.instance.collection('SETTINGS');
  static CollectionReference job = FirebaseFirestore.instance.collection('JOB');
  static CollectionReference review = FirebaseFirestore.instance.collection('REVIEW');
}
