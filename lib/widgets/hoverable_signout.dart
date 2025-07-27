import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HoverSignOutIcon extends StatefulWidget {
  final VoidCallback onTap;

  const HoverSignOutIcon({super.key, required this.onTap});

  @override
  _HoverSignOutIconState createState() => _HoverSignOutIconState();
}

class _HoverSignOutIconState extends State<HoverSignOutIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: 'Sign out',
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(color: Colors.white, fontSize: 14),
        preferBelow: false, // Show beside or above
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: Colors.grey.withOpacity(0.3),
          child: AnimatedScale(
            scale: _isHovered ? 1.2 : 1.0, // Slight zoom effect
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: Icon(
              Icons.exit_to_app,
              size: 20,
              color: AspirantsAIPalette.darkGrey,
            ),
          ),
        ),
      ),
    );
  }
}
