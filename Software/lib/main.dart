import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/home/homepage_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageController()),
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
