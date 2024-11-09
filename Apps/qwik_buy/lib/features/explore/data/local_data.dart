import 'package:path/path.dart';
import 'package:qwik_buy/features/explore/data/models/user.dart';
import 'package:sqflite/sqflite.dart';

const String tableUsers = 'users';
const String columnId = 'id';
const String columnName = 'name';
const String columnEmail = 'email';
const String columnPassword = 'password';

class DbManager {
  static final DbManager _instance = DbManager.internal();
  DbManager.internal();
  factory DbManager() => _instance;
  Database? _db;

  Future<Database> get database async {
    _db ??= await open();
    return _db!;
  }

  Future<Database> open() async {
    String path = join(await getDatabasesPath(), 'local_users.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    create table $tableUsers ( 
    $columnId integer primary key, 
    $columnName text not null,
    $columnEmail text not null,
    $columnPassword text not null)
    ''');
  }

  Future<List<Map>> allUsers() async {
    final db = await database;
    List<Map> users = await db.query(tableUsers);
    return users;
  }

  regesterUser(User user) async {
    Database db = await database;
    await db.insert(tableUsers, user.toMap());
  }

  deleteUser(int id) async {
    Database db = await database;
    await db.delete(tableUsers, where: 'id = ?', whereArgs: [id]);
  }
}
