// Application router configuration utilizing GoRouter with stateful shell navigation.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/habits/presentation/habits_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/shell/presentation/app_shell.dart';
import '../../features/stats/presentation/stats_screen.dart';
import '../../features/tasks/presentation/tasks_screen.dart';
import '../../features/today/presentation/today_screen.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// Provider exposing the application's central [GoRouter] configuration.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.today,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          // 1. Today Tab Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.today,
                name: RouteNames.today,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: TodayScreen(),
                ),
                routes: const [
                  // Nested routes under Today will be added here in future modules
                ],
              ),
            ],
          ),
          // 2. Tasks Tab Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.tasks,
                name: RouteNames.tasks,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: TasksScreen(),
                ),
                routes: const [
                  // Nested routes under Tasks (e.g. /tasks/new, /tasks/:id) will be added here in future modules
                ],
              ),
            ],
          ),
          // 3. Habits Tab Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.habits,
                name: RouteNames.habits,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HabitsScreen(),
                ),
                routes: const [
                  // Nested routes under Habits (e.g. /habits/new, /habits/:id) will be added here in future modules
                ],
              ),
            ],
          ),
          // 4. Stats Tab Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.stats,
                name: RouteNames.stats,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: StatsScreen(),
                ),
                routes: const [
                  // Nested routes under Stats will be added here in future modules
                ],
              ),
            ],
          ),
          // 5. Settings Tab Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                name: RouteNames.settings,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SettingsScreen(),
                ),
                routes: const [
                  // Nested routes under Settings will be added here in future modules
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
