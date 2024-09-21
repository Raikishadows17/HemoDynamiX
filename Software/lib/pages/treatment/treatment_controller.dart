import 'package:flutter/material.dart';
import 'package:dialysimetrics/database/database_helper.dart';
import 'package:dialysimetrics/database/models/treatment_model.dart';

class TreatmentController {
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Método para insertar el tratamiento
  Future<void> insertTreatment(
    BuildContext context,
    int systolic,
    int diastolic,
    String description,
    int systolicLevelId, // ID del nivel sistólico
    int diastolicLevelId, // ID del nivel diastólico
  ) async {
    try {
      // Crear un objeto Treatment con los datos proporcionados
      Treatment newTreatment = Treatment(
        id: 0, // El ID se generará automáticamente en la base de datos
        pressureSystolic: systolic,
        pressureDiastolic: diastolic,
        date: DateTime.now().toString().split(' ')[0], // Fecha actual
        hour: TimeOfDay.now().format(context), // Hora actual
        descripction: description,
        systolicLevelId: systolicLevelId,
        diastolicLevelId: diastolicLevelId,
      );

      // Insertar el tratamiento en la base de datos usando el método toMap()
      await dbHelper.insertTreatment(newTreatment.toMap());

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tratamiento registrado correctamente')),
      );

      // Volver a la pantalla anterior (HomePage)
      Navigator.pop(context);
    } catch (error) {
      // Manejar error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar tratamiento: $error')),
      );
    }
  }
}
