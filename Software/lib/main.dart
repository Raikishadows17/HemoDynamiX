import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DialysiMetrics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home, // Página inicial
      onGenerateRoute: AppRoutes.generateRoute, // Generador de rutas
    );
  }
}
