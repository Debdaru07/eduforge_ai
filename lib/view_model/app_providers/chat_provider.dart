import 'package:flutter/foundation.dart';

import '../../models/chat_model.dart';
import '../../services/gemini_service.dart';

class ChatProvider with ChangeNotifier {
  final GeminiService _geminiService = GeminiService();

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  static const String _systemInstruction =
      "You are an experienced and knowledgeable UPSC tutor. Your goal is to provide accurate, detailed, and comprehensive answers to questions related to the UPSC civil services examination syllabus, including history, geography, polity, economics, science and technology, and current affairs. You should explain concepts clearly, provide examples, and guide the user in their preparation. If you dont have enough information to answer definitively, state that you don't know rather than fabricating information.";

  Future<void> sendMessage(String question) async {
    _messages.add(ChatMessage(role: "user", text: question));
    notifyListeners();

    _isLoading = true;
    notifyListeners();

    try {
      final contextText = _messages
          .where((msg) => msg.role == "assistant" || msg.role == "user")
          .map((msg) => "${msg.role.toUpperCase()}: ${msg.text}")
          .join("\n");

      final answer = await _geminiService.geminiRequest(
        question,
        _systemInstruction,
        contextText,
      );

      _messages.add(ChatMessage(role: "assistant", text: answer));
    } catch (e) {
      _messages.add(
        ChatMessage(role: "assistant", text: "Error generating response: $e"),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}
