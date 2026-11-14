// Stats and analytics presentation screen.

import 'package:flutter/material.dart';

import '../../../core/widgets/placeholder_screen.dart';

/// Presentation screen for streaks, metrics, and progress analytics.
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Stats',
      icon: Icons.bar_chart_outlined,
      description: 'View your streaks, completion rates, and analytics here.',
    );
  }
}
