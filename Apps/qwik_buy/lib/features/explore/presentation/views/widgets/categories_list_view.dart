import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qwik_buy/core/utils/app_router.dart';

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
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kCategoreyView,
                extra: list[index],
              );
            },
            child: CategoriesListViewItem(
              text: list[index],
            ),
          );
        },
      ),
    );
  }
}
