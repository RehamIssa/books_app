import 'package:bloc/bloc.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchRepoImpl) : super(SearchedBooksInitial());
  final SearchRepoImpl searchRepoImpl;

  Future<void> fetchSearchedBooks({required String bookName}) async {
    emit(SearchedBooksLoading());

    var results = await searchRepoImpl.fetchSearchedContent(
      searchedText: bookName,
    );
    results.fold(
      (failure) {
        emit(SearchedBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(SearchedBooksSuccess(searchedBooks: books));
      },
    );
  }
}
