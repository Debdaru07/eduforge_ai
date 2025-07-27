import 'package:flutter/material.dart';

void main() => runApp(BookMenuApp());

class BookMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BookMenuHome(), debugShowCheckedModeBanner: false);
  }
}

class BookMenuHome extends StatefulWidget {
  @override
  _BookMenuHomeState createState() => _BookMenuHomeState();
}

class _BookMenuHomeState extends State<BookMenuHome> {
  bool isMenuOpen = false;

  // ✅ Replace with stable image URLs (icons8 CDN)
  final closedBookUrl = 'https://img.icons8.com/ios-filled/100/000000/book.png';
  final openBookUrl =
      'https://img.icons8.com/ios-filled/100/000000/open-book.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEE9E6),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 1200),
            crossFadeState: isMenuOpen
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Image.network(closedBookUrl, height: 100, width: 100),
            secondChild: Image.network(openBookUrl, height: 100, width: 100),
          ),
        ),
      ),
    );
  }
}
