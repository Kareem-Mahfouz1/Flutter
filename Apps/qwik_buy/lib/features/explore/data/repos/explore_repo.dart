import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/explore/data/models/categories/categories.dart';
import 'package:qwik_buy/features/explore/data/models/result/result.dart';

abstract class ExploreRepo {
  Future<Either<Failure, Categories>> fetchCategories();
  Future<Either<Failure, Result>> fetchFreshDrops();
  Future<Either<Failure, Categories>> fetchProductsByCategorey(
      {required String categorey});
}
