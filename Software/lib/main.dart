import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/home/homepage_controller.dart';
import 'package:dialysimetrics/pages/home/home_page.dart';

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
        home: HomePage(), // HomePage ahora muestra los datos registrados
      ),
    );
  }
}
