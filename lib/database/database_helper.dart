import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  // Initialize database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Create database table
  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE students (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      admissionNumber TEXT NOT NULL UNIQUE,
      course TEXT NOT NULL,
      email TEXT NOT NULL
    )
    ''');
  }

  // CREATE: Insert a new student
  Future<int> createStudent(Student student) async {
    final db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  // READ: Get all students
  Future<List<Student>> readAllStudents() async {
    final db = await instance.database;
    final result = await db.query('students', orderBy: 'id DESC');
    return result.map((json) => Student.fromMap(json)).toList();
  }

  // READ: Get a single student by ID
  Future<Student?> readStudent(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'students',
      columns: ['id', 'name', 'admissionNumber', 'course', 'email'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Student.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // UPDATE: Update a student record
  Future<int> updateStudent(Student student) async {
    final db = await instance.database;
    return db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  // DELETE: Delete a student record
  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // SEARCH: Search students by name, admission number, or course
  Future<List<Student>> searchStudents(String query) async {
    final db = await instance.database;
    final result = await db.query(
      'students',
      where: 'name LIKE ? OR admissionNumber LIKE ? OR course LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
      orderBy: 'id DESC',
    );
    return result.map((json) => Student.fromMap(json)).toList();
  }

  // Get student count
  Future<int> getStudentCount() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM students');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  // Close database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
