import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadFile(File file) async {
    final ref = storage.ref().child('context_docs/${file.path.split('/').last}');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void> saveAssistant(Map<String, dynamic> data, String assistantId) async {
    await db.collection('assistants').doc(assistantId).set(data);
  }

  Future<void> saveSession(Map<String, dynamic> data, String sessionId) async {
    await db.collection('sessions').doc(sessionId).set(data);
  }

  Future<void> saveThread(String sessionId, Map<String, dynamic> data) async {
    await db.collection('sessions').doc(sessionId).collection('threads').add(data);
  }
}
