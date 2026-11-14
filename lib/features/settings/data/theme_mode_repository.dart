// Repository for persisting and retrieving user theme mode preferences.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/providers/shared_preferences_provider.dart';

/// Provider for the [ThemeModeRepository].
final themeModeRepositoryProvider = Provider<ThemeModeRepository>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return ThemeModeRepository(sharedPreferences);
});

/// Handles reading and writing of [ThemeMode] via [SharedPreferences].
class ThemeModeRepository {
  final SharedPreferences _sharedPreferences;

  const ThemeModeRepository(this._sharedPreferences);

  static const String _systemValue = 'system';
  static const String _lightValue = 'light';
  static const String _darkValue = 'dark';

  /// Reads the persisted theme mode. Defaults to [ThemeMode.system] if unset.
  ThemeMode getThemeMode() {
    final value = _sharedPreferences.getString(AppConstants.themeModeStorageKey);
    switch (value) {
      case _lightValue:
        return ThemeMode.light;
      case _darkValue:
        return ThemeMode.dark;
      case _systemValue:
      default:
        return ThemeMode.system;
    }
  }

  /// Persists the selected [themeMode] to disk.
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    final String value;
    switch (themeMode) {
      case ThemeMode.light:
        value = _lightValue;
      case ThemeMode.dark:
        value = _darkValue;
      case ThemeMode.system:
        value = _systemValue;
    }
    return _sharedPreferences.setString(AppConstants.themeModeStorageKey, value);
  }
}
