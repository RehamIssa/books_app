import 'package:books_app/Core/utils/app_router.dart';
import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:books_app/constants.dart';
import 'package:books_app/Core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsViewPath);
      },
      child: SizedBox(
        height: 115,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 47.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AssetsData.testImage),
                  ),
                ),
              ),
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
                      'Harry Potter and the Goblet of Fire',
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, //three dots when the text is too long
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text('J.K. Rowling', style: Styles.textStyle14),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: [
                        Text(
                          '19.99 €',
                          style: Styles.textStyle20.copyWith(
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
