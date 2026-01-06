import 'package:books_app/Core/utils/styles.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 47),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: width * .24),
          child: const CustomBookImage(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',),
        ),
        const SizedBox(height: 42),
        const Text('The Jungle Book', style: Styles.textStyle30),
        const SizedBox(height: 12),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBox(height: 20),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
