import 'package:flutter/material.dart';

class UploadedDocuments extends StatefulWidget {
  const UploadedDocuments({super.key});

  @override
  State<UploadedDocuments> createState() => _UploadedDocumentsState();
}

class _UploadedDocumentsState extends State<UploadedDocuments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Uploaded Documents",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          UploadedDocumentItem(
            iconBgColor: Color(0xFFFEE2E2),
            icon: Icons.picture_as_pdf,
            fileName: "Indian Constitution Basics.pdf",
            fileSize: "3.2 MB",
            uploadedAgo: "2 hours ago",
            type: "Theory",
          ),
          const SizedBox(height: 20),

          UploadedDocumentItem(
            iconBgColor: Color(0xFFE0EAFF),
            icon: Icons.description,
            fileName: "Modern History Notes.docx",
            fileSize: "1.8 MB",
            uploadedAgo: "yesterday",
            type: "Theory",
          ),
          const SizedBox(height: 20),

          UploadedDocumentItem(
            iconBgColor: Color(0xFFFEE2E2),
            icon: Icons.picture_as_pdf,
            fileName: "Economics MCQs Collection.pdf",
            fileSize: "4.7 MB",
            uploadedAgo: "3 days ago",
            type: "MCQ",
          ),
        ],
      ),
    );
  }
}

class UploadedDocumentItem extends StatelessWidget {
  final Color iconBgColor;
  final IconData icon;
  final String fileName;
  final String fileSize;
  final String uploadedAgo;
  final String type;

  const UploadedDocumentItem({
    super.key,
    required this.iconBgColor,
    required this.icon,
    required this.fileName,
    required this.fileSize,
    required this.uploadedAgo,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black54),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fileName, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text("$fileSize • Uploaded $uploadedAgo", style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        DropdownButton<String>(
          value: type,
          style: const TextStyle(color: Colors.black),
          underline: Container(),
          borderRadius: BorderRadius.circular(10),
          items: ["Theory", "MCQ"].map((value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          )).toList(),
          onChanged: (value) {},
        ),
        const SizedBox(width: 8),
        const Icon(Icons.delete_outline, color: Colors.grey),
      ],
    );
  }
}

