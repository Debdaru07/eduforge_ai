import 'package:aspirants_ai/theme/app_colors.dart';
import 'package:aspirants_ai/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeedbackHelpers {
  static Widget buildOverviewCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String value,
    required String subtitle,
    required Color subtitleColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24), // p-6
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48, // w-12 h-12
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8), // rounded-lg
                ),
                child: Icon(icon, color: iconColor, size: 24), // ri-xl
              ),
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 24, // text-2xl
                  fontWeight: FontWeight.w700,
                  color: AspirantsAIPalette.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // mb-4
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 18, // text-lg
              fontWeight: FontWeight.w600,
              color: AspirantsAIPalette.black,
            ),
          ),
          const SizedBox(height: 4), // mb-1
          Text(
            subtitle,
            style: AspirantsAITextStyles.bodySmall.copyWith(color: subtitleColor),
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
      ),
    );
  }

  static Widget buildSuggestionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String description,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16), // p-4
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8), // rounded-lg
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32, // w-8 h-8
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 16),
          ),
          const SizedBox(width: 12), // space-x-3
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 4), // mb-1
                Text(
                  description,
                  style: AspirantsAITextStyles.bodySmall.copyWith(color: AspirantsAIPalette.grey600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}