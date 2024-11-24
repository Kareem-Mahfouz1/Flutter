import 'package:flutter/material.dart';
import '../../data/models/result/product.dart';
import 'widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemDetailsViewBody(
        product: product,
      ),
    );
  }
}
