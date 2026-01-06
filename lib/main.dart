import 'package:books_app/Core/utils/service_locator.dart';
import 'package:books_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:books_app/Features/home/presentation/views_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/Features/home/presentation/views_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:books_app/Core/utils/app_router.dart';

void main() {
  //setup the get_it service locator
  setupGetItServiceLocator();

  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //requesting the data from here
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        //Changing the default background color of the Scaffold Widget
        //Another note is using dark() to make the app in the dark theme
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(kPrimaryColor),
          //Using google fonts package to get montserrat font
          //As well as making it the default font for the whole app in the dark theme specifically
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
