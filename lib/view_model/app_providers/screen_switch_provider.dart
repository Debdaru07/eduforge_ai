import 'package:flutter/material.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/ask_ai/ask_ai.dart';
import '../../screens/quiz/quiz.dart';
import '../../screens/upload/upload.dart';
import '../../screens/feedback/feedback.dart';
import '../../screens/assistants/asssistants.dart';

class ScreenSwitchProvider extends ChangeNotifier {
  // Current index
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // Collapse sidebar
  bool _isCollapsed = false;
  bool get isCollapsed => _isCollapsed;

  // All screens listed in order
  final List<Widget> _screens = const [
    HomeScreen(),
    AskAI(),
    Quiz(),
    Upload(),
    FeedbackScreen(),
    Assistants(),
  ];
  List<Widget> get screens => _screens;

  final List<Map<String, dynamic>> _destinations = [
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Ask AI', 'icon': Icons.chat},
    {'name': 'Quiz', 'icon': Icons.quiz},
    {'name': 'Upload', 'icon': Icons.upload_file},
    {'name': 'Feedback', 'icon': Icons.feedback},
    {'name': 'Assistants', 'icon': Icons.settings},
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
