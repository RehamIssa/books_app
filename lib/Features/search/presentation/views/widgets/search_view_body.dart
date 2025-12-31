import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:books_app/Features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          CustomSearchTextField(),
          SizedBox(height: 30),
          Text('Search Results', style: Styles.textStyle18),
          SizedBox(height: 15),
          Expanded(child: SearchResultsListView()),
        ],
      ),
    );
  }
}
