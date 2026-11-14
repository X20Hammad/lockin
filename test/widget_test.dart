// Widget tests verifying the navigation shell and tab switching behaviors.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lockin/app.dart';
import 'package:lockin/core/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'verifies 5 navigation destinations exist and tabs navigate correctly',
    (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final preferences = await SharedPreferences.getInstance();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(preferences),
          ],
          child: const LockinApp(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify all 5 navigation destinations exist in the NavigationBar
      final navigationBarFinder = find.byType(NavigationBar);
      expect(navigationBarFinder, findsOneWidget);

      final todayTab = find.descendant(
        of: navigationBarFinder,
        matching: find.text('Today'),
      );
      final tasksTab = find.descendant(
        of: navigationBarFinder,
        matching: find.text('Tasks'),
      );
      final habitsTab = find.descendant(
        of: navigationBarFinder,
        matching: find.text('Habits'),
      );
      final statsTab = find.descendant(
        of: navigationBarFinder,
        matching: find.text('Stats'),
      );
      final settingsTab = find.descendant(
        of: navigationBarFinder,
        matching: find.text('Settings'),
      );

      expect(todayTab, findsOneWidget);
      expect(tasksTab, findsOneWidget);
      expect(habitsTab, findsOneWidget);
      expect(statsTab, findsOneWidget);
      expect(settingsTab, findsOneWidget);

      // 1. Initial screen should be Today
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Today'),
        ),
        findsOneWidget,
      );

      // 2. Navigate to Tasks tab
      await tester.tap(tasksTab);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Tasks'),
        ),
        findsOneWidget,
      );

      // 3. Navigate to Habits tab
      await tester.tap(habitsTab);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Habits'),
        ),
        findsOneWidget,
      );

      // 4. Navigate to Stats tab
      await tester.tap(statsTab);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Stats'),
        ),
        findsOneWidget,
      );

      // 5. Navigate to Settings tab
      await tester.tap(settingsTab);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Settings'),
        ),
        findsOneWidget,
      );
    },
  );
}
