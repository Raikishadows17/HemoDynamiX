import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex; // Índice de la pestaña actualmente seleccionada
  final Function(int)
      onTap; // Función que se ejecuta al hacer clic en una pestaña

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex, // Índice de la pestaña seleccionada
    required this.onTap, // Función callback
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Mantener el fondo estático
      currentIndex: widget.currentIndex, // Pestaña seleccionada
      onTap: widget.onTap, // Cambiar entre pestañas
      items: [
        _buildBottomNavItem(
          icon: Icons.dashboard,
          label: 'Datos',
          index: 0,
        ),
        _buildBottomNavItem(
          icon: Icons.bar_chart,
          label: 'Gráfico',
          index: 1,
        ),
        _buildBottomNavItem(
          icon: Icons.analytics,
          label: 'Estadísticas',
          index: 2,
        ),
        _buildBottomNavItem(
          icon: Icons.speed,
          label: 'Nivel',
          index: 3,
        ),
      ],
    );
  }

  // Función para construir un BottomNavigationBarItem
  BottomNavigationBarItem _buildBottomNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    // Verificar si es la pestaña seleccionada
    bool isSelected = widget.currentIndex == index;

    return BottomNavigationBarItem(
      icon: Icon(icon), // Mostrar solo el icono cuando no esté seleccionado
      label: isSelected
          ? label
          : '', // Mostrar el texto solo si está seleccionada la pestaña
    );
  }
}
