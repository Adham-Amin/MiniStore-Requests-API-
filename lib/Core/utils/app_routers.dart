import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String homeView = '/';
  static const String categoryView = '/categoryView';
  static const String uodateProductView = '/updateProductView';
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: homeView,
        builder: (context, state) => const Text('Home'),
      ),
      GoRoute(
        path: categoryView,
        builder: (context, state) => const Text('Category'),
      ),
      GoRoute(
        path: uodateProductView,
        builder: (context, state) => const Text('Update Product'),
      )
    ],
  );
}