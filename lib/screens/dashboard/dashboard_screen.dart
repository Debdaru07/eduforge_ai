import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'components/dashboard_card.dart';
import 'components/recent_quiz_card.dart';
import 'components/study_recommendation_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800; // breakpoint for mobile/tablet

    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// WELCOME SECTION
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back, Debdaru!',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
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

            /// DASHBOARD CARDS - Responsive Grid
            GridView.count(
              crossAxisCount: isMobile ? 2 : 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                DashboardCard(
                  title: 'Documents Uploaded',
                  value: '24',
                  subtext: '+3 this week',
                  color: AspirantsAIPalette.purple,
                ),
                DashboardCard(
                  title: 'Quizzes Completed',
                  value: '156',
                  subtext: '85% average score',
                  color: AspirantsAIPalette.green,
                ),
                DashboardCard(
                  title: 'AI Assistants',
                  value: '8',
                  subtext: '3 active sessions',
                  color: AspirantsAIPalette.orange,
                ),
                DashboardCard(
                  title: 'Overall Progress',
                  value: '92%',
                  subtext: 'Great Improvement!',
                  color: AspirantsAIPalette.grey,
                  icon: Icons.emoji_events,
                ),
              ],
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
        ),
      ),
    );
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
