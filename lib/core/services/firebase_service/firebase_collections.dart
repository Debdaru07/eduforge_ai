import 'package:cloud_firestore/cloud_firestore.dart';

class EduForgeCollections {
  static final users = FirebaseFirestore.instance.collection('users');
  static final tests = FirebaseFirestore.instance.collection('tests');
  static final results = FirebaseFirestore.instance.collection('results');
  static final feedback = FirebaseFirestore.instance.collection('feedback');
}
