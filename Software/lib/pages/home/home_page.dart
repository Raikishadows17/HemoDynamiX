import 'package:flutter/material.dart';
import 'homepage_view.dart';
import 'package:dialysimetrics/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/home/homepage_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialysiMetrics - Registro de Tratamientos'),
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder(
        future: Provider.of<HomePageController>(context, listen: false)
            .fetchTreatments(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos'));
          } else {
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para agregar datos
          Provider.of<HomePageController>(context, listen: false)
              .onAddDataPressed(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Agregar Datos',
      ),
    );
  }
}
