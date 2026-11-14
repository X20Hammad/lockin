// Application-wide constants for typography, dimensions, spacing, and metadata.

/// Global constant values utilized throughout the Lockin application.
abstract final class AppConstants {
  /// The user-facing display name of the application.
  static const String appName = 'Lockin';

  /// The current semantic version and build number of the application.
  static const String appVersion = '1.0.0 (1)';

  // Spacing
  static const double spacing2 = 2.0;
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;

  // Radii
  static const double radius8 = 8.0;
  static const double radius12 = 12.0;
  static const double radius16 = 16.0;
  static const double radius24 = 24.0;

  // Icon sizing
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double placeholderIconSize = 64.0;

  // Component heights
  static const double navigationBarHeight = 68.0;

  // Durations
  static const Duration durationShort = Duration(milliseconds: 200);
  static const Duration durationMedium = Duration(milliseconds: 300);

  // Storage keys
  static const String themeModeStorageKey = 'lockin_theme_mode';
}
