import 'package:books_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomSearchTextField()],
        ),
      ),
    );
  }
}
