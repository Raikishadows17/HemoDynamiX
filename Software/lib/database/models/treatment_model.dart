import 'package:flutter/material.dart';

class Treatment {
  final int id;
  final int pressureSystolic;
  final int pressureDiastolic;
  final String date;
  final String hour;
  final String descripction;
  final int systolicLevelId;
  final int diastolicLevelId;

  Treatment({
    required this.id,
    required this.pressureSystolic,
    required this.pressureDiastolic,
    required this.date,
    required this.hour,
    required this.descripction,
    required this.systolicLevelId,
    required this.diastolicLevelId,
  });
  // Método para obtener el icono basado en el nivel sistólico
  Widget getSystolicIcon() {
    if (systolicLevelId == 1) {
      return Icon(Icons.arrow_downward, color: Colors.blue); // Presión baja
    } else if (systolicLevelId == 2) {
      return Icon(Icons.arrow_forward, color: Colors.green); // Presión normal
    } else if (systolicLevelId == 3) {
      return Icon(Icons.arrow_upward, color: Colors.red); // Presión alta
    } else {
      return Icon(Icons.help, color: Colors.grey); // Nivel desconocido
    }
  }

  // Método para obtener el icono basado en el nivel diastólico
  Widget getDiastolicIcon() {
    if (diastolicLevelId == 1) {
      return Icon(Icons.arrow_downward, color: Colors.blue); // Presión baja
    } else if (diastolicLevelId == 2) {
      return Icon(Icons.arrow_forward, color: Colors.green); // Presión normal
    } else if (diastolicLevelId == 3) {
      return Icon(Icons.arrow_upward, color: Colors.red); // Presión alta
    } else {
      return Icon(Icons.help, color: Colors.grey); // Nivel desconocido
    }
  }

  // Método para mapear datos desde la base de datos
  factory Treatment.fromMap(Map<String, dynamic> json) {
    return Treatment(
      id: json['id'],
      pressureSystolic: json['pressure_systolic'],
      pressureDiastolic: json['pressure__diastolic'],
      date: json['date'],
      hour: json['hour'],
      descripction: json['descripction'],
      systolicLevelId: json['systolic_level_id'],
      diastolicLevelId: json['diastolic_level_id'],
    );
  }

  // Método para mapear datos hacia la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pressure_systolic': pressureSystolic,
      'pressure_diastolic': pressureDiastolic,
      'date': date,
      'hour': hour,
      'descripction': descripction,
      'systolic_level_id': systolicLevelId,
      'diastolic_level_id': diastolicLevelId,
    };
  }
}
