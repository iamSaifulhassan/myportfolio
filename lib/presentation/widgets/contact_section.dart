import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/themes/app_theme.dart';
import '../../core/constants/app_constants.dart';
import 'responsive_helper.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveHelper.isDesktop(width);
    final isTablet = ResponsiveHelper.isTablet(width);
    final isMobile = ResponsiveHelper.isMobile(width);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : (isTablet ? 50 : 16),
        vertical: isDesktop ? 100 : (isTablet ? 80 : 40),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.backgroundColor, AppTheme.surfaceColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          // Section Icon
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: CircleAvatar(
              radius: isDesktop ? 38 : 30,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.12),
              child: Icon(Icons.mail_outline,
                  size: isDesktop ? 38 : 30, color: AppTheme.primaryColor),
            ),
          ),
          const SizedBox(height: 18),
          const SizedBox(height: 18),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 100),
            child: Text(
              'Get In Touch',
              style: AppTheme.headingStyle.copyWith(fontSize: isDesktop ? 48 : 36),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 200),
            child: Container(
              width: 100,
              height: 4,
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const SizedBox(height: 18),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 300),
            child: Text(
              'I\'m always open to discussing new opportunities and exciting projects.',
              style: AppTheme.bodyStyle.copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          // Responsive layout
          if (isDesktop || isTablet)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact Form
                Expanded(
                  flex: 3,
                  child: _buildContactForm(enhanced: true, isMobile: false),
                ),
                Container(
                  width: 1,
                  height: 340,
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  color: AppTheme.primaryColor.withOpacity(0.10),
                ),
                // Contact Info
                Expanded(
                  flex: 2,
                  child: _buildContactInfo(enhanced: true),
                ),
              ],
            )
          else
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildContactForm(enhanced: true, isMobile: true),
                  const SizedBox(height: 36),
                  Divider(
                    color: AppTheme.primaryColor.withOpacity(0.10),
                    thickness: 1,
                  ),
                  const SizedBox(height: 36),
                  _buildContactInfo(enhanced: true),
                ],
              ),
            ),
          const SizedBox(height: 60),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildContactInfo({bool enhanced = false}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: EdgeInsets.symmetric(
        horizontal: enhanced ? 24 : 0,
        vertical: enhanced ? 24 : 0,
      ),
      decoration: enhanced
          ? BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppTheme.primaryColor.withOpacity(0.08)),
              boxShadow: AppTheme.cardShadow,
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline,
                  color: AppTheme.primaryColor, size: 26),
              const SizedBox(width: 10),
              Text(
                'Contact Information',
                style: AppTheme.subHeadingStyle.copyWith(fontSize: 22),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildContactItem(
            icon: Icons.email,
            label: 'Email',
            value: AppConstants.email,
            enhanced: enhanced,
          ),
          const SizedBox(height: 18),
          _buildContactItem(
            icon: Icons.phone,
            label: 'Phone',
            value: AppConstants.phone,
            enhanced: enhanced,
          ),
          const SizedBox(height: 18),
          _buildContactItem(
            icon: Icons.location_on,
            label: 'Location',
            value: AppConstants.location,
            enhanced: enhanced,
          ),
          if (enhanced) ...[
            const SizedBox(height: 28),
            Divider(color: AppTheme.primaryColor.withOpacity(0.10), thickness: 1),
            const SizedBox(height: 18),
            Text('Social Links',
                style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.globe, color: AppTheme.primaryColor),
                  tooltip: 'Portfolio',
                  onPressed: () => _launchURL(AppConstants.portfolioUrl),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.github, color: Colors.black),
                  tooltip: 'GitHub',
                  onPressed: () => _launchURL(AppConstants.githubUrl),
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.linkedin, color: Colors.blue[700]),
                  tooltip: 'LinkedIn',
                  onPressed: () => _launchURL(AppConstants.linkedinUrl),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    bool enhanced = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: enhanced ? 22 : 18),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold, fontSize: enhanced ? 15 : 13)),
            const SizedBox(height: 2),
            Text(value,
                style: AppTheme.bodyStyle.copyWith(fontSize: enhanced ? 15 : 13, color: AppTheme.textSecondary)),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm({bool enhanced = false, bool isMobile = false}) {
    return FadeInRight(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 400),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: EdgeInsets.symmetric(
          horizontal: enhanced ? (isMobile ? 12 : 32) : 30,
          vertical: enhanced ? 32 : 30,
        ),
        decoration: BoxDecoration(
          gradient: AppTheme.cardGradient,
          borderRadius: BorderRadius.circular(24),
          border: enhanced
              ? Border.all(color: AppTheme.primaryColor.withOpacity(0.10), width: 2)
              : null,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send Me A Message',
                style: AppTheme.subHeadingStyle.copyWith(
                  fontSize: enhanced ? 24 : 20,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField(
                controller: _nameController,
                label: 'Your Name',
                icon: Icons.person_outline,
                enhanced: enhanced,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _emailController,
                label: 'Your Email',
                icon: Icons.email_outlined,
                enhanced: enhanced,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _messageController,
                label: 'Your Message',
                icon: Icons.message_outlined,
                maxLines: 4,
                enhanced: enhanced,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement email sending logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Message sent successfully!'),
                          backgroundColor: AppTheme.primaryColor,
                        ),
                      );
                      _nameController.clear();
                      _emailController.clear();
                      _messageController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Send Message',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    bool enhanced = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: AppTheme.textPrimary),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.primaryColor),
        filled: true,
        fillColor: AppTheme.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppTheme.primaryColor.withOpacity(0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppTheme.primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildFooter() {
    final width = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(width);
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 600),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppTheme.primaryColor.withOpacity(0.2), width: 1),
          ),
        ),
        child: isMobile
            ? Column(
                children: [
                  Text('© 2024 ${AppConstants.developerName}.',
                      style: AppTheme.bodyStyle.copyWith(fontSize: 14, color: AppTheme.textHint),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('All rights reserved.',
                      style: AppTheme.bodyStyle.copyWith(fontSize: 14, color: AppTheme.textHint),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('Made with ❤️ using Flutter',
                      style: AppTheme.bodyStyle.copyWith(fontSize: 14, color: AppTheme.textHint),
                      textAlign: TextAlign.center),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text('© 2024 ${AppConstants.developerName}. All rights reserved.',
                        style: AppTheme.bodyStyle.copyWith(fontSize: 14, color: AppTheme.textHint),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text('Made with ❤️ using Flutter',
                        style: AppTheme.bodyStyle.copyWith(fontSize: 14, color: AppTheme.textHint),
                        textAlign: TextAlign.end),
                  ),
                ],
              ),
      ),
    );
  }
}
