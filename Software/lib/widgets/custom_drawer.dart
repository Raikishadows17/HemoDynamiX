import 'package:flutter/material.dart';
import 'package:dialysimetrics/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'DialysiMetrics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Datos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.show_chart),
            title: const Text('Grafico'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.settings);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Estadísticas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.stats);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Niveles'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.about);
            },
          ),
        ],
      ),
    );
  }
}
