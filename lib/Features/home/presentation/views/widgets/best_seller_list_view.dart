import 'package:books_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';


class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero, //remove the default padding of the widget
      physics:
          NeverScrollableScrollPhysics(), //Stop the scrolling of the list itself
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
