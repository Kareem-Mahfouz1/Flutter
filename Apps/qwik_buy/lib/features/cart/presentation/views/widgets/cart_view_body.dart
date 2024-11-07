import 'package:flutter/material.dart';
import 'package:qwik_buy/features/cart/presentation/views/widgets/cart_list_view_item.dart';
import 'package:qwik_buy/features/cart/presentation/views/widgets/cart_list_view_summary.dart';
import 'package:qwik_buy/features/cart/presentation/views/widgets/custom_cart_action_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 30),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const CartListViewItem();
                    },
                  ),
                  const Divider(),
                  const CartListViewSummary(),
                  const Divider(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomCartActionBar(),
          ),
        ],
      ),
    );
  }
}
