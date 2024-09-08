import 'package:flutter/material.dart';
import 'package:dialysimetrics/routes.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
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
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.settings);
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Estadísticas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.stats);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.about);
            },
          ),
        ],
      ),
    );
  }
}
