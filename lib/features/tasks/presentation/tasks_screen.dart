// Tasks feature presentation screen.

import 'package:flutter/material.dart';

import '../../../core/widgets/placeholder_screen.dart';

/// Presentation screen for one-off tasks and action items.
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Tasks',
      icon: Icons.check_box_outlined,
      description: 'Manage your one-off tasks and action items here.',
    );
  }
}
