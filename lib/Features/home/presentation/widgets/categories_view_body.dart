import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/widgets/custom_error.dart';
import 'package:mini_store/Core/widgets/custom_loading.dart';
import 'package:mini_store/Features/home/presentation/manager/categories_cubit/cubit/categories_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/custom_category_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      builder: (context, state) {
        if (state is AllCategoriesLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) => CustomCategoryItem(
                category: state.categories[index],
              ),
            ),
          );
        } else if (state is AllCategoriesFailure) {
          return CustomError(title: state.message);
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}

