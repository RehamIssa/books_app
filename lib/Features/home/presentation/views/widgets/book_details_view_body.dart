import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_details_section.dart';
import 'package:books_app/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:books_app/Features/home/presentation/views/widgets/custom_book_details_view_app_bar.dart';
import 'package:books_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const CustomBookDetailsViewAppBar(),
                    BookDetailsSection(book: bookModel),
                    const SizedBox(height: 40),
                    const BooksActions(),
                    Expanded(child: const SizedBox(height: 50)),
                    const SimilarBooksSection(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
