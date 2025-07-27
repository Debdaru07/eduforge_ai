import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CommonHoverActionItem extends StatefulWidget {
  final String message;
  final VoidCallback onTap;
  final Widget icon;

  const CommonHoverActionItem({
    super.key,
    required this.message,
    required this.onTap,
    required this.icon,
  });

  @override
  _CommonHoverActionItemState createState() => _CommonHoverActionItemState();
}

class _CommonHoverActionItemState extends State<CommonHoverActionItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.message,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AspirantsAITextStyles.bodySmall.copyWith(
          color: AspirantsAIPalette.bodyBackground,
        ),
        preferBelow: false,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: AspirantsAIPalette.beigeDark,
          child: AnimatedScale(
            scale: _isHovered ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
