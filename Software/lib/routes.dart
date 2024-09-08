import 'package:flutter/material.dart';
import 'package:dialysimetrics/pages/home/home_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String settings = '/settings';
  static const String stats = '/stats';
  static const String about = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case AppRoutes.settings:
      //return MaterialPageRoute(builder: (_) => SettingsPage());
      case AppRoutes.stats:
      //return MaterialPageRoute(builder: (_) => StatsPage());
      case AppRoutes.about:
      //return MaterialPageRoute(builder: (_) => AboutPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
