// Habits feature presentation screen.

import 'package:flutter/material.dart';

import '../../../core/widgets/placeholder_screen.dart';

/// Presentation screen for recurring habits and consistency tracking.
class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Habits',
      icon: Icons.repeat,
      description: 'Track and build your recurring daily habits here.',
    );
  }
}
