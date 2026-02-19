import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/themes/app_theme.dart';
import '../../data/repositories/portfolio_repository.dart';
import 'responsive_helper.dart';
import 'education_card.dart';
import 'certification_card.dart';

class EducationCertificationSection extends StatelessWidget {
  const EducationCertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isDesktop = ResponsiveHelper.isDesktop(width);
        final isTablet = ResponsiveHelper.isTablet(width);
        final horizontalPadding = isDesktop ? 100.0 : (isTablet ? 50.0 : 20.0);
        final verticalPadding = isDesktop ? 100.0 : (isTablet ? 60.0 : 30.0);
        final headingFontSize = isDesktop ? 48.0 : (isTablet ? 40.0 : 28.0);
        final subHeadingFontSize = isDesktop ? 32.0 : (isTablet ? 28.0 : 22.0);

        return Container(
          color: AppTheme.surfaceColor,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Education & Certifications',
                  style: AppTheme.headingStyle.copyWith(
                    fontSize: headingFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 100),
                child: Container(
                  width: isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0),
                  height: 4,
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
              SizedBox(height: isDesktop ? 60 : (isTablet ? 40 : 20)),
              isDesktop
                  ? _buildDesktopLayout(subHeadingFontSize)
                  : _buildMobileLayout(subHeadingFontSize),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(double subHeadingFontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildEducationSection(subHeadingFontSize)),
        const SizedBox(width: 50),
        Expanded(child: _buildCertificationSection(subHeadingFontSize)),
      ],
    );
  }

  Widget _buildMobileLayout(double subHeadingFontSize) {
    return Column(
      children: [
        _buildEducationSection(subHeadingFontSize),
        const SizedBox(height: 30),
        _buildCertificationSection(subHeadingFontSize),
      ],
    );
  }

  Widget _buildEducationSection(double subHeadingFontSize) {
    final educations = PortfolioRepository.getEducation();

    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: subHeadingFontSize,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          ...educations.asMap().entries.map((entry) {
            final index = entry.key;
            final education = entry.value;
            final isLast = index == educations.length - 1;
            return FadeInLeft(
              duration: const Duration(milliseconds: 800),
              delay: Duration(milliseconds: 300 + (index * 100)),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Timeline dot and line
                    SizedBox(
                      width: 32,
                      child: Column(
                        children: [
                          // Dot
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.primaryColor.withOpacity(0.2),
                                width: 4,
                              ),
                            ),
                          ),
                          // Line (except for last item)
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 4,
                                color: AppTheme.primaryColor.withOpacity(0.3),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Education card
                    Expanded(
                      child: EducationCard(education: education),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCertificationSection(double subHeadingFontSize) {
    // Keeping certifications hardcoded here as they are not in repository yet,
    // or we can move them to repository if preferred.
    // For now, using the list from the original file but cleaner.
    final certifications = [
      {
        'title': 'Flutter Rest Api',
        'issuer': 'Mindluster.com',
        'date': 'August 2025',
        'credentialId': '',
        'url':
            'https://drive.google.com/file/d/192CiFFlMqbHl9V1ykm9Ls0yLbZQ-Rabk/view',
        'skills': [
          'Flutter',
          'Dart',
          'Mobile Development',
          'State Management',
          'Firebase',
          'Api'
        ],
      },
      {
        'title': 'Database for Developers: Foundations',
        'issuer': 'Oracle Corporation',
        'date': 'April 2025',
        'credentialId': '571065',
        'url':
            'https://drive.google.com/file/d/1k0JdU-Xo6rSvsQa40AJpoKipWV_VwVil/view?usp=drive_link',
        'skills': ['Oracle', 'Databases', 'CRUD Operations', 'SQL'],
      },
      {
        'title': 'Database for Developers: Next Level',
        'issuer': 'Oracle Corporation',
        'date': 'Feb 2025',
        'credentialId': '571065',
        'url':
            'https://drive.google.com/file/d/17o3JekT2jZrT7F_ggY3j_3pnkgJn06kK/view?usp=drive_link',
        'skills': [
          'Structured Databases',
          'Normalization',
          'Transaction Management',
          'Recovery & Backup'
        ],
      },
      {
        'title': 'Amazon Cloud Practitioner (AWS)',
        'issuer': 'Amazon Web Services',
        'date': 'August 2025',
        'credentialId': 'AWS-CP-123456',
        'url': 'https://www.aws.training/Certification',
        'skills': [
          'AWS Cloud',
          'Cloud Computing',
          'Security',
          'Billing & Pricing',
          'Cloud Architecture'
        ],
      },
    ];

    return FadeInRight(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Certifications',
            style: AppTheme.subHeadingStyle.copyWith(
              fontSize: subHeadingFontSize,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: Column(
              key: ValueKey(certifications.length),
              children: certifications
                  .map((certification) =>
                      CertificationCard(certification: certification))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
