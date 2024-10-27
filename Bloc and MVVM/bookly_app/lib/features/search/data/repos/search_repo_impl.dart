import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String term}) async {
    try {
      var data =
          await apiService.get(endPoint: 'volumes?q=$term+intitle:$term');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return (Left(ServerFailure.fromDioException(e)));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
