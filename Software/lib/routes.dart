import 'package:flutter/material.dart';
import 'package:dialysimetrics/pages/home/home_page.dart';
import 'package:dialysimetrics/pages/stats/statspage.dart';
import 'package:dialysimetrics/pages/about/about_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String settings = '/settings';
  static const String stats = '/stats';
  static const String about = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.about:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case AppRoutes.stats:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Statics')),
            body: const Center(child: Text('Statics Page Coming Soon')),
          ),
        );
      // Implementar las rutas que aún no están definidas
      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Settings')),
            body: const Center(child: Text('Settings Page Coming Soon')),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
