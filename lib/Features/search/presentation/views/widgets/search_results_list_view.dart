import 'package:books_app/Core/widgets/custom_error_widget.dart';
import 'package:books_app/Core/widgets/custom_progress_indicator.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:books_app/Features/search/views_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero, //remove the default padding of the widget
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: state.searchedBooks[index]),
              );
            },
          );
        } else if (state is SearchedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchedBooksLoading) {
          return CustomProgressIndicator();
        } else {
          return SizedBox(height: 15);
        }
      },
    );
  }
}
