import 'package:flutter/material.dart';
import 'package:dialysimetrics/database/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:dialysimetrics/database/models/treatment_model.dart';

class HomePageController with ChangeNotifier {
  List<Treatment> _treatments = [];

  List<Treatment> get treatments => _treatments;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController weightPreController = TextEditingController();
  final TextEditingController weightPostController = TextEditingController();

  final TextEditingController pressurePreSystolicController =
      TextEditingController();
  final TextEditingController pressurePreDiastolicController =
      TextEditingController();

  final TextEditingController pressurePostSystolicController =
      TextEditingController();
  final TextEditingController pressurePostDiastolicController =
      TextEditingController();

  final TextEditingController totalLiquidsController = TextEditingController();

  void onAddDataPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar Datos'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildTextField(
                      'Peso Pre-diálisis (kg)', weightPreController),
                  _buildTextField(
                      'Peso Post-diálisis (kg)', weightPostController),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextField('Presión Pre Sistólica (mmHg)',
                              pressurePreSystolicController)),
                      SizedBox(width: 10),
                      Expanded(
                          child: _buildTextField(
                              'Presión Pre Diastólica (mmHg)',
                              pressurePreDiastolicController)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextField(
                              'Presión Post Sistólica (mmHg)',
                              pressurePostSystolicController)),
                      SizedBox(width: 10),
                      Expanded(
                          child: _buildTextField(
                              'Presión Post Diastólica (mmHg)',
                              pressurePostDiastolicController)),
                    ],
                  ),
                  _buildTextField(
                      'Total de Líquidos (ml)', totalLiquidsController),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo sin guardar
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _saveData(context);
                }
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  TextFormField _buildTextField(
      String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        if (double.tryParse(value) == null) {
          return 'Por favor, ingrese un número válido';
        }
        return null;
      },
    );
  }

  Future<void> _saveData(BuildContext context) async {
    final dbHelper = DatabaseHelper();

    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    Map<String, dynamic> treatmentData = {
      'weight_pre': double.parse(weightPreController.text),
      'weight_post': double.parse(weightPostController.text),
      'pressure_pre_systolic': int.parse(pressurePreSystolicController.text),
      'pressure_pre_diastolic': int.parse(pressurePreDiastolicController.text),
      'pressure_post_systolic': int.parse(pressurePostSystolicController.text),
      'pressure_post_diastolic':
          int.parse(pressurePostDiastolicController.text),
      'total_liquids': int.parse(totalLiquidsController.text),
      'date': formattedDate, // Guardar la fecha actual
    };

    await dbHelper.insertTreatment(treatmentData);

    Navigator.of(context).pop(); // Cerrar el diálogo después de guardar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos guardados exitosamente')),
    );
  }

  Future<void> fetchTreatments() async {
    _treatments = await DatabaseHelper().getAllTreatments();
    notifyListeners(); // Notificar a la vista para actualizarse
  }

  void dispose() {
    weightPreController.dispose();
    weightPostController.dispose();
    pressurePreSystolicController.dispose();
    pressurePreDiastolicController.dispose();
    pressurePostSystolicController.dispose();
    pressurePostDiastolicController.dispose();
    totalLiquidsController.dispose();
  }
}
