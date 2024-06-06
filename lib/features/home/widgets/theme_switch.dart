import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../theme/palette.dart';

class ThemeSwitcher extends ConsumerWidget {
  final VoidCallback toggleTheme;

  const ThemeSwitcher({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);
    final isDarkMode = themeNotifier.mode == ThemeMode.dark;

    return FlutterSwitch(
      value: isDarkMode,
      onToggle: (_) => toggleTheme(),
      activeColor: Colors.black,
      inactiveColor: Colors.yellow,
      activeIcon: const Icon(
        Icons.nights_stay,
        color: Colors.deepPurple,
      ),
      inactiveIcon: const Icon(
        Icons.wb_sunny,
        color: Colors.orange,
      ),
    );
  }
}