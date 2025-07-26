import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizComponents {
  static Widget buildQuizFilter({
    required String label,
    required String initialValue,
    required List<String> options,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AspirantsAITextStyles.bodySmall.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AspirantsAIPalette.grey600,
          ),
        ),
        const SizedBox(height: 8), // mb-2
        Container(
          height: 40, // py-2
          padding: const EdgeInsets.symmetric(horizontal: 12), // px-3
          decoration: BoxDecoration(
            border: Border.all(color: AspirantsAIPalette.grey300),
            borderRadius: BorderRadius.circular(8), // rounded-button
          ),
          child: MinimalDropdown(
            options: options,
            initialValue: initialValue,
          ),
        ),
      ],
    );
  }

  static Widget buildQuizOption({
    required String optionLabel,
    required String optionText,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16), // p-4
        decoration: BoxDecoration(
          border: Border.all(color: AspirantsAIPalette.grey300),
          borderRadius: BorderRadius.circular(8), // rounded-lg
          color: isSelected ? AspirantsAIPalette.grey100 : AspirantsAIPalette.white,
        ),
        child: Row(
          children: [
            Text(
              optionLabel,
              style: AspirantsAITextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AspirantsAIPalette.grey600,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                optionText,
                style: AspirantsAITextStyles.bodyMedium.copyWith(
                  color: AspirantsAIPalette.grey600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildQuizResultCard({
    required String value,
    required String label,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24), // p-6
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12), // rounded-xl
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 30, // text-3xl
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8), // mb-2
          Text(
            label,
            style: AspirantsAITextStyles.bodySmall.copyWith(
              color: AspirantsAIPalette.grey600,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildWeakTopicCard({
    required String title,
    required String accuracy,
    required String description,
    required String buttonText,
    required Color bgColor,
    required Color borderColor,
    required Color accuracyColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16), // p-4
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8), // rounded-lg
        border: Border(
          left: BorderSide(color: borderColor, width: 4), // border-l-4
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AspirantsAIPalette.black,
                ),
              ),
              Text(
                accuracy,
                style: AspirantsAITextStyles.bodySmall.copyWith(
                  color: accuracyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // mb-2
          Text(
            description,
            style: AspirantsAITextStyles.bodySmall.copyWith(color: AspirantsAIPalette.grey600),
          ),
          if (buttonText.isNotEmpty) ...[
            const SizedBox(height: 8), // mb-2
            TextButton(
              onPressed: () {},
              child: Text(
                buttonText,
                style: AspirantsAITextStyles.bodySmall.copyWith(
                  color: AspirantsAIPalette.purple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Reused MinimalDropdown from AssistantPlayground
class MinimalDropdown extends StatefulWidget {
  final List<String> options;
  final String initialValue;

  const MinimalDropdown({super.key, required this.options, required this.initialValue});

  @override
  _MinimalDropdownState createState() => _MinimalDropdownState();
}

class _MinimalDropdownState extends State<MinimalDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AspirantsAIPalette.white,
        border: Border.all(color: AspirantsAIPalette.grey300, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: PopupMenuButton<String>(
        menuPadding: EdgeInsets.zero,
        onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        itemBuilder: (context) => widget.options
            .map((item) => PopupMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AspirantsAITextStyles.bodySmall.copyWith(fontSize: 12),
                  ),
                ))
            .toList(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedValue,
              style: AspirantsAITextStyles.bodySmall.copyWith(fontSize: 12),
            ),
            const Icon(
              Icons.arrow_drop_down,
              size: 12,
              color: AspirantsAIPalette.grey600,
            ),
          ],
        ),
      ),
    );
  }
}