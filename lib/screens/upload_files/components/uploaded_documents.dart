import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UploadedDocuments extends StatelessWidget {
  final bool isMobile;
  const UploadedDocuments({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : width * 0.1,
        vertical: 24,
      ),
      padding: EdgeInsets.only(top: 24, left: isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: AspirantsAIPalette.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Uploaded Documents",
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Satoshi',
            ),
          ),
          const SizedBox(height: 16),
          _uploadedDocumentItem(
            iconBgColor: const Color(0xFFFEE2E2),
            icon: Icons.picture_as_pdf,
            fileName: "Indian Constitution Basics.pdf",
            fileSize: "3.2 MB",
            uploadedAgo: "2 hours ago",
          ),
          const SizedBox(height: 16),
          _uploadedDocumentItem(
            iconBgColor: const Color(0xFFE0EAFF),
            icon: Icons.description,
            fileName: "Modern History Notes.docx",
            fileSize: "1.8 MB",
            uploadedAgo: "yesterday",
          ),
          const SizedBox(height: 16),
          _uploadedDocumentItem(
            iconBgColor: const Color(0xFFFEE2E2),
            icon: Icons.picture_as_pdf,
            fileName: "Economics MCQs Collection.pdf",
            fileSize: "4.7 MB",
            uploadedAgo: "3 days ago",
          ),
        ],
      ),
    );
  }

  Widget _uploadedDocumentItem({
    required Color iconBgColor,
    required IconData icon,
    required String fileName,
    required String fileSize,
    required String uploadedAgo,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.red, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Satoshi',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$fileSize • Uploaded $uploadedAgo",
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}
