import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'theme/app_theme.dart';
import 'view_model/app_providers/screen_switch_provider.dart';
import 'widgets/responsive_main_scaffold.dart';
import 'widgets/sidebar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScreenSwitchProvider(),
      child: const AIApp(),
    ),
  );
}

class AIApp extends StatefulWidget {
  const AIApp({super.key});

  @override
  State<AIApp> createState() => _AIAppState();
}

class _AIAppState extends State<AIApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AspirantsTheme.light,
      darkTheme: AspirantsTheme.dark,
      home: Consumer<ScreenSwitchProvider>(
        builder: (_, provider, __) {
          return ResponsiveScaffold(
            isCollapsed: provider.isCollapsed,
            onToggle: provider.toggleSidebar,
            sidebarCollapsed: Sidebar(
              isCollapsed: true,
              onToggle: provider.toggleSidebar,
            ),
            sidebarExpanded: Sidebar(
              isCollapsed: false,
              onToggle: provider.toggleSidebar,
            ),
            body: provider.screens[provider.selectedIndex],
          );
        },
      ),
    );
  }
}
