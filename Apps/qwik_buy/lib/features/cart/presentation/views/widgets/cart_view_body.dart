import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../data/models/cart_product.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import 'cart_list_view_item.dart';
import 'cart_list_view_summary.dart';
import 'custom_cart_action_bar.dart';

double calculateTotal(List<CartProduct> products) {
  double total = 0;
  for (var element in products) {
    total += element.price;
  }
  return total;
}

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartProductsSuccess) {
          return Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    const SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: CustomBackButton(),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return CartListViewItem(
                              product: state.products[index]);
                        },
                      ),
                      state.products.isNotEmpty ? const Divider() : Container(),
                      state.products.isNotEmpty
                          ? CartListViewSummary(
                              subTotal: calculateTotal(state.products),
                            )
                          : Container(),
                      state.products.isNotEmpty ? const Divider() : Container(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomCartActionBar(
                    total: calculateTotal(state.products) * 1.14),
              ),
            ],
          );
        } else if (state is CartFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
