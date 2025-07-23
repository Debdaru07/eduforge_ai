import 'package:flutter/material.dart';

class RecentQuizCard extends StatelessWidget {
  final String title;
  final String questions;
  final String time;
  final String score;

  const RecentQuizCard({
    super.key,
    required this.title,
    required this.questions,
    required this.time,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 0.1
                  ),
                ),
                Text(
                  '$questions • $time',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: const Color.fromARGB(255, 125, 124, 124),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                score,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Text(
                'score',
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 125, 124, 124),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}