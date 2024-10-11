import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_product_service.dart';
import 'package:store/services/update_product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<ProductModel> products = [];
  HomeCubit() : super(HomeInitial());

  void getAllProducts() async {
    emit(HomeLoading());
    try {
      products = await AllProductsService().getAllProducts();
      emit(HomeSuccess(products: products));
    } on Exception {
      emit(HomeFailure());
    }
  }

  Future<void> updateProduct(
      ProductModel product, NewProduct newProduct) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: newProduct.title == '' ? product.title : newProduct.title,
        price: newProduct.price == ''
            ? product.price.toString()
            : newProduct.price.toString(),
        desc: newProduct.description == ''
            ? product.description
            : newProduct.description,
        image: newProduct.image == '' ? product.image : newProduct.image,
        category: product.category);
  }
}
