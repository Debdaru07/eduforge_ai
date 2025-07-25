class ThreadModel {
  final String role;
  final String message;
  final String timestamp;

  ThreadModel({
    required this.role,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
