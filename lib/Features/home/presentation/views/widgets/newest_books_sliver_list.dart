import 'package:books_app/Core/widgets/custom_error_widget.dart';
import 'package:books_app/Core/widgets/custom_progress_indicator.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:books_app/Features/home/presentation/views_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16.0,
                ),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            }, childCount: state.books.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        } else {
          return SliverToBoxAdapter(child: CustomProgressIndicator());
        }
      },
    );
  }
}
