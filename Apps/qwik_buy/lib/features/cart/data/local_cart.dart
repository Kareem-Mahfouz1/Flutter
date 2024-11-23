import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/cart/data/models/cart_product.dart';
import 'package:sqflite/sqflite.dart';

const String tableCart = 'cart';
const String columnId = 'id';
const String columnProductId = 'product_id';
const String columnName = 'name';
const String columnPrice = 'price';
const String columnImage = 'image';

class CartManager {
  static Future<Database> getUserCartDb(int userId) async {
    final dbPath = await getDatabasesPath();
    final cartDbPath = join(dbPath, 'cart_user_$userId.db');

    return openDatabase(
      cartDbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        create table $tableCart ( 
        $columnId integer primary key, 
        $columnName text not null,
        $columnPrice text not null,
        $columnImage text not null)
      ''');
      },
    );
  }

  static Future<Either<Failure, int>> addToCart(
      {required int userId, required CartProduct product}) async {
    try {
      final db = await getUserCartDb(userId);
      final id = await db.insert(tableCart, product.toMap());
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('product already in cart.'));
    }
  }

  static Future<Either<Failure, List<CartProduct>>> getCartItems(
      {required int userId}) async {
    try {
      final db = await getUserCartDb(userId);
      List<Map<String, dynamic>> response = await db.query(tableCart);
      List<CartProduct> products =
          response.map((entry) => CartProduct.fromMap(entry)).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('something went wrong.'));
    }
  }
}
