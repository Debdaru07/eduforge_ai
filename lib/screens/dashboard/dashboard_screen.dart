import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Expanded(
        child: Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}