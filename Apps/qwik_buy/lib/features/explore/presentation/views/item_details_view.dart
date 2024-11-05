import 'package:flutter/material.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ItemDetailsViewBody(),
    );
  }
}
