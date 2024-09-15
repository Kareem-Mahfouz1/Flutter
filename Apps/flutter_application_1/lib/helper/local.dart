import 'package:flutter_application_1/recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableFavourites = 'favourites';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnImage = 'image';
const String columnIsFavourite = 'isFavourite';

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
    String path = join(await getDatabasesPath(), 'local.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    create table $tableFavourites ( 
    $columnId integer primary key, 
    $columnTitle text not null,
    $columnImage text not null,
    $columnIsFavourite integer not null)
    ''');
  }

  Future<List<Map>> allRecipes() async {
    final db = await database;
    List<Map> recipes = await db.query(tableFavourites);
    return recipes;
  }

  insertRecipe(Recipe recipe) async {
    Database db = await database;
    await db.insert(tableFavourites, recipe.toMap());
  }

  deleteRecipe(int id) async {
    Database db = await database;
    await db.delete(tableFavourites, where: 'id = ?', whereArgs: [id]);
  }
}
