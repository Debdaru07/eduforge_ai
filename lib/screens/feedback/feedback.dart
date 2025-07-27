import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/helper.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Padding(
        padding: const EdgeInsets.all(32.0), // p-8 (8 * 4px = 32px)
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1280,
            ), // max-w-7xl (7xl = 80rem = 1280px)
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0), // mb-8
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Feedback & Analytics',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AspirantsAIPalette.black,
                          ),
                        ),
                        const SizedBox(height: 8), // mb-2
                        Text(
                          'Track your progress and get personalized insights to improve your preparation.',
                          style: AspirantsAITextStyles.bodyMedium.copyWith(
                            color: AspirantsAIPalette.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Performance Overview Grid
                  GridView.count(
                    crossAxisCount: 4, // lg:grid-cols-4
                    crossAxisSpacing: 24, // gap-6 (6 * 4px = 24px)
                    mainAxisSpacing: 24,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      FeedbackHelpers.buildOverviewCard(
                        icon: Icons.check,
                        iconColor: AspirantsAIPalette.green,
                        iconBgColor: AspirantsAIPalette.green.withOpacity(0.1),
                        title: 'Overall Accuracy',
                        value: '85%',
                        subtitle: '+5% from last week',
                        subtitleColor: AspirantsAIPalette.green,
                      ),
                      FeedbackHelpers.buildOverviewCard(
                        icon: Icons.timer,
                        iconColor: AspirantsAIPalette.purple,
                        iconBgColor: AspirantsAIPalette.purple.withOpacity(0.1),
                        title: 'Avg. Response Time',
                        value: '45s',
                        subtitle: '-8s improvement',
                        subtitleColor: AspirantsAIPalette.purple,
                      ),
                      FeedbackHelpers.buildOverviewCard(
                        icon: Icons.emoji_events,
                        iconColor: AspirantsAIPalette.purple,
                        iconBgColor: AspirantsAIPalette.purple.withOpacity(0.1),
                        title: 'Strong Topics',
                        value: '12',
                        subtitle: 'Out of 18 total',
                        subtitleColor: AspirantsAIPalette.purple,
                      ),
                      FeedbackHelpers.buildOverviewCard(
                        icon: Icons.center_focus_strong,
                        iconColor: AspirantsAIPalette.orange,
                        iconBgColor: AspirantsAIPalette.orange.withOpacity(0.1),
                        title: 'Focus Areas',
                        value: '6',
                        subtitle: 'Need improvement',
                        subtitleColor: AspirantsAIPalette.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32), // mb-8
                  // Charts Grid
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1, // lg:grid-cols-2
                        child: Container(
                          padding: const EdgeInsets.all(24), // p-6
                          decoration: BoxDecoration(
                            color: AspirantsAIPalette.white,
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // rounded-xl
                            border: Border.all(
                              color: AspirantsAIPalette.grey300,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AspirantsAIPalette.black.withOpacity(
                                  0.05,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Performance Trend',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              const SizedBox(height: 16), // mb-4
                              Container(
                                height: 300,
                                color: AspirantsAIPalette.grey100,
                                child: const Center(
                                  child: Text(
                                    'Performance Chart Placeholder',
                                    style: AspirantsAITextStyles.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 32), // gap-8
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(24), // p-6
                          decoration: BoxDecoration(
                            color: AspirantsAIPalette.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AspirantsAIPalette.grey300,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AspirantsAIPalette.black.withOpacity(
                                  0.05,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subject-wise Accuracy',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              const SizedBox(height: 16), // mb-4
                              Container(
                                height: 300,
                                color: AspirantsAIPalette.grey100,
                                child: const Center(
                                  child: Text(
                                    'Subject Chart Placeholder',
                                    style: AspirantsAITextStyles.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32), // mb-8
                  // Weak Topics and Suggestions Grid
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1, // lg:grid-cols-2
                        child: Container(
                          padding: const EdgeInsets.all(24), // p-6
                          decoration: BoxDecoration(
                            color: AspirantsAIPalette.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AspirantsAIPalette.grey300,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AspirantsAIPalette.black.withOpacity(
                                  0.05,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Areas for Improvement',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              const SizedBox(height: 16), // mb-4
                              FeedbackHelpers.buildWeakTopicCard(
                                title: 'Microeconomics',
                                accuracy: '58% accuracy',
                                description:
                                    'Focus on market structures and price determination',
                                buttonText: 'Practice More →',
                                bgColor: AspirantsAIPalette.orange.withOpacity(
                                  0.1,
                                ),
                                borderColor: AspirantsAIPalette.orange,
                                accuracyColor: AspirantsAIPalette.orange,
                              ),
                              const SizedBox(height: 16), // space-y-4
                              FeedbackHelpers.buildWeakTopicCard(
                                title: 'Constitutional Amendments',
                                accuracy: '64% accuracy',
                                description:
                                    'Review major amendments and their provisions',
                                buttonText: 'Study Guide →',
                                bgColor: AspirantsAIPalette.orange.withOpacity(
                                  0.1,
                                ),
                                borderColor: AspirantsAIPalette.orange,
                                accuracyColor: AspirantsAIPalette.orange,
                              ),
                              const SizedBox(height: 16),
                              FeedbackHelpers.buildWeakTopicCard(
                                title: 'Physical Geography',
                                accuracy: '67% accuracy',
                                description:
                                    'Strengthen concepts of climate and landforms',
                                buttonText: 'Watch Videos →',
                                bgColor: AspirantsAIPalette.orange.withOpacity(
                                  0.1,
                                ),
                                borderColor: AspirantsAIPalette.orange,
                                accuracyColor: AspirantsAIPalette.orange,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 32), // gap-8
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(24), // p-6
                          decoration: BoxDecoration(
                            color: AspirantsAIPalette.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AspirantsAIPalette.grey300,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AspirantsAIPalette.black.withOpacity(
                                  0.05,
                                ),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personalized Suggestions',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              const SizedBox(height: 16), // mb-4
                              FeedbackHelpers.buildSuggestionCard(
                                icon: Icons.lightbulb_outline,
                                iconColor: AspirantsAIPalette.purple,
                                iconBgColor: AspirantsAIPalette.purple
                                    .withOpacity(0.1),
                                title: 'Study Schedule',
                                description:
                                    'Dedicate 45 minutes daily to Economics. Your consistency has improved by 23%.',
                                bgColor: AspirantsAIPalette.purple.withOpacity(
                                  0.1,
                                ),
                                borderColor: AspirantsAIPalette.purple,
                              ),
                              const SizedBox(height: 16), // space-y-4
                              FeedbackHelpers.buildSuggestionCard(
                                icon: Icons.track_changes,
                                iconColor: AspirantsAIPalette.green,
                                iconBgColor: AspirantsAIPalette.green
                                    .withOpacity(0.1),
                                title: 'Practice Strategy',
                                description:
                                    'Take 2-3 mixed topic quizzes weekly to maintain strong subjects while improving weak ones.',
                                bgColor: AspirantsAIPalette.green.withOpacity(
                                  0.1,
                                ),
                                borderColor: AspirantsAIPalette.green,
                              ),
                              const SizedBox(height: 16),
                              FeedbackHelpers.buildSuggestionCard(
                                icon: Icons.book,
                                iconColor: AspirantsAIPalette.purple,
                                iconBgColor: AspirantsAIPalette.purple
                                    .withOpacity(0.1),
                                title: 'Resource Recommendation',
                                description:
                                    'Upload more Economics practice papers to get targeted questions for weak areas.',
                                bgColor: AspirantsAIPalette.purple.withOpacity(
                                  0.1,
                                ),
                                borderColor: AspirantsAIPalette.purple,
                              ),
                              const SizedBox(height: 24), // mt-6
                              Container(
                                padding: const EdgeInsets.all(16), // p-4
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AspirantsAIPalette.purple,
                                      AspirantsAIPalette.green,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ), // rounded-lg
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AspirantsAIPalette.white
                                            .withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: AspirantsAIPalette.white,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12), // space-x-3
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '"Success is the sum of small efforts repeated day in and day out."',
                                            style: AspirantsAITextStyles
                                                .bodyMedium
                                                .copyWith(
                                                  color:
                                                      AspirantsAIPalette.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          const SizedBox(height: 4), // mb-1
                                          Text(
                                            'Keep going, you\'re making great progress!',
                                            style: AspirantsAITextStyles
                                                .bodySmall
                                                .copyWith(
                                                  color: AspirantsAIPalette
                                                      .white
                                                      .withOpacity(0.9),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32), // mt-8
                  // Export Button
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ), // px-6 py-3
                        backgroundColor: AspirantsAIPalette.white,
                        side: const BorderSide(
                          color: AspirantsAIPalette.grey300,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.download,
                            color: AspirantsAIPalette.grey600,
                            size: 20,
                          ),
                          const SizedBox(width: 8), // space-x-2
                          Text(
                            'Export Detailed Report',
                            style: AspirantsAITextStyles.bodyMedium.copyWith(
                              color: AspirantsAIPalette.grey600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
