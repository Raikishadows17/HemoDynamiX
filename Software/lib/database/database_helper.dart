import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dialysimetrics/database/models/treatment_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dialysimetrics.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE treatments (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      weight_pre REAL,
      weight_post REAL,
      pressure_pre_systolic INTEGER,
      pressure_pre_diastolic INTEGER,
      pressure_post_systolic INTEGER,
      pressure_post_diastolic INTEGER,
      total_liquids INTEGER,
      date TEXT

    )
    ''');
  }

  Future<int> insertTreatment(Map<String, dynamic> treatment) async {
    Database db = await database;
    return await db.insert('treatments', treatment);
  }

  Future<List<Treatment>> getAllTreatments() async {
    Database db = await database;
    final List<Map<String, dynamic>> treatmentMaps =
        await db.query('treatments');

    // Convertimos los datos obtenidos en una lista de objetos Treatment
    return List.generate(treatmentMaps.length, (i) {
      return Treatment.fromMap(treatmentMaps[i]);
    });
  }
}
