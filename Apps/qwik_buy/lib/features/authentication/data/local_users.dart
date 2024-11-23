import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/authentication/data/models/user.dart';
import 'package:sqflite/sqflite.dart';

const String tableUsers = 'users';
const String columnId = 'id';
const String columnName = 'name';
const String columnEmail = 'email';
const String columnPassword = 'password';

class UserManager {
  static final UserManager _instance = UserManager.internal();
  UserManager.internal();
  factory UserManager() => _instance;
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
    $columnEmail text unique not null,
    $columnPassword text not null)
    ''');
  }

  Future<List<User>> allUsers() async {
    final db = await database;
    List<Map<String, dynamic>> response = await db.query(tableUsers);
    List<User> users = response.map((entry) => User.fromMap(entry)).toList();
    return users;
  }

  Future<Either<Failure, int>> loginUser(String email, String password) async {
    Database db = await database;
    try {
      List<Map<String, dynamic>> target = await db.query(
        tableUsers,
        where: 'email = ? and password = ?',
        whereArgs: [email, password],
      );
      if (target.isEmpty) {
        throw Exception('Email or password is incorrect, Please try again.');
      }
      User user = User.fromMap(target[0]);
      return Right(user.id!);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, int>> signupUser(User user) async {
    Database db = await database;
    try {
      int id = await db.insert(tableUsers, user.toMap());
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('User already exists.'));
    }
  }

  deleteUser(int id) async {
    Database db = await database;
    await db.delete(tableUsers, where: 'id = ?', whereArgs: [id]);
  }
}
