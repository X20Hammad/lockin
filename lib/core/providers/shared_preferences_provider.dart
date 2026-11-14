// Shared preferences dependency provider for persistent storage.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider holding the initialized [SharedPreferences] instance.
///
/// Must be overridden in [ProviderScope] at root before application execution.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in main()');
});
