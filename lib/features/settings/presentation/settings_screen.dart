// Settings presentation screen with appearance and app metadata controls.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../application/theme_mode_controller.dart';

/// Settings screen providing configuration for appearance and application details.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final currentThemeMode = ref.watch(themeModeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacing16,
            vertical: AppConstants.spacing20,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing4,
                vertical: AppConstants.spacing8,
              ),
              child: Text(
                'APPEARANCE',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme',
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    Text(
                      'Choose how Lockin looks to maintain focus in any environment.',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: AppConstants.spacing16),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<ThemeMode>(
                        segments: const [
                          ButtonSegment<ThemeMode>(
                            value: ThemeMode.system,
                            icon: Icon(Icons.brightness_auto_outlined),
                            label: Text('System'),
                          ),
                          ButtonSegment<ThemeMode>(
                            value: ThemeMode.light,
                            icon: Icon(Icons.light_mode_outlined),
                            label: Text('Light'),
                          ),
                          ButtonSegment<ThemeMode>(
                            value: ThemeMode.dark,
                            icon: Icon(Icons.dark_mode_outlined),
                            label: Text('Dark'),
                          ),
                        ],
                        selected: {currentThemeMode},
                        onSelectionChanged: (Set<ThemeMode> selection) {
                          ref
                              .read(themeModeControllerProvider.notifier)
                              .setThemeMode(selection.first);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppConstants.spacing32),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing4,
                vertical: AppConstants.spacing8,
              ),
              child: Text(
                'ABOUT',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: colorScheme.primary,
                    size: AppConstants.iconMedium,
                  ),
                ),
                title: const Text(AppConstants.appName),
                subtitle: const Text('Version ${AppConstants.appVersion}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
