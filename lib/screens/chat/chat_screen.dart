import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Center(child: Text('Hey Chat')),
    );
  }
}
