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
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
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
            leading: const Icon(Icons.info),
            title: const Text('Acerca de'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.about);
            },
          ),
        ],
      ),
    );
  }
}
