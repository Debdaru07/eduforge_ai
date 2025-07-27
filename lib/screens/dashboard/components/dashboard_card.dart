import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtext;
  final Color color;
  final IconData? icon;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtext,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Apply border radius here
          ),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 45, // square width
                        height: 45, // square height
                        decoration: BoxDecoration(
                          color: Colors.white, // background color
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // 20 px border radius
                        ),
                      ),
                      Text(
                        value,
                        style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtext,
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
