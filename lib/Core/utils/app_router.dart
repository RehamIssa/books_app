import 'package:books_app/Features/home/presentation/views/book_details_view.dart';
import 'package:books_app/Features/home/presentation/views/home_view.dart';
import 'package:books_app/Features/search/presentation/views/search_view.dart';
import 'package:books_app/Features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => BookDetailsView(),
      ),
      GoRoute(path: kSearchViewPath, builder: (context, state) => SearchView()),
    ],
  );
}
