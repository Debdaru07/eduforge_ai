import 'dart:ui';
import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final Widget sidebarCollapsed;
  final Widget sidebarExpanded;
  final bool isCollapsed;
  final VoidCallback onToggle;

  const ResponsiveScaffold({
    super.key,
    required this.body,
    required this.sidebarCollapsed,
    required this.sidebarExpanded,
    required this.isCollapsed,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 1080;

    // ✅ If Mobile & Sidebar Expanded → Show Stack
    if (isMobile && !isCollapsed) {
      return Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                sidebarCollapsed, // Collapsed sidebar always visible
                Expanded(child: body),
              ],
            ),
            // ✅ Dark overlay with blur
            Positioned.fill(
              child: GestureDetector(
                onTap: onToggle,
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(color: Colors.black.withOpacity(0.2)),
                  ),
                ),
              ),
            ),
            // ✅ Animated expanded sidebar on top
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: 0,
              top: 0,
              bottom: 0,
              width: 240,
              child: sidebarExpanded,
            ),
          ],
        ),
      );
    }

    // ✅ For Desktop or Mobile Collapsed → Normal Row Layout
    return Scaffold(
      body: Row(
        children: [
          isCollapsed ? sidebarCollapsed : sidebarExpanded,
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isMobile && !isCollapsed) {
                  onToggle(); // Collapse when clicking outside on desktop
                }
              },
              behavior: HitTestBehavior.opaque,
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
