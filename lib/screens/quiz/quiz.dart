import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'components/quiz_components.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizState();
}

class _QuizState extends State<QuizScreen> {
  bool _isQuizStarted = false;
  bool _isQuizCompleted = false;
  String _selectedOption = '';
  int _currentQuestion = 1;
  int _totalQuestions = 10;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth > 768 ? 32.0 : 16.0;
    final resultCrossAxisCount =
        screenWidth > 768
            ? 3
            : screenWidth > 600
            ? 2
            : 1;

    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Stretch to full width
              children: [
                // Header Section
                Padding(
                  padding: EdgeInsets.only(bottom: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quiz Interface',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: screenWidth > 768 ? 30 : 24,
                          fontWeight: FontWeight.w700,
                          color: AspirantsAIPalette.black,
                        ),
                      ),
                      SizedBox(height: padding / 4),
                      Text(
                        'Test your knowledge with AI-generated quizzes from your uploaded materials.',
                        style: AspirantsAITextStyles.bodyMedium.copyWith(
                          color: AspirantsAIPalette.grey600,
                          fontSize: screenWidth > 768 ? 16 : 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // Quiz Filters
                Container(
                  padding: EdgeInsets.all(padding * 0.75),
                  margin: EdgeInsets.only(bottom: padding),
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
                    children: [
                      // Quiz Filters
                      Wrap(
                        spacing:
                            padding / 2, // Horizontal spacing between items
                        runSpacing:
                            padding /
                            2, // Vertical spacing between wrapped lines
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          QuizComponents.buildQuizFilter(
                            label: 'Topic',
                            initialValue: 'All Topics',
                            options: [
                              'All Topics',
                              'Indian Polity',
                              'Modern History',
                              'Geography',
                              'Economics',
                              'Current Affairs',
                            ],
                          ),
                          QuizComponents.buildQuizFilter(
                            label: 'Difficulty',
                            initialValue: 'All Levels',
                            options: ['All Levels', 'Easy', 'Medium', 'Hard'],
                          ),
                          QuizComponents.buildQuizFilter(
                            label: 'Questions',
                            initialValue: '10 Questions',
                            options: [
                              '10 Questions',
                              '20 Questions',
                              '30 Questions',
                              '50 Questions',
                            ],
                          ),
                          QuizComponents.buildQuizFilter(
                            label: 'Timer',
                            initialValue: 'No Timer',
                            options: [
                              'No Timer',
                              '30 seconds/question',
                              '60 seconds/question',
                              '90 seconds/question',
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: padding / 2),
                      Center(
                        child: ElevatedButton(
                          onPressed:
                              () => setState(() => _isQuizStarted = true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AspirantsAIPalette.coffee,
                            foregroundColor: AspirantsAIPalette.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: padding,
                              vertical: padding / 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Start Quiz',
                            style: AspirantsAITextStyles.bodyMedium.copyWith(
                              color: AspirantsAIPalette.white,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth > 768 ? 16 : 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Quiz Card or Results
                if (_isQuizStarted && !_isQuizCompleted) ...[
                  Container(
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
                      children: [
                        // Quiz Header
                        Container(
                          padding: EdgeInsets.all(padding * 0.75),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AspirantsAIPalette.grey300,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              screenWidth > 600
                                  ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Question $_currentQuestion of $_totalQuestions',
                                            style: AspirantsAITextStyles
                                                .bodySmall
                                                .copyWith(
                                                  color:
                                                      AspirantsAIPalette
                                                          .grey600,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      screenWidth > 768
                                                          ? 14
                                                          : 12,
                                                ),
                                          ),
                                          SizedBox(width: padding / 2),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: padding / 2,
                                              vertical: padding / 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AspirantsAIPalette.purple
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              'Indian Polity',
                                              style: AspirantsAITextStyles
                                                  .bodySmall
                                                  .copyWith(
                                                    color:
                                                        AspirantsAIPalette
                                                            .purple,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth > 768
                                                            ? 14
                                                            : 12,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: padding / 2),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: padding / 2,
                                              vertical: padding / 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AspirantsAIPalette.green
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              'Medium',
                                              style: AspirantsAITextStyles
                                                  .bodySmall
                                                  .copyWith(
                                                    color:
                                                        AspirantsAIPalette
                                                            .green,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth > 768
                                                            ? 14
                                                            : 12,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '01:30',
                                        style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: screenWidth > 768 ? 18 : 16,
                                          fontWeight: FontWeight.w700,
                                          color: AspirantsAIPalette.black,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Question $_currentQuestion of $_totalQuestions',
                                        style: AspirantsAITextStyles.bodySmall
                                            .copyWith(
                                              color: AspirantsAIPalette.grey600,
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  screenWidth > 768 ? 14 : 12,
                                            ),
                                      ),
                                      SizedBox(height: padding / 4),
                                      Wrap(
                                        spacing: padding / 2,
                                        runSpacing: padding / 4,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: padding / 2,
                                              vertical: padding / 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AspirantsAIPalette.purple
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              'Indian Polity',
                                              style: AspirantsAITextStyles
                                                  .bodySmall
                                                  .copyWith(
                                                    color:
                                                        AspirantsAIPalette
                                                            .purple,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth > 768
                                                            ? 14
                                                            : 12,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: padding / 2,
                                              vertical: padding / 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AspirantsAIPalette.green
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              'Medium',
                                              style: AspirantsAITextStyles
                                                  .bodySmall
                                                  .copyWith(
                                                    color:
                                                        AspirantsAIPalette
                                                            .green,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth > 768
                                                            ? 14
                                                            : 12,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: padding / 4),
                                      Text(
                                        '01:30',
                                        style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: screenWidth > 768 ? 18 : 16,
                                          fontWeight: FontWeight.w700,
                                          color: AspirantsAIPalette.black,
                                        ),
                                      ),
                                    ],
                                  ),
                              SizedBox(height: padding / 2),
                              Stack(
                                children: [
                                  Container(
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AspirantsAIPalette.grey100,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Container(
                                    height: 8,
                                    width:
                                        (screenWidth - 2 * padding) *
                                        (_currentQuestion / _totalQuestions),
                                    decoration: BoxDecoration(
                                      color: AspirantsAIPalette.purple,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Question Content
                        Padding(
                          padding: EdgeInsets.all(padding * 0.75),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Which of the following is NOT a fundamental right guaranteed by the Indian Constitution?',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: screenWidth > 768 ? 20 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              SizedBox(height: padding * 0.75),
                              Column(
                                children: [
                                  QuizComponents.buildQuizOption(
                                    optionLabel: 'A.',
                                    optionText: 'Right to Equality',
                                    onTap:
                                        () => setState(
                                          () => _selectedOption = 'A',
                                        ),
                                    isSelected: _selectedOption == 'A',
                                  ),
                                  SizedBox(height: padding / 2.5),
                                  QuizComponents.buildQuizOption(
                                    optionLabel: 'B.',
                                    optionText: 'Right to Freedom',
                                    onTap:
                                        () => setState(
                                          () => _selectedOption = 'B',
                                        ),
                                    isSelected: _selectedOption == 'B',
                                  ),
                                  SizedBox(height: padding / 2.5),
                                  QuizComponents.buildQuizOption(
                                    optionLabel: 'C.',
                                    optionText: 'Right to Work',
                                    onTap:
                                        () => setState(
                                          () => _selectedOption = 'C',
                                        ),
                                    isSelected: _selectedOption == 'C',
                                  ),
                                  SizedBox(height: padding / 2.5),
                                  QuizComponents.buildQuizOption(
                                    optionLabel: 'D.',
                                    optionText: 'Right against Exploitation',
                                    onTap:
                                        () => setState(
                                          () => _selectedOption = 'D',
                                        ),
                                    isSelected: _selectedOption == 'D',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Quiz Actions
                        Container(
                          padding: EdgeInsets.all(padding * 0.75),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: AspirantsAIPalette.grey300,
                              ),
                            ),
                          ),
                          child:
                              screenWidth > 600
                                  ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_currentQuestion <
                                                _totalQuestions) {
                                              _currentQuestion++;
                                              _selectedOption = '';
                                            } else {
                                              _isQuizCompleted = true;
                                            }
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: padding,
                                            vertical: padding / 2,
                                          ),
                                          side: const BorderSide(
                                            color: AspirantsAIPalette.grey300,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Skip Question',
                                          style: AspirantsAITextStyles
                                              .bodyMedium
                                              .copyWith(
                                                color:
                                                    AspirantsAIPalette.grey600,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    screenWidth > 768 ? 16 : 14,
                                              ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed:
                                            _selectedOption.isNotEmpty
                                                ? () {
                                                  setState(() {
                                                    if (_currentQuestion <
                                                        _totalQuestions) {
                                                      _currentQuestion++;
                                                      _selectedOption = '';
                                                    } else {
                                                      _isQuizCompleted = true;
                                                    }
                                                  });
                                                }
                                                : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AspirantsAIPalette.purple,
                                          foregroundColor:
                                              AspirantsAIPalette.white,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: padding,
                                            vertical: padding / 2,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Submit Answer',
                                          style: AspirantsAITextStyles
                                              .bodyMedium
                                              .copyWith(
                                                color: AspirantsAIPalette.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    screenWidth > 768 ? 16 : 14,
                                              ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_currentQuestion <
                                                _totalQuestions) {
                                              _currentQuestion++;
                                              _selectedOption = '';
                                            } else {
                                              _isQuizCompleted = true;
                                            }
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: padding,
                                            vertical: padding / 2,
                                          ),
                                          side: const BorderSide(
                                            color: AspirantsAIPalette.grey300,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Skip Question',
                                          style: AspirantsAITextStyles
                                              .bodyMedium
                                              .copyWith(
                                                color:
                                                    AspirantsAIPalette.grey600,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    screenWidth > 768 ? 16 : 14,
                                              ),
                                        ),
                                      ),
                                      SizedBox(height: padding / 2),
                                      ElevatedButton(
                                        onPressed:
                                            _selectedOption.isNotEmpty
                                                ? () {
                                                  setState(() {
                                                    if (_currentQuestion <
                                                        _totalQuestions) {
                                                      _currentQuestion++;
                                                      _selectedOption = '';
                                                    } else {
                                                      _isQuizCompleted = true;
                                                    }
                                                  });
                                                }
                                                : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AspirantsAIPalette.purple,
                                          foregroundColor:
                                              AspirantsAIPalette.white,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: padding,
                                            vertical: padding / 2,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Submit Answer',
                                          style: AspirantsAITextStyles
                                              .bodyMedium
                                              .copyWith(
                                                color: AspirantsAIPalette.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    screenWidth > 768 ? 16 : 14,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                        ),
                      ],
                    ),
                  ),
                ] else if (_isQuizCompleted) ...[
                  Container(
                    padding: EdgeInsets.all(padding * 0.75),
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
                      children: [
                        // Result Header
                        Column(
                          children: [
                            Container(
                              width: screenWidth > 768 ? 80 : 60,
                              height: screenWidth > 768 ? 80 : 60,
                              decoration: BoxDecoration(
                                color: AspirantsAIPalette.green.withOpacity(
                                  0.1,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.emoji_events,
                                color: AspirantsAIPalette.green,
                                size: screenWidth > 768 ? 32 : 24,
                              ),
                            ),
                            SizedBox(height: padding / 2),
                            Text(
                              'Quiz Completed!',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: screenWidth > 768 ? 24 : 20,
                                fontWeight: FontWeight.w700,
                                color: AspirantsAIPalette.black,
                              ),
                            ),
                            SizedBox(height: padding / 4),
                            Text(
                              'Great job on completing the quiz. Here are your results:',
                              style: AspirantsAITextStyles.bodyMedium.copyWith(
                                color: AspirantsAIPalette.grey600,
                                fontSize: screenWidth > 768 ? 16 : 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: padding),
                        // Result Stats
                        GridView.count(
                          crossAxisCount: resultCrossAxisCount,
                          crossAxisSpacing: padding / 1.5,
                          mainAxisSpacing: padding / 1.5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio:
                              screenWidth > 600
                                  ? 1.0
                                  : 1.5, // Adjust aspect ratio for mobile
                          children: [
                            QuizComponents.buildQuizResultCard(
                              value: '8/10',
                              label: 'Correct Answers',
                              bgColor: AspirantsAIPalette.green.withOpacity(
                                0.1,
                              ),
                              textColor: AspirantsAIPalette.green,
                            ),
                            QuizComponents.buildQuizResultCard(
                              value: '80%',
                              label: 'Accuracy',
                              bgColor: AspirantsAIPalette.purple.withOpacity(
                                0.1,
                              ),
                              textColor: AspirantsAIPalette.purple,
                            ),
                            QuizComponents.buildQuizResultCard(
                              value: '12:45',
                              label: 'Time Taken',
                              bgColor: AspirantsAIPalette.purple.withOpacity(
                                0.1,
                              ),
                              textColor: AspirantsAIPalette.purple,
                            ),
                          ],
                        ),
                        SizedBox(height: padding),
                        // Question Review
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question Review',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: screenWidth > 768 ? 18 : 16,
                                fontWeight: FontWeight.w600,
                                color: AspirantsAIPalette.black,
                              ),
                            ),
                            SizedBox(height: padding / 2),
                            QuizComponents.buildWeakTopicCard(
                              title: 'Question 1: Fundamental Rights',
                              accuracy: 'Correct',
                              description:
                                  'Your answer: C. Right to Work\nExplanation: Right to Work is a Directive Principle, not a Fundamental Right.',
                              buttonText: '',
                              bgColor: AspirantsAIPalette.green.withOpacity(
                                0.1,
                              ),
                              borderColor: AspirantsAIPalette.green,
                              accuracyColor: AspirantsAIPalette.green,
                            ),
                            SizedBox(height: padding / 2),
                            QuizComponents.buildWeakTopicCard(
                              title: 'Question 3: Constitutional Amendments',
                              accuracy: 'Incorrect',
                              description:
                                  'Your answer: B. Article 368 | Correct answer: A. Article 356\nExplanation: Article 356 deals with President\'s Rule in states.',
                              buttonText: '',
                              bgColor: AspirantsAIPalette.orange.withOpacity(
                                0.1,
                              ),
                              borderColor: AspirantsAIPalette.orange,
                              accuracyColor: AspirantsAIPalette.orange,
                            ),
                          ],
                        ),
                        SizedBox(height: padding),
                        // Result Actions
                        screenWidth > 600
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: padding,
                                      vertical: padding / 2,
                                    ),
                                    side: const BorderSide(
                                      color: AspirantsAIPalette.grey300,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Review Answers',
                                    style: AspirantsAITextStyles.bodyMedium
                                        .copyWith(
                                          color: AspirantsAIPalette.grey600,
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth > 768 ? 16 : 14,
                                        ),
                                  ),
                                ),
                                SizedBox(width: padding / 2),
                                ElevatedButton(
                                  onPressed:
                                      () => setState(() {
                                        _isQuizStarted = false;
                                        _isQuizCompleted = false;
                                        _currentQuestion = 1;
                                        _selectedOption = '';
                                      }),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AspirantsAIPalette.purple,
                                    foregroundColor: AspirantsAIPalette.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: padding,
                                      vertical: padding / 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Take Another Quiz',
                                    style: AspirantsAITextStyles.bodyMedium
                                        .copyWith(
                                          color: AspirantsAIPalette.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth > 768 ? 16 : 14,
                                        ),
                                  ),
                                ),
                              ],
                            )
                            : Column(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: padding,
                                      vertical: padding / 2,
                                    ),
                                    side: const BorderSide(
                                      color: AspirantsAIPalette.grey300,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Review Answers',
                                    style: AspirantsAITextStyles.bodyMedium
                                        .copyWith(
                                          color: AspirantsAIPalette.grey600,
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth > 768 ? 16 : 14,
                                        ),
                                  ),
                                ),
                                SizedBox(height: padding / 2),
                                ElevatedButton(
                                  onPressed:
                                      () => setState(() {
                                        _isQuizStarted = false;
                                        _isQuizCompleted = false;
                                        _currentQuestion = 1;
                                        _selectedOption = '';
                                      }),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AspirantsAIPalette.purple,
                                    foregroundColor: AspirantsAIPalette.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: padding,
                                      vertical: padding / 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Take Another Quiz',
                                    style: AspirantsAITextStyles.bodyMedium
                                        .copyWith(
                                          color: AspirantsAIPalette.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth > 768 ? 16 : 14,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                      ],
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
