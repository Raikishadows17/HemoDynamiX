import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/widgets/custom_drawer.dart';
import 'package:dialysimetrics/pages/home/homepage_controller.dart';
import 'homepage_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Llamar a fetchTreatments para cargar los datos al iniciar la página
    Provider.of<HomePageController>(context, listen: false).fetchTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialysiMetrics - Registro de Tratamientos'),
      ),
      drawer: CustomDrawer(),
      body: HomePageView(), // Llamar a la vista (home_view.dart)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para abrir el diálogo y agregar nuevos datos
          Provider.of<HomePageController>(context, listen: false)
              .onAddDataPressed(context)
              .then((_) {
            // Actualizar la lista después de agregar datos
            Provider.of<HomePageController>(context, listen: false)
                .fetchTreatments();
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Agregar Datos',
      ),
    );
  }
}
