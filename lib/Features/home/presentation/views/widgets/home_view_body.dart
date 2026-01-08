import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:books_app/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:books_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: BooksListView(),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text('Newest Books', style: Styles.textStyle18),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(child: NewestBooksListView()),
      ],
    );
  }
}
