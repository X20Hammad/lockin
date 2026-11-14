// Reusable placeholder empty-state screen widget.

import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Clean, centered placeholder screen used for unpopulated feature tabs.
class PlaceholderScreen extends StatelessWidget {
  /// The title displayed in the AppBar and header.
  final String title;

  /// The illustrative icon for the feature.
  final IconData icon;

  /// Informational subtitle explaining future feature functionality.
  final String description;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 96.0,
                  height: 96.0,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.outlineVariant,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: AppConstants.placeholderIconSize,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppConstants.spacing24),
                Text(
                  title,
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.spacing8),
                Text(
                  description,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
