import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

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
                if(isCollapsed == false)
                Row(
                  children: [
                    Text('Aspirants AI', style: AspirantsAITextStyles.labelLarge.copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
                IconButton(
                  icon: Icon(isCollapsed ? Icons.menu : Icons.close_fullscreen, size: 18,),
                  onPressed: onToggle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SidebarItem(icon: Icons.home, label: 'Home', isCollapsed: isCollapsed),
          SidebarItem(icon: Icons.chat, label: 'Ask AI', isCollapsed: isCollapsed),
          SidebarItem(icon: Icons.quiz, label: 'Quiz', isCollapsed: isCollapsed),
          SidebarItem(icon: Icons.upload_file, label: 'Upload', isCollapsed: isCollapsed),
          SidebarItem(icon: Icons.feedback, label: 'Feedback', isCollapsed: isCollapsed),
          SidebarItem(icon: Icons.settings, label: 'Assistants', isCollapsed: isCollapsed),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isCollapsed;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isCollapsed
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: AspirantsAIPalette.darkGrey.withOpacity(0.6), // Dark Gray
      ),
      minLeadingWidth: 10,
      title: isCollapsed ? null : Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          label,
          style: TextStyle(
            color: AspirantsAIPalette.darkGrey.withOpacity(0.6), // Dark Gray
            fontWeight: FontWeight.w700,
            fontSize: 16
          ),
        ),
      ),
      hoverColor: AspirantsAIPalette.grey100, // Slightly darker beige
    );
  }
}
