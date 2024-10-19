import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'featured_items_list_view.dart';
import 'package:flutter/widgets.dart';
import 'custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedItemsListView(),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                  child: Text(
                    'Best Seller',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ];
      },
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: BestSellerListView(),
      ),
    );
  }
}
