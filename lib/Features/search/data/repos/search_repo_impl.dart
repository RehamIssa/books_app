import 'package:books_app/Core/errors/failure.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/search/data/repos/search_repo.dart';
import 'package:books_app/Core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedContent({
    required String searchedText,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?orderBy=newest&Filtering=free-ebooks&Sorting=relevance&q=subject:$searchedText',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
