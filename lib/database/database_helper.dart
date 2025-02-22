import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'matrimony.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            mobile TEXT NOT NULL,
            age INTEGER NOT NULL CHECK (age >= 18),
            city TEXT NOT NULL,
            gender TEXT NOT NULL,
            password TEXT NOT NULL,
            isFavorite INTEGER DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<int> insertUser(User user) async {
    try {
      final db = await database;
      return await db.insert('users', user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print("Error inserting user: $e");
      return -1; // indicate an error condition
    }
  }

  Future<int> updateUser(User user) async {
    try {
      final db = await database;
      return await db.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    } catch (e) {
      print("Error updating user: $e");
      return -1; // indicate an error condition
    }
  }

  Future<int> deleteUser(int id) async {
    try {
      final db = await database;
      return await db.delete(
        'users',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print("Error deleting user: $e");
      return -1; // indicate an error condition
    }
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query('users');
    return results.map((map) => User.fromMap(map)).toList();
  }

  Future<bool> validateUser(String email, String password) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<List<User>> getFavoriteUsers() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'isFavorite = ?',
      whereArgs: [1],
    );
    return results.map((map) => User.fromMap(map)).toList();
  }

  Future<void> toggleFavorite(int id) async {
    final db = await database;

    // Get user's current favorite status
    List<Map<String, dynamic>> result = await db.query(
      'users',
      columns: ['isFavorite'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      int newFavoriteStatus = (result.first['isFavorite'] as int) == 1 ? 0 : 1;
      await db.update(
        'users',
        {'isFavorite': newFavoriteStatus},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}