import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../data/models/result/product.dart';
import 'custom_item_action_bar.dart';
import 'custom_sliver_app_bar.dart';
import 'item_details_main_section.dart';

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
          child: CustomItemActionBar(
            product: product,
          ),
        )
      ],
    );
  }
}
