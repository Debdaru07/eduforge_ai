import 'package:flutter/foundation.dart';

import '../../models/assistant_model.dart';
import '../../services/firebase_service.dart';

class AssistantViewModel with ChangeNotifier {
  final FirebaseService firebaseService;

  AssistantViewModel({required this.firebaseService});

  List<AssistantModel> assistants = [];
  bool isLoading = false;

  Future<void> fetchAssistants() async {
    isLoading = true;
    notifyListeners();

    final snapshot = await firebaseService.db.collection('assistants').get();
    assistants =
        snapshot.docs
            .map((doc) => AssistantModel.fromMap(doc.data(), doc.id))
            .toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addAssistant(AssistantModel assistant) async {
    await firebaseService.saveAssistant(assistant.toMap(), assistant.id);
    assistants.add(assistant);
    notifyListeners();
  }
}
