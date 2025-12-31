import 'package:books_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:books_app/Core/utils/app_router.dart';

void main() {
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      //Changing the default background color of the Scaffold Widget
      //Another note is using dark() to make the app in the dark theme
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(kPrimaryColor),
        //Using google fonts package to get montserrat font
        //As well as making it the default font for the whole app in the dark theme specifically
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
