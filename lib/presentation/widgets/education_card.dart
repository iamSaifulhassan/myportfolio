import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';
import '../../data/models/education.dart';

class EducationCard extends StatelessWidget {
  final Education education;

  const EducationCard({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  education.degree,
                  style: AppTheme.subHeadingStyle.copyWith(
                    fontSize: 16,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  education.duration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            education.institution,
            style: AppTheme.bodyStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          if (education.grade != null) ...[
            const SizedBox(height: 4),
            Text(
              education.grade!,
              style: AppTheme.bodyStyle.copyWith(
                fontSize: 14,
                color: AppTheme.secondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          if (education.description != null) ...[
            const SizedBox(height: 12),
            Text(
              education.description!,
              style: AppTheme.bodyStyle.copyWith(
                height: 1.5,
              ),
            ),
          ],
          // Achievements removed from model in repository but kept in UI logic previously.
          // Assuming Education model might not have achievements list based on repository view.
          // If needed, we can add it back if the model supports it.
        ],
      ),
    );
  }
}
