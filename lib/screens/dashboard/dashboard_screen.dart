import 'package:flutter/material.dart';
import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'components/dashboard_card.dart';
import 'components/recent_quiz_card.dart';
import 'components/study_recommendation_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            bool isMobile = maxWidth < 800; // responsive breakpoint

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// WELCOME SECTION
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome back, Debdaru!',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Ready to ace your UPSC preparation today?',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                /// DASHBOARD CARDS
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _buildDashboardCards(maxWidth, isMobile),
                ),

                const SizedBox(height: 20),

                /// RECENT QUIZZES + STUDY RECOMMENDATIONS
                isMobile
                    ? Column(
                      children: [
                        _buildRecentQuizzesSection(),
                        const SizedBox(height: 16),
                        _buildStudyRecommendationsSection(),
                      ],
                    )
                    : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildRecentQuizzesSection()),
                        const SizedBox(width: 20),
                        Expanded(child: _buildStudyRecommendationsSection()),
                      ],
                    ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// ✅ Build cards dynamically based on available width
  List<Widget> _buildDashboardCards(double maxWidth, bool isMobile) {
    int columns = isMobile ? 2 : 4;
    double spacing = 12;
    double availableWidth = maxWidth - (spacing * (columns - 1));
    double cardWidth = availableWidth / columns;

    List<Map<String, dynamic>> cards = [
      {
        "title": "Documents Uploaded",
        "value": "24",
        "subtext": "+3 this week",
        "color": AspirantsAIPalette.purple,
        "icon": FlutterRemix.book_open_line,
      },
      {
        "title": "Quizzes Completed",
        "value": "156",
        "subtext": "85% average score",
        "color": AspirantsAIPalette.green,
        "icon": FlutterRemix.question_answer_line,
      },
      {
        "title": "AI Assistants",
        "value": "8",
        "subtext": "3 active sessions",
        "color": AspirantsAIPalette.orange,
        "icon": FlutterRemix.robot_line,
      },
      {
        "title": "Overall Progress",
        "value": "92%",
        "subtext": "Great Improvement!",
        "color": AspirantsAIPalette.grey,
        "icon": FlutterRemix.trophy_line,
      },
    ];

    return cards
        .map(
          (item) => SizedBox(
            width: cardWidth,
            child: DashboardCard(
              title: item["title"],
              value: item["value"],
              subtext: item["subtext"],
              color: item["color"],
              icon: item["icon"],
            ),
          ),
        )
        .toList();
  }

  Widget _buildRecentQuizzesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Recent Quizzes',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          RecentQuizCard(
            title: 'Indian Polity - Fundamentals',
            questions: '20 questions',
            time: '18 minutes ago',
            score: '88%',
          ),
          RecentQuizCard(
            title: 'Modern History - Freedom Struggle',
            questions: '15 questions',
            time: '2 hours ago',
            score: '92%',
          ),
          RecentQuizCard(
            title: 'Geography - Physical Features',
            questions: '25 questions',
            time: 'Yesterday',
            score: '76%',
          ),
        ],
      ),
    );
  }

  Widget _buildStudyRecommendationsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Study Recommendations',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          StudyRecommendationCard(
            title: 'Focus on Economics',
            description:
                'Your recent scores suggest reviewing microeconomics concepts.',
          ),
          StudyRecommendationCard(
            title: 'Great Progress in History',
            description:
                'Keep up the excellent work with modern Indian history topics.',
          ),
          StudyRecommendationCard(
            title: 'Practice More Geography',
            description: 'Consider taking more quizzes on physical geography.',
          ),
        ],
      ),
    );
  }
}
