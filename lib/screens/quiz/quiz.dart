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
    return Scaffold(
      backgroundColor: AspirantsAIPalette.beige,
      body: Padding(
        padding: const EdgeInsets.all(32.0), // p-8 (8 * 4px = 32px)
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 896), // max-w-4xl (4xl = 56rem = 896px)
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
                          'Quiz Interface',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AspirantsAIPalette.black,
                          ),
                        ),
                        const SizedBox(height: 8), // mb-2
                        Text(
                          'Test your knowledge with AI-generated quizzes from your uploaded materials.',
                          style: AspirantsAITextStyles.bodyMedium.copyWith(
                            color: AspirantsAIPalette.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Quiz Filters
                  Container(
                    padding: const EdgeInsets.all(24), // p-6
                    margin: const EdgeInsets.only(bottom: 32), // mb-8
                    decoration: BoxDecoration(
                      color: AspirantsAIPalette.white,
                      borderRadius: BorderRadius.circular(12), // rounded-xl
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
                        GridView.count(
                          crossAxisCount: 4, // md:grid-cols-4
                          crossAxisSpacing: 16, // gap-4
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                        const SizedBox(height: 24), // mt-6
                        Center(
                          child: ElevatedButton(
                            onPressed: () => setState(() => _isQuizStarted = true),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AspirantsAIPalette.purple,
                              foregroundColor: AspirantsAIPalette.white,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // px-8 py-3
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              'Start Quiz',
                              style: AspirantsAITextStyles.bodyMedium.copyWith(
                                color: AspirantsAIPalette.white,
                                fontWeight: FontWeight.w500,
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
                        borderRadius: BorderRadius.circular(12), // rounded-xl
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
                            padding: const EdgeInsets.all(24), // p-6
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AspirantsAIPalette.grey300)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Question $_currentQuestion of $_totalQuestions',
                                          style: AspirantsAITextStyles.bodySmall.copyWith(
                                            color: AspirantsAIPalette.grey600,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 16), // space-x-4
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), // px-3 py-1
                                          decoration: BoxDecoration(
                                            color: AspirantsAIPalette.purple.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(16), // rounded-full
                                          ),
                                          child: Text(
                                            'Indian Polity',
                                            style: AspirantsAITextStyles.bodySmall.copyWith(
                                              color: AspirantsAIPalette.purple,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AspirantsAIPalette.green.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                            'Medium',
                                            style: AspirantsAITextStyles.bodySmall.copyWith(
                                              color: AspirantsAIPalette.green,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '01:30',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: AspirantsAIPalette.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16), // mb-4
                                Stack(
                                  children: [
                                    Container(
                                      height: 8, // h-2
                                      decoration: BoxDecoration(
                                        color: AspirantsAIPalette.grey100,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Container(
                                      height: 8,
                                      width: MediaQuery.of(context).size.width * 0.1, // 10% progress
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
                            padding: const EdgeInsets.all(24), // p-6
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Which of the following is NOT a fundamental right guaranteed by the Indian Constitution?',
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontSize: 20, // text-xl
                                    fontWeight: FontWeight.w600,
                                    color: AspirantsAIPalette.black,
                                  ),
                                ),
                                const SizedBox(height: 24), // mb-6
                                Column(
                                  children: [
                                    QuizComponents.buildQuizOption(
                                      optionLabel: 'A.',
                                      optionText: 'Right to Equality',
                                      onTap: () => setState(() => _selectedOption = 'A'),
                                      isSelected: _selectedOption == 'A',
                                    ),
                                    const SizedBox(height: 12), // space-y-3
                                    QuizComponents.buildQuizOption(
                                      optionLabel: 'B.',
                                      optionText: 'Right to Freedom',
                                      onTap: () => setState(() => _selectedOption = 'B'),
                                      isSelected: _selectedOption == 'B',
                                    ),
                                    const SizedBox(height: 12),
                                    QuizComponents.buildQuizOption(
                                      optionLabel: 'C.',
                                      optionText: 'Right to Work',
                                      onTap: () => setState(() => _selectedOption = 'C'),
                                      isSelected: _selectedOption == 'C',
                                    ),
                                    const SizedBox(height: 12),
                                    QuizComponents.buildQuizOption(
                                      optionLabel: 'D.',
                                      optionText: 'Right against Exploitation',
                                      onTap: () => setState(() => _selectedOption = 'D'),
                                      isSelected: _selectedOption == 'D',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Quiz Actions
                          Container(
                            padding: const EdgeInsets.all(24), // p-6
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: AspirantsAIPalette.grey300)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_currentQuestion < _totalQuestions) {
                                        _currentQuestion++;
                                        _selectedOption = '';
                                      } else {
                                        _isQuizCompleted = true;
                                      }
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8), // px-6 py-2
                                    side: const BorderSide(color: AspirantsAIPalette.grey300),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Text(
                                    'Skip Question',
                                    style: AspirantsAITextStyles.bodyMedium.copyWith(
                                      color: AspirantsAIPalette.grey600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: _selectedOption.isNotEmpty
                                      ? () {
                                          setState(() {
                                            if (_currentQuestion < _totalQuestions) {
                                              _currentQuestion++;
                                              _selectedOption = '';
                                            } else {
                                              _isQuizCompleted = true;
                                            }
                                          });
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AspirantsAIPalette.purple,
                                    foregroundColor: AspirantsAIPalette.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Text(
                                    'Submit Answer',
                                    style: AspirantsAITextStyles.bodyMedium.copyWith(
                                      color: AspirantsAIPalette.white,
                                      fontWeight: FontWeight.w500,
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
                      padding: const EdgeInsets.all(32), // p-8
                      decoration: BoxDecoration(
                        color: AspirantsAIPalette.white,
                        borderRadius: BorderRadius.circular(12), // rounded-xl
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
                                width: 80,
                                height: 80, // w-20 h-20
                                decoration: BoxDecoration(
                                  color: AspirantsAIPalette.green.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.emoji_events,
                                  color: AspirantsAIPalette.green,
                                  size: 32, // ri-2x
                                ),
                              ),
                              const SizedBox(height: 16), // mb-4
                              Text(
                                'Quiz Completed!',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 24, // text-2xl
                                  fontWeight: FontWeight.w700,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              const SizedBox(height: 8), // mb-2
                              Text(
                                'Great job on completing the quiz. Here are your results:',
                                style: AspirantsAITextStyles.bodyMedium.copyWith(
                                  color: AspirantsAIPalette.grey600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32), // mb-8
                          // Result Stats
                          GridView.count(
                            crossAxisCount: 3, // md:grid-cols-3
                            crossAxisSpacing: 24, // gap-6
                            mainAxisSpacing: 24,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              QuizComponents.buildQuizResultCard(
                                value: '8/10',
                                label: 'Correct Answers',
                                bgColor: AspirantsAIPalette.green.withOpacity(0.1),
                                textColor: AspirantsAIPalette.green,
                              ),
                              QuizComponents.buildQuizResultCard(
                                value: '80%',
                                label: 'Accuracy',
                                bgColor: AspirantsAIPalette.purple.withOpacity(0.1),
                                textColor: AspirantsAIPalette.purple,
                              ),
                              QuizComponents.buildQuizResultCard(
                                value: '12:45',
                                label: 'Time Taken',
                                bgColor: AspirantsAIPalette.purple.withOpacity(0.1),
                                textColor: AspirantsAIPalette.purple,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32), // mb-8
                          // Question Review
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question Review',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18, // text-lg
                                  fontWeight: FontWeight.w600,
                                  color: AspirantsAIPalette.black,
                                ),
                              ),
                              const SizedBox(height: 16), // mb-4
                              QuizComponents.buildWeakTopicCard(
                                title: 'Question 1: Fundamental Rights',
                                accuracy: 'Correct',
                                description: 'Your answer: C. Right to Work\nExplanation: Right to Work is a Directive Principle, not a Fundamental Right.',
                                buttonText: '',
                                bgColor: AspirantsAIPalette.green.withOpacity(0.1),
                                borderColor: AspirantsAIPalette.green,
                                accuracyColor: AspirantsAIPalette.green,
                              ),
                              const SizedBox(height: 16), // space-y-4
                              QuizComponents.buildWeakTopicCard(
                                title: 'Question 3: Constitutional Amendments',
                                accuracy: 'Incorrect',
                                description: 'Your answer: B. Article 368 | Correct answer: A. Article 356\nExplanation: Article 356 deals with President\'s Rule in states.',
                                buttonText: '',
                                bgColor: AspirantsAIPalette.orange.withOpacity(0.1),
                                borderColor: AspirantsAIPalette.orange,
                                accuracyColor: AspirantsAIPalette.orange,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32), // mb-8
                          // Result Actions
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8), // px-6 py-2
                                  side: const BorderSide(color: AspirantsAIPalette.grey300),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text(
                                  'Review Answers',
                                  style: AspirantsAITextStyles.bodyMedium.copyWith(
                                    color: AspirantsAIPalette.grey600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16), // space-x-4
                              ElevatedButton(
                                onPressed: () => setState(() {
                                  _isQuizStarted = false;
                                  _isQuizCompleted = false;
                                  _currentQuestion = 1;
                                  _selectedOption = '';
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AspirantsAIPalette.purple,
                                  foregroundColor: AspirantsAIPalette.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Text(
                                  'Take Another Quiz',
                                  style: AspirantsAITextStyles.bodyMedium.copyWith(
                                    color: AspirantsAIPalette.white,
                                    fontWeight: FontWeight.w500,
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
      ),
    );
  }
}