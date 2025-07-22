import 'package:flutter/material.dart';

class AskAI extends StatefulWidget {
  const AskAI({super.key});

  @override
  State<AskAI> createState() => _FeedbackState();
}

class _FeedbackState extends State<AskAI> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('AskAI'),
    );
  }
}