import 'package:flutter/material.dart';
import 'treatment_controller.dart';

class TreatmentFormPage extends StatefulWidget {
  @override
  _TreatmentFormPageState createState() => _TreatmentFormPageState();
}

class _TreatmentFormPageState extends State<TreatmentFormPage> {
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _descriptionController = TextEditingController();
  final TreatmentController controller = TreatmentController();

  // Niveles de presión (Ejemplo de valores estáticos, podrías obtenerlos de la base de datos)
  final List<Map<String, dynamic>> _systolicLevels = [
    {'id': 1, 'label': 'Baja'},
    {'id': 2, 'label': 'Normal'},
    {'id': 3, 'label': 'Alta'},
  ];

  final List<Map<String, dynamic>> _diastolicLevels = [
    {'id': 1, 'label': 'Baja'},
    {'id': 2, 'label': 'Normal'},
    {'id': 3, 'label': 'Alta'},
  ];

  int? _selectedSystolicLevelId;
  int? _selectedDiastolicLevelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Tratamiento'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _systolicController,
                decoration: InputDecoration(labelText: 'Presión Sistólica'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _diastolicController,
                decoration: InputDecoration(labelText: 'Presión Diastólica'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
              SizedBox(height: 20),

              // Dropdown para nivel de presión sistólica
              DropdownButtonFormField<int>(
                value: _selectedSystolicLevelId,
                decoration:
                    InputDecoration(labelText: 'Nivel de Presión Sistólica'),
                items: _systolicLevels.map((level) {
                  return DropdownMenuItem<int>(
                    value: level['id'],
                    child: Text(level['label']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSystolicLevelId = value;
                  });
                },
              ),

              // Dropdown para nivel de presión diastólica
              DropdownButtonFormField<int>(
                value: _selectedDiastolicLevelId,
                decoration:
                    InputDecoration(labelText: 'Nivel de Presión Diastólica'),
                items: _diastolicLevels.map((level) {
                  return DropdownMenuItem<int>(
                    value: level['id'],
                    child: Text(level['label']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDiastolicLevelId = value;
                  });
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Validar que los niveles de presión fueron seleccionados
                  if (_selectedSystolicLevelId == null ||
                      _selectedDiastolicLevelId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Por favor, seleccione los niveles de presión')),
                    );
                    return;
                  }

                  // Llamar al controlador para insertar el tratamiento
                  controller.insertTreatment(
                    context,
                    int.parse(_systolicController.text),
                    int.parse(_diastolicController.text),
                    _descriptionController.text,
                    _selectedSystolicLevelId!, // Pasar el ID del nivel sistólico
                    _selectedDiastolicLevelId!, // Pasar el ID del nivel diastólico
                  );
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
