import 'package:flutter/material.dart';

import 'categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  static const List list = ['Men', 'Women', 'Devices', 'Gadgets', 'Gaming'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return CategoriesListViewItem(
            text: list[index],
          );
        },
      ),
    );
  }
}
