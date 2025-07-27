import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/app_colors.dart';

class PDFUploader extends StatelessWidget {
  const PDFUploader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFEF9F6), // Light beige background
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload Study Materials',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w900,
              color: AspirantsAIPalette.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Upload your PDFs and documents to create personalized quizzes and get AI assistance',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Satoshi',
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(32),
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.8,
            ), // ✅ keeps it centered and not full width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 1, color: AspirantsAIPalette.grey300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                24,
              ), // ✅ curved edges for dots
              child: DottedBorder(
                options: RectDottedBorderOptions(
                  color: AspirantsAIPalette.grey300,
                  strokeWidth: 1,
                  dashPattern: [6, 3],
                  padding: EdgeInsets.all(8), // ✅ prevents clipping of dots
                ),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                  ), // ✅ keeps it centered and not full width
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      24,
                    ), // ✅ matches outer radius
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5E9E0),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          FontAwesomeIcons.cloudArrowUp,
                          size: 36,
                          color: Color(0xFF6E432C),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Drop your files here',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'or click to browse from your computer',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Satoshi',
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6E432C),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Choose Files',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Supports PDF, DOC, DOCX files up to 10MB each',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
