class SessionModel {
  final String id;
  final String assistantId;
  final String userId;
  final String title;

  SessionModel({
    required this.id,
    required this.assistantId,
    required this.userId,
    required this.title,
  });

  factory SessionModel.fromMap(Map<String, dynamic> map, String id) {
    return SessionModel(
      id: id,
      assistantId: map['assistantId'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'assistantId': assistantId,
      'userId': userId,
      'title': title,
    };
  }
}
