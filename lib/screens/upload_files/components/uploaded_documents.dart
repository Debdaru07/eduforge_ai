import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
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
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 24,
      ),
      padding: EdgeInsets.only(top: 28, left: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: AspirantsAIPalette.grey300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Uploaded Documents",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Satoshi',
            ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: Colors.red, size: 15),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: AspirantsAITextStyles.bodyMedium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    color: AspirantsAIPalette.black,
                  ),
                ),
                Text(
                  "$fileSize • Uploaded $uploadedAgo",
                  style: AspirantsAITextStyles.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          MinimalDropdown(),
          const SizedBox(width: 8),
          const Icon(
            Icons.delete_outline,
            color: AspirantsAIPalette.grey300,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class MinimalDropdown extends StatefulWidget {
  const MinimalDropdown({super.key});

  @override
  _MinimalDropdownState createState() => _MinimalDropdownState();
}

class _MinimalDropdownState extends State<MinimalDropdown> {
  String selectedValue = "Theory";
  final List<String> options = ["Theory", "MCQ"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PopupMenuButton<String>(
        menuPadding: EdgeInsets.zero,
        onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        itemBuilder:
            (context) =>
                options
                    .map(
                      (item) => PopupMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 12)),
                      ),
                    )
                    .toList(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue,
              style: AspirantsAITextStyles.bodySmall.copyWith(fontSize: 12),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              size: 12,
              color: AspirantsAIPalette.grey300,
            ),
          ],
        ),
      ),
    );
  }
}
