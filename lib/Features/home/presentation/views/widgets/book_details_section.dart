import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 47),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: width * .24),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(height: 42),
        Text(
          book.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: GoogleFonts.domine(textStyle: Styles.textStyle30),
        ),
        const SizedBox(height: 12),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 20),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
