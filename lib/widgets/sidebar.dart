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

class SidebarItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenSwitchProvider>(context);
    final bool selected = screenProvider.selectedIndex == index;

    return InkWell(
      onTap: () => screenProvider.setSelectedIndex(index),
      hoverColor: AspirantsAIPalette.grey100,
      child: Container(
        color: selected ? AspirantsAIPalette.grey100.withOpacity(0.3) : null,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: isCollapsed ? 16.0 : 24.0),
              child: Icon(
                icon,
                color: selected
                    ? AspirantsAIPalette.darkGrey
                    : AspirantsAIPalette.darkGrey.withOpacity(0.6),
              ),
            ),
            if (!isCollapsed)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: selected
                        ? AspirantsAIPalette.darkGrey
                        : AspirantsAIPalette.darkGrey.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}