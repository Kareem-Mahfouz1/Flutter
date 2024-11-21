import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/features/explore/data/models/result/product.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/custom_item_action_bar.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/custom_sliver_app_bar.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/item_details_main_section.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            CustomSliverAppBar(image: product.imageUrl!),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kHoriontalPadding),
                      child: ItemDetailsMainSection(
                        product: product,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned.fill(
          top: MediaQuery.sizeOf(context).height * .89,
          child: const CustomItemActionBar(),
        )
      ],
    );
  }
}
