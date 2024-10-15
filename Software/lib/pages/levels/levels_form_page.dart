import 'package:flutter/material.dart';
import 'package:dialysimetrics/database/database_helper.dart';

class LevelsFormPage extends StatefulWidget {
  const LevelsFormPage({super.key});

  @override
  _LevelsFormPageState createState() => _LevelsFormPageState();
}

class _LevelsFormPageState extends State<LevelsFormPage> {
  final _systolicValueController = TextEditingController();
  final _diastolicValueController = TextEditingController();
  final _descriptionController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  String? _selectedSystolicLevel;
  String? _selectedDiastolicLevel;

  // Niveles de presión disponibles
  final List<String> _levels = [
    'Muy baja',
    'Baja',
    'Normal',
    'Alta',
    'Muy alta'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Niveles de Presión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecciona el nivel de Presión Sistólica',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                value: _selectedSystolicLevel,
                items: _levels.map((String level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSystolicLevel = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Nivel Sistólico',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _systolicValueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor Sistólico (numérico)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Selecciona el nivel de Presión Diastólica',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                value: _selectedDiastolicLevel,
                items: _levels.map((String level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDiastolicLevel = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Nivel Diastólico',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _diastolicValueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor Diastólico (numérico)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveLevels,
                child: const Text('Guardar Niveles'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para guardar los niveles en la base de datos
  Future<void> _saveLevels() async {
    if (_selectedSystolicLevel == null ||
        _selectedDiastolicLevel == null ||
        _systolicValueController.text.isEmpty ||
        _diastolicValueController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    try {
      // Guardar nivel sistólico
      await dbHelper.insertSystolicLevel({
        'value': int.parse(_systolicValueController
            .text), // Valor numérico de la presión sistólica
        'description':
            _selectedSystolicLevel, // Descripción del nivel sistólico
      });

      // Guardar nivel diastólico
      await dbHelper.insertDiastolicLevel({
        'value': int.parse(_diastolicValueController
            .text), // Valor numérico de la presión diastólica
        'description':
            _selectedDiastolicLevel, // Descripción del nivel diastólico
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Niveles guardados exitosamente')),
      );

      // Limpiar el formulario
      setState(() {
        _selectedSystolicLevel = null;
        _selectedDiastolicLevel = null;
        _systolicValueController.clear();
        _diastolicValueController.clear();
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar los niveles: $error')),
      );
    }
  }

  @override
  void dispose() {
    _systolicValueController.dispose();
    _diastolicValueController.dispose();
    super.dispose();
  }
}
