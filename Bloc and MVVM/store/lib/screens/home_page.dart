import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/cubits/home_cubit/home_cubit.dart';
import '../models/product_model.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = 'HomePAge';
  List<ProductModel> products = [];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllProducts();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeSuccess) {
            products = state.products;
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
              child: GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  }),
            );
          } else if (state is HomeFailure) {
            return Center(child: Text('something went wrong'));
          } else {
            return Center(child: Text('this is initial state'));
          }
        },
      ),
    );
  }
}
