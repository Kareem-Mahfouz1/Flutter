import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/categories_list_view.dart';

import 'best_selling_grid_view.dart';
import 'custom_app_bar.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const CustomAppBar(),
                  const SizedBox(height: 40),
                  Text(
                    'Categories',
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const CategoriesListView(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Selling',
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'See all',
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          )
        ];
      },
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriontalPadding),
        child: BestSellingGridView(),
      ),
    );
  }
}
