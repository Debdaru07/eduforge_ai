import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Row(
        children: [
          Sidebar(
            isCollapsed: isCollapsed,
            onToggle: () {
              setState(() => isCollapsed = !isCollapsed);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                'Hello Deb!',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}