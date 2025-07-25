import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class FileProcessingService {
  Future<List<String>> extractChunks(File file) async {
    // Load PDF
    final bytes = await file.readAsBytes();
    final PdfDocument document = PdfDocument(inputBytes: bytes);

    // Extract text
    final String text = PdfTextExtractor(document).extractText();
    document.dispose();

    // Split into chunks
    const int chunkSize = 1000;
    List<String> chunks = [];
    for (int i = 0; i < text.length; i += chunkSize) {
      chunks.add(text.substring(i, i + chunkSize > text.length ? text.length : i + chunkSize));
    }

    return chunks;
  }
}
