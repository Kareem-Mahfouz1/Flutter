import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/cubits/home_cubit/home_cubit.dart';
import '../models/product_model.dart';
import '../services/update_product.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  String? productName, desc, image;
  static String id = 'update product';
  String? price;
  bool isLoading = false;

  UpdateProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButon(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    try {
                      await BlocProvider.of<HomeCubit>(context).updateProduct(
                          product,
                          NewProduct(
                              title: productName!,
                              price: price,
                              description: desc!,
                              image: image!));

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
