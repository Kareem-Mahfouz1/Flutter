import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_items_list_view.dart';
import 'package:flutter/widgets.dart';
import 'custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const FeaturedItemsListView(),
        SizedBox(height: MediaQuery.of(context).size.height * .065),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(height: 20),
        const BestSellerListViewItem(),
      ],
    );
  }
}
