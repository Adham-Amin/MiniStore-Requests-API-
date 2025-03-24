import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Core/services/api_service.dart';
import 'package:mini_store/Core/utils/app_styles.dart';
import 'package:mini_store/Features/home/data/home_repo_impl.dart';
import 'package:mini_store/Features/home/presentation/manager/update_product_cubit/update_product_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/update_product_view_body.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProductCubit(HomeRepoImpl(ApiService(Dio()))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: AppStyles.textBold24,
          ),
          centerTitle: true,
        ),
        body: UpdateProductViewBody(product: product,),
      ),
    );
  }
}
