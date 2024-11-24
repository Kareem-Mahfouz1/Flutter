import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../data/models/categories/child.dart';
import '../../manager/products_by_catigorey/products_by_catigorey_cubit.dart';
import 'categorey_items_grid_view.dart';
import 'custom_category_app_bar.dart';

class CategoreyViewBody extends StatelessWidget {
  const CategoreyViewBody({super.key, required this.brand});
  final Child brand;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        CustomCategoryAppBar(title: brand.content!.title!),
        const SizedBox(height: 15),
        BlocBuilder<ProductsByCatigoreyCubit, ProductsByCatigoreyState>(
          builder: (context, state) {
            if (state is ProductsByCatigoreySuccess) {
              return Expanded(
                  child: CategoreyItemsGridView(
                products: state.result.products,
              ));
            } else if (state is ProductsByCatigoreyFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ],
    );
  }
}
