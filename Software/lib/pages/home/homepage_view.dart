import 'package:flutter/material.dart';
import 'homepage_controller.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(
      builder: (ctx, controller, _) {
        if (controller.treatments.isEmpty) {
          return Center(child: Text('No hay tratamientos registrados'));
        }

        return ListView.builder(
          itemCount: controller.treatments.length,
          itemBuilder: (ctx, i) {
            final treatment = controller.treatments[i];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Fecha: ${treatment.date}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Peso Pre-diálisis: ${treatment.weightPre.toStringAsFixed(1)} kg'),
                    Text(
                        'Peso Post-diálisis: ${treatment.weightPost.toStringAsFixed(1)} kg'),
                    Text(
                        'Presión Pre-diálisis: ${treatment.pressurePreSystolic}/${treatment.pressurePreDiastolic} mmHg'),
                    Text(
                        'Presión Post-diálisis: ${treatment.pressurePostSystolic}/${treatment.pressurePostDiastolic} mmHg'),
                    Text(
                        'Total de Líquidos Extraídos: ${treatment.totalLiquids} ml'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
