import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (ResponsiveHelper.isDesktop(width)) {
          return desktop;
        } else if (ResponsiveHelper.isTablet(width) && tablet != null) {
          return tablet!;
        } else {
          return mobile;
        }
      },
    );
  }
}
