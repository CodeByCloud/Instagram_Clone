import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/screens/login_screen.dart';
import 'package:instagram_clone/features/profile/screens/profile_screen.dart';
import 'package:instagram_clone/features/settings/screens/settings_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
