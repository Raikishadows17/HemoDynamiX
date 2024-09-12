class Treatment {
  final int id;
  final double weightPre;
  final double weightPost;
  final int pressurePreSystolic;
  final int pressurePreDiastolic;
  final int pressurePostSystolic;
  final int pressurePostDiastolic;
  final int totalLiquids;
  final String date;

  Treatment({
    required this.id,
    required this.weightPre,
    required this.weightPost,
    required this.pressurePreSystolic,
    required this.pressurePreDiastolic,
    required this.pressurePostSystolic,
    required this.pressurePostDiastolic,
    required this.totalLiquids,
    required this.date,
  });

  // Método para mapear datos desde la base de datos
  factory Treatment.fromMap(Map<String, dynamic> json) {
    return Treatment(
      id: json['id'],
      weightPre: json['weight_pre'],
      weightPost: json['weight_post'],
      pressurePreSystolic: json['pressure_pre_systolic'],
      pressurePreDiastolic: json['pressure_pre_diastolic'],
      pressurePostSystolic: json['pressure_post_systolic'],
      pressurePostDiastolic: json['pressure_post_diastolic'],
      totalLiquids: json['total_liquids'],
      date: json['date'],
    );
  }

  // Método para mapear datos hacia la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight_pre': weightPre,
      'weight_post': weightPost,
      'pressure_pre_systolic': pressurePreSystolic,
      'pressure_pre_diastolic': pressurePreDiastolic,
      'pressure_post_systolic': pressurePostSystolic,
      'pressure_post_diastolic': pressurePostDiastolic,
      'total_liquids': totalLiquids,
      'date': date,
    };
  }
}
