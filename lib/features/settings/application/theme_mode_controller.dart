// State controller for managing application theme mode.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/theme_mode_repository.dart';

/// Provider for managing and observing the active [ThemeMode].
final themeModeControllerProvider =
    NotifierProvider<ThemeModeController, ThemeMode>(ThemeModeController.new);

/// Controller managing the application's [ThemeMode] state and persistence.
class ThemeModeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ref.watch(themeModeRepositoryProvider).getThemeMode();
  }

  /// Updates active theme mode and persists choice to storage.
  Future<void> setThemeMode(ThemeMode mode) async {
    if (state == mode) {
      return;
    }
    state = mode;
    await ref.read(themeModeRepositoryProvider).setThemeMode(mode);
  }
}
