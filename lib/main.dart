import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/services/api_service.dart';
import 'package:mini_store/Core/utils/app_routers.dart';
import 'package:mini_store/Features/home/data/home_repo_impl.dart';
import 'package:mini_store/Features/home/presentation/manager/all_product_cubit/cubit/all_product_cubit.dart';

void main() {
  runApp(const MiniStore());
}

class MiniStore extends StatelessWidget {
  const MiniStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllProductCubit(
        HomeRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      )..getAllProducts(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouters.router,
          );
        }
      ),
    );
  }
}
