import 'package:flutter/material.dart';
import 'components/pdf_uploader.dart';
import 'components/uploaded_documents.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800; // breakpoint for responsiveness

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : width * 0.05,
        vertical: isMobile ? 12 : 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PDFUploader(isMobile: isMobile),
          const SizedBox(height: 20),
          UploadedDocuments(isMobile: isMobile),
        ],
      ),
    );
  }
}
