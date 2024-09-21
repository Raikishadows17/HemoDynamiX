import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dialysimetrics/pages/stats/stats_controller.dart';

class StatsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatsPageController>(
      builder: (context, controller, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        );
      },
    );
  }
}
