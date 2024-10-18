import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(await getDatabasesPath(), 'admin_database.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE admins(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, telefono TEXT, email TEXT, token TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertAdmin(Admin admin) async {
    final db = await database;
    await db.insert(
      'admins',
      admin.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Otros métodos para consultar, actualizar y eliminar admins...
}

class Admin {
  final int? id;
  final String nombre;
  final String telefono;
  final String email;
  final String token;

  Admin({this.id, required this.nombre, required this.telefono, required this.email, required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'token': token,
    };
  }
}
