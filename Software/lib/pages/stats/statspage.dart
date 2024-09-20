import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/stats/stats_controller.dart';
import 'package:dialysimetrics/pages/stats/stats_view.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  void initState() {
    super.initState();
    // Llamar al método fetchStatistics cuando la página se inicia
    Provider.of<StatsPageController>(context, listen: false).fetchStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estadísticas de Tratamientos'),
      ),
      body: StatsPageView(), // Mostrar la vista de estadísticas
    );
  }
}
