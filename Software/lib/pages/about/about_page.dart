import 'package:dialysimetrics/pages/about/about_view.dart';
import 'package:dialysimetrics/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      drawer: const CustomDrawer(),
      body: AboutView(),
    );
  }
}
