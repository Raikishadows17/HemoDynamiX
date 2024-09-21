import 'package:flutter/material.dart';
import 'package:dialysimetrics/database/database_helper.dart';
import 'package:intl/intl.dart';

class HomePageController with ChangeNotifier {
  List<Map<String, dynamic>> _treatments = [];

  List<Map<String, dynamic>> get treatments => _treatments;

  // Obtener todos los tratamientos con JOIN a los niveles de presión
  Future<void> fetchTreatments() async {
    final dbHelper = DatabaseHelper();
    final treatmentData = await dbHelper.getAllTreatments();
    _treatments = treatmentData;
    notifyListeners();
  }

  // Método para agregar un nuevo tratamiento
  Future<void> addTreatment({
    required int pressureSystolic,
    required int pressureDiastolic,
    required int systolicLevelId,
    required int diastolicLevelId,
    required String description,
  }) async {
    final dbHelper = DatabaseHelper();
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());

    Map<String, dynamic> treatmentData = {
      'pressure_systolic': pressureSystolic,
      'pressure_diastolic': pressureDiastolic,
      'date': formattedDate,
      'hour': currentTime,
      'description': description,
      'systolic_level_id': systolicLevelId, // ID del nivel sistólico
      'diastolic_level_id': diastolicLevelId, // ID del nivel diastólico
    };

    await dbHelper.insertTreatment(treatmentData);
    await fetchTreatments(); // Actualiza la lista después de insertar
  }
}
