import '../../../../../core/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepo) : super(SearchedBooksInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchedBooks(String term) async {
    emit(SearchedBooksLoading());
    var result = await searchRepo.fetchSearchedBooks(term: term);
    result.fold(
      (failure) {
        emit(SearchedBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SearchedBooksSuccess(books));
      },
    );  
  }
}
