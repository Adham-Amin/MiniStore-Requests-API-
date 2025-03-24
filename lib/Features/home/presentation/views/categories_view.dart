import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/services/api_service.dart';
import 'package:mini_store/Core/utils/app_styles.dart';
import 'package:mini_store/Features/home/data/home_repo_impl.dart';
import 'package:mini_store/Features/home/presentation/manager/categories_cubit/cubit/categories_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCategoriesCubit(HomeRepoImpl(ApiService(Dio())))..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Categories',
            style: AppStyles.textBold24,
          ),
          centerTitle: true,
        ),
        body: CategoriesViewBody(),
      ),
    );
  }
}
