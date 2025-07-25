import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';

import '../../services/file_processing_service.dart';
import '../../services/firebase_service.dart';
import '../../services/gemini_service.dart';
import '../../services/pinecone_service.dart';

class UploadViewModel with ChangeNotifier {
  final FirebaseService firebaseService;
  final FileProcessingService fileService;
  final GeminiService geminiService;
  final PineconeService pineconeService;

  UploadViewModel({
    required this.firebaseService,
    required this.fileService,
    required this.geminiService,
    required this.pineconeService,
  });

  Future<void> processAndUploadFile(File file, String assistantId) async {
    final url = await firebaseService.uploadFile(file);
    final chunks = await fileService.extractChunks(file);

    for (var chunk in chunks) {
      final embedding = await geminiService.getEmbedding(chunk);
      final id = const Uuid().v4();
      await pineconeService.upsertVector(id, embedding, {
        'text': chunk,
        'assistantId': assistantId
      });
    }

    await firebaseService.saveAssistant({
      'fileName': file.path.split('/').last,
      'fileUrl': url,
      'assistantId': assistantId,
      'createdAt': DateTime.now().toIso8601String()
    }, assistantId);
  }
}
