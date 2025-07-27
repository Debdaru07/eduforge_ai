import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../view_model/app_providers/screen_switch_provider.dart';
import 'hoverable_signout.dart';

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
                        CommonHoverActionItem(
                          message: 'Expand',
                          onTap: () {
                            print('Sidebar Open');
                          },
                          icon: InkWell(
                            onTap: onToggle,
                            child: Image.asset(
                              'assets/images/logos/aspirants_ai.png',
                              width: 45,
                              height: 45,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      else
                        CommonHoverActionItem(
                          message: 'Collapse',
                          onTap: () {
                            print('Sidebar Close');
                          },
                          icon: InkWell(
                            onTap: onToggle,
                            child: Image.network(
                              'https://img.icons8.com/ios-filled/100/000000/open-book.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
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
                  tooltipMessage: 'See all the Action Items',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.upload_file,
                  label: 'PDF Upload',
                  isCollapsed: isCollapsed,
                  index: 1,
                  tooltipMessage: 'Upload necessary Files',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.quiz,
                  label: 'Quiz Interface',
                  isCollapsed: isCollapsed,
                  index: 2,
                  tooltipMessage: 'Take the Quiz',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.play_circle_outline,
                  label: 'Assistant Playground',
                  isCollapsed: isCollapsed,
                  index: 3,
                  tooltipMessage: 'Make your own Tutor Assistant',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: Icons.analytics,
                  label: 'Feedback & Analytics',
                  isCollapsed: isCollapsed,
                  index: 4,
                  tooltipMessage: 'Check your feedback and analytics',
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(thickness: 1, color: AspirantsAIPalette.grey300),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/display_pic.jpeg',
                      ),
                    ),
                    if (isCollapsed == false) ...[
                      const SizedBox(width: 8),
                      SizedBox(
                        width:
                            isCollapsed
                                ? 78
                                : MediaQuery.of(context).size.width * 0.2 - 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Debdaru Dasgupta',
                                  style: AspirantsAITextStyles.bodySmall
                                      .copyWith(
                                        color: AspirantsAIPalette.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Free',
                                  style: AspirantsAITextStyles.bodySmall
                                      .copyWith(
                                        color: AspirantsAIPalette.grey600,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                            CommonHoverActionItem(
                              message: 'Sign Out',
                              onTap: () {
                                print('Sign out tapped');
                              },
                              icon: Icon(
                                Icons.door_back_door_outlined,
                                size: 20,
                                color: AspirantsAIPalette.darkGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
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
  final String tooltipMessage;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isCollapsed,
    required this.index,
    required this.tooltipMessage,
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
        child: Tooltip(
          message: widget.tooltipMessage,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AspirantsAITextStyles.bodySmall.copyWith(
            color: AspirantsAIPalette.bodyBackground,
            fontSize: 12,
          ),
          preferBelow: true,
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
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 16,
                    ),
                    child: Text(widget.label),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
