import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme/app_colors.dart';

class PDFUploader extends StatelessWidget {
  final bool isMobile;

  const PDFUploader({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xFFFEF9F6), // Light beige background
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : width * 0.1,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Upload Study Materials',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w900,
              color: AspirantsAIPalette.black,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            'Upload your PDFs and documents to create personalized quizzes and get AI assistance',
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              fontFamily: 'Satoshi',
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(isMobile ? 20 : 32),
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
              borderRadius: BorderRadius.circular(24),
              child: DottedBorder(
                options: const RectDottedBorderOptions(
                  color: AspirantsAIPalette.grey300,
                  strokeWidth: 1,
                  dashPattern: [6, 3],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(isMobile ? 20 : 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : 20),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5E9E0),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FontAwesomeIcons.cloudArrowUp,
                          size: isMobile ? 28 : 36,
                          color: const Color(0xFF6E432C),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Drop your files here',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 20,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'or click to browse from your computer',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontFamily: 'Satoshi',
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6E432C),
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 24,
                            vertical: isMobile ? 8 : 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Choose Files',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Supports PDF, DOC, DOCX files up to 10MB each',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.black54,
                        ),
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
