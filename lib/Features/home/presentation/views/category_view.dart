import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/services/api_service.dart';
import 'package:mini_store/Core/utils/app_styles.dart';
import 'package:mini_store/Features/home/data/home_repo_impl.dart';
import 'package:mini_store/Features/home/presentation/manager/all_category_cubit/cubit/categories_products_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesProductsCubit(HomeRepoImpl(ApiService(Dio())))..getCategoriesProducts(category: categoryName),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName,
            style: AppStyles.textBold24,
          ),
        ),
        body: CategoryViewBody(),
      ),
    );
  }
}
