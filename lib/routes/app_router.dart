import 'package:go_router/go_router.dart';
import '../screens/feedback/feedback.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/quiz/quiz.dart';
import '../screens/upload_files/upload.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      name: 'feedback',
      path: '/feedback',
      builder: (context, state) => const FeedbackScreen(),
    ),
    GoRoute(
      name: 'quiz',
      path: '/quiz',
      builder: (context, state) => const QuizScreen(),
    ),
    GoRoute(
      name: 'upload',
      path: '/upload',
      builder: (context, state) => const Upload(),
    ),
  ],
);
