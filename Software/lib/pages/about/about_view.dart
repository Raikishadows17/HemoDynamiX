import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about_controller.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AboutController>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('images/deku.jpg'),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(
                fontFamily: 'SourceSansPro',
                letterSpacing: 2.5,
                color: Color(0xfff07b3f),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
            width: 150,
            child: Divider(
              color: Color(0xfff07b3f),
            ),
          ),
          Text(
            controller.developerName,
            style: const TextStyle(fontSize: 18),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0xfff07b3f),
              ),
              title: Text(
                controller.phonenumber,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Color(0xfff07b3f),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Color(0xfff07b3f),
              ),
              title: Text(
                controller.email,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Color(0xfff07b3f),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Color(0xfff07b3f),
              ),
              title: Text(
                controller.developerName,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Color(0xfff07b3f),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Funcionalidad adicional, si la necesitas
            },
            child: const Text('Contactar al desarrollador'),
          ),
        ],
      ),
    );
  }
}
