import 'package:go_router/go_router.dart';
import '../screens/feedback/feedback.dart';
import '../screens/home/home_screen.dart';
import '../screens/ask_ai/ask_ai.dart';
import '../screens/assistants/asssistants.dart';
import '../screens/quiz/quiz.dart';
import '../screens/upload/upload.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'ask_ai',
      path: '/ask-ai',
      builder: (context, state) {
        return AskAI();
      },
    ),
    GoRoute(
      name: 'assistants',
      path: '/assistants',
      builder: (context, state) => const Assistants(),
    ),
    GoRoute(
      name: 'feedback',
      path: '/feedback',
      builder: (context, state) => const FeedbackScreen(),
    ),
    GoRoute(
      name: 'quiz',
      path: '/quiz',
      builder: (context, state) {
        return Quiz();
      },
    ),
    GoRoute(
      name: 'upload',
      path: '/upload',
      builder: (context, state) => const Upload(),
    ),
  ],
);
