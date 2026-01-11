import 'package:books_app/Features/search/views_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        BlocProvider.of<SearchedBooksCubit>(
          context,
        ).fetchSearchedBooks(bookName: value);
      },
      decoration: InputDecoration(
        focusedBorder: buildOutlinedInputBorder(),
        enabledBorder: buildOutlinedInputBorder(),
        hint: const Text('search...'),
        suffixIcon: const Opacity(
          opacity: 0.8,
          child: Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
