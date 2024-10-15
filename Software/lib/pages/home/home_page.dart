import 'package:dialysimetrics/pages/levels/levels_form_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/widgets/custom_drawer.dart';
import 'package:dialysimetrics/pages/home/homepage_controller.dart';
import 'package:dialysimetrics/pages/treatment/treatment_form_page.dart';
import 'package:dialysimetrics/widgets/custom_bottom_nav_bar.dart';
import 'homepage_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice de la página seleccionada

  // Lista de páginas que se mostrarán según el índice seleccionado
  final List<Widget> _pages = [
    const HomePageView(), // Página principal que muestra los tratamientos
    Center(child: Text('Gráfico')), // Página de gráfico
    Center(child: Text('Estadísticas')), // Página de estadísticas
    const LevelsFormPage(), // Página de niveles
  ];

  @override
  void initState() {
    super.initState();
    // Llamar a fetchTreatments para cargar los datos al iniciar la página
    Provider.of<HomePageController>(context, listen: false).fetchTreatments();
  }

  // Función que se llama cuando el usuario selecciona una pestaña en el Bottom Navigation Bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualizar el índice seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialysiMetrics - Registro de Tratamientos'),
      ),
      drawer: const CustomDrawer(),
      body: _pages[_selectedIndex], // Mostrar la página seleccionada

      // Floating Action Button para agregar tratamientos solo en la pestaña de Datos
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                // Navegar a la página TreatmentFormPage cuando el botón se presione
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TreatmentFormPage()),
                ).then((_) {
                  // Actualizar la lista después de regresar de la página de formulario
                  Provider.of<HomePageController>(context, listen: false)
                      .fetchTreatments();
                });
              },
              backgroundColor: Colors.blue,
              tooltip: 'Agregar Datos',
              child: const Icon(Icons.add),
            )
          : null, // No mostrar el botón si no estamos en la pestaña de Datos

      // Custom Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex, // Enviar el índice seleccionado
        onTap:
            _onItemTapped, // Función que se llama cuando se selecciona un ítem
      ),
    );
  }
}
