// Today feature presentation screen.

import 'package:flutter/material.dart';

import '../../../core/widgets/placeholder_screen.dart';

/// Presentation screen for the Today tab displaying daily commitments.
class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Today',
      icon: Icons.today_outlined,
      description: 'Your tasks and habits for today will appear here.',
    );
  }
}
