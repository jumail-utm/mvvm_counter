import 'package:flutter/material.dart';

import '../ui/screens/home/home_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/main/main_wrapper.dart';

class Routes {
  static const String main = '/entry';
  static const String home = '/home';
  static const String login = '/login';

  static Route<dynamic>? createRoute(settings) {
    switch (settings.name) {
      case main:
        return MainWrapper.route();

      case home:
        return HomeScreen.route();

      case login:
        return LoginScreen.route();
    }
    return null;
  }
}
