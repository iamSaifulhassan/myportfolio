import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';
import 'responsive_helper.dart';

class CustomAppBar extends StatelessWidget {
  final Function(GlobalKey) onNavigate;
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey experienceKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey educationKey;
  final GlobalKey contactKey;

  const CustomAppBar({
    super.key,
    required this.onNavigate,
    required this.heroKey,
    required this.aboutKey,
    required this.experienceKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.educationKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveHelper.isDesktop(width);
    final isTablet = ResponsiveHelper.isTablet(width);
    final isMobile = ResponsiveHelper.isMobile(width);

    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: AppTheme.backgroundColor.withOpacity(0.95),
      elevation: 0,
      title: Text(
        'Portfolio',
        style: AppTheme.subHeadingStyle.copyWith(fontSize: 20),
      ),
      actions: [
        if (width > 800) ...[
          _buildNavButton(context, 'Home', () => onNavigate(heroKey)),
          _buildNavButton(context, 'About', () => onNavigate(aboutKey)),
          _buildNavButton(
              context, 'Experience', () => onNavigate(experienceKey)),
          _buildNavButton(context, 'Skills', () => onNavigate(skillsKey)),
          _buildNavButton(context, 'Projects', () => onNavigate(projectsKey)),
          if (isDesktop || isTablet)
            _buildNavButton(
                context, 'Education', () => onNavigate(educationKey)),
          _buildNavButton(context, 'Contact', () => onNavigate(contactKey)),
        ] else ...[
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
            onSelected: (value) {
              switch (value) {
                case 'Home':
                  onNavigate(heroKey);
                  break;
                case 'About':
                  onNavigate(aboutKey);
                  break;
                case 'Experience':
                  onNavigate(experienceKey);
                  break;
                case 'Skills':
                  onNavigate(skillsKey);
                  break;
                case 'Projects':
                  onNavigate(projectsKey);
                  break;
                case 'Education':
                  onNavigate(educationKey);
                  break;
                case 'Contact':
                  onNavigate(contactKey);
                  break;
              }
            },
            itemBuilder: (context) => [
              _buildPopupMenuItem('Home'),
              _buildPopupMenuItem('About'),
              _buildPopupMenuItem('Experience'),
              _buildPopupMenuItem('Skills'),
              _buildPopupMenuItem('Projects'),
              _buildPopupMenuItem('Education'),
              _buildPopupMenuItem('Contact'),
            ],
          ),
        ],
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNavButton(
      BuildContext context, String text, VoidCallback onPressed) {
    final isTablet = ResponsiveHelper.isTablet(MediaQuery.of(context).size.width);

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: isTablet ? 8 : 10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: isTablet ? 14 : 16,
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(text),
    );
  }
}
