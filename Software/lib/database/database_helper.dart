import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dialysimetrics/database/models/treatment_model.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

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

  // Crear las tablas al iniciar la base de datos
  Future _onCreate(Database db, int version) async {
    // Crear tabla systolic_levels
    await db.execute('''
      CREATE TABLE systolic_levels (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        value INTEGER,
        description TEXT
      )
    ''');
    // Crear tabla diastolic_levels
    await db.execute('''
      CREATE TABLE diastolic_levels (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        value INTEGER,
        description TEXT
      )
    ''');

    // Crear tabla weights
    await db.execute('''
      CREATE TABLE weights (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        initial_weight REAL,
        final_weight REAL,
        total_liquids REAL,
        date TEXT,
        hour TEXT
      )
    ''');

    // Crear tabla treatments con FOREIGN KEYS
    await db.execute('''
      CREATE TABLE treatments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pressure_systolic INTEGER,
        pressure_diastolic INTEGER,
        date TEXT,
        hour TEXT,
        description TEXT,
        systolic_level_id INTEGER,
        diastolic_level_id INTEGER,
        FOREIGN KEY (systolic_level_id) REFERENCES systolic_levels(id),
        FOREIGN KEY (diastolic_level_id) REFERENCES diastolic_levels(id)
      )
    ''');
  }

  // Cerrar la base de datos
  Future<void> close() async {
    final db = await database;
    db.close();
  }

  // Insertar en systolic_levels
  Future<int> insertSystolicLevel(Map<String, dynamic> systolicLevel) async {
    final db = await database;
    return await db.insert('systolic_levels', systolicLevel);
  }

// Insertar en diastolic_levels
  Future<int> insertDiastolicLevel(Map<String, dynamic> diastolicLevel) async {
    final db = await database;
    return await db.insert('diastolic_levels', diastolicLevel);
  }

// Obtener todos los niveles sistólicos
  Future<List<Map<String, dynamic>>> getAllSystolicLevels() async {
    final db = await database;
    return await db.query('systolic_levels');
  }

// Obtener todos los niveles diastólicos
  Future<List<Map<String, dynamic>>> getAllDiastolicLevels() async {
    final db = await database;
    return await db.query('diastolic_levels');
  }

  // Insertar un registro de peso
  Future<int> insertWeight(Map<String, dynamic> weight) async {
    final db = await database;
    return await db.insert('weights', weight);
  }

// Obtener todos los registros de peso
  Future<List<Map<String, dynamic>>> getAllWeights() async {
    final db = await database;
    return await db.query('weights');
  }

// Actualizar un registro de peso
  Future<int> updateWeight(Map<String, dynamic> weight, int id) async {
    final db = await database;
    return await db.update('weights', weight, where: 'id = ?', whereArgs: [id]);
  }

// Eliminar un registro de peso
  Future<int> deleteWeight(int id) async {
    final db = await database;
    return await db.delete('weights', where: 'id = ?', whereArgs: [id]);
  }

  // Insertar un tratamiento
  Future<int> insertTreatment(Map<String, dynamic> treatment) async {
    final db = await database;
    return await db.insert('treatments', treatment);
  }

// Obtener todos los tratamientos con JOIN a las tablas de niveles
  Future<List<Map<String, dynamic>>> getAllTreatments() async {
    final db = await database;
    return await db.rawQuery('''
    SELECT t.*, sl.description AS systolic_description, dl.description AS diastolic_description
    FROM treatments t
    JOIN systolic_levels sl ON t.systolic_level_id = sl.id
    JOIN diastolic_levels dl ON t.diastolic_level_id = dl.id
  ''');
  }

// Actualizar un tratamiento
  Future<int> updateTreatment(Map<String, dynamic> treatment, int id) async {
    final db = await database;
    return await db
        .update('treatments', treatment, where: 'id = ?', whereArgs: [id]);
  }

// Eliminar un tratamiento
  Future<int> deleteTreatment(int id) async {
    final db = await database;
    return await db.delete('treatments', where: 'id = ?', whereArgs: [id]);
  }
}
