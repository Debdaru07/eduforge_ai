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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [PDFUploader(), UploadedDocuments()],
      ),
    );
  }
}
