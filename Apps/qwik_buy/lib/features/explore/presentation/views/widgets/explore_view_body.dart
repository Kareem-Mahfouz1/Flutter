import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/categories_list_view.dart';

import 'best_selling_grid_view.dart';
import 'custom_search_app_bar.dart';

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
                  const CustomSearchAppBar(),
                  const SizedBox(height: 40),
                  Text(
                    'Categories',
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const CategoriesListView(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fresh Drops',
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      CustomTextButton(
                        text: 'See All',
                        color: Colors.black,
                        style: Styles.textStyle16,
                        onPressed: () {},
                      )
                    ],
                  ),
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
