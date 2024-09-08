import 'package:flutter/material.dart';
import 'homepage_view.dart';
import 'homepage_controller.dart';
import 'package:dialysimetrics/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialysiMetrics'),
      ),
      drawer: CustomDrawer(), // Aquí agregas el menú lateral
      body: Center(
        child: Text('Bienvenido a DialysiMetrics'),
      ),
    );
  }
}
