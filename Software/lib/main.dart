import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/home/homepage_controller.dart';
import 'package:dialysimetrics/pages/stats/stats_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageController()),
        ChangeNotifierProvider(create: (_) => StatsPageController()),
      ],
      child: MaterialApp(
        title: 'DialysiMetrics',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.home, // Ruta inicial
        onGenerateRoute: AppRoutes.generateRoute, // Generador de rutas
      ),
    );
  }
}
