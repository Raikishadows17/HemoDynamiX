import 'package:flutter/material.dart';
import 'homepage_view.dart';
import 'homepage_controller.dart';
import 'package:dialysimetrics/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomePageController(); // Inicializa el controlador
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialysiMetrics'),
      ),
      drawer: CustomDrawer(),
      body: HomePageView(
          controller: _controller), // Inyecta la vista con el controlador
    );
  }
}
