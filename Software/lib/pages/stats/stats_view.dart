import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/stats/stats_controller.dart';

class StatsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatsPageController>(
      builder: (context, controller, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Promedio Peso Pre-diálisis: ${controller.averagePreWeight.toStringAsFixed(1)} kg'),
              Text(
                  'Promedio Peso Post-diálisis: ${controller.averagePostWeight.toStringAsFixed(1)} kg'),
              Text(
                  'Promedio Presión Pre Sistólica: ${controller.averagePreSystolicPressure.toStringAsFixed(1)} mmHg'),
              Text(
                  'Promedio Presión Post Sistólica: ${controller.averagePostSystolicPressure.toStringAsFixed(1)} mmHg'),
              Text(
                  'Total de Líquidos Extraídos: ${controller.totalLiquids} ml'),
            ],
          ),
        );
      },
    );
  }
}
