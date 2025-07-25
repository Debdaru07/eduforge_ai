import 'package:flutter/foundation.dart';
import '../../services/firebase_service.dart';
import '../../services/gemini_service.dart';
import '../../services/pinecone_service.dart';

class ChatViewModel with ChangeNotifier {
  final GeminiService geminiService;
  final PineconeService pineconeService;
  final FirebaseService firebaseService;

  ChatViewModel({
    required this.geminiService,
    required this.pineconeService,
    required this.firebaseService,
  });

  String responseText = '';
  bool isLoading = false;

  Future<void> sendMessage({
    required String sessionId,
    required String assistantPretext,
    required String question,
  }) async {
    isLoading = true;
    notifyListeners();

    // 1. Generate embedding for question
    final queryEmbedding = await geminiService.getEmbedding(question);

    // 2. Query Pinecone for relevant chunks
    final contextChunks = await pineconeService.queryVector(queryEmbedding, 3);

    // 3. Generate response with Gemini
    final contextText = contextChunks.join("\n");
    final answer = await geminiService.generateAnswer(question, assistantPretext, contextText);

    // 4. Save user and model messages to Firestore
    await firebaseService.saveThread(sessionId, {
      'role': 'user',
      'message': question,
      'timestamp': DateTime.now().toIso8601String(),
    });

    await firebaseService.saveThread(sessionId, {
      'role': 'model',
      'message': answer,
      'timestamp': DateTime.now().toIso8601String(),
    });

    responseText = answer;
    isLoading = false;
    notifyListeners();
  }
}
