import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const Sidebar({super.key, required this.isCollapsed, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isCollapsed ? 70 : 220,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Column(
        children: [
          IconButton(
            icon: Icon(isCollapsed ? Icons.menu : Icons.arrow_back),
            onPressed: onToggle,
          ),
          const SizedBox(height: 20),
          _SidebarItem(icon: Icons.home, label: 'Home', isCollapsed: isCollapsed),
          _SidebarItem(icon: Icons.chat, label: 'Ask AI', isCollapsed: isCollapsed),
          _SidebarItem(icon: Icons.quiz, label: 'Quiz', isCollapsed: isCollapsed),
          _SidebarItem(icon: Icons.upload_file, label: 'Upload', isCollapsed: isCollapsed),
          _SidebarItem(icon: Icons.feedback, label: 'Feedback', isCollapsed: isCollapsed),
          _SidebarItem(icon: Icons.settings, label: 'Assistants', isCollapsed: isCollapsed),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isCollapsed;

  const _SidebarItem({required this.icon, required this.label, required this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: isCollapsed ? null : Text(label),
      horizontalTitleGap: 0,
    );
  }
}
