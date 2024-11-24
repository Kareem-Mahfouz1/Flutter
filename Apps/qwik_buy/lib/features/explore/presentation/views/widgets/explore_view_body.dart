import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../manager/fresh_drops_cubit/fresh_drops_cubit.dart';
import 'categories_list_view.dart';

import 'newest_items_grid_view.dart';
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
      body: BlocBuilder<FreshDropsCubit, FreshDropsState>(
        builder: (context, state) {
          if (state is FreshDropsSuccess) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
              child: NewestItemsGridView(
                products: state.result.products,
              ),
            );
          } else if (state is FreshDropsFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
