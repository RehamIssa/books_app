import 'package:books_app/Core/utils/functions/launch_url.dart';
import 'package:books_app/Core/widgets/custom_button.dart';
import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 18,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                customLaunchUrl(context, bookModel.volumeInfo.previewLink!);
              },
              text: getText(book: bookModel),
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              fontSize: 16,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText({required BookModel book}) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
