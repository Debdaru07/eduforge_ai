import 'package:flutter/material.dart';
import '../../screens/chat/chat_screen.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/upload_files/upload.dart';
import '../../screens/quiz/quiz.dart';
import '../../screens/playground/playground.dart';
import '../../screens/feedback/feedback.dart';

class ScreenSwitchProvider extends ChangeNotifier {
  // Current index
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // Collapse sidebar
  bool _isCollapsed = false;
  bool get isCollapsed => _isCollapsed;

  // All screens listed in order
  final List<Widget> _screens = const [
    Dashboard(),
    Upload(),
    QuizScreen(),
    AssistantPlayground(),
    FeedbackScreen(),
    ChatScreen(),
  ];
  List<Widget> get screens => _screens;

  final List<Map<String, dynamic>> _destinations = [
    {'name': 'Dashboard', 'icon': Icons.dashboard},
    {'name': 'PDF Upload', 'icon': Icons.upload_file},
    {'name': 'Quiz Interface', 'icon': Icons.quiz},
    {'name': 'Assistant Playground', 'icon': Icons.play_circle_outline},
    {'name': 'Feedback & Analytics', 'icon': Icons.analytics},
  ];
  List<Map<String, dynamic>> get destinations => _destinations;

  void setSelectedIndex(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void toggleSidebar() {
    _isCollapsed = !_isCollapsed;
    notifyListeners();
  }
}
