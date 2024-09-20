import 'package:flutter/material.dart';
import 'package:dialysimetrics/database/database_helper.dart';
import 'stats_model.dart';
import 'package:dialysimetrics/database/models/treatment_model.dart'; // Importar el modelo Treatment

class StatsPageController with ChangeNotifier {
  final StatisticsModel _model = StatisticsModel();

  double averagePreWeight = 0;
  double averagePostWeight = 0;
  double averagePreSystolicPressure = 0;
  double averagePostSystolicPressure = 0;
  int totalLiquids = 0;

  Future<void> fetchStatistics() async {
    // Obtener todos los tratamientos de la base de datos
    final List<Treatment> treatments =
        await DatabaseHelper().getAllTreatments();

    // Calcular las estadísticas usando el modelo
    averagePreWeight = _model.calculateAveragePreWeight(treatments);
    averagePostWeight = _model.calculateAveragePostWeight(treatments);
    averagePreSystolicPressure =
        _model.calculateAveragePreSystolicPressure(treatments);
    averagePostSystolicPressure =
        _model.calculateAveragePostSystolicPressure(treatments);
    totalLiquids = _model.calculateTotalLiquids(treatments);

    // Notificar a la vista para que se actualice
    notifyListeners();
  }
}
