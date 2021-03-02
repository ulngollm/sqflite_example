import 'package:cache_test/repository/config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteRepository {
  static String _name = Config.dbName;
  static Database _database;

  static getPath() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _name);
    print(path);
    return path;
  }

  static Future<void> init() async {
    final path = getPath();
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
    
  }

  static _onCreate(Database db, int ver) async {
    await db.execute('''
    CREATE TABLE IF NOT EXIST users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        age INTEGER
        );
        ''');
  }
  static Future<int> addUser(String name, String email, int age) async {
    final value = {
      "name": name,
      "email": email,
      "age": age
    };
    int resId = await _database.insert(
      'users',
      value
    );
    return resId;
  }

  Future <List<Map<String,dynamic>>> getUsers() async {
    final sql = 'SELECT * FROM users';
    final result = await _database.rawQuery(sql);
    return result;
  }
}
