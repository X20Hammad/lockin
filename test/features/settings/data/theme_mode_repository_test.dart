// Unit tests for ThemeModeRepository persistence operations.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lockin/core/constants/app_constants.dart';
import 'package:lockin/features/settings/data/theme_mode_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeModeRepository', () {
    test('returns ThemeMode.system when no preference is saved', () async {
      SharedPreferences.setMockInitialValues({});
      final preferences = await SharedPreferences.getInstance();
      final repository = ThemeModeRepository(preferences);

      final mode = repository.getThemeMode();

      expect(mode, ThemeMode.system);
    });

    test('loads saved ThemeMode.light correctly', () async {
      SharedPreferences.setMockInitialValues({
        AppConstants.themeModeStorageKey: 'light',
      });
      final preferences = await SharedPreferences.getInstance();
      final repository = ThemeModeRepository(preferences);

      final mode = repository.getThemeMode();

      expect(mode, ThemeMode.light);
    });

    test('loads saved ThemeMode.dark correctly', () async {
      SharedPreferences.setMockInitialValues({
        AppConstants.themeModeStorageKey: 'dark',
      });
      final preferences = await SharedPreferences.getInstance();
      final repository = ThemeModeRepository(preferences);

      final mode = repository.getThemeMode();

      expect(mode, ThemeMode.dark);
    });

    test('saves and retrieves ThemeMode values sequentially', () async {
      SharedPreferences.setMockInitialValues({});
      final preferences = await SharedPreferences.getInstance();
      final repository = ThemeModeRepository(preferences);

      await repository.setThemeMode(ThemeMode.light);
      expect(repository.getThemeMode(), ThemeMode.light);
      expect(
        preferences.getString(AppConstants.themeModeStorageKey),
        'light',
      );

      await repository.setThemeMode(ThemeMode.dark);
      expect(repository.getThemeMode(), ThemeMode.dark);
      expect(
        preferences.getString(AppConstants.themeModeStorageKey),
        'dark',
      );

      await repository.setThemeMode(ThemeMode.system);
      expect(repository.getThemeMode(), ThemeMode.system);
      expect(
        preferences.getString(AppConstants.themeModeStorageKey),
        'system',
      );
    });
  });
}
