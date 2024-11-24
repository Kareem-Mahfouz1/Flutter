import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/categories/categories.dart';
import '../models/result/result.dart';

abstract class ExploreRepo {
  Future<Either<Failure, Categories>> fetchCategories();
  Future<Either<Failure, Result>> fetchFreshDrops();
  Future<Either<Failure, Result>> fetchProductsByCategorey({required int id});
}
