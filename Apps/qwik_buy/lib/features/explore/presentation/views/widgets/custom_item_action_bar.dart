import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/faded_text.dart';
import '../../../../cart/data/models/cart_product.dart';
import '../../../../cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../../data/models/result/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomItemActionBar extends StatelessWidget {
  const CustomItemActionBar({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadedText(text: 'PRICE'),
              Text(
                product.price!.current!.text!,
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
            width: 140,
            child: BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartAddSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('item added to cart')));
                } else if (state is CartFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
              },
              child: CustomButton(
                text: 'ADD',
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).addToCart(
                      userId: getIt.get<SharedPreferences>().getInt('id')!,
                      product: CartProduct.fromMap({
                        'product_id': product.id!,
                        'name': product.name!,
                        'price': product.price!.current!.value!,
                        'image': product.imageUrl!,
                      }));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
