import 'package:books_app/Core/utils/app_router.dart';
import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kBookDetailsViewPath, extra: bookModel);
      },
      child: SizedBox(
        height: 115,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    /*Bring the width size of the current screen 
                    and used 50% of it as a width for the text
                    This used as a technique to apply responsiveness to the design
                    */
                    width: MediaQuery.of(context).size.width * .50,
                    child: Text(
                      bookModel.volumeInfo.title ?? 'not found',
                      style: GoogleFonts.domine(textStyle: Styles.textStyle20),
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, //three dots when the text is too long
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
