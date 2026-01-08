import 'package:books_app/Core/utils/service_locator.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:books_app/Features/home/presentation/views/book_details_view.dart';
import 'package:books_app/Features/home/presentation/views/home_view.dart';
import 'package:books_app/Features/home/presentation/views_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_app/Features/search/presentation/views/search_view.dart';
import 'package:books_app/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeViewPath = '/homeView';
  static const kBookDetailsViewPath = '/bookDetailsView';
  static const kSearchViewPath = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        //path without words means it is the default path when the app run
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(path: kHomeViewPath, builder: (context, state) => HomeView()),
      GoRoute(
        path: kBookDetailsViewPath,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(path: kSearchViewPath, builder: (context, state) => SearchView()),
    ],
  );
}
