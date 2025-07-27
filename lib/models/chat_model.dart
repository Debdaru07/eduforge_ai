class ChatMessage {
  final String role; // "user" or "assistant"
  final String text;

  ChatMessage({required this.role, required this.text});

  factory ChatMessage.fromMap(Map<String, dynamic> map, String id) {
    return ChatMessage(role: map['role'], text: map['text']);
  }

  Map<String, dynamic> toMap() {
    return {'role': role, 'text': text};
  }
}
