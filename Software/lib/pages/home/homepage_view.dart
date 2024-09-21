import 'package:flutter/material.dart';
import 'homepage_controller.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/database/models/treatment_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(
      builder: (context, controller, _) {
        if (controller.treatments.isEmpty) {
          return const Center(child: Text('No hay tratamientos registrados'));
        }

        return ListView.builder(
          itemCount: controller.treatments.length,
          itemBuilder: (context, index) {
            // Convertir Map a un objeto Treatment
            final treatment = Treatment.fromMap(controller.treatments[index]);

            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Fecha: ${treatment.date}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Presión Sistólica: '),
                        treatment
                            .getSystolicIcon(), // Mostrar icono de presión sistólica
                        Text('${treatment.pressureSystolic} mmHg'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Presión Diastólica: '),
                        treatment
                            .getDiastolicIcon(), // Mostrar icono de presión diastólica
                        Text('${treatment.pressureDiastolic} mmHg'),
                      ],
                    ),
                    Text('Descripción: ${treatment.descripction}'),
                    Text('Hora: ${treatment.hour}'),
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
