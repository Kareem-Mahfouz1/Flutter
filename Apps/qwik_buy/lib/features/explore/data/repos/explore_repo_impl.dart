import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/core/utils/web_service.dart';
import 'package:qwik_buy/features/explore/data/models/categories/categories.dart';
import 'package:qwik_buy/features/explore/data/models/result/result.dart';
import 'package:qwik_buy/features/explore/data/repos/explore_repo.dart';

class ExploreRepoImpl implements ExploreRepo {
  final WebService webService;
  ExploreRepoImpl(this.webService);

  @override
  Future<Either<Failure, Categories>> fetchCategories() async {
    try {
      var data = await webService.get(
          endPoint: 'categories/list?country=US&lang=en-US');
      Categories categories = Categories.fromJson(data);
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Result>> fetchFreshDrops() async {
    try {
      var data = await webService.get(
          endPoint:
              'products/v2/list?store=US&offset=0&categoryId=4209&country=US&sort=freshness&currency=USD&sizeSchema=US&limit=48&lang=en-US');
      Result response = Result.fromJson(data);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Categories>> fetchProductsByCategorey(
      {required String categorey}) {
    // TODO: implement fetchProductsByCategorey
    throw UnimplementedError();
  }
}
