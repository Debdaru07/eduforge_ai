class FileMetadataModel {
  final String fileName;
  final String fileUrl;
  final String assistantId;

  FileMetadataModel({
    required this.fileName,
    required this.fileUrl,
    required this.assistantId,
  });

  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'fileUrl': fileUrl,
      'assistantId': assistantId,
    };
  }
}
