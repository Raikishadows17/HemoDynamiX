import 'package:dialysimetrics/database/models/treatment_model.dart'; // Importar el modelo Treatment

class StatisticsModel {
  // Cálculo del promedio de peso pre-diálisis
  double calculateAveragePreWeight(List<Treatment> treatments) {
    double totalWeight = 0;
    for (var treatment in treatments) {
      totalWeight += treatment.weightPre;
    }
    return treatments.isNotEmpty ? totalWeight / treatments.length : 0;
  }

  // Cálculo del promedio de peso post-diálisis
  double calculateAveragePostWeight(List<Treatment> treatments) {
    double totalWeight = 0;
    for (var treatment in treatments) {
      totalWeight += treatment.weightPost;
    }
    return treatments.isNotEmpty ? totalWeight / treatments.length : 0;
  }

  // Cálculo del promedio de presión pre-diálisis (sistólica)
  double calculateAveragePreSystolicPressure(List<Treatment> treatments) {
    double totalPressure = 0;
    for (var treatment in treatments) {
      totalPressure += treatment.pressurePreSystolic;
    }
    return treatments.isNotEmpty ? totalPressure / treatments.length : 0;
  }

  // Cálculo del promedio de presión post-diálisis (sistólica)
  double calculateAveragePostSystolicPressure(List<Treatment> treatments) {
    double totalPressure = 0;
    for (var treatment in treatments) {
      totalPressure += treatment.pressurePostSystolic;
    }
    return treatments.isNotEmpty ? totalPressure / treatments.length : 0;
  }

  // Total de líquidos extraídos
  int calculateTotalLiquids(List<Treatment> treatments) {
    int totalLiquids = 0;
    for (var treatment in treatments) {
      totalLiquids += treatment.totalLiquids;
    }
    return totalLiquids;
  }
}
