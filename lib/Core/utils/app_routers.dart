import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_store/Features/home/presentation/views/home_view.dart';
import 'package:mini_store/Features/home/presentation/views/update_product_view.dart';

abstract class AppRouters {
  static const String homeView = '/';
  static const String categoryView = '/categoryView';
  static const String updateProductView = '/updateProductView';
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: categoryView,
        builder: (context, state) => const Text('Category'),
      ),
      GoRoute(
        path: updateProductView,
        builder: (context, state) => const UpdateProductView(),
      )
    ],
  );
}