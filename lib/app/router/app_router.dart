import 'package:flutter/material.dart';
import '../../features/feed/screens/feed_screen.dart';
import '../../features/auth/screens/login_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/feed':
        return MaterialPageRoute(builder: (_) => const FeedScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
