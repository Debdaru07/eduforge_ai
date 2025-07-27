import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../view_model/app_providers/screen_switch_provider.dart';
import 'hoverable_signout.dart';
import 'package:flutter_remix/flutter_remix.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const Sidebar({super.key, required this.isCollapsed, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // ✅ Clamp to avoid RenderFlex overflow
    double sidebarWidth =
        isCollapsed
            ? 78
            : (screenWidth * 0.2).clamp(200.0, 280.0); // Safe range for web
    if (screenWidth < 800) {
      sidebarWidth = isCollapsed ? 78 : 240; // Fixed for mobile
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: sidebarWidth,
      color: AspirantsAIPalette.white,
      child: Column(
        children: [
          /// ✅ Header Section (Logo + Toggle)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
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
                            const SizedBox(width: 8),
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

          /// ✅ Sidebar Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                SidebarItem(
                  icon: FlutterRemix.dashboard_line,
                  label: 'Dashboard',
                  isCollapsed: isCollapsed,
                  index: 0,
                  tooltipMessage: 'View your progress',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: FlutterRemix.upload_cloud_line,
                  label: 'PDF Upload',
                  isCollapsed: isCollapsed,
                  index: 1,
                  tooltipMessage: 'Upload study files',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: FlutterRemix.question_line,
                  label: 'Quiz Interface',
                  isCollapsed: isCollapsed,
                  index: 2,
                  tooltipMessage: 'Test your knowledge',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: FlutterRemix.robot_line,
                  label: 'Assistant Playground',
                  isCollapsed: isCollapsed,
                  index: 3,
                  tooltipMessage: 'Create AI tutor',
                ),
                const SizedBox(height: 8),
                SidebarItem(
                  icon: FlutterRemix.bar_chart_line,
                  label: 'Feedback & Analytics',
                  isCollapsed: isCollapsed,
                  index: 4,
                  tooltipMessage: 'Track your performance',
                ),
              ],
            ),
          ),

          /// ✅ User Info Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 1, color: AspirantsAIPalette.grey300),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/display_pic.jpeg',
                      ),
                    ),
                    if (!isCollapsed) ...[
                      const SizedBox(width: 8),
                      Expanded(
                        // ✅ Added to prevent overflow
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              // ✅ Added so text wraps if needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Debdaru Dasgupta',
                                    overflow:
                                        TextOverflow
                                            .ellipsis, // ✅ Safe truncation
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
                            ),
                            const SizedBox(width: 8),
                            CommonHoverActionItem(
                              message: 'Sign Out',
                              onTap: () => print('Sign out tapped'),
                              icon: Icon(
                                Icons.door_back_door_outlined,
                                size: 20,
                                color: AspirantsAIPalette.coffee,
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

/// ✅ Sidebar Item Fix: Navigation without toggle
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

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          screenProvider.setSelectedIndex(widget.index);
          // ✅ DO NOT toggle sidebar on collapsed state
        },
        child: Tooltip(
          message: widget.isCollapsed ? widget.tooltipMessage : '',
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AspirantsAITextStyles.bodySmall.copyWith(
            color: AspirantsAIPalette.bodyBackground,
            fontSize: 12,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AspirantsAIPalette.coffee.withOpacity(0.1)
                      : isHovered
                      ? AspirantsAIPalette.coffee.withOpacity(0.3)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(widget.icon, size: 20, color: AspirantsAIPalette.coffee),
                if (!widget.isCollapsed) ...[
                  const SizedBox(width: 12),
                  Flexible(
                    // ✅ Added to avoid overflow
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: AspirantsAITextStyles.bodyMedium.copyWith(
                        color: AspirantsAIPalette.coffee.withOpacity(
                          isSelected ? 1.0 : 0.7,
                        ),
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 16,
                      ),
                      child: Text(
                        widget.label,
                        overflow: TextOverflow.ellipsis, // ✅ Truncate if needed
                        style: AspirantsAITextStyles.bodySmall,
                      ),
                    ),
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
