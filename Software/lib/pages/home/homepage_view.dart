import 'package:flutter/material.dart';
import 'homepage_controller.dart';

class HomePageView extends StatelessWidget {
  final HomePageController controller;

  HomePageView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bienvenido a DialysiMetrics',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => controller.onButtonPressed(),
          child: Text('Presionar botón'),
        ),
      ],
    );
  }
}
