import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/widgets/custom_error.dart';
import 'package:mini_store/Core/widgets/custom_loading.dart';
import 'package:mini_store/Features/home/presentation/manager/all_category_cubit/cubit/categories_products_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/custom_card.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
      child: BlocBuilder<CategoriesProductsCubit, CategoriesProductsState>(
        builder: (context, state) {
          if (state is CategoriesProductsLoaded) {
            return GridView.builder(
            itemCount: state.products.length,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 80,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => CustomCard(product: state.products[index],),
          );
          } else if (state is CategoriesProductsFailure) {
            return CustomError(title: state.errorMessage);
          } else {
            return const CustomLoading();
          }
        },
      ),
    );
  }
}