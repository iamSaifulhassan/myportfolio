class ResponsiveHelper {
  static bool isDesktop(double width) => width > 1024;
  static bool isTablet(double width) => width > 600 && width <= 1024;
  static bool isMobile(double width) => width <= 600;
}
