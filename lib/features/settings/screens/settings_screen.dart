import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Theme',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            title: const Text('Light'),
            subtitle: const Text('Always use light theme'),
            leading: const Icon(Icons.light_mode_outlined),
            trailing: themeMode == ThemeMode.light
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              ref.read(themeModeProvider.notifier).setTheme(ThemeMode.light);
            },
          ),
          ListTile(
            title: const Text('Dark'),
            subtitle: const Text('Always use dark theme'),
            leading: const Icon(Icons.dark_mode_outlined),
            trailing: themeMode == ThemeMode.dark
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              ref.read(themeModeProvider.notifier).setTheme(ThemeMode.dark);
            },
          ),
          ListTile(
            title: const Text('System'),
            subtitle: const Text('Follow device settings'),
            leading: const Icon(Icons.brightness_auto_outlined),
            trailing: themeMode == ThemeMode.system
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              ref.read(themeModeProvider.notifier).setTheme(ThemeMode.system);
            },
          ),
        ],
      ),
    );
  }
}
