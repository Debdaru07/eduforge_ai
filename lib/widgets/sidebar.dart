import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../view_model/app_providers/screen_switch_provider.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const Sidebar({super.key, required this.isCollapsed, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 78 : MediaQuery.of(context).size.width * 0.2,
      color: AspirantsAIPalette.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              'assets/images/logos/aspirants_ai.png',
                              width: 45,
                              height: 45,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              'Aspirants AI',
                              style: AspirantsAITextStyles.headlineMedium
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      if (isCollapsed)
                        InkWell(
                          onTap: onToggle,
                          child: Image.asset(
                            'assets/images/logos/aspirants_ai.png',
                            width: 45,
                            height: 45,
                            fit: BoxFit.contain,
                          ),
                        )
                      else
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.bars,
                            size: 20,
                            color: AspirantsAIPalette.darkGrey,
                          ),
                          onPressed: onToggle,
                        ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: AspirantsAIPalette.grey300),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                SidebarItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  isCollapsed: isCollapsed,
                  index: 0,
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.upload_file,
                  label: 'PDF Upload',
                  isCollapsed: isCollapsed,
                  index: 1,
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.quiz,
                  label: 'Quiz Interface',
                  isCollapsed: isCollapsed,
                  index: 2,
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.play_circle_outline,
                  label: 'Assistant Playground',
                  isCollapsed: isCollapsed,
                  index: 3,
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.analytics,
                  label: 'Feedback & Analytics',
                  isCollapsed: isCollapsed,
                  index: 4,
                ),
              ],
            ),
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
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? AspirantsAIPalette.darkGrey.withOpacity(0.1)
                    : isHoveredOnly
                    ? AspirantsAIPalette.grey.withOpacity(0.3)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: AspirantsAIPalette.darkGrey.withOpacity(
                  isSelected ? 1.0 : 0.7,
                ),
              ),
              if (!widget.isCollapsed) ...[
                const SizedBox(width: 12),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: AspirantsAITextStyles.bodyMedium.copyWith(
                    color: AspirantsAIPalette.darkGrey.withOpacity(
                      isSelected ? 1.0 : 0.7,
                    ),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 16,
                  ),
                  child: Text(widget.label),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
