import 'dart:ui';

import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_text_styles.dart';
import '../view_model/app_providers/screen_switch_provider.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const Sidebar({super.key, required this.isCollapsed, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.0625 : MediaQuery.of(context).size.width * 0.15,
      color: AspirantsAIPalette.beigeDark,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isCollapsed)
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logos/logo_coffee.jpeg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4,),
                      Text(
                        'Aspirants AI',
                        style: AspirantsAITextStyles.labelLarge.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                IconButton(
                  icon: Icon(
                    isCollapsed ? Icons.menu : Icons.close_fullscreen,
                    size: 18,
                  ),
                  onPressed: onToggle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SidebarItem(
            icon: Icons.home,
            label: 'Home',
            isCollapsed: isCollapsed,
            index: 0,
          ),
          SidebarItem(
            icon: Icons.chat,
            label: 'Ask AI',
            isCollapsed: isCollapsed,
            index: 1,
          ),
          SidebarItem(
            icon: Icons.quiz,
            label: 'Quiz',
            isCollapsed: isCollapsed,
            index: 2,
          ),
          SidebarItem(
            icon: Icons.upload_file,
            label: 'Upload',
            isCollapsed: isCollapsed,
            index: 3,
          ),
          SidebarItem(
            icon: Icons.feedback,
            label: 'Feedback',
            isCollapsed: isCollapsed,
            index: 4,
          ),
          SidebarItem(
            icon: Icons.settings,
            label: 'Assistants',
            isCollapsed: isCollapsed,
            index: 5,
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isCollapsed;
  final int index;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isCollapsed,
    required this.index,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenSwitchProvider>(context);
    final bool isSelected = screenProvider.selectedIndex == widget.index;
    final bool isHoveredOnly = isHovered && !isSelected;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => screenProvider.setSelectedIndex(widget.index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: isHoveredOnly ? EdgeInsets.symmetric(horizontal: 4) : null,
          decoration: isHoveredOnly
              ? BoxDecoration(
                  color: AspirantsAIPalette.beige.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                )
              : const BoxDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                      ),
                      child: Icon(
                        widget.icon,
                        size: isSelected
                            ? 18
                            : isHoveredOnly
                                ? 20
                                : 18,
                        color: AspirantsAIPalette.darkGrey.withOpacity(
                          isSelected ? 1 : 0.4,
                        ),
                      ),
                    ),
                    if (!widget.isCollapsed)
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 100),
                        style: AspirantsAITextStyles.labelSmall.copyWith(
                          color: AspirantsAIPalette.darkGrey.withOpacity(
                            isSelected ? 1 : 0.6,
                          ),
                          fontWeight: isSelected || isHoveredOnly
                              ? FontWeight.w800
                              : FontWeight.w600,
                          fontSize: isSelected
                              ? 14
                              : isHoveredOnly
                                  ? 14
                                  : 12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(widget.label),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
