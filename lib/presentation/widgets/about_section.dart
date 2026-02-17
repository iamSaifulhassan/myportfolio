import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../data/repositories/portfolio_repository.dart';
import 'responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveHelper.isDesktop(width);
    final isTablet = ResponsiveHelper.isTablet(width);
    final isMobile = ResponsiveHelper.isMobile(width);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : (isTablet ? 50 : 24),
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'About Me',
              style:
                  AppTheme.headingStyle.copyWith(fontSize: isDesktop ? 48 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 100),
            child: Container(
              width: 100,
              height: 4,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(height: 60),
          isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
          const SizedBox(height: 80),
          _buildStatsSection(context, isDesktop),
          // const SizedBox(height: 80),
          // _buildExperienceSection(isDesktop),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildAboutContent(),
        ),
        const SizedBox(width: 60),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildAboutContent(),
      ],
    );
  }

  Widget _buildAboutContent() {
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.aboutMe,
            style: AppTheme.bodyStyle.copyWith(fontSize: 18, height: 1.8),
          ),
          const SizedBox(height: 30),
          Text(
            'When I\'m not coding, you can find me exploring new technologies, contributing to open-source projects, or sharing my knowledge through technical blogs and community talks.',
            style: AppTheme.bodyStyle.copyWith(fontSize: 16, height: 1.8),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildInfoChip('📍 ${AppConstants.location}'),
              _buildInfoChip('💼 ${AppConstants.experience}'),
              _buildInfoChip('✉️ Available for work'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isDesktop) {
    final isMobile =
        ResponsiveHelper.isMobile(MediaQuery.of(context).size.width);

    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 300),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 16 : 40),
            decoration: BoxDecoration(
              gradient: AppTheme.cardGradient,
              borderRadius: BorderRadius.circular(isMobile ? 12 : 20),
              boxShadow: AppTheme.cardShadow,
            ),
            child: isMobile
                ? Column(
                    children: _buildStatItems()
                        .map((item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: item,
                            ))
                        .toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildStatItems(),
                  ),
          ),
        ),
        SizedBox(height: isMobile ? 24 : 32),
        Column(
          children: [
            Text(
              'Certified by:',
              style: AppTheme.bodyStyle.copyWith(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: isMobile ? 10 : 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 16,
                vertical: isMobile ? 10 : 16,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: isMobile ? 16 : 24,
                runSpacing: isMobile ? 16 : 24,
                children: PortfolioRepository.getCertifications()
                    .map((cert) => _buildCertIcon(context, cert, isMobile))
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildStatItems() {
    return [
      _buildStatItem('Projects Completed', AppConstants.projectsCompleted),
      _buildStatItem('Paid Projects', AppConstants.paidprojects),
      _buildStatItem('Years Experience', AppConstants.experience),
      _buildStatItem('Technologies', '15+'),
    ];
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTheme.headingStyle.copyWith(
            fontSize: 36,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTheme.bodyStyle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: AppTheme.bodyStyle.copyWith(fontSize: 14),
      ),
    );
  }

  Widget _buildCertIcon(
      BuildContext context, Map<String, String> cert, bool isMobile) {
    final iconSize = isMobile ? 24.0 : 30.0;
    final containerSize = isMobile ? 40.0 : 50.0;
    final name = cert['name']!;
    final certificateUrl = cert['certificateUrl']!;

    // Map certification names to icons and colors
    IconData? iconData;
    Color iconColor = AppTheme.primaryColor;
    String? imagePath;

    switch (name) {
      case 'Amazon AWS':
        iconData = FontAwesomeIcons.aws;
        iconColor = const Color(0xFFFF9900);
        break;
      case 'Oracle':
        imagePath = 'assets/images/oracle.png';
        break;
      case 'Hackerrank':
        iconData = FontAwesomeIcons.hackerrank;
        iconColor = const Color(0xFF2EC866);
        break;
      case 'JP Morgan':
        imagePath = 'assets/images/jpmorgan.png';
        break;
      case 'Mindluster':
        imagePath = 'assets/images/Mindluster.png';
        break;
      case 'EA Sports':
        imagePath = 'assets/images/easports.png';
        break;
      default:
        iconData = Icons.verified;
    }

    return GestureDetector(
      onTap: () => _launchURL(certificateUrl),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: containerSize,
              height: containerSize,
              padding: EdgeInsets.all(isMobile ? 7 : 10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: iconSize,
                      height: iconSize,
                      fit: BoxFit.contain,
                    )
                  : Icon(iconData, size: iconSize, color: iconColor),
            ),
            SizedBox(height: isMobile ? 6 : 8),
            Text(
              name,
              style: AppTheme.bodyStyle.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
