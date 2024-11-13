import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwik_buy/core/utils/app_router.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_loading_indicator.dart';
import 'package:qwik_buy/features/explore/presentation/manager/categories_cubit/categories_cubit.dart';

import 'categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.brands!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kCategoreyView,
                          extra:
                              state.categories.brands![index].content!.title!);
                    },
                    child: CategoriesListViewItem(
                        text: state.categories.brands![index].content!.title!),
                  );
                },
              ),
            );
          } else if (state is CategoriesFailure) {
            return Text(state.errMessage, style: Styles.textStyle20);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
