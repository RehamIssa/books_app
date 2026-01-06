import 'package:books_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CustomBookImage(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',),
          );
        },
      ),
    );
  }
}
