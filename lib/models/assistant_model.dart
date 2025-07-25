class AssistantModel {
  final String id;
  final String name;
  final String pretext;
  final String createdAt;

  AssistantModel({
    required this.id,
    required this.name,
    required this.pretext,
    required this.createdAt,
  });

  factory AssistantModel.fromMap(Map<String, dynamic> map, String id) {
    return AssistantModel(
      id: id,
      name: map['name'] ?? '',
      pretext: map['pretext'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pretext': pretext,
      'createdAt': createdAt,
    };
  }
}
