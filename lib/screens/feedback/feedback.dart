import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1024 ? 4 : 2;

    final padding = screenWidth > 768 ? 32.0 : 16.0;

    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth > 1280 ? 1280 : screenWidth,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      Padding(
                        padding: EdgeInsets.only(bottom: padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feedback & Analytics',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: screenWidth > 768 ? 30 : 24,
                                fontWeight: FontWeight.w700,
                                color: AspirantsAIPalette.black,
                              ),
                            ),
                            SizedBox(height: padding / 4),
                            Text(
                              'Track your progress and get personalized insights to improve your preparation.',
                              style: AspirantsAITextStyles.bodyMedium.copyWith(
                                color: AspirantsAIPalette.grey600,
                                fontSize: screenWidth > 768 ? 16 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Performance Overview Grid
                      GridView.count(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: padding / 1.5,
                        mainAxisSpacing: padding / 1.5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          FeedbackHelpers.buildOverviewCard(
                            icon: Icons.check,
                            iconColor: AspirantsAIPalette.green,
                            iconBgColor: AspirantsAIPalette.green.withOpacity(
                              0.1,
                            ),
                            title: 'Overall Accuracy',
                            value: '85%',
                            subtitle: '+5% from last week',
                            subtitleColor: AspirantsAIPalette.green,
                          ),
                          FeedbackHelpers.buildOverviewCard(
                            icon: Icons.timer,
                            iconColor: AspirantsAIPalette.purple,
                            iconBgColor: AspirantsAIPalette.purple.withOpacity(
                              0.1,
                            ),
                            title: 'Avg. Response Time',
                            value: '45s',
                            subtitle: '-8s improvement',
                            subtitleColor: AspirantsAIPalette.purple,
                          ),
                          FeedbackHelpers.buildOverviewCard(
                            icon: Icons.emoji_events,
                            iconColor: AspirantsAIPalette.purple,
                            iconBgColor: AspirantsAIPalette.purple.withOpacity(
                              0.1,
                            ),
                            title: 'Strong Topics',
                            value: '12',
                            subtitle: 'Out of 18 total',
                            subtitleColor: AspirantsAIPalette.purple,
                          ),
                          FeedbackHelpers.buildOverviewCard(
                            icon: Icons.center_focus_strong,
                            iconColor: AspirantsAIPalette.orange,
                            iconBgColor: AspirantsAIPalette.orange.withOpacity(
                              0.1,
                            ),
                            title: 'Focus Areas',
                            value: '6',
                            subtitle: 'Need improvement',
                            subtitleColor: AspirantsAIPalette.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: padding),
                      // Charts Section
                      screenWidth > 768
                          ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: buildChartCard(
                                  context,
                                  'Performance Trend',
                                  'Performance Chart Placeholder',
                                ),
                              ),
                              SizedBox(width: padding),
                              Expanded(
                                child: buildChartCard(
                                  context,
                                  'Subject-wise Accuracy',
                                  'Subject Chart Placeholder',
                                ),
                              ),
                            ],
                          )
                          : Column(
                            children: [
                              buildChartCard(
                                context,
                                'Performance Trend',
                                'Performance Chart Placeholder',
                              ),
                              SizedBox(height: padding),
                              buildChartCard(
                                context,
                                'Subject-wise Accuracy',
                                'Subject Chart Placeholder',
                              ),
                            ],
                          ),
                      SizedBox(height: padding),
                      // Weak Topics and Suggestions Section
                      screenWidth > 768
                          ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: buildWeakTopicsCard(context)),
                              SizedBox(width: padding),
                              Expanded(child: buildSuggestionsCard(context)),
                            ],
                          )
                          : Column(
                            children: [
                              buildWeakTopicsCard(context),
                              SizedBox(height: padding),
                              buildSuggestionsCard(context),
                            ],
                          ),
                      SizedBox(height: padding),
                      // Export Button
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: padding,
                              vertical: padding / 2,
                            ),
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
                              SizedBox(width: padding / 4),
                              Text(
                                'Export Detailed Report',
                                style: AspirantsAITextStyles.bodyMedium
                                    .copyWith(
                                      color: AspirantsAIPalette.grey600,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth > 768 ? 16 : 14,
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
          );
        },
      ),
    );
  }

  Widget buildChartCard(
    BuildContext context,
    String title,
    String placeholder,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth > 768 ? 24.0 : 16.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AspirantsAIPalette.grey300),
        boxShadow: [
          BoxShadow(
            color: AspirantsAIPalette.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: screenWidth > 768 ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: AspirantsAIPalette.black,
            ),
          ),
          SizedBox(height: padding / 1.5),
          Container(
            height: screenWidth > 768 ? 300 : 200,
            color: AspirantsAIPalette.grey100,
            child: Center(
              child: Text(
                placeholder,
                style: AspirantsAITextStyles.bodyMedium.copyWith(
                  fontSize: screenWidth > 768 ? 16 : 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWeakTopicsCard(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth > 768 ? 24.0 : 16.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AspirantsAIPalette.grey300),
        boxShadow: [
          BoxShadow(
            color: AspirantsAIPalette.black.withOpacity(0.05),
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
              fontSize: screenWidth > 768 ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: AspirantsAIPalette.black,
            ),
          ),
          SizedBox(height: padding / 1.5),
          FeedbackHelpers.buildWeakTopicCard(
            title: 'Microeconomics',
            accuracy: '58% accuracy',
            description: 'Focus on market structures and price determination',
            buttonText: 'Practice More →',
            bgColor: AspirantsAIPalette.orange.withOpacity(0.1),
            borderColor: AspirantsAIPalette.orange,
            accuracyColor: AspirantsAIPalette.orange,
          ),
          SizedBox(height: padding / 1.5),
          FeedbackHelpers.buildWeakTopicCard(
            title: 'Constitutional Amendments',
            accuracy: '64% accuracy',
            description: 'Review major amendments and their provisions',
            buttonText: 'Study Guide →',
            bgColor: AspirantsAIPalette.orange.withOpacity(0.1),
            borderColor: AspirantsAIPalette.orange,
            accuracyColor: AspirantsAIPalette.orange,
          ),
          SizedBox(height: padding / 1.5),
          FeedbackHelpers.buildWeakTopicCard(
            title: 'Physical Geography',
            accuracy: '67% accuracy',
            description: 'Strengthen concepts of climate and landforms',
            buttonText: 'Watch Videos →',
            bgColor: AspirantsAIPalette.orange.withOpacity(0.1),
            borderColor: AspirantsAIPalette.orange,
            accuracyColor: AspirantsAIPalette.orange,
          ),
        ],
      ),
    );
  }

  Widget buildSuggestionsCard(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth > 768 ? 24.0 : 16.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AspirantsAIPalette.grey300),
        boxShadow: [
          BoxShadow(
            color: AspirantsAIPalette.black.withOpacity(0.05),
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
              fontSize: screenWidth > 768 ? 18 : 16,
              fontWeight: FontWeight.w600,
              color: AspirantsAIPalette.black,
            ),
          ),
          SizedBox(height: padding / 1.5),
          FeedbackHelpers.buildSuggestionCard(
            icon: Icons.lightbulb_outline,
            iconColor: AspirantsAIPalette.purple,
            iconBgColor: AspirantsAIPalette.purple.withOpacity(0.1),
            title: 'Study Schedule',
            description:
                'Dedicate 45 minutes daily to Economics. Your consistency has improved by 23%.',
            bgColor: AspirantsAIPalette.purple.withOpacity(0.1),
            borderColor: AspirantsAIPalette.purple,
          ),
          SizedBox(height: padding / 1.5),
          FeedbackHelpers.buildSuggestionCard(
            icon: Icons.track_changes,
            iconColor: AspirantsAIPalette.green,
            iconBgColor: AspirantsAIPalette.green.withOpacity(0.1),
            title: 'Practice Strategy',
            description:
                'Take 2-3 mixed topic quizzes weekly to maintain strong subjects while improving weak ones.',
            bgColor: AspirantsAIPalette.green.withOpacity(0.1),
            borderColor: AspirantsAIPalette.green,
          ),
          SizedBox(height: padding / 1.5),
          FeedbackHelpers.buildSuggestionCard(
            icon: Icons.book,
            iconColor: AspirantsAIPalette.purple,
            iconBgColor: AspirantsAIPalette.purple.withOpacity(0.1),
            title: 'Resource Recommendation',
            description:
                'Upload more Economics practice papers to get targeted questions for weak areas.',
            bgColor: AspirantsAIPalette.purple.withOpacity(0.1),
            borderColor: AspirantsAIPalette.purple,
          ),
          SizedBox(height: padding),
          Container(
            padding: EdgeInsets.all(padding / 1.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AspirantsAIPalette.purple, AspirantsAIPalette.green],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AspirantsAIPalette.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: AspirantsAIPalette.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: padding / 2.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"Success is the sum of small efforts repeated day in and day out."',
                        style: AspirantsAITextStyles.bodyMedium.copyWith(
                          color: AspirantsAIPalette.white,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth > 768 ? 16 : 14,
                        ),
                      ),
                      SizedBox(height: padding / 4),
                      Text(
                        'Keep going, you\'re making great progress!',
                        style: AspirantsAITextStyles.bodySmall.copyWith(
                          color: AspirantsAIPalette.white.withOpacity(0.9),
                          fontSize: screenWidth > 768 ? 14 : 12,
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
    );
  }
}
