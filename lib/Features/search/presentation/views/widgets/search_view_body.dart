import 'package:books_app/Core/utils/service_locator.dart';
import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:books_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:books_app/Features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:books_app/Features/search/views_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchedBooksCubit(getIt.get<SearchRepoImpl>()),
      child: Padding(
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
      ),
    );
  }
}
